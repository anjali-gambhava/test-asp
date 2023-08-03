using Newtonsoft.Json;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Xml.Serialization;

namespace CameraStatusService
{
    public class CameraStatusAPI
    {
        private string ConnStr = ConfigurationManager.ConnectionStrings["DBConn"].ConnectionString.ToString();
        private string ConnStr1 = ConfigurationManager.ConnectionStrings["DBConn1"].ConnectionString.ToString();
        private string mediatype = ConfigurationManager.AppSettings["MediaType"].ToString();

        public string Cameraid { get; set; }
        public bool isSdCard { get; set; }
        public string TotalSpace { get; set; }
        public string FreeSpace { get; set; }
        public string UsedSpace { get; set; }
        public string PresentTime { get; set; }

        public DataTable GetCameraStatusList()
        {
            DataTable dtLiveCamera = new DataTable();
            //string cameraids = "";
            try
            {
                dtLiveCamera.Columns.Add("CameraID");
                dtLiveCamera.Columns.Add("InBytes");
                dtLiveCamera.Columns.Add("CreateTime");
                DataSet ds = GetServerNameList();
                if (ds != null)
                {
                    if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            string servername = dr["servername"].ToString();
                            if (servername != "")
                            {
                                if (mediatype.ToUpper() == "JSON")
                                {
                                    try
                                    {
                                        //Logs.InsertLog(servername);
                                        using (var client = new HttpClient())
                                        {
                                            client.BaseAddress = new Uri(String.Format("http://{0}:8080", servername));//"http://punjabets1.vmukti.com:8080/api/streams"
                                            client.DefaultRequestHeaders.Accept.Clear();
                                            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                                            HttpResponseMessage response = client.GetAsync("api/streams").Result;
                                            if (response.IsSuccessStatusCode)
                                            {
                                                string res = response.Content.ReadAsStringAsync().Result;
                                                CameraStatusList oresponse = JsonConvert.DeserializeObject<CameraStatusList>(res);

                                                if (oresponse?.data?.liverecord != null)
                                                {
                                                    foreach (var cam in oresponse.data.liverecord)
                                                    {
                                                        if ((cam.Value?.publisher?.id ?? "") != "" && (cam.Value?.publisher?.id ?? "") != "0")// && (cam.Value?.publisher?.inbytes ?? 0) > 5
                                                        {
                                                            dtLiveCamera.Rows.Add(cam.Key.ToString().Trim(), cam.Value?.publisher?.inbytes ?? 0, cam.Value?.publisher?.createtime ?? 0);
                                                            //dtLiveCamera.Rows.Add(cam.Key.ToString().Trim());
                                                        }
                                                        //cameraids += cam.Key.ToString().Trim() + ",";
                                                    }
                                                    Logs.InsertLog(servername + " Count: " + oresponse.data.liverecord.Count.ToString());
                                                }
                                            }
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        Logs.InsertLog(servername + " Error: " + ex.Message);
                                    }
                                }
                                else if (mediatype.ToUpper() == "XML")
                                {
                                    try
                                    {
                                        //Logs.InsertLog(servername);
                                        using (var client = new HttpClient())
                                        {
                                            client.BaseAddress = new Uri(String.Format("http://{0}:8080", servername));//"http://punjabets1.vmukti.com:8080/api/streams"
                                            client.DefaultRequestHeaders.Accept.Clear();
                                            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/xml"));
                                            HttpResponseMessage response = client.GetAsync("stats.xml").Result;
                                            if (response.IsSuccessStatusCode)
                                            {
                                                string res = response.Content.ReadAsStringAsync().Result;
                                                var serializer = new XmlSerializer(typeof(rtmp));
                                                rtmp oresponse = new rtmp();
                                                using (TextReader reader = new StringReader(res))
                                                {
                                                    oresponse = (rtmp)serializer.Deserialize(reader);
                                                }

                                                if (oresponse?.server?.application?.live?.stream != null)
                                                {
                                                    foreach(var cam in oresponse.server.application.live.stream)
                                                    {
                                                        dtLiveCamera.Rows.Add(cam.name.ToString().Trim(), 0);
                                                    }
                                                    Logs.InsertLog(servername + " Count: " + oresponse.server.application.live.stream.Count().ToString());
                                                }
                                                //if (oresponse?.data?.liverecord != null)
                                                //{
                                                //    foreach (var cam in oresponse.data.liverecord)
                                                //    {
                                                //        if ((cam.Value?.publisher?.id ?? "") != "" && (cam.Value?.publisher?.id ?? "") != "0")// && (cam.Value?.publisher?.inbytes ?? 0) > 5
                                                //        {
                                                //            dtLiveCamera.Rows.Add(cam.Key.ToString().Trim());
                                                //        }
                                                //        //cameraids += cam.Key.ToString().Trim() + ",";
                                                //    }
                                                //    Logs.InsertLog(servername + " Count: " + oresponse.data.liverecord.Count.ToString());
                                                //}
                                            }
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        Logs.InsertLog(servername + " Error: " + ex.Message);
                                    }
                                }
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                Logs.InsertLog(ex.Message);
            }
            return dtLiveCamera;
        }

        public DataSet GetServerNameList()
        {
            DataSet ds = new DataSet();
            using (SqlConnection SQLconn = new SqlConnection(ConnStr))
            {
                try
                {
                    using (SqlCommand SQLcommand = new SqlCommand("GetServerName", SQLconn))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(SQLcommand))
                        {
                            SQLcommand.CommandType = CommandType.StoredProcedure;
                            SQLconn.Open();
                            sda.Fill(ds);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logs.InsertLog(ex.Message);
                }
                finally
                {
                    SQLconn.Close();
                }
            }

            return ds;
        }

        public bool SaveCameraStatus(DataTable dt)
        {
            try
            {
                using (SqlConnection SQLconn = new SqlConnection(ConnStr))
                {
                    try
                    {
                        using (SqlCommand SQLcommand = new SqlCommand("SaveCameraStatusInBytes", SQLconn))
                        {
                            SQLcommand.CommandType = System.Data.CommandType.StoredProcedure;
                            SqlParameter sqlParam = SQLcommand.Parameters.AddWithValue("@CameraStatus", dt);
                            sqlParam.SqlDbType = SqlDbType.Structured;
                            SQLcommand.CommandTimeout = 60;
                            SQLconn.Open();
                            SQLcommand.ExecuteNonQuery();
                            Logs.InsertLog("Camera Status saved successfully.");
                        }
                    }
                    catch (Exception ex)
                    {
                        Logs.InsertLog(ex.Message);
                        return false;
                    }
                    finally
                    {
                        SQLconn.Close();
                    }
                }

            }
            catch (Exception ex)
            {
                Logs.InsertLog(ex.Message);
                return false;
            }
            return true;
        }

        public DataTable GetCameraStreamList()
        {
            DataTable dt1 = new DataTable();
            using (SqlConnection SQLconn = new SqlConnection(ConnStr))
            {
                try
                {
                    using (SqlCommand SQLcommand = new SqlCommand("GetActiveStreamList", SQLconn))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(SQLcommand))
                        {
                            SQLcommand.CommandType = CommandType.StoredProcedure;
                            SQLconn.Open();
                            sda.Fill(dt1);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logs.InsertLog(ex.Message);
                }
                finally
                {
                    SQLconn.Close();
                }
            }

            return dt1;
        }

        public DataTable GetSDCardDtls(DataTable sddt)
        {
            DataTable dt1 = new DataTable();
            try
             {
               
                if (sddt.Rows.Count > 0)
                {
                    foreach (DataRow dr in sddt.Rows)
                    {
                        string streamname = dr["streamname"].ToString();
                        using (SqlConnection SQLconn = new SqlConnection(ConnStr1))
                        {
                           
                            using (SqlCommand SQLcommand = new SqlCommand("GetSDCardDtls", SQLconn))
                            {
                                using (SqlDataAdapter sda = new SqlDataAdapter(SQLcommand))
                                {
                                    SQLcommand.CommandType = CommandType.StoredProcedure;
                                    SQLcommand.Parameters.AddWithValue("@CameraID", streamname);
                                    SQLconn.Open();
                                    sda.Fill(dt1);
                                    SQLconn.Close();
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
               
            }
            return dt1;
        }

        public bool SaveSDCardDtls(DataTable dt2)
        {

            try
            {
                using (SqlConnection SQLconn = new SqlConnection(ConnStr))
                {
                    try
                    {
                        using (SqlCommand SQLcommand = new SqlCommand("SaveSdcarddetail", SQLconn))
                        {
                            SQLcommand.CommandType = System.Data.CommandType.StoredProcedure;
                            SqlParameter sqlParam = SQLcommand.Parameters.AddWithValue("@tbl", dt2);
                            sqlParam.SqlDbType = SqlDbType.Structured;

                            SQLconn.Open();
                            SQLcommand.ExecuteNonQuery();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logs.InsertLog(ex.Message);
                        return false;
                    }
                    finally
                    {
                        SQLconn.Close();
                    }
                }

            }
            catch (Exception ex)
            {
                Logs.InsertLog(ex.Message);
                return false;
            }
            return true;
        }
        public bool saveimage(DataTable dt)
        {
            string outputDirectory = "D:\\Image"; // Replace with your desired directory path

            if (!Directory.Exists(outputDirectory))
            {
                Directory.CreateDirectory(outputDirectory);
            }

            foreach (DataRow row in dt.Rows)
            {
                string serverName = row["InBytes"].ToString();
                string cameraID = row["CameraID"].ToString();

                // Generate the RTMP URL.
                string rtmpUrl = $"rtmp://{serverName}:80/live-record/{cameraID}";

                // Create a unique file name for the captured image.
                string fileName = $"{cameraID}_{DateTime.Now.ToString("yyyyMMddHHmmss")}.jpg";

                // Capture image using FFmpeg.
                // Configure FFmpeg process start info.
                ProcessStartInfo startInfo = new ProcessStartInfo
                {
                    FileName = "ffmpeg",
                    Arguments = $"-i {rtmpUrl} -frames:v 1 \"{Path.Combine(outputDirectory, fileName)}\"",
                    UseShellExecute = false,
                    RedirectStandardOutput = true,
                    CreateNoWindow = true // This hides the console window
                };

                // Start the FFmpeg process.
                Process process = new Process
                {
                    StartInfo = startInfo
                };
                process.Start();
                process.WaitForExit();

                Console.WriteLine($"Captured image for server {serverName}, camera {cameraID}");

                // Break out of the loop after capturing one image per camera.
             

                // Console.WriteLine($"Captured image for server {serverName}, camera {cameraID}");
            }
            return true;
        }
    }
}
