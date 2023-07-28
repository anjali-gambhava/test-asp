using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace exam.DAL
{
    public class db_data
    {
        public string connstr = Common.DecodeConnectionstring(ConfigurationManager.ConnectionStrings["connectionstr"].ToString());
        public int minute = Convert.ToInt32(ConfigurationManager.AppSettings["minute"]);
        public string stcode = ConfigurationManager.AppSettings["stcode"].ToString();
        public string table_prefix = ConfigurationManager.AppSettings["tb_prefix"].ToString();
        public string currentphase = ConfigurationManager.AppSettings["stateid"].ToString();
        public DateTime start_hour = Convert.ToDateTime(ConfigurationManager.AppSettings["starthour"].ToString());
        public DateTime end_hour = Convert.ToDateTime(ConfigurationManager.AppSettings["endhour"].ToString());
        string allKeyword = ConfigurationManager.AppSettings["AllSelectKeword"].ToString() + " "; 
        string districtname = ConfigurationManager.AppSettings["district"].ToString();
      //  string assemblyname = ConfigurationManager.AppSettings["assemblyname"].ToString();

        public DataSet GetUser(string username, string password)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = "SELECT * FROM " + table_prefix + "users WHERE username=@username and password=@password and IsEnable=1";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetUser()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }
        public DataSet GetUserData(string username)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = "SELECT * FROM " + table_prefix + "users WHERE username=@username and IsEnable=1";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@username", username);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetUserData()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }

        //public string GETDIDfrmvm(string streamname)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "SELECT deviceid FROM " + table_prefix + "streamlist where streamname = @streamname";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@streamname", streamname);
        //        conn.Open();
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);

        //        return ds.Tables[0].Rows[0]["deviceid"].ToString();
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetUserData()--> " + ex.Message);
        //        return "";
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }

        //}
        public DataSet GetMapBoothList(string usertype, bool isgrid, int st_id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string dist = string.Empty;
                string dist_sch = string.Empty;
                string strzone = string.Empty;
                string[] utype = { };
                string tblname = string.Empty;
                if (!isgrid)
                {
                    if (usertype == "Master_Admin")
                    {
                        query = "select staff.name,staff.contact_no,vd.Vehicle_No,b.district,s.streamname as videoname,s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist s on b.streamid=s.id INNER JOIN vehicalDetail vd on vd.streamid = s.id INNER JOIN [dbo].[Vehicle_Staff_Mapping] mapping ON mapping.VehicleId = vd.vehicalId AND mapping.isdeleted = 0 INNER JOIN [dbo].[vehicleshift] sft on sft.id = mapping.ShiftId AND sft.isdeleted = 0 INNER JOIN [dbo].[Staff_Info] staff ON mapping.StaffId = staff.Id AND staff.isdeleted = 0  and staff.Type=1 where l.longitude IS NOT NULL and l.latitude IS NOT NULL and b.isdisplay='True' and s.IsEnable=1 and b.boothstateid='" + st_id + "' group by staff.name,contact_no,Vehicle_No,district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,l.longitude,l.latitude,l.UpdateDatetime ,b.location Order By b.acname,b.location asc,len(s.streamname) asc; select * from " + table_prefix + "static_count;";
                    }
                    else if (usertype == "live")
                    {
                        query = "select staff.name,staff.contact_no,vd.Vehicle_No,b.district,s.streamname as videoname,s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid " + table_prefix + "streamlist s on b.streamid=s.id INNER JOIN vehicalDetail vd on vd.streamid = s.id INNER JOIN [dbo].[Vehicle_Staff_Mapping] mapping ON mapping.VehicleId = vd.vehicalId AND mapping.isdeleted = 0 INNER JOIN [dbo].[vehicleshift] sft on sft.id = mapping.ShiftId AND sft.isdeleted = 0 INNER JOIN [dbo].[Staff_Info] staff ON mapping.StaffId = staff.Id AND staff.isdeleted = 0  and staff.Type=1  where l.longitude IS NOT NULL and l.latitude IS NOT NULL and b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid='" + st_id + "' group by staff.name,contact_no,Vehicle_No,district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,l.longitude,l.latitude,l.UpdateDatetime ,b.location Order By b.acname,b.location asc,len(s.streamname) asc";
                    }
                    else if (usertype.StartsWith("zn"))
                    {
                        strzone = usertype.Split('_')[1];
                        query = "select staff.name,staff.contact_no,vd.Vehicle_No,b.district,s.streamname as videoname,s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid " + table_prefix + "streamlist s on b.streamid=s.id INNER JOIN vehicalDetail vd on vd.streamid = s.id INNER JOIN [dbo].[Vehicle_Staff_Mapping] mapping ON mapping.VehicleId = vd.vehicalId AND mapping.isdeleted = 0 INNER JOIN [dbo].[vehicleshift] sft on sft.id = mapping.ShiftId AND sft.isdeleted = 0 INNER JOIN [dbo].[Staff_Info] staff ON mapping.StaffId = staff.Id AND staff.isdeleted = 0  and staff.Type=1  where l.longitude IS NOT NULL and l.latitude IS NOT NULL and b.isdisplay='True' and b.district in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName =@zn) and s.IsEnable=1 and b.boothstateid='" + st_id + "' group by staff.name,contact_no,Vehicle_No,district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,l.longitude,l.latitude,l.UpdateDatetime ,b.location,s.hasalarm  Order By s.hasalarm desc,len(s.streamname) asc";
                    }
                    else if (usertype.StartsWith("dst"))
                    {
                        if (usertype.Contains("?"))
                        {
                            utype = usertype.Split('?');
                            if (utype[1] != st_id.ToString())
                            {
                                tblname = "p" + utype[1];
                            }
                            dist = utype[0].Split('_')[1];
                            query = "select staff.name,staff.contact_no,vd.Vehicle_No,b.district,s.streamname as videoname,s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime from booth" + tblname + " b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id INNER JOIN vehicalDetail vd on vd.streamid = s.id INNER JOIN [dbo].[Vehicle_Staff_Mapping] mapping ON mapping.VehicleId = vd.vehicalId AND mapping.isdeleted = 0 INNER JOIN [dbo].[vehicleshift] sft on sft.id = mapping.ShiftId AND sft.isdeleted = 0 INNER JOIN [dbo].[Staff_Info] staff ON mapping.StaffId = staff.Id AND staff.isdeleted = 0  and staff.Type=1 where l.longitude IS NOT NULL and l.latitude IS NOT NULL and b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + utype[1] + "' group by staff.name,contact_no,Vehicle_No,district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,l.longitude,l.latitude,l.UpdateDatetime ,b.location Order By b.acname,b.location asc,len(s.streamname) asc";
                        }
                        else
                        {
                            dist = usertype.Split('_')[1];
                            //query = "select staff.name,staff.contact_no,vd.Vehicle_No,b.district,s.streamname as videoname,s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist s on b.streamid=s.id INNER JOIN vehicalDetail vd on vd.streamid = s.id INNER JOIN [dbo].[Vehicle_Staff_Mapping] mapping ON mapping.VehicleId = vd.vehicalId AND mapping.isdeleted = 0 INNER JOIN [dbo].[vehicleshift] sft on sft.id = mapping.ShiftId AND sft.isdeleted = 0 INNER JOIN [dbo].[Staff_Info] staff ON mapping.StaffId = staff.Id AND staff.isdeleted = 0  and staff.Type=1  where l.longitude IS NOT NULL and l.latitude IS NOT NULL and b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + st_id + "' group by staff.name,contact_no,Vehicle_No,district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,l.longitude,l.latitude,l.UpdateDatetime ,b.location,s.hasalarm Order By s.hasalarm desc,len(s.streamname) asc";
                            query = "select b.district,s.streamname as videoname,s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,b.longitude,b.latitude from booth b  inner join streamlist s on b.streamid=s.id  where b.longitude >0 and b.latitude IS NOT NULL and b.isdisplay='True'   and s.IsEnable=1 and b.boothstateid='1' group by district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,b.longitude,b.latitude, b.location,s.hasalarm Order By s.hasalarm desc,len(s.streamname) asc";
                        }
                    }
                    else if (usertype.StartsWith("sch"))
                    {
                        if (usertype.Contains("?"))
                        {
                            utype = usertype.Split('?');
                            if (utype[1] != st_id.ToString())
                            {
                                tblname = "p" + utype[1];
                            }
                            dist = utype[0].Split('_')[1];
                            dist_sch = utype[0].Split('_')[2];
                            query = "select staff.name,staff.contact_no,vd.Vehicle_No,b.district,s.streamname as videoname,s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime from booth" + tblname + " b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id INNER JOIN vehicalDetail vd on vd.streamid = s.id INNER JOIN [dbo].[Vehicle_Staff_Mapping] mapping ON mapping.VehicleId = vd.vehicalId AND mapping.isdeleted = 0 INNER JOIN [dbo].[vehicleshift] sft on sft.id = mapping.ShiftId AND sft.isdeleted = 0 INNER JOIN [dbo].[Staff_Info] staff ON mapping.StaffId = staff.Id AND staff.isdeleted = 0  and staff.Type=1 where l.longitude IS NOT NULL and l.latitude IS NOT NULL and b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid='" + utype[1] + "' group by staff.name,contact_no,Vehicle_No,district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,l.longitude,l.latitude,l.UpdateDatetime ,b.location Order By b.acname,b.location asc,len(s.streamname) asc";
                        }
                        else
                        {
                            dist = usertype.Split('_')[1];
                            dist_sch = usertype.Split('_')[2];
                            query = "select staff.name,staff.contact_no,vd.Vehicle_No,b.district,s.streamname as videoname,s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist s on b.streamid=s.id INNER JOIN vehicalDetail vd on vd.streamid = s.id INNER JOIN [dbo].[Vehicle_Staff_Mapping] mapping ON mapping.VehicleId = vd.vehicalId AND mapping.isdeleted = 0 INNER JOIN [dbo].[vehicleshift] sft on sft.id = mapping.ShiftId AND sft.isdeleted = 0 INNER JOIN [dbo].[Staff_Info] staff ON mapping.StaffId = staff.Id AND staff.isdeleted = 0  and staff.Type=1 where l.longitude IS NOT NULL and l.latitude IS NOT NULL and b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid='" + st_id + "' group by staff.name,contact_no,Vehicle_No,district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,l.longitude,l.latitude,l.UpdateDatetime ,b.location Order By b.acname,b.location asc,len(s.streamname) asc";
                        }
                    }
                    else
                    {
                        query = "select staff.name,staff.contact_no,vd.Vehicle_No,b.district,s.streamname as videoname,s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist s on b.streamid=s.id INNER JOIN vehicalDetail vd on vd.streamid = s.id INNER JOIN [dbo].[Vehicle_Staff_Mapping] mapping ON mapping.VehicleId = vd.vehicalId AND mapping.isdeleted = 0 INNER JOIN [dbo].[vehicleshift] sft on sft.id = mapping.ShiftId AND sft.isdeleted = 0 INNER JOIN [dbo].[Staff_Info] staff ON mapping.StaffId = staff.Id AND staff.isdeleted = 0  and staff.Type=1 where l.longitude IS NOT NULL and l.latitude IS NOT NULL and b.isdisplay='True' and s.IsEnable=1 and b.boothstateid='" + st_id + "' group by staff.name,contact_no,Vehicle_No,district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,l.longitude,l.latitude,l.UpdateDatetime ,b.location Order By b.acname,b.location asc,len(s.streamname) asc; select * from " + table_prefix + "static_count;";
                    }
                }
                else
                {
                    if (usertype == "Master_Admin")
                    {
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid='" + st_id + "' Order By s.lastseen desc";
                    }
                    else if (usertype == "live")
                    {
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid='" + st_id + "' Order By s.lastseen desc";
                    }
                    else if (usertype.StartsWith("zn"))
                    {
                        strzone = usertype.Split('_')[1];
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and b.district in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName =@zn) and s.IsEnable=1 and b.boothstateid='" + st_id + "' Order By s.hasalarm desc";
                    }
                    else if (usertype.StartsWith("dst"))
                    {
                        dist = usertype.Split('_')[1];
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + st_id + "' Order By s.hasalarm desc";
                    }
                    else if (usertype.StartsWith("sch"))
                    {
                        dist = usertype.Split('_')[1];
                        // dist_sch = Convert.ToInt32(usertype.Split('_')[2]);
                        dist_sch = usertype.Split('_')[2];
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid='" + st_id + "' Order By s.lastseen desc";
                    }
                    else
                    {
                        query = "select staff.name,staff.contact_no,vd.Vehicle_No,b.district,s.streamname as videoname,s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist s on b.streamid=s.id INNER JOIN vehicalDetail vd on vd.streamid = s.id INNER JOIN [dbo].[Vehicle_Staff_Mapping] mapping ON mapping.VehicleId = vd.vehicalId AND mapping.isdeleted = 0 INNER JOIN [dbo].[vehicleshift] sft on sft.id = mapping.ShiftId AND sft.isdeleted = 0 INNER JOIN [dbo].[Staff_Info] staff ON mapping.StaffId = staff.Id AND staff.isdeleted = 0  and staff.Type=1 where l.longitude IS NOT NULL and l.latitude IS NOT NULL and b.isdisplay='True' and s.IsEnable=1 and b.boothstateid='" + st_id + "' group by staff.name,contact_no,Vehicle_No,district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,l.longitude,l.latitude,l.UpdateDatetime ,b.location Order By b.acname,b.location asc,len(s.streamname) asc; select * from " + table_prefix + "static_count;";
                    }
                }
                dist = usertype.Split('_')[1];
                dist = dist.ToUpper() == "ALL DISTRICT" ? "" : dist;
                //query = "select staff.name,staff.contact_no,vd.Vehicle_No,b.district,s.streamname as videoname,s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime from booth b full join location_info l on b.id = l.boothid inner join streamlist s on b.streamid=s.id INNER JOIN vehicalDetail vd on vd.streamid = s.id INNER JOIN [dbo].[Vehicle_Staff_Mapping] mapping ON mapping.VehicleId = vd.vehicalId AND mapping.isdeleted = 0 INNER JOIN [dbo].[vehicleshift] sft on sft.id = mapping.ShiftId AND sft.isdeleted = 0 INNER JOIN [dbo].[Staff_Info] staff ON mapping.StaffId = staff.Id AND staff.isdeleted = 0  and staff.Type=1  where ISNULL(l.longitude,0) != 0 and ISNULL(l.latitude,0) != 0 and b.isdisplay='True' and ((@dst='') OR (b.district=@dst)) and s.IsEnable=1 and b.boothstateid='1' group by staff.name,contact_no,Vehicle_No,district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,l.longitude,l.latitude,l.UpdateDatetime ,b.location,s.hasalarm Order By s.hasalarm desc,len(s.streamname) asc;" +
                //    "SELECT sum(case when tbl.longitude>73 AND tbl.latitude > 24 THEN 1 ELSE 0 END) Configured,sum(case when tbl.status='RUNNING' THEN 1 ELSE 0 END) Online,sum(case when tbl.status = 'STOPPED' THEN 1 ELSE 0 END) Offline FROM( select staff.name, staff.contact_no, vd.Vehicle_No, b.district, s.streamname as videoname," +
                //    " s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat, " +
                //    " l.longitude,l.latitude,l.UpdateDatetime from booth b full join location_info l on b.id = l.boothid " +
                //    " inner join streamlist s on b.streamid = s.id " +
                //    " INNER JOIN vehicalDetail vd on vd.streamid = s.id " +
                //    " INNER JOIN[dbo].[Vehicle_Staff_Mapping] mapping ON mapping.VehicleId = vd.vehicalId AND mapping.isdeleted = 0 " +
                //    " INNER JOIN[dbo].[vehicleshift] sft on sft.id = mapping.ShiftId AND sft.isdeleted = 0 " +
                //    " INNER JOIN[dbo].[Staff_Info] staff ON mapping.StaffId = staff.Id AND staff.isdeleted = 0 " +
                //    " and staff.Type = 1  where ISNULL(l.longitude,0) != 0 and ISNULL(l.latitude,0) != 0 " +
                //    " and b.isdisplay = 'True' and ((@dst='') OR (b.district=@dst)) and s.IsEnable = 1 and b.boothstateid = '1' group by staff.name,contact_no,Vehicle_No,district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,l.longitude,l.latitude,l.UpdateDatetime ,b.location,s.hasalarm) tbl";

                query = " select  b.district,s.streamname as videoname,s.servername as cdnsvc,s.status," +
                        " b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,b.longitude,b.latitude from booth b" +
                        " inner join streamlist s on b.streamid = s.id " +
                        " where ISNULL(b.longitude,0) != 0 and ISNULL(b.latitude,0) != 0 and b.isdisplay = 'True' and(('' = '') OR(b.district = '')) and s.IsEnable = 1" +
                        " and b.boothstateid = '1' and accode in(4,5)  group by district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id," +
                        " b.longitude,b.latitude ,b.location,s.hasalarm Order By s.hasalarm desc, len(s.streamname) asc; " +
                        " SELECT sum(case when tbl.longitude > 0 AND tbl.latitude > 0 THEN 1 ELSE 0 END) Configured,sum(case when tbl.status = 'RUNNING' THEN 1 ELSE 0 END) Online," +
                        " sum(case when tbl.status = 'STOPPED' THEN 1 ELSE 0 END) Offline FROM(select b.district," +
                        " s.streamname as videoname, s.servername as cdnsvc,s.status,b.acname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,  " +
                        " l.longitude,l.latitude,l.UpdateDatetime from booth b full join location_info l on b.id = l.boothid  inner join streamlist s on b.streamid = s.id " +
                        " where  b.isdisplay = 'True' and accode in(4,5)   and s.IsEnable = 1 and b.boothstateid = '1'" +
                        " group by district,streamname,servername,status,acname,PSNum,b.longitude,b.latitude,b.id,l.longitude,l.latitude,l." +
                        " UpdateDatetime ,b.location,s.hasalarm) tbl";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@dst", dist);
                //if (!string.IsNullOrEmpty(dist))
                //{
                //    command.Parameters.AddWithValue("@dst", dist);
                //}
                //if (!string.IsNullOrEmpty(strzone))
                //{
                //    command.Parameters.AddWithValue("@zn", strzone);
                //}
                //if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_sch))
                //{
                //    command.Parameters.AddWithValue("@dist_sch", dist_sch);
                //}
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetBoothList()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }

        public DataSet GetMapBoothListNew(string district, string assembly, string status, int isPink = -1, int isARO = -1, string booth = "", string streamname = "", string orderBy = "")
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                SqlCommand command = new SqlCommand("GetBoothListNew", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@assembly", assembly);
                command.Parameters.AddWithValue("@status", status);
                command.Parameters.AddWithValue("@isPink", isPink);
                command.Parameters.AddWithValue("@isARO", isARO);
                command.Parameters.AddWithValue("@booth", booth);
                command.Parameters.AddWithValue("@streamname", streamname);
                command.Parameters.AddWithValue("@psnum", streamname);

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, true);
            }
            catch (Exception ex)
            {
                Common.Log("GetMapBoothListNew()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }

        //public DataSet GetMapBoothListSequence(string district, string assembly, string status, int isPink = -1, int isARO = -1, string booth = "", string streamname = "", string orderBy = "")
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        SqlCommand command = new SqlCommand("GetBoothListNew_sequence", conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@assembly", assembly);
        //        command.Parameters.AddWithValue("@status", status);
        //        command.Parameters.AddWithValue("@isPink", isPink);
        //        command.Parameters.AddWithValue("@isARO", isARO);
        //        command.Parameters.AddWithValue("@booth", booth);
        //        command.Parameters.AddWithValue("@streamname", streamname);
        //        command.Parameters.AddWithValue("@OrderBY", orderBy);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetMapBoothListNew()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        //public DataSet GetMapBoothListNew_Indoor(string district, string assembly, string status, int isPink = -1, int isARO = -1, string booth = "", string streamname = "", string orderBy = "", int isoutside = -1)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        SqlCommand command = new SqlCommand("GetBoothListNew_Indoor", conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@assembly", assembly);
        //        command.Parameters.AddWithValue("@status", status);
        //        command.Parameters.AddWithValue("@isPink", isPink);
        //        command.Parameters.AddWithValue("@isOutdoor", 0);
        //        command.Parameters.AddWithValue("@isARO", isARO);
        //        command.Parameters.AddWithValue("@booth", booth);
        //        command.Parameters.AddWithValue("@streamname", streamname);
        //        command.Parameters.AddWithValue("@OrderBY", orderBy);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetMapBoothListNew()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        //public DataSet GetMapBoothListNew_OutDoor(string district, string assembly, string status, int isPink = -1, int isARO = -1, string booth = "", string streamname = "", string orderBy = "", int isoutside = -1)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        SqlCommand command = new SqlCommand("GetBoothListNew_OutDoor", conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@assembly", assembly);
        //        command.Parameters.AddWithValue("@status", status);
        //        command.Parameters.AddWithValue("@isPink", isPink);
        //        command.Parameters.AddWithValue("@isOutdoor", 1);
        //        command.Parameters.AddWithValue("@isARO", isARO);
        //        command.Parameters.AddWithValue("@booth", booth);
        //        command.Parameters.AddWithValue("@streamname", streamname);
        //        command.Parameters.AddWithValue("@OrderBY", orderBy);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetMapBoothListNew()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        //public DataSet GetBoothListNewGridView(string district, string assembly, string status, int isPink = -1, int isARO = -1, string booth = "", string streamname = "", string orderBy = "", int PageIndex = 0, int PageSize = 20, int userid = 0)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        SqlCommand command = new SqlCommand("GetBoothListNewGridView", conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@assembly", assembly);
        //        command.Parameters.AddWithValue("@status", status);
        //        command.Parameters.AddWithValue("@isPink", isPink);
        //        command.Parameters.AddWithValue("@isARO", isARO);
        //        command.Parameters.AddWithValue("@booth", booth);
        //        command.Parameters.AddWithValue("@streamname", streamname);
        //        command.Parameters.AddWithValue("@OrderBY", orderBy);
        //        command.Parameters.AddWithValue("@PageIndex", PageIndex);
        //        command.Parameters.AddWithValue("@PageSize", PageSize);
        //        command.Parameters.AddWithValue("@UserID", userid);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetMapBoothListNew()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        public DataSet GetOnlineMapBoothListNew(string district, string assembly, string status, int isPink = -1, int isARO = -1, string booth = "", string streamname = "", string orderBy = "")
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                SqlCommand command = new SqlCommand("GetOnlineBoothListNew", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@assembly", assembly);
                command.Parameters.AddWithValue("@status", status);
                command.Parameters.AddWithValue("@isPink", isPink);
                command.Parameters.AddWithValue("@isARO", isARO);
                command.Parameters.AddWithValue("@booth", booth);
                command.Parameters.AddWithValue("@streamname", streamname);

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, true);
            }
            catch (Exception ex)
            {
                Common.Log("GetMapBoothListNew()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }

        //public DataSet GetBoothListNewAutoView(string district, string assembly)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        SqlCommand command = new SqlCommand("GetBoothListNewAutoView", conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@assembly", assembly);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetMapBoothListNew()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        //public DataSet GetBoothListNewPinkView(string district, string assembly)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        SqlCommand command = new SqlCommand("GetBoothListNewPinkView", conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@assembly", assembly);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetMapBoothListNew()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}

        //public DataSet GetBoothListNewPSView(string district, string assembly, string PSNo)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        SqlCommand command = new SqlCommand("GetBoothListNewPSView", conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@assembly", assembly);
        //        command.Parameters.AddWithValue("@location", PSNo);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetMapBoothListNew()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        //public DataSet GetBoothListNotChangedLocation(string usertype, bool isgrid, int st_id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string dist = string.Empty;
        //        string dist_sch = string.Empty;
        //        string strzone = string.Empty;
        //        string[] utype = { };
        //        string tblname = string.Empty;

        //        if (usertype == "Master_Admin")
        //        {
        //            query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid='" + st_id + "' and l.UpdateDatetime <= DateAdd(minute,-30,CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME)) Order By b.schoolname,b.location asc,len(s.streamname) asc; select * from " + table_prefix + "static_count;";
        //        }
        //        else if (usertype == "live")
        //        {
        //            query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid='" + st_id + "' and l.UpdateDatetime <= DateAdd(minute,-30,CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME)) Order By b.schoolname,b.location asc,len(s.streamname) asc";
        //        }
        //        else if (usertype.StartsWith("zn"))
        //        {
        //            strzone = usertype.Split('_')[1];
        //            query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and b.district in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName =@zn) and s.IsEnable=1 and b.boothstateid='" + st_id + "' and l.UpdateDatetime <= DateAdd(minute,-30,CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME)) Order By s.hasalarm desc,len(s.streamname) asc";
        //        }
        //        else if (usertype.StartsWith("dst"))
        //        {
        //            if (usertype.Contains("?"))
        //            {
        //                utype = usertype.Split('?');
        //                if (utype[1] != st_id.ToString())
        //                {
        //                    tblname = "p" + utype[1];
        //                }
        //                dist = utype[0].Split('_')[1];
        //                query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from booth" + tblname + " b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id  where b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + utype[1] + "' and l.UpdateDatetime <= DateAdd(minute,-30,CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME)) Order By b.schoolname,b.location asc,len(s.streamname) asc";
        //            }
        //            else
        //            {
        //                dist = usertype.Split('_')[1];
        //                query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + st_id + "' and l.UpdateDatetime <= DateAdd(minute,-30,CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME)) Order By s.hasalarm desc,len(s.streamname) asc";
        //            }
        //        }
        //        else if (usertype.StartsWith("sch"))
        //        {
        //            if (usertype.Contains("?"))
        //            {
        //                utype = usertype.Split('?');
        //                if (utype[1] != st_id.ToString())
        //                {
        //                    tblname = "p" + utype[1];
        //                }
        //                dist = utype[0].Split('_')[1];
        //                dist_sch = utype[0].Split('_')[2];
        //                query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from " + table_prefix + "booth" + tblname + " b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.schoolname = @dist_sch and b.boothstateid='" + utype[1] + "' and l.UpdateDatetime <= DateAdd(minute,-30,CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME)) Order By b.schoolname,b.location asc,len(s.streamname) asc";
        //            }
        //            else
        //            {
        //                dist = usertype.Split('_')[1];
        //                dist_sch = usertype.Split('_')[2];
        //                query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.schoolname = @dist_sch and b.boothstateid='" + st_id + "' and l.UpdateDatetime <= DateAdd(minute,-30,CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME)) Order By b.schoolname,b.location asc,len(s.streamname) asc";
        //            }
        //        }
        //        SqlCommand command = new SqlCommand(query, conn);
        //        if (!string.IsNullOrEmpty(dist))
        //        {
        //            command.Parameters.AddWithValue("@dst", dist);
        //        }
        //        if (!string.IsNullOrEmpty(strzone))
        //        {
        //            command.Parameters.AddWithValue("@zn", strzone);
        //        }
        //        if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_sch))
        //        {
        //            command.Parameters.AddWithValue("@dist_sch", dist_sch);
        //        }

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        //public DataSet GetBoothListAwayLocation(string usertype, bool isgrid, int minval, int maxval, int st_id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string dist = string.Empty;
        //        string dist_sch = string.Empty;
        //        string strzone = string.Empty;
        //        string[] utype = { };
        //        string tblname = string.Empty;

        //        if (usertype == "Master_Admin")
        //        {
        //            query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid='" + st_id + "' and CAST(l.distance3 as decimal) <=@maxval and CAST(l.distance3 as decimal) >@minval Order By b.schoolname,b.location asc,len(s.streamname) asc; select * from " + table_prefix + "static_count;";
        //        }
        //        else if (usertype == "live")
        //        {
        //            query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid='" + st_id + "' and CAST(l.distance3 as decimal) <=@maxval and CAST(l.distance3 as decimal) >@minval Order By b.schoolname,b.location asc,len(s.streamname) asc";
        //        }
        //        else if (usertype.StartsWith("zn"))
        //        {
        //            strzone = usertype.Split('_')[1];
        //            query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and b.district in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName =@zn) and s.IsEnable=1 and b.boothstateid='" + st_id + "' and CAST(l.distance3 as decimal) <=@maxval and CAST(l.distance3 as decimal) >@minval Order By s.hasalarm desc,len(s.streamname) asc";
        //        }
        //        else if (usertype.StartsWith("dst"))
        //        {
        //            if (usertype.Contains("?"))
        //            {
        //                utype = usertype.Split('?');
        //                if (utype[1] != st_id.ToString())
        //                {
        //                    tblname = "p" + utype[1];
        //                }
        //                dist = utype[0].Split('_')[1];
        //                query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from booth" + tblname + " b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id  where b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + utype[1] + "' and CAST(l.distance3 as decimal) <=@maxval and CAST(l.distance3 as decimal) >@minval Order By b.schoolname,b.location asc,len(s.streamname) asc";
        //            }
        //            else
        //            {
        //                dist = usertype.Split('_')[1];
        //                query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + st_id + "' and CAST(l.distance3 as decimal) <=@maxval and CAST(l.distance3 as decimal) >@minval Order By s.hasalarm desc,len(s.streamname) asc";
        //            }
        //        }
        //        else if (usertype.StartsWith("sch"))
        //        {
        //            if (usertype.Contains("?"))
        //            {
        //                utype = usertype.Split('?');
        //                if (utype[1] != st_id.ToString())
        //                {
        //                    tblname = "p" + utype[1];
        //                }
        //                dist = utype[0].Split('_')[1];
        //                dist_sch = utype[0].Split('_')[2];
        //                query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from " + table_prefix + "booth" + tblname + " b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.schoolname = @dist_sch and b.boothstateid='" + utype[1] + "' and CAST(l.distance3 as decimal) <=@maxval and CAST(l.distance3 as decimal) >@minval Order By b.schoolname,b.location asc,len(s.streamname) asc";
        //            }
        //            else
        //            {
        //                dist = usertype.Split('_')[1];
        //                dist_sch = usertype.Split('_')[2];
        //                query = "select b.acname,b.location,b.psnum,b.district,s.streamname,b.PSNum,b.id,b.longitude as boothlng,b.latitude as boothlat,l.longitude,l.latitude,l.UpdateDatetime,l.distance3 from " + table_prefix + "booth b full join " + table_prefix + "location_info l on b.id = l.boothid inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.schoolname = @dist_sch and b.boothstateid='" + st_id + "' and CAST(l.distance3 as decimal) <=@maxval and CAST(l.distance3 as decimal) >@minval Order By b.schoolname,b.location asc,len(s.streamname) asc";
        //            }
        //        }
        //        SqlCommand command = new SqlCommand(query, conn);
        //        if (!string.IsNullOrEmpty(dist))
        //        {
        //            command.Parameters.AddWithValue("@dst", dist);
        //        }
        //        if (!string.IsNullOrEmpty(strzone))
        //        {
        //            command.Parameters.AddWithValue("@zn", strzone);
        //        }
        //        if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_sch))
        //        {
        //            command.Parameters.AddWithValue("@dist_sch", dist_sch);
        //        }
        //        command.Parameters.AddWithValue("@minval", minval);
        //        command.Parameters.AddWithValue("@maxval", maxval);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}

        public DataSet GetBoothList(string usertype, bool isgrid, int st_id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string dist = string.Empty;
                string dist_sch = string.Empty;
                string dist_loc = string.Empty;
                string strzone = string.Empty;
                string[] utype = { };
                string tblname = string.Empty;
                if (!isgrid)
                {
                    if (usertype == "Master_Admin")
                    {
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc; select * from " + table_prefix + "static_count;";
                    }
                    else if (usertype == "live")
                    {
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc";
                    }
                    else if (usertype.StartsWith("zn"))
                    {
                        strzone = usertype.Split('_')[1];
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and b.district in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName =@zn) and s.IsEnable=1 and b.boothstateid='" + st_id + "' Order By b.acname,b.location asc,len(s.streamname) asc";
                    }
                    else if (usertype.StartsWith("dst"))
                    {
                        if (usertype.Contains("?"))
                        {
                            utype = usertype.Split('?');
                            if (utype[1] != st_id.ToString())
                            {
                                tblname = "p" + utype[1];
                            }
                            dist = utype[0].Split('_')[1];
                            query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + utype[1] + "' Order By b.acname,b.location asc,len(s.streamname) asc";
                        }
                        else
                        {
                            dist = usertype.Split('_')[1];
                            query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and b.district=@dst and s.IsEnable=1 Order By b.acname,b.location asc,len(s.streamname) asc";
                        }
                    }
                    else if (usertype.StartsWith("sch"))
                    {
                        //dist_sch = Convert.ToInt32(usertype.Split('_')[2]);
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.id = @dist_sch and b.boothstateid='" + st_id + "' Order By s.status,LEN(s.streamname),s.id";
                        if (usertype.Contains("?"))
                        {
                            utype = usertype.Split('?');
                            if (utype[1] != st_id.ToString())
                            {
                                tblname = "p" + utype[1];
                            }
                            dist = utype[0].Split('_')[1];
                            dist_sch = utype[0].Split('_')[2];
                            query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid='" + utype[1] + "' Order By b.acname,b.location asc,len(s.streamname) asc";
                        }
                        else
                        {
                            dist = usertype.Split('_')[1];
                            dist_sch = usertype.Split('_')[2];
                            query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch Order By b.acname,b.location asc,len(s.streamname) asc";
                        }
                    }

                    else if (usertype.StartsWith("loc"))
                    {

                        dist = usertype.Split('_')[1];
                        dist_sch = usertype.Split('_')[2];
                        dist_loc = usertype.Split('_')[3];
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.psnum=@dist_loc Order By b.acname,b.location asc,len(s.streamname) asc";

                    }

                }
                else
                {
                    if (usertype == "Master_Admin")
                    {
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By s.lastseen desc";
                    }
                    else if (usertype == "live")
                    {
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By s.lastseen desc";
                    }
                    else if (usertype.StartsWith("zn"))
                    {
                        strzone = usertype.Split('_')[1];
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and b.district in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName =@zn) and s.IsEnable=1 and b.boothstateid='" + st_id + "' Order By s.hasalarm desc";
                    }
                    else if (usertype.StartsWith("dst"))
                    {
                        dist = usertype.Split('_')[1];
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and b.boothstateid=" + st_id + " and b.district=@dst and s.IsEnable=1 Order By s.hasalarm desc";
                    }
                    else if (usertype.StartsWith("sch"))
                    {
                        dist = usertype.Split('_')[1];
                        // dist_sch = Convert.ToInt32(usertype.Split('_')[2]);
                        dist_sch = usertype.Split('_')[2];
                        //query = "select * from booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.district=@dst and b.id = @dist_sch and b.boothstateid='" + st_id + "' Order By s.status,LEN(s.streamname),s.id";
                        query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid=" + st_id + " Order By s.lastseen desc";
                    }
                }
                SqlCommand command = new SqlCommand(query, conn);
                if (!string.IsNullOrEmpty(dist))
                {
                    command.Parameters.AddWithValue("@dst", dist);
                }
                if (!string.IsNullOrEmpty(strzone))
                {
                    command.Parameters.AddWithValue("@zn", strzone);
                }
                if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_sch))
                {
                    command.Parameters.AddWithValue("@dist_sch", dist_sch);
                }
                if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_sch) && !string.IsNullOrEmpty(dist_loc))
                {
                    command.Parameters.AddWithValue("@dist_loc", dist_loc);
                }

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetBoothList()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }
        //Phase wise
        //public DataSet GetBoothByPhase(int st_id, string district, string acname)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        query = "select * from " + table_prefix + "booth_" + st_id + " b inner join " + table_prefix + "streamlist_" + st_id + " s on b.streamid=s.id where b.boothstateid=" + st_id + "and b.district='" + district + "'";
        //        if (acname != "" && acname != "0")
        //            query = query + " and acname='" + acname + "' ";
        //        query = query + " Order By s.lastseen desc";

        //        SqlCommand command = new SqlCommand(query, conn);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        public List<string> GetLocation(string location, string usertype)
        {
            try
            {
                List<string> locationres = new List<string>();
                using (SqlConnection con = new SqlConnection(connstr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        string query = "select Top 10 location from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s ON s.id=b.streamid where b.location LIKE '%'+@SearchLocation+'%' and b.boothstateid=" + currentphase;
                        if (usertype.StartsWith("dst_"))
                        {
                            query = "select Top 10 location from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s ON s.id=b.streamid where b.location LIKE '%'+@SearchLocation+'%' and b.district='" + usertype.Split('_')[1] + "' and b.boothstateid=" + currentphase;
                        }
                        if (usertype.StartsWith("pc_"))
                        {
                            query = "select Top 10 location from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s ON s.id=b.streamid where b.location LIKE '%'+@SearchLocation+'%' and b.boothstateid=" + currentphase;

                        }
                        if (usertype.StartsWith("sch_"))
                        {
                            query = "select Top 10 location from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s ON s.id=b.streamid where b.location LIKE '%'+@SearchLocation+'%' and b.accode='" + usertype.Split('_')[2] + "' and acname='" + usertype.Split('_')[3] + "' and b.boothstateid=" + currentphase;

                        }
                        cmd.CommandText = query;
                        cmd.Connection = con;
                        con.Open();
                        cmd.Parameters.AddWithValue("@SearchLocation", location);
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            locationres.Add(dr["location"].ToString());
                        }
                        con.Close();
                        return locationres;
                    }
                }
            }
            catch (Exception ex)
            {
                return new List<string>();
            }
        }

        public List<string> Getbooth(string searchtxt, string usertype)
        {
            try
            {
                List<string> locationres = new List<string>();
                using (SqlConnection con = new SqlConnection(connstr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        // string query = "select Top 10 (CONCAT(SUBSTRING(b.acname,0, CHARINDEX('-', b.schoolname)),'/',b.psnum)) as booth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s ON s.id=b.streamid where b.boothstateid=" + currentphase;
                        string query = "select Top 10 (CONCAT(b.acname,'/',b.psnum)) as booth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s ON s.id=b.streamid where b.boothstateid=" + currentphase;

                        if (usertype.StartsWith("ac/ps#"))
                        {
                            usertype = usertype.Split('#')[1];
                            if (usertype.StartsWith("admin"))
                            {
                                query += "";
                            }
                            if (usertype.StartsWith("pc_"))
                            {
                                query += " and b.accode='" + usertype.Split('_')[2] + "'";
                            }
                            if (usertype.StartsWith("sch_"))
                            {
                                query += " and b.accode='" + usertype.Split('_')[2] + "' and b.acname='" + usertype.Split('_')[3] + "' ";
                            }
                            if (searchtxt.Contains('/'))
                            {
                                string[] search_arr = searchtxt.Split('/');
                                query += " and b.acname LIKE '" + search_arr[0] + "%'";
                                //  query += " and b.accode LIKE '" + search_arr[0] + "%'";
                                if (!string.IsNullOrEmpty(search_arr[1]))
                                    query += " and b.psnum LIKE '" + search_arr[1] + "%'";
                            }
                        }
                        cmd.CommandText = query;
                        cmd.Connection = con;
                        con.Open();
                        //cmd.Parameters.AddWithValue("@SearchLocation", location);
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            locationres.Add(dr["booth"].ToString());
                        }
                        con.Close();
                        return locationres;
                    }
                }
            }
            catch (Exception ex)
            {
                return new List<string>();
            }
        }

        public DataSet GetBoothList(string usertype, bool isgrid, int st_id, int start, int end)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string querywherestr = string.Empty;
                string dist = string.Empty;
                string dist_pc = string.Empty;
                string dist_sch = string.Empty;
                string dist_psbooth = string.Empty;
                string dist_loc = string.Empty;
                string strzone = string.Empty;
                string[] utype = { };
                string tblname = string.Empty;
                if (!isgrid)
                {
                    if (usertype == "Master_Admin")
                    {
                        // query = "select * from booth b inner join streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc; select * from static_count;";

                    }
                    else if (usertype == "live")
                    {
                        // query = "select * from booth b inner join streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc";
                        querywherestr = " and s.status='RUNNING' ";
                    }
                    else if (usertype.StartsWith("zn"))
                    {
                        strzone = usertype.Split('_')[1];
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id  where b.isdisplay='True' and b.district in (select zoneDistrict from zoneinfo where zoneName =@zn) and s.IsEnable=1 and b.boothstateid='" + st_id + "' Order By b.acname,b.location asc,len(s.streamname) asc";
                        querywherestr = " and b.district in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName =@zn) ";
                    }
                    else if (usertype.StartsWith("dst"))
                    {
                        if (usertype.Contains("?"))
                        {
                            utype = usertype.Split('?');
                            if (utype[1] != st_id.ToString())
                            {
                                tblname = "p" + utype[1];
                            }
                            dist = utype[0].Split('_')[1];
                            // query = "select * from booth" + tblname + " b inner join streamlist" + tblname + " s on b.streamid=s.id  where b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + utype[1] + "' Order By b.acname,b.location asc,len(s.streamname) asc";
                            querywherestr = " and  b.district=@dst ";
                        }
                        else
                        {
                            dist = usertype.Split('_')[1];
                            // query = "select * from booth b inner join streamlist s on b.streamid=s.id  where b.isdisplay='True' and b.district=@dst and s.IsEnable=1 Order By b.acname,b.location asc,len(s.streamname) asc";
                            querywherestr = " and  b.district=@dst ";
                        }
                    }
                    else if (usertype.StartsWith("pc"))
                    {

                        dist = usertype.Split('_')[1];
                        dist_pc = usertype.Split('_')[2];
                        querywherestr = " and  b.district=@dst and b.accode=@dist_pc ";

                    }
                    else if (usertype.StartsWith("loc"))
                    {

                        dist = usertype.Split('_')[1];
                        dist_pc = usertype.Split('_')[2];
                        dist_sch = usertype.Split('_')[3];
                        dist_loc = usertype.Split('_')[4];
                        // query = "select * from booth b inner join streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.psnum=@dist_loc Order By b.schoolname,b.location asc,len(s.streamname) asc";
                        querywherestr = " and  b.district=@dst and b.accode=@dist_pc and b.acname=@dist_sch and b.psnum=@dist_loc ";
                    }
                    else if (usertype.StartsWith("sch"))
                    {

                        dist = usertype.Split('_')[1];
                        dist_pc = usertype.Split('_')[2];
                        dist_sch = usertype.Split('_')[3];
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch Order By b.schoolname,b.location asc,len(s.streamname) asc";
                        querywherestr = " and  b.district=@dst and b.accode=@dist_pc and b.acname=@dist_sch ";

                    }
                    else if (usertype.StartsWith("psbooth"))
                    {

                        dist = usertype.Split('_')[1];
                        dist_pc = usertype.Split('_')[2];
                        dist_sch = usertype.Split('_')[3];
                        dist_psbooth = usertype.Split('_')[4];
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch Order By b.schoolname,b.location asc,len(s.streamname) asc";
                        querywherestr = " and  b.district=@dst and b.accode=@dist_pc and b.acname=@dist_sch and b.psnum=@dist_psbooth ";

                    }

                }
                else
                {
                    if (usertype == "Master_Admin")
                    {
                        querywherestr = " and s.status='RUNNING' ";
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By s.lastseen desc";
                    }
                    else if (usertype == "live")
                    {
                        querywherestr = " and s.status='RUNNING' ";
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By s.lastseen desc";
                    }
                    else if (usertype.StartsWith("zn"))
                    {
                        strzone = usertype.Split('_')[1];
                        //  query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and b.district in (select zoneDistrict from zoneinfo where zoneName =@zn) and s.IsEnable=1 and b.boothstateid='" + st_id + "' Order By s.hasalarm desc";
                        querywherestr = " and s.status='RUNNING' and b.district in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName =@zn) ";
                    }
                    else if (usertype.StartsWith("dst"))
                    {
                        dist = usertype.Split('_')[1];
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and b.boothstateid=" + st_id + " and b.district=@dst and s.IsEnable=1 Order By s.hasalarm desc";
                        querywherestr = " and s.status='RUNNING' and  b.district=@dst ";
                    }
                    else if (usertype.StartsWith("pc"))
                    {
                        dist = usertype.Split('_')[1];
                        // dist_sch = Convert.ToInt32(usertype.Split('_')[2]);
                        dist_pc = usertype.Split('_')[2];
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.district=@dst and b.id = @dist_sch and b.boothstateid='" + st_id + "' Order By s.status,LEN(s.streamname),s.id";
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid=" + st_id + " Order By s.lastseen desc";
                        querywherestr = " and s.status='RUNNING' and  b.district=@dst and b.accode = @dist_pc ";
                    }
                    else if (usertype.StartsWith("sch"))
                    {
                        dist = usertype.Split('_')[1];
                        // dist_sch = Convert.ToInt32(usertype.Split('_')[2]);
                        dist_pc = usertype.Split('_')[2];
                        dist_sch = usertype.Split('_')[3];
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.district=@dst and b.id = @dist_sch and b.boothstateid='" + st_id + "' Order By s.status,LEN(s.streamname),s.id";
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid=" + st_id + " Order By s.lastseen desc";
                        querywherestr = " and s.status='RUNNING' and  b.district=@dst and b.accode = @dist_pc and b.acname = @dist_sch ";
                    }
                    else if (usertype.StartsWith("psbooth"))
                    {
                        //dist_sch = Convert.ToInt32(usertype.Split('_')[2]);
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.id = @dist_sch and b.boothstateid='" + st_id + "' Order By s.status,LEN(s.streamname),s.id";

                        dist = usertype.Split('_')[1];
                        dist_pc = usertype.Split('_')[2];
                        dist_sch = usertype.Split('_')[3];
                        dist_psbooth = usertype.Split('_')[4];
                        //query = "select * from booth b inner join streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch Order By b.schoolname,b.location asc,len(s.streamname) asc";
                        querywherestr = " and s.status='RUNNING' and  b.district=@dst and b.accode = @dist_pc and b.acname = @dist_sch and b.psnum=@dist_psbooth ";

                    }
                }
                String varname1 = "";
                varname1 = varname1 + "WITH x " + "\n";
                varname1 = varname1 + "AS " + "\n";
                varname1 = varname1 + "( " + "\n";
                varname1 = varname1 + "     select ROW_NUMBER() over (order by len(SUBSTRING(s.streamname, PATINDEX('%[^0 ]%', s.streamname), LEN(s.streamname))) asc) as rn, " + "\n";
                varname1 = varname1 + "    b.*,s.deviceid,s.hasalarm,s.isdownload,s.IsEnable,s.isLive,s.isvod,s.lastseen,s.schoolid,s.selected,s.servername,b.boothstateid,s.status,s.stop,s.streamname " + "\n";
                varname1 = varname1 + " from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' " + "\n";
                varname1 = varname1 + " and s.IsEnable=1 and b.boothstateid='" + ConfigurationManager.AppSettings["stateid"].ToString() + "' " + "\n";
                varname1 = varname1 + querywherestr + "\n";
                varname1 = varname1 + "), " + "\n";
                varname1 = varname1 + "Count_CTE " + "\n";
                varname1 = varname1 + "AS " + "\n";
                varname1 = varname1 + "( " + "\n";
                varname1 = varname1 + "    SELECT COUNT(*) AS TotalRows FROM x " + "\n";
                varname1 = varname1 + "    " + "\n";
                varname1 = varname1 + ") " + "\n";
                varname1 = varname1 + "SELECT x.*, Count_CTE.TotalRows " + "\n";
                varname1 = varname1 + "FROM x " + "\n";
                varname1 = varname1 + "CROSS JOIN Count_CTE " + "\n";
                varname1 = varname1 + " where x.rn between " + start + " and " + end + " ORDER BY x.rn";
                query = varname1;
                SqlCommand command = new SqlCommand(query, conn);
                if (!string.IsNullOrEmpty(dist))
                {
                    command.Parameters.AddWithValue("@dst", dist);
                }
                if (!string.IsNullOrEmpty(strzone))
                {
                    command.Parameters.AddWithValue("@zn", strzone);
                }
                if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_pc))
                {
                    command.Parameters.AddWithValue("@dist_pc", dist_pc);
                }
                if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_pc) && !string.IsNullOrEmpty(dist_sch))
                {
                    command.Parameters.AddWithValue("@dist_sch", dist_sch);
                }
                if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_pc) && !string.IsNullOrEmpty(dist_sch) && !string.IsNullOrEmpty(dist_loc))
                {
                    command.Parameters.AddWithValue("@dist_loc", dist_loc);
                }
                if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_pc) && !string.IsNullOrEmpty(dist_sch) && !string.IsNullOrEmpty(dist_psbooth))
                {
                    command.Parameters.AddWithValue("@dist_psbooth", dist_psbooth);
                }

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetBoothList()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }

        //public DataSet GetBoothListCount(string usertype, bool isgrid, int st_id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string querywherestr = string.Empty;
        //        string dist = string.Empty;
        //        string dist_pc = string.Empty;
        //        string dist_sch = string.Empty;
        //        string dist_psbooth = string.Empty;
        //        string dist_loc = string.Empty;
        //        string strzone = string.Empty;
        //        string[] utype = { };
        //        string tblname = string.Empty;

        //        query = "select s.status from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s ON s.id=b.streamid where b.isdisplay=1";
        //        SqlCommand command = new SqlCommand(query, conn);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        //public DataSet GetDistrictByPhase(int st_id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string dist = string.Empty;
        //        string tblname = string.Empty;

        //        query = "SELECT distinct(District) from " + table_prefix + "[district_" + st_id + "] WHERE stateid=" + st_id + " ORDER BY District ASC;";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetDistrictList()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}
        //public DataSet GetACbyDistrict(int st_id, string district)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string dist = string.Empty;
        //        string tblname = string.Empty;

        //        query = "SELECT acname from  " + table_prefix + "[district_" + st_id + "] WHERE stateid=" + st_id + " AND district ='" + district + "' ORDER BY ACNAme ASC;";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetDistrictList()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}

        public DataSet GetDistrictList(string usertype, int st_id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string dist = string.Empty;
                string tblname = string.Empty;
                string[] utype = { };
                //if (usertype == "Master_Admin" || usertype == "live")
                //{
                query = "SELECT distinct(b.district)district,b.district as SelValue FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE Isdisplay=1 and b.boothstateid=" + st_id + " ORDER BY b.District ASC;";
                //}
                //else if (usertype.Contains("?"))
                //{
                //    utype = usertype.Split('?');
                //    if (utype[1] != st_id.ToString())
                //    {
                //        tblname = "p" + utype[1];
                //    }
                //    if (utype[0] == "admin" || utype[0] == "live")
                //    {
                //        query = "SELECT distinct(b.district)district,b.district as SelValue FROM " + table_prefix + "booth" + tblname + " b inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id WHERE Isdisplay=1 and b.boothstateid='" + utype[1] + "' ORDER BY b.District ASC;";
                //    }

                //    else
                //    {
                //        dist = utype[0].Split('_')[1];
                //        query = "SELECT distinct(b.district)district,b.district as SelValue  FROM " + table_prefix + "booth" + tblname + " b inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district =N'" + dist + "' and b.boothstateid='" + utype[1] + "' ORDER BY b.District ASC;";
                //        //query = "SELECT distinct([acname]) FROM [Booth] WHERE Isdisplay=1 and district ='" + dist + "'  ORDER BY [schoolname] ASC;";
                //    }

                //}
                //else if (usertype.StartsWith("zn"))
                //{
                //    dist = usertype.Split('_')[1];
                //    query = "SELECT distinct(b.district)district,b.district as SelValue FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district  in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName ='" + dist + "')  and b.boothstateid='" + st_id + "' ORDER BY b.District ASC;";

                //}
                //else if (usertype.StartsWith("pc"))
                //{
                //    string pc = usertype.Split('_')[2];
                //    query = "SELECT distinct(b.district)district,b.district as SelValue FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.boothstateid=" + st_id + " and b.accode=N'" + pc + "' ORDER BY b.District ASC;";

                //}
                //else
                //{
                //    dist = usertype.Split('_')[1];
                //    query = "SELECT distinct(b.district)district,b.district as SelValue FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district = N'" + dist + "' and b.boothstateid=" + st_id + " ORDER BY b.District ASC;";
                //    //query = "SELECT distinct([acname]) FROM [Booth] WHERE Isdisplay=1 and district ='" + dist + "'  ORDER BY [schoolname] ASC;";
                //}


                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, false);
            }
            catch (Exception ex)
            {
                Common.Log("GetDistrictList()--> " + ex.Message);
            }
            finally
            {
            }
            return ds;
        }


        //public DataSet GetBoothListECI(string usertype, bool isgrid, int st_id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string dist = string.Empty;
        //        string dist_sch = string.Empty;
        //        string strzone = string.Empty;
        //        string[] utype = { };
        //        string tblname = string.Empty;
        //        if (!isgrid)
        //        {
        //            if (usertype == "Master_Admin")
        //            {
        //                query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid='" + st_id + "' and s.selected=1 Order By b.acname,b.location asc,len(s.streamname) asc; select * from " + table_prefix + "static_count;";
        //            }
        //            else if (usertype == "live")
        //            {
        //                query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid='" + st_id + "' and s.selected=1 Order By b.acname,b.location asc,len(s.streamname) asc";
        //            }
        //            else if (usertype.StartsWith("zn"))
        //            {
        //                strzone = usertype.Split('_')[1];
        //                query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and b.district in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName =@zn) and s.IsEnable=1 and b.boothstateid='" + st_id + "' Order By s.hasalarm desc,len(s.streamname) asc";
        //            }
        //            else if (usertype.StartsWith("dst"))
        //            {
        //                if (usertype.Contains("?"))
        //                {
        //                    utype = usertype.Split('?');
        //                    if (utype[1] != st_id.ToString())
        //                    {
        //                        tblname = "p" + utype[1];
        //                    }
        //                    dist = utype[0].Split('_')[1];
        //                    query = "select * from booth" + tblname + " b inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id  where b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + utype[1] + "' Order By b.acname,b.location asc,len(s.streamname) asc";
        //                }
        //                else
        //                {
        //                    dist = usertype.Split('_')[1];
        //                    query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + st_id + "' and s.selected=1 Order By s.hasalarm desc,len(s.streamname) asc";
        //                }
        //            }
        //            else if (usertype.StartsWith("sch"))
        //            {
        //                //dist_sch = Convert.ToInt32(usertype.Split('_')[2]);
        //                //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.id = @dist_sch and b.boothstateid='" + st_id + "' Order By s.status,LEN(s.streamname),s.id";
        //                if (usertype.Contains("?"))
        //                {
        //                    utype = usertype.Split('?');
        //                    if (utype[1] != st_id.ToString())
        //                    {
        //                        tblname = "p" + utype[1];
        //                    }
        //                    dist = utype[0].Split('_')[1];
        //                    dist_sch = utype[0].Split('_')[2];
        //                    query = "select * from booth" + tblname + " b inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid='" + utype[1] + "' Order By b.schoolname,b.location asc,len(s.streamname) asc";
        //                }
        //                else
        //                {
        //                    dist = usertype.Split('_')[1];
        //                    dist_sch = usertype.Split('_')[2];
        //                    query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid='" + st_id + "' and s.selected=1 Order By b.schoolname,b.location asc,len(s.streamname) asc";
        //                }
        //            }
        //        }
        //        else
        //        {
        //            if (usertype == "Master_Admin")
        //            {
        //                query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid='" + st_id + "' and s.selected=1 Order By s.lastseen desc";
        //            }
        //            else if (usertype == "live")
        //            {
        //                query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid='" + st_id + "' and s.selected=1 Order By s.lastseen desc";
        //            }
        //            else if (usertype.StartsWith("zn"))
        //            {
        //                strzone = usertype.Split('_')[1];
        //                query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and b.district in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName =@zn) and s.IsEnable=1 and b.boothstateid='" + st_id + "' Order By s.hasalarm desc";
        //            }
        //            else if (usertype.StartsWith("dst"))
        //            {
        //                dist = usertype.Split('_')[1];
        //                query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + st_id + "' and s.selected=1 Order By s.hasalarm desc";
        //            }
        //            else if (usertype.StartsWith("sch"))
        //            {
        //                dist = usertype.Split('_')[1];
        //                // dist_sch = Convert.ToInt32(usertype.Split('_')[2]);
        //                dist_sch = usertype.Split('_')[2];
        //                //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.district=@dst and b.id = @dist_sch and b.boothstateid='" + st_id + "' Order By s.status,LEN(s.streamname),s.id";
        //                query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid='" + st_id + "' and s.selected=1 Order By s.lastseen desc";
        //            }
        //        }
        //        SqlCommand command = new SqlCommand(query, conn);
        //        if (!string.IsNullOrEmpty(dist))
        //        {
        //            command.Parameters.AddWithValue("@dst", dist);
        //        }
        //        if (!string.IsNullOrEmpty(strzone))
        //        {
        //            command.Parameters.AddWithValue("@zn", strzone);
        //        }
        //        if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_sch))
        //        {
        //            command.Parameters.AddWithValue("@dist_sch", dist_sch);
        //        }
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        public DataSet GetDistrictListECI(string usertype, int st_id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string dist = string.Empty;
                string tblname = string.Empty;
                string[] utype = { };
                if (usertype == "Master_Admin" || usertype == "live")
                {
                    query = "SELECT distinct(b.district)district,b.district as SelValue  FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE Isdisplay=1 and b.boothstateid='" + st_id + "' and s.selected=1 ORDER BY b.District ASC;";
                }
                else if (usertype.Contains("?"))
                {
                    utype = usertype.Split('?');
                    if (utype[1] != st_id.ToString())
                    {
                        tblname = "p" + utype[1];
                    }
                    if (utype[0] == "admin" || utype[0] == "live")
                    {
                        query = "SELECT distinct(b.district)district,b.district as SelValue FROM " + table_prefix + "booth" + tblname + " b inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id WHERE Isdisplay=1 and b.boothstateid='" + utype[1] + "' ORDER BY b.District ASC;";
                    }

                    else
                    {
                        dist = utype[0].Split('_')[1];
                        query = "SELECT distinct(b.district)district,b.district as SelValue FROM Booth" + tblname + " b inner join streamlist" + tblname + " s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district =N'" + dist + "' and b.boothstateid='" + utype[1] + "' ORDER BY b.District ASC;";
                        //query = "SELECT distinct([acname]) FROM [Booth] WHERE Isdisplay=1 and district ='" + dist + "'  ORDER BY [schoolname] ASC;";
                    }

                }
                else if (usertype.StartsWith("zn"))
                {
                    dist = usertype.Split('_')[1];
                    query = "SELECT distinct(b.district)district,b.district as SelValue FROM " + table_prefix + "booth b inner join streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district  in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName ='" + dist + "')  and b.boothstateid='" + st_id + "' ORDER BY b.District ASC;";

                }
                else
                {
                    dist = usertype.Split('_')[1];
                    query = "SELECT distinct(b.district)district,b.district as SelValue FROM " + table_prefix + "booth b inner join streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district = N'" + dist + "' and b.boothstateid='" + st_id + "' and s.selected=1 ORDER BY b.District ASC;";
                    //query = "SELECT distinct([acname]) FROM [Booth] WHERE Isdisplay=1 and district ='" + dist + "'  ORDER BY [schoolname] ASC;";
                }


                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetDistrictList()--> " + ex.Message);
            }
            finally
            {
            }
            return ds;
        }

        public DataSet GetPhaseList()
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string dist = string.Empty;
                query = "SELECT * from state where isdisplay=1 and id=@stateid";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@stateid", currentphase);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetDistrictList()--> " + ex.Message);
            }
            finally
            {
            }
            return ds;
        }
        //public DataSet GetPhases()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string dist = string.Empty;
        //        query = "SELECT * from state";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetPhases()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}
        public DataSet GetBoothFromDistrictPC(string District, string pcname, string usertype)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string utype = string.Empty;
                string tblname = string.Empty;
                query = "SELECT distinct(b.acname) ,b.acname SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.accode = N'" + pcname + "' and boothstateid=" + currentphase + "";
                if (District == allKeyword + districtname)
                {
                    query = "SELECT distinct(b.acname) ,b.acname SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.accode = N'" + pcname + "' and boothstateid=" + currentphase + "";
                }
                if (usertype.StartsWith("pc") || usertype.StartsWith("dst"))
                {
                    if (District == allKeyword + districtname)
                    {
                        query = "SELECT distinct(b.acname) ,b.acname SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.accode = N'" + pcname + "' and boothstateid=" + currentphase + "";
                    }
                    else
                    {

                        query = "SELECT distinct(b.acname) ,b.acname SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and district=N'" + District + "' and b.accode = N'" + pcname + "' and boothstateid=" + currentphase + "";
                    }
                }
                if (usertype.StartsWith("sch"))
                {
                    string acname = usertype.Split('_')[3];
                    query = "SELECT distinct(b.acname) ,b.acname SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.district = N'" + District + "' and b.accode = N'" + pcname + "' and acname =N'" + acname + "' and boothstateid=" + currentphase + "";
                    if (District == allKeyword + districtname)
                    {
                        query = "SELECT distinct(b.acname) ,b.acname SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.accode = N'" + pcname + "' and acname =N'" + acname + "' and boothstateid=" + currentphase + "";
                    }
                }
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetBoothFromDistrict()--> " + ex.Message);
            }
            finally
            {
            }
            return ds;
        }

        //public DataSet GetPSBoothFromDistrictPCAC(string District, string pcname, string acname, string usertype)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string utype = string.Empty;
        //        string tblname = string.Empty;
        //        query = "SELECT distinct(b.psnum),b.psnum  SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.accode = N'" + pcname + "' and b.acname = N'" + acname + "' and boothstateid=" + currentphase + "";
        //        if (District == allKeyword + districtname)
        //        {
        //            query = "SELECT distinct(b.psnum),b.psnum  SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.accode = N'" + pcname + "' and b.acname = N'" + acname + "' and boothstateid=" + currentphase + "";
        //        }
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothFromDistrict()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}

        public DataSet GetPCFromDistrict(string District, string usertype, int st_id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string utype = string.Empty;
                string tblname = string.Empty;
                if (usertype.Contains("?"))
                {
                    utype = usertype.Split('?')[1];
                    if (utype != st_id.ToString())
                    {
                        tblname = "p" + utype;
                    }
                    //query = "SELECT distinct(b.acname),b.id FROM Booth" + tblname + " b inner join streamlist" + tblname + " s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district ='" + District + "' and b.boothstateid='" + utype + "' and b.id in (select min(id) from booth" + tblname + " where isdisplay=1 group by schoolname);";
                    //query = "SELECT distinct(b.accode) ,b.accode SelValue FROM Booth" + tblname + " b WHERE b.Isdisplay=1 and b.district = N'" + District + "' and b.boothstateid='" + currentphase + "';";
                    query = "SELECT distinct(b.accode) ,b.acname,b.accode SelValue FROM Booth" + tblname + " b WHERE b.Isdisplay=1 and b.district = N'" + District + "' and b.boothstateid='" + currentphase + "';";
                }
                else
                {
                    // query = "SELECT distinct(b.acname),b.id FROM Booth b inner join streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district ='" + District + "' and b.boothstateid='" + st_id + "' and b.id in (select min(id) from booth where isdisplay=1 group by schoolname);";
                    //query = "SELECT distinct(b.accode) ,b.accode SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.district = N'" + District + "' and b.boothstateid='" + currentphase + "'";
                    query = "SELECT distinct(b.accode) ,b.acname,b.accode SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.district = N'" + District + "' and b.boothstateid='" + currentphase + "'";
                }
                if (usertype.StartsWith("pc"))
                {
                    string schoolid = usertype.Split('_')[2].ToString();
                    if (usertype.Contains("?"))
                    {
                        string oldschoolid = usertype.Split('?')[0].ToString();
                        schoolid = oldschoolid.Split('_')[2].ToString();
                    }

                    //query = "SELECT distinct(b.accode) ,b.accode SelValue FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district = N'" + District + "'  and b.accode = '" + schoolid + "' and b.boothstateid='" + st_id + "' ORDER BY b.accode ASC;";
                    query = "SELECT distinct(b.accode) ,b.acname ,b.accode SelValue FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district = N'" + District + "'  and b.accode = '" + schoolid + "' and b.boothstateid='" + st_id + "' ORDER BY b.accode ASC;";
                    if (usertype.Split('_')[1] == allKeyword + districtname)
                    {
                        //query = "SELECT distinct(b.accode) ,b.accode SelValue FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1  and b.accode = '" + schoolid + "' and b.boothstateid='" + st_id + "' ORDER BY b.accode ASC;";
                        query = "SELECT distinct(b.accode) ,b.acname,b.accode SelValue FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1  and b.accode = '" + schoolid + "' and b.boothstateid='" + st_id + "' ORDER BY b.accode ASC;";
                    }

                }
                if (usertype == "ALL District-ALL PC")
                {
                    //query = "SELECT distinct(b.accode) ,b.accode SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and accode is not NULL and b.boothstateid='" + currentphase + "'";
                    query = "SELECT distinct(b.accode) ,b.acname,b.accode SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and accode is not NULL and b.boothstateid='" + currentphase + "'";

                }
                if (usertype.StartsWith("sch"))
                {
                    string schoolid = usertype.Split('_')[2].ToString();
                    //query = "SELECT distinct(b.accode) ,b.accode SelValue FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district = N'" + District + "'  and b.accode = '" + schoolid + "' and b.boothstateid='" + st_id + "' ORDER BY b.accode ASC;";
                    query = "SELECT distinct(b.accode) ,b.acname,b.accode SelValue FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district = N'" + District + "'  and b.accode = '" + schoolid + "' and b.boothstateid='" + st_id + "' ORDER BY b.accode ASC;";
                }
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetBoothFromDistrict()--> " + ex.Message);
            }
            finally
            {
            }
            return ds;
        }

        //public string GetDistrictFromPC(string pc, string usertype)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string utype = string.Empty;
        //        string tblname = string.Empty;
        //        query = "SELECT distinct(b.district) FROM " + table_prefix + "Booth b WHERE b.Isdisplay=1 and b.accode = N'" + pc + "';";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);

        //        return ds.Tables[0].Rows[0]["district"].ToString();
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetDistrictFromPC()--> " + ex.Message);
        //        return string.Empty;
        //    }
        //    finally
        //    {
        //    }

        //}
        //public DataSet GetBoothFromPC(string District, string PC, string usertype, int st_id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string utype = string.Empty;
        //        string tblname = string.Empty;
        //        if (usertype.Contains("?"))
        //        {
        //            utype = usertype.Split('?')[1];
        //            if (utype != st_id.ToString())
        //            {
        //                tblname = "p" + utype;
        //            }
        //            //query = "SELECT distinct(b.acname),b.id FROM Booth" + tblname + " b inner join streamlist" + tblname + " s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district ='" + District + "' and b.boothstateid='" + utype + "' and b.id in (select min(id) from booth" + tblname + " where isdisplay=1 group by schoolname);";
        //            query = "SELECT distinct(b.acname) FROM " + table_prefix + "Booth b WHERE b.Isdisplay=1 and b.district = N'" + District + "' and b.accode = N'" + PC + "';";
        //        }
        //        else
        //        {
        //            // query = "SELECT distinct(b.acname),b.id FROM Booth b inner join streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district ='" + District + "' and b.boothstateid='" + st_id + "' and b.id in (select min(id) from booth where isdisplay=1 group by schoolname);";
        //            query = "SELECT distinct(b.acname) FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.district = N'" + District + "' and b.accode = N'" + PC + "'";
        //        }
        //        if (usertype.StartsWith("sch"))
        //        {
        //            string schoolid = usertype.Split('_')[2].ToString();
        //            if (usertype.Contains("?"))
        //            {
        //                string oldschoolid = usertype.Split('?')[0].ToString();
        //                schoolid = oldschoolid.Split('_')[2].ToString();
        //            }

        //            query = "SELECT distinct(b.acname) FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district = N'" + District + "' and b.accode = N'" + PC + "'  and b.acname = '" + schoolid + "' and b.boothstateid='" + st_id + "' ORDER BY b.acname ASC;";
        //        }

        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothFromPC()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}

        public DataSet GetBoothFromDistrict(string District, string usertype, int st_id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string utype = string.Empty;
                string tblname = string.Empty;
                if (usertype.Contains("?"))
                {
                    utype = usertype.Split('?')[1];
                    if (utype != st_id.ToString())
                    {
                        tblname = "p" + utype;
                    }
                    //query = "SELECT distinct(b.acname),b.id FROM Booth" + tblname + " b inner join streamlist" + tblname + " s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district ='" + District + "' and b.boothstateid='" + utype + "' and b.id in (select min(id) from booth" + tblname + " where isdisplay=1 group by schoolname);";
                    query = "SELECT distinct(b.acname) FROM " + table_prefix + "Booth b WHERE b.Isdisplay=1 and b.district = N'" + District + "';";
                }
                else
                {
                    // query = "SELECT distinct(b.acname),b.id FROM Booth b inner join streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district ='" + District + "' and b.boothstateid='" + st_id + "' and b.id in (select min(id) from booth where isdisplay=1 group by schoolname);";
                    query = "SELECT distinct(b.acname) FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.district = N'" + District + "'";
                }
                if (usertype.StartsWith("sch"))
                {
                    string schoolid = usertype.Split('_')[2].ToString();
                    if (usertype.Contains("?"))
                    {
                        string oldschoolid = usertype.Split('?')[0].ToString();
                        schoolid = oldschoolid.Split('_')[2].ToString();
                    }

                    query = "SELECT distinct(b.acname) FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district = N'" + District + "'  and b.schoolname = '" + schoolid + "' and b.boothstateid='" + st_id + "' ORDER BY b.schoolname ASC;";
                }

                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetBoothFromDistrict()--> " + ex.Message);
            }
            finally
            {
            }
            return ds;
        }
        public DataSet GetBoothFromDistrictECI(string District, string usertype, int st_id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string utype = string.Empty;
                string tblname = string.Empty;
                if (usertype.Contains("?"))
                {
                    utype = usertype.Split('?')[1];
                    if (utype != st_id.ToString())
                    {
                        tblname = "p" + utype;
                    }
                    //query = "SELECT distinct(b.acname),b.id FROM Booth" + tblname + " b inner join streamlist" + tblname + " s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district ='" + District + "' and b.boothstateid='" + utype + "' and b.id in (select min(id) from booth" + tblname + " where isdisplay=1 group by schoolname);";
                    query = "SELECT distinct(b.acname) ,b.acname SelValue FROM Booth" + tblname + " b WHERE b.Isdisplay=1 and b.district = N'" + District + "';";
                }
                else
                {
                    // query = "SELECT distinct(b.acname),b.id FROM Booth b inner join streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district ='" + District + "' and b.boothstateid='" + st_id + "' and b.id in (select min(id) from booth where isdisplay=1 group by schoolname);";
                    query = "SELECT distinct(b.acname) ,b.acname SelValue FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.district = N'" + District + "'";
                }
                if (usertype.StartsWith("sch"))
                {
                    string schoolid = usertype.Split('_')[2].ToString();
                    if (usertype.Contains("?"))
                    {
                        string oldschoolid = usertype.Split('?')[0].ToString();
                        schoolid = oldschoolid.Split('_')[2].ToString();
                    }

                    query = "SELECT distinct(b.acname) ,b.acname SelValue FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district = N'" + District + "'  and b.schoolname = '" + schoolid + "' and b.boothstateid='" + st_id + "' and s.selected=1 ORDER BY b.schoolname ASC;";
                }

                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetBoothFromDistrict()--> " + ex.Message);
            }
            finally
            {
            }
            return ds;
        }
        //public DataSet GetStreamStatusDate(string District, string acname, string booth)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string utype = string.Empty;
        //        string tblname = string.Empty;
        //        query = "SELECT distinct(CONVERT(VARCHAR(10),ss.statustime,103)) as statustime FROM " + table_prefix + "streamstatus ss WHERE ss.streamid= (SELECT streamid FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.district = N'" + District + "' and b.acname = N'" + acname + "' and b.PSNum = N'" + booth + "')";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        return ds;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothFromDistrict()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}
        //public DataSet GetlocationFromDistrictAC(string District, string acname, string usertype)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string utype = string.Empty;
        //        string tblname = string.Empty;
        //        query = "SELECT distinct(b.psnum) FROM " + table_prefix + "booth b WHERE b.Isdisplay=1 and b.district = N'" + District + "' and b.acname = N'" + acname + "'";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothFromDistrict()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}
        public DataSet GetBoothFromDistrict(string District, int st_id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = "SELECT distinct(b.acname),b.id FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id WHERE b.Isdisplay=1 and b.district ='" + District + "' and b.boothstateid='" + st_id + "' ORDER BY b.schoolname ASC;";
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetBoothFromDistrict(1param)--> " + ex.Message);
            }
            finally
            {
            }
            return ds;
        }
        //public DataSet GetStreamList()
        //{
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string result = string.Empty;
        //        string query = string.Empty;
        //        string utype = string.Empty;

        //        query = "select * from streamlist1";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        DataSet ds = new DataSet();
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        return ds;
        //    }
        //    catch (Exception ex)
        //    {
        //        return new DataSet();
        //    }
        //    finally
        //    {

        //    }

        //}
        public string LiveCounter(string usertype, bool hrflag, int st_id)
        {
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string result = string.Empty;
                string query = string.Empty;
                string utype = string.Empty;
                if (usertype == "uadmin")
                {
                    query = "select COUNT(b.streamid) from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid='" + st_id + "' and lastseen >= DateAdd(minute,-" + minute + ",CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME));";
                }
                else if (usertype == "uadmin2")
                {
                    if (hrflag)
                    {
                        query = "select COUNT(b.streamid) from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and lastseen >= DateAdd(minute,-" + minute + ",CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME)) and s.IsEnable=1 and b.boothstateid=" + st_id;
                    }
                    else
                    {
                        query = "select COUNT(b.streamid) from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid=" + st_id;
                    }
                }
                else
                {

                    utype = usertype.Split('_')[1];
                    if (hrflag)
                    {
                        query = "select COUNT(b.streamid) from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where  b.district=N'" + utype + "' and lastseen >= DateAdd(minute,-" + minute + ",CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME)) and b.isdisplay='True' and s.IsEnable=1 and b.boothstateid='" + st_id + "'";
                    }
                    else
                    {
                        query = "select COUNT(b.streamid) from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where  b.district=N'" + utype + "' and s.status='RUNNING' and b.isdisplay='True' and s.IsEnable=1 and b.boothstateid='" + st_id + "'";
                    }
                    if (usertype.Split('_').Length > 2)
                    {
                        if (usertype.Split('_')[2] == "dstcount")
                        {
                            query = "select COUNT(b.streamid) from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where  b.district=N'" + utype + "' and b.isdisplay='True' and s.IsEnable=1 and b.boothstateid='" + st_id + "'";

                        }
                    }
                    // query = "select COUNT(s.id) from booth b inner join streamlist s on b.streamid=s.id where b.district=N'" + utype + "' and b.isdisplay='True' and s.IsEnable=1 and b.boothstateid='" + st_id + "' and lastseen >= DateAdd(minute,-" + minute + ",CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME))";
                }
                SqlCommand command = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader dr = command.ExecuteReader();
                if (dr.Read())
                {
                    result = dr.GetValue(0).ToString();
                }
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conn.Close();
            }

        }

        public string LiveCounterECI(string usertype, int st_id)
        {
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string result = string.Empty;
                string query = string.Empty;
                string utype = string.Empty;
                if (usertype == "uadmin")
                {
                    query = "select COUNT(s.id) from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1  and s.selected=1 and b.boothstateid='" + st_id + "'";
                }
                else if (usertype == "uadmin2")
                {
                    query = "select COUNT(s.id) from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.status='RUNNING'  and s.selected=1 and s.IsEnable=1 and b.boothstateid=" + st_id;
                }
                else
                {
                    utype = usertype.Split('_')[1];
                    query = "select COUNT(s.id) from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where  b.district=N'" + utype + "' and s.status='RUNNING' and b.isdisplay='True' and s.IsEnable=1 and s.selected=1 and b.boothstateid='" + st_id + "'";

                    // query = "select COUNT(s.id) from booth b inner join streamlist s on b.streamid=s.id where b.district=N'" + utype + "' and b.isdisplay='True' and s.IsEnable=1 and b.boothstateid='" + st_id + "' and lastseen >= DateAdd(minute,-" + minute + ",CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME))";
                }
                SqlCommand command = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader dr = command.ExecuteReader();
                if (dr.Read())
                {
                    result = dr.GetValue(0).ToString();
                }
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conn.Close();
            }

        }

        public void UpdateStatus(string streamname)
        {
            SqlConnection SQLconn = new SqlConnection(connstr);
            try
            {
                string query = query = "UPDATE " + table_prefix + "streamlist SET hasalarm='False' WHERE streamname = @streamname;";
                SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
                SQLcommand.Parameters.Add(new SqlParameter("@streamname", streamname));
                SQLconn.Open();
                SQLcommand.ExecuteNonQuery();
                SQLconn.Close();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                SQLconn.Close();
            }
        }

        public void updateloginstatus(bool status, string username)
        {
            SqlConnection SQLconn = new SqlConnection(connstr);
            try
            {
                string query = query = "UPDATE " + table_prefix + "users set islogin = @islogin, logincount=logincount-1 where username = @username";
                //  string query = query = "UPDATE " + table_prefix + "users set islogin = @islogin where username = @username";
                SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
                SQLcommand.Parameters.Add(new SqlParameter("@islogin", status));
                SQLcommand.Parameters.Add(new SqlParameter("@username", username));
                SQLconn.Open();
                SQLcommand.ExecuteNonQuery();

            }
            catch (Exception ex)
            {

            }
            finally
            {
                SQLconn.Close();
            }
        }

        //public int getliveconn()
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = query = "select minute from liveconn";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
        //        DataTable dt = new DataTable();

        //        SQLconn.Open();
        //        adp.Fill(dt);
        //        SQLconn.Close();

        //        return Convert.ToInt32(dt.Rows[0]["minute"]);
        //    }
        //    catch (Exception ex)
        //    {
        //        return 0;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }

        //}

        public bool updatelogincount(string username)
        {
            SqlConnection SQLconn = new SqlConnection(connstr);
            try
            {
                string query = query = "UPDATE " + table_prefix + "users set logincount = logincount+1 where username = @username";
                SqlCommand SQLcommand = new SqlCommand(query, SQLconn);

                SQLcommand.Parameters.Add(new SqlParameter("@username", username));
                SQLconn.Open();
                SQLcommand.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                SQLconn.Close();
            }
        }
        //public DataSet GetStreamstatusList(string usertype, bool isgrid, int st_id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string dist = string.Empty;
        //        string dist_sch = string.Empty;
        //        string dist_loc = string.Empty;
        //        string dist_dd = string.Empty;
        //        string strzone = string.Empty;
        //        string[] utype = { };
        //        string tblname = string.Empty;
        //        if (!isgrid)
        //        {
        //            if (usertype == "Master_Admin")
        //            {
        //                query = "select b.*,ss.*,s.streamname from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id inner join " + table_prefix + "streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc;";
        //            }
        //            else if (usertype == "live")
        //            {
        //                query = "select b.*,ss.*,s.streamname from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id inner join " + table_prefix + "streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //            }
        //            else if (usertype.StartsWith("zn"))
        //            {
        //                strzone = usertype.Split('_')[1];
        //                query = "select b.*,ss.*,s.streamname from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id inner join " + table_prefix + "streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and b.district in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName =@zn) and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //            }
        //            else if (usertype.StartsWith("dst"))
        //            {
        //                if (usertype.Contains("?"))
        //                {
        //                    utype = usertype.Split('?');
        //                    if (utype[1] != st_id.ToString())
        //                    {
        //                        tblname = "p" + utype[1];
        //                    }
        //                    dist = utype[0].Split('_')[1];
        //                    query = "select b.*,ss.*,s.streamname from booth" + tblname + " b inner join streamlist" + tblname + " s on b.streamid=s.id inner join " + table_prefix + "streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + utype[1] + "' Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //                }
        //                else
        //                {
        //                    dist = usertype.Split('_')[1];
        //                    query = "select b.*,ss.*,s.streamname from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id inner join " + table_prefix + "streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //                }
        //            }
        //            else if (usertype.StartsWith("sch"))
        //            {
        //                //dist_sch = Convert.ToInt32(usertype.Split('_')[2]);
        //                //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.id = @dist_sch and b.boothstateid='" + st_id + "' Order By s.status,LEN(s.streamname),s.id";
        //                if (usertype.Contains("?"))
        //                {
        //                    utype = usertype.Split('?');
        //                    if (utype[1] != st_id.ToString())
        //                    {
        //                        tblname = "p" + utype[1];
        //                    }
        //                    dist = utype[0].Split('_')[1];
        //                    dist_sch = utype[0].Split('_')[2];
        //                    query = "select b.*,ss.*,s.streamname from booth" + tblname + " b inner join streamlist" + tblname + " s on b.streamid=s.id inner join " + table_prefix + "streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid='" + utype[1] + "' Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //                }
        //                else
        //                {
        //                    dist = usertype.Split('_')[1];
        //                    dist_sch = usertype.Split('_')[2];
        //                    query = "select b.*,ss.*,s.streamname from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id inner join " + table_prefix + "streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //                }
        //            }
        //            else if (usertype.StartsWith("loc"))
        //            {

        //                dist = usertype.Split('_')[1];
        //                dist_sch = usertype.Split('_')[2];
        //                dist_loc = usertype.Split('_')[3];
        //                query = "select b.*,ss.*,s.streamname from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id inner join " + table_prefix + "streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.psnum = @dist_loc and b.boothstateid=" + st_id + " Order By b.schoolname,b.location asc,len(s.streamname) asc,ss.statustime desc";

        //            }
        //            else if (usertype.StartsWith("dd"))
        //            {

        //                dist = usertype.Split('_')[1];
        //                dist_sch = usertype.Split('_')[2];
        //                dist_loc = usertype.Split('_')[3];
        //                dist_dd = usertype.Split('_')[4];
        //                query = "select b.*,ss.*,s.streamname from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id inner join " + table_prefix + "streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(ss.statustime as DATE)), '19000101') and ss.statustime < DATEADD(DAY, DATEDIFF(DAY, '18991231', CAST(ss.statustime as DATE)), '19000101')  and b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.psnum = @dist_loc and b.boothstateid=" + st_id + " Order By b.schoolname,b.location asc,len(s.streamname) asc";

        //            }
        //        }

        //        SqlCommand command = new SqlCommand(query, conn);
        //        if (!string.IsNullOrEmpty(dist))
        //        {
        //            command.Parameters.AddWithValue("@dst", dist);
        //        }
        //        if (!string.IsNullOrEmpty(strzone))
        //        {
        //            command.Parameters.AddWithValue("@zn", strzone);
        //        }
        //        if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_sch))
        //        {
        //            command.Parameters.AddWithValue("@dist_sch", dist_sch);
        //        }
        //        if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_sch) && !string.IsNullOrEmpty(dist_loc))
        //        {
        //            command.Parameters.AddWithValue("@dist_loc", dist_loc);
        //        }
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}

        //public DataSet GetStreamstatusList(string usertype, int st_id, int start, int end)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string dist = string.Empty;
        //        string querywherestr = string.Empty;
        //        string dist_sch = string.Empty;
        //        string dist_loc = string.Empty;
        //        string dist_dd = string.Empty;
        //        string strzone = string.Empty;
        //        string[] utype = { };
        //        string tblname = string.Empty;

        //        if (usertype == "Master_Admin")
        //        {
        //            // query = "select b.*,ss.*,s.streamname from booth b inner join streamlist s on b.streamid=s.id inner join streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc;";
        //        }
        //        else if (usertype == "live")
        //        {
        //            // query = "select b.*,ss.*,s.streamname from booth b inner join streamlist s on b.streamid=s.id inner join streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and s.status='RUNNING' and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //            querywherestr = " and s.status='RUNNING' ";
        //        }
        //        else if (usertype.StartsWith("zn"))
        //        {
        //            strzone = usertype.Split('_')[1];
        //            //query = "select b.*,ss.*,s.streamname from booth b inner join streamlist s on b.streamid=s.id inner join streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and b.district in (select zoneDistrict from zoneinfo where zoneName =@zn) and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //            querywherestr = " and b.district in (select zoneDistrict from " + table_prefix + "zoneinfo where zoneName =@zn) ";
        //        }
        //        else if (usertype.StartsWith("dst"))
        //        {
        //            if (usertype.Contains("?"))
        //            {
        //                utype = usertype.Split('?');
        //                if (utype[1] != st_id.ToString())
        //                {
        //                    tblname = "p" + utype[1];
        //                }
        //                dist = utype[0].Split('_')[1];
        //                query = "select b.*,ss.*,s.streamname from " + table_prefix + "booth" + tblname + " b inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id inner join " + table_prefix + "streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid='" + utype[1] + "' Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //            }
        //            else
        //            {
        //                dist = usertype.Split('_')[1];
        //                // query = "select b.*,ss.*,s.streamname from booth b inner join streamlist s on b.streamid=s.id inner join streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and b.district=@dst and s.IsEnable=1 and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //                querywherestr = " and  b.district=@dst ";
        //            }
        //        }
        //        else if (usertype.StartsWith("sch"))
        //        {
        //            //dist_sch = Convert.ToInt32(usertype.Split('_')[2]);
        //            //query = "select * from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.id = @dist_sch and b.boothstateid='" + st_id + "' Order By s.status,LEN(s.streamname),s.id";
        //            if (usertype.Contains("?"))
        //            {
        //                utype = usertype.Split('?');
        //                if (utype[1] != st_id.ToString())
        //                {
        //                    tblname = "p" + utype[1];
        //                }
        //                dist = utype[0].Split('_')[1];
        //                dist_sch = utype[0].Split('_')[2];
        //                query = "select b.*,ss.*,s.streamname from booth" + tblname + " b inner join " + table_prefix + "streamlist" + tblname + " s on b.streamid=s.id inner join " + table_prefix + "streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid='" + utype[1] + "' Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //            }
        //            else
        //            {
        //                dist = usertype.Split('_')[1];
        //                dist_sch = usertype.Split('_')[2];
        //                // query = "select b.*,ss.*,s.streamname from booth b inner join streamlist s on b.streamid=s.id inner join streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.boothstateid=" + st_id + " Order By b.acname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //                querywherestr = " and  b.district=@dst and b.acname=@dist_sch ";
        //            }
        //        }
        //        else if (usertype.StartsWith("loc"))
        //        {

        //            dist = usertype.Split('_')[1];
        //            dist_sch = usertype.Split('_')[2];
        //            dist_loc = usertype.Split('_')[3];
        //            //query = "select b.*,ss.*,s.streamname from booth b inner join streamlist s on b.streamid=s.id inner join streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.psnum = @dist_loc and b.boothstateid=" + st_id + " Order By b.schoolname,b.location asc,len(s.streamname) asc,ss.statustime desc";
        //            querywherestr = " and  b.district=@dst and b.acname=@dist_sch and b.psnum=@dist_loc ";
        //        }
        //        else if (usertype.StartsWith("dd"))
        //        {

        //            dist = usertype.Split('_')[1];
        //            dist_sch = usertype.Split('_')[2];
        //            dist_loc = usertype.Split('_')[3];
        //            dist_dd = usertype.Split('_')[4];
        //            querywherestr = " and  b.district=@dst and b.acname=@dist_sch and b.psnum=@dist_loc ";
        //            // query = "select b.*,ss.*,s.streamname from booth b inner join streamlist s on b.streamid=s.id inner join streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(ss.statustime as DATE)), '19000101') and ss.statustime < DATEADD(DAY, DATEDIFF(DAY, '18991231', CAST(ss.statustime as DATE)), '19000101')  and b.isdisplay='True' and s.IsEnable=1 and b.district=@dst and b.acname = @dist_sch and b.psnum = @dist_loc and b.boothstateid=" + st_id + " Order By b.schoolname,b.location asc,len(s.streamname) asc";

        //        }

        //        String varname1 = "";
        //        varname1 = varname1 + "WITH x " + "\n";
        //        varname1 = varname1 + "AS " + "\n";
        //        varname1 = varname1 + "( " + "\n";
        //        varname1 = varname1 + "     select ROW_NUMBER() over (order by len(SUBSTRING(s.streamname, PATINDEX('%[^0 ]%', s.streamname), LEN(s.streamname))) asc) as rn, " + "\n";
        //        varname1 = varname1 + "    b.*,s.deviceid,s.hasalarm,s.isdownload,s.IsEnable,s.isLive,s.isvod,s.lastseen,s.schoolid,s.selected,s.servername,b.boothstateid,s.status,s.stop,s.streamname " + "\n";
        //        varname1 = varname1 + " from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id  inner join " + table_prefix + "streamstatus ss on ss.streamid = b.streamid where ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101') and b.isdisplay='True' " + "\n";
        //        varname1 = varname1 + " and s.IsEnable=1 and b.boothstateid='" + ConfigurationManager.AppSettings["stateid"].ToString() + "' " + "\n";
        //        varname1 = varname1 + querywherestr + "\n";
        //        varname1 = varname1 + "), " + "\n";
        //        varname1 = varname1 + "Count_CTE " + "\n";
        //        varname1 = varname1 + "AS " + "\n";
        //        varname1 = varname1 + "( " + "\n";
        //        varname1 = varname1 + "    SELECT COUNT(*) AS TotalRows FROM x " + "\n";
        //        varname1 = varname1 + "    " + "\n";
        //        varname1 = varname1 + ") " + "\n";
        //        varname1 = varname1 + "SELECT x.*, Count_CTE.TotalRows " + "\n";
        //        varname1 = varname1 + "FROM x " + "\n";
        //        varname1 = varname1 + "CROSS JOIN Count_CTE " + "\n";
        //        varname1 = varname1 + " where x.rn between " + start + " and " + end + " ORDER BY x.rn";
        //        query = varname1;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        if (!string.IsNullOrEmpty(dist))
        //        {
        //            command.Parameters.AddWithValue("@dst", dist);
        //        }
        //        if (!string.IsNullOrEmpty(strzone))
        //        {
        //            command.Parameters.AddWithValue("@zn", strzone);
        //        }
        //        if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_sch))
        //        {
        //            command.Parameters.AddWithValue("@dist_sch", dist_sch);
        //        }
        //        if (!string.IsNullOrEmpty(dist) && !string.IsNullOrEmpty(dist_sch) && !string.IsNullOrEmpty(dist_loc))
        //        {
        //            command.Parameters.AddWithValue("@dist_loc", dist_loc);
        //        }
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}

        //public DataSet camuptime(string psnum)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = query = "SELECT ss.*, UPTIME = CASE status WHEN 'FALSE' THEN DATEDIFF(minute, Lag(statustime, 1) OVER(ORDER BY streamname, statustime), statustime) ELSE 0 END FROM " + table_prefix + "streamstatus ss inner join " + table_prefix + "booth b on b.streamid=ss.streamid where b.PSNum=@psnum and ss.statustime >= DATEADD(DAY, DATEDIFF(DAY, '19000101', CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATE)), '19000101')";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@psnum", psnum);
        //        SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
        //        DataSet ds = new DataSet();

        //        SQLconn.Open();
        //        adp.Fill(ds);
        //        SQLconn.Close();

        //        return ds;
        //    }
        //    catch (Exception ex)
        //    {
        //        return new DataSet();
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }

        //}
        //public DataSet GetBoothListFOR_Status_Time_UPTIME(string usertype, bool isgrid, int st_id, string sel_date)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {

        //        string select_date_db = "dt_" + Convert.ToDateTime(sel_date, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat).ToString("ddMMyyyy");
        //        string query = string.Empty;


        //        string tblname = string.Empty;
        //        string whereto = "";

        //        query = "select b.id,d.boothid,b.district,b.accode,b.acname,b.PSNum,b.location,s.streamname, \n";
        //        query += "SUM(CASE When T_5 =2 Then 0 Else T_5 End +CASE When T_6 =2 Then 0 Else T_6 End +CASE When T_7 =2 Then 0 Else T_7 End +CASE When T_8 =2 Then 0 Else T_8 End +CASE When T_9 =2 Then 0 Else T_9 End +CASE When T_10 =2 Then 0 Else T_10 End +CASE When T_11 =2 Then 0 Else T_11 End +CASE When T_12 =2 Then 0 Else T_12 End +CASE When T_13 =2 Then 0 Else T_13 End +CASE When T_14 =2 Then 0 Else T_14 End +CASE When T_15 =2 Then 0 Else T_15 End +CASE When T_16 =2 Then 0 Else T_16 End +CASE When T_17=2 Then 0 Else T_17 End+CASE When T_18 =2 Then 0 Else T_18 End) as Uptime, \n";
        //        query += " 14-SUM(CASE When T_5 =2 Then 0 Else T_5 End +CASE When T_6 =2 Then 0 Else T_6 End +CASE When T_7 =2 Then 0 Else T_7 End +CASE When T_8 =2 Then 0 Else T_8 End +CASE When T_9 =2 Then 0 Else T_9 End +CASE When T_10 =2 Then 0 Else T_10 End +CASE When T_11 =2 Then 0 Else T_11 End +CASE When T_12 =2 Then 0 Else T_12 End +CASE When T_13 =2 Then 0 Else T_13 End +CASE When T_14 =2 Then 0 Else T_14 End +CASE When T_15 =2 Then 0 Else T_15 End +CASE When T_16 =2 Then 0 Else T_16 End +CASE When T_17=2 Then 0 Else T_17 End+CASE When T_18 =2 Then 0 Else T_18 End) as Downtime,remarks,T_0,T_1,T_2,T_3,T_4,T_5,T_6,T_7,T_8,T_9,T_10,T_11,T_12,T_13,T_14,T_15,T_16,T_17,T_18,T_19,T_20,T_21,T_22,T_23  from booth b inner join streamlist \n";
        //        query += "  s on b.streamid=s.id inner join " + select_date_db + " d ON d.boothid=b.id and boothstateid=" + st_id + " \n";


        //        if (usertype.StartsWith("admin"))
        //        {

        //        }
        //        else if (usertype.StartsWith("dst_"))
        //        {
        //            query += " and district='" + usertype.Split('_')[1] + "' \n";
        //        }
        //        else if (usertype.StartsWith("pc_"))
        //        {
        //            query += " and district='" + usertype.Split('_')[1] + "' and accode='" + usertype.Split('_')[2] + "' \n";
        //        }
        //        else if (usertype.StartsWith("sch_"))
        //        {
        //            query += " and district='" + usertype.Split('_')[1] + "' and accode='" + usertype.Split('_')[2] + "' and acname='" + usertype.Split('_')[3] + "' \n";
        //        }
        //        else if (usertype.StartsWith("loc_"))
        //        {
        //            query += " and district='" + usertype.Split('_')[1] + "' and accode='" + usertype.Split('_')[2] + "' and acname='" + usertype.Split('_')[3] + "' and location='" + usertype.Split('_')[4] + "' \n";
        //        }
        //        query += "  group by remarks,b.id,d.boothid,b.district,b.accode, b.acname, b.PSNum,b.location,s.streamname,T_0,T_1,T_2,T_3,T_4,T_5,T_6,T_7,T_8,T_9,T_10,T_11,T_12,T_13,T_14,T_15,T_16,T_17,T_18,T_19,T_20,T_21,T_22,T_23 Order by district";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);

        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}

        //public DataSet GetBoothListFOR_Status_Time_UPTIME_ExcelExport(string usertype, bool isgrid, int st_id, string sel_date)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {

        //        string select_date_db = "dt_" + Convert.ToDateTime(sel_date, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat).ToString("ddMMyyyy");
        //        string query = string.Empty;


        //        string tblname = string.Empty;
        //        string whereto = "";

        //        query = "select b.district,b.accode,b.acname,b.PSNum, b.location,s.streamname, \n";
        //        query += "SUM(CASE When T_5 =2 Then 0 Else T_5 End +CASE When T_6 =2 Then 0 Else T_6 End +CASE When T_7 =2 Then 0 Else T_7 End +CASE When T_8 =2 Then 0 Else T_8 End +CASE When T_9 =2 Then 0 Else T_9 End +CASE When T_10 =2 Then 0 Else T_10 End +CASE When T_11 =2 Then 0 Else T_11 End +CASE When T_12 =2 Then 0 Else T_12 End +CASE When T_13 =2 Then 0 Else T_13 End +CASE When T_14 =2 Then 0 Else T_14 End +CASE When T_15 =2 Then 0 Else T_15 End +CASE When T_16 =2 Then 0 Else T_16 End +CASE When T_17=2 Then 0 Else T_17 End+CASE When T_18 =2 Then 0 Else T_18 End) as Uptime, \n";
        //        query += " 14-SUM(CASE When T_5 =2 Then 0 Else T_5 End +CASE When T_6 =2 Then 0 Else T_6 End +CASE When T_7 =2 Then 0 Else T_7 End +CASE When T_8 =2 Then 0 Else T_8 End +CASE When T_9 =2 Then 0 Else T_9 End +CASE When T_10 =2 Then 0 Else T_10 End +CASE When T_11 =2 Then 0 Else T_11 End +CASE When T_12 =2 Then 0 Else T_12 End +CASE When T_13 =2 Then 0 Else T_13 End +CASE When T_14 =2 Then 0 Else T_14 End +CASE When T_15 =2 Then 0 Else T_15 End +CASE When T_16 =2 Then 0 Else T_16 End +CASE When T_17=2 Then 0 Else T_17 End+CASE When T_18 =2 Then 0 Else T_18 End) as Downtime, \n";
        //        for (int i = start_hour.Hour; i < end_hour.Hour; i++)
        //        {
        //            query += "CASE When T_" + i.ToString() + " =2 Then 0 Else T_" + i.ToString() + " End as [" + (i == 0 ? 12 : (i > 12 ? (i - 12) : i)).ToString() + " " + (i == 11 ? "AM" : "") + " to " + (i + 1 == 0 ? 12 : (i + 1 > 12 ? (i + 1 - 12) : i + 1)).ToString() + " " + (i + 1 > 11 ? "PM" : "AM") + "],";
        //        }
        //        query = query.TrimEnd(',');
        //        //query += "CASE When T_5 =2 Then 0 Else T_5 End as [5 to 6 AM],CASE When T_6 =2 Then 0 Else T_6 End as [6 to 7 AM],CASE When T_7 =2 Then 0 Else T_7 End as [7 to 8 AM],CASE When T_8 =2 Then 0 Else T_8 End as [8 to 9 AM],CASE When T_9 =2 Then 0 Else T_9 End as [9 to 10 AM],CASE When T_10 =2 Then 0 Else T_10 End as [10 to 11 AM],CASE When T_11 =2 Then 0 Else T_11 End as [11 AM to 12 PM],CASE When T_12 =2 Then 0 Else T_12 End as [12 to 1 PM],CASE When T_13 =2 Then 0 Else T_13 End as [1 to 2 PM],CASE When T_14 =2 Then 0 Else T_14 End as [2 to 3 PM],CASE When T_15 =2 Then 0 Else T_15 End as [3 to 4 PM],CASE When T_16 =2 Then 0 Else T_16 End as [4 to 5 PM],CASE When T_17 =2 Then 0 Else T_17 End as [5 to 6 PM],CASE When T_17 =2 Then 0 Else T_17 End as [6 to 7 PM]  from booth b inner join streamlist \n";
        //        query += " from booth b inner join streamlist \n";
        //        query += "  s on b.streamid=s.id inner join " + select_date_db + " d ON d.boothid=b.id and boothstateid=" + st_id + " \n";


        //        if (usertype.StartsWith("admin"))
        //        {

        //        }
        //        else if (usertype.StartsWith("dst_"))
        //        {
        //            query += " and district='" + usertype.Split('_')[1] + "' \n";
        //        }
        //        else if (usertype.StartsWith("pc_"))
        //        {
        //            query += " and district='" + usertype.Split('_')[1] + "' and accode='" + usertype.Split('_')[2] + "' \n";
        //        }
        //        else if (usertype.StartsWith("sch_"))
        //        {
        //            query += " and district='" + usertype.Split('_')[1] + "' and accode='" + usertype.Split('_')[2] + "' and acname='" + usertype.Split('_')[3] + "' \n";
        //        }
        //        else if (usertype.StartsWith("loc_"))
        //        {
        //            query += " and district='" + usertype.Split('_')[1] + "' and accode='" + usertype.Split('_')[2] + "' and acname='" + usertype.Split('_')[3] + "' and location='" + usertype.Split('_')[4] + "' \n";
        //        }
        //        query += " group by remarks,b.id,d.boothid,b.district,b.accode,b.acname,b.PSNum,b.location,s.streamname,s.deviceid,T_0,T_1,T_2,T_3,T_4,T_5,T_6,T_7,T_8,T_9,T_10,T_11,T_12,T_13,T_14,T_15,T_16,T_17,T_18,T_19,T_20,T_21,T_22,T_23 Order by acname";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);

        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}


        //public DataSet GetBoothListFOR_Status_Time_WITH_MIN(string usertype, bool isgrid, int st_id, string sel_date)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {

        //        // string select_date_db = "dt_" + Convert.ToDateTime(sel_date, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat).ToString("ddMMyyyy");
        //        string query = string.Empty;
        //        string tblname = string.Empty;
        //        string whereto = "";
        //        string start_time_ele = Convert.ToDateTime(sel_date + " " + ConfigurationManager.AppSettings["starthour"].ToString()).ToString("yyyy-MM-dd HH:mm:ss");
        //        string end_time_ele = Convert.ToDateTime(sel_date + " " + ConfigurationManager.AppSettings["endhour"].ToString()).ToString("yyyy-MM-dd HH:mm:ss");


        //        query = "select b.*,s.* ,(case when b.streamid=uptime.streamid then uptime.total else 0 end ) total_uptime";
        //        query += " from booth b LEFT JOIN (select sum(t.count_time_as_minute) as total,t.streamid from ";
        //        query += " (select streamid,streamname,statustime,status, ";
        //        query += " Lead(statustime,1, case when CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as datetime) >= '" + end_time_ele + "' ";
        //        query += " then '" + end_time_ele + "' else CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as datetime) end)  ";
        //        query += " OVER(PARTITION BY [streamname] ORDER BY [streamname]) as [next status time] , ";
        //        query += " Lead(status,1,status)  OVER(PARTITION BY [streamname] ORDER BY [streamname]) as [next_status] ,";
        //        query += " DATEDIFF(minute,statustime,Lead(statustime,1,case when CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as datetime) ";
        //        query += " >= '" + end_time_ele + "' then '" + end_time_ele + "' else CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as datetime) ";
        //        query += "  end) OVER(PARTITION BY [streamname] ORDER BY [streamname])) as [count_time_as_minute]";
        //        query += " ,(case when status=0 and Lead(status,1)  OVER(PARTITION BY [streamname]";
        //        query += " ORDER BY [streamname]) = 1 then 'off' when status=1 and Lead(status,1)  OVER(PARTITION BY [streamname]";
        //        query += " ORDER BY [streamname]) = 0 then 'on'";
        //        query += " when status=1 and Lead(status,1)  OVER(PARTITION BY [streamname] ORDER BY [streamname]) = 1 then 'on'";
        //        query += " when status=0 and Lead(status,1)  OVER(PARTITION BY [streamname] ORDER BY [streamname]) = 0 then 'off'";
        //        query += "  when status=1 and Lead(status,'')  OVER(PARTITION BY [streamname] ORDER BY [streamname]) = 1 then 'on' ";
        //        query += "  when status=0 and Lead(status,'')  OVER(PARTITION BY [streamname] ORDER BY [streamname]) = 0 then 'off' ";
        //        query += " end ) as [status_result]";
        //        query += " from streamstatustest  where  statustime>='" + start_time_ele + "' and ";
        //        query += "  statustime<= '" + end_time_ele + "' group by streamid,streamname,statustime,status) as t";
        //        query += "  where t.status_result = 'on' group by t.streamid ) as uptime on b.streamid= uptime.streamid inner join streamlist s ON s.id=b.streamid";
        //        query += " where boothstateid=" + st_id + " and isdisplay=1 ";

        //        if (usertype.StartsWith("admin"))
        //        {

        //        }
        //        else if (usertype.StartsWith("dst_"))
        //        {
        //            query += " and district='" + usertype.Split('_')[1] + "' \n";
        //        }
        //        else if (usertype.StartsWith("pc_"))
        //        {
        //            query += " and district='" + usertype.Split('_')[1] + "' and accode='" + usertype.Split('_')[2] + "' \n";
        //        }
        //        else if (usertype.StartsWith("sch_"))
        //        {
        //            query += " and district='" + usertype.Split('_')[1] + "' and accode='" + usertype.Split('_')[2] + "' and acname='" + usertype.Split('_')[3] + "' \n";
        //        }
        //        else if (usertype.StartsWith("loc_"))
        //        {
        //            query += " and district='" + usertype.Split('_')[1] + "' and accode='" + usertype.Split('_')[2] + "' and acname='" + usertype.Split('_')[3] + "' and location='" + usertype.Split('_')[4] + "' \n";
        //        }
        //        query += "   Order by district";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);

        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}

        //public DataSet GetEmailList()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {

        //        // string select_date_db = "dt_" + Convert.ToDateTime(sel_date, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat).ToString("ddMMyyyy");
        //        string query = "Select ID, EmailID, Active FROM EmailDetails WHERE Active = 1";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);

        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetEmailList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}

        //public DataSet GetReport()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {

        //        // string select_date_db = "dt_" + Convert.ToDateTime(sel_date, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat).ToString("ddMMyyyy");
        //        string query = "Select t1.Id,d.DistrictName,s.SchoolName,t1.PSNo,t1.Location,case when t1.[7_AM] = 1 then '1' else '0' end [7_AM],case when t1.[710_AM] = 1 then '1' else '0' end [710_AM],case when t1.[720_AM] = 1 then '1' else '0' end [720_AM],case when t1.[730_AM] = 1 then '1' else '0' end [730_AM],case when t1.[740_AM] = 1 then '1' else '0' end [740_AM],case when t1.[750_AM] = 1 then '1' else '0' end [750_AM],case when t1.[8_AM] = 1 then '1' else '0' end [8_AM],case when t1.[810_AM] = 1 then '1' else '0' end [810_AM],case when t1.[820_AM] = 1 then '1' else '0' end [820_AM],case when t1.[830_AM] = 1 then '1' else '0' end [830_AM],case when t1.[840_AM] = 1 then '1' else '0' end [840_AM],case when t1.[850_AM] = 1 then '1' else '0' end [850_AM],case when t1.[9_AM] = 1 then '1' else '0' end [9_AM],case when t1.[910_AM] = 1 then '1' else '0' end [910_AM],case when t1.[920_AM] = 1 then '1' else '0' end [920_AM],case when t1.[930_AM] = 1 then '1' else '0' end [930_AM],case when t1.[940_AM] = 1 then '1' else '0' end [940_AM],case when t1.[950_AM] = 1 then '1' else '0' end [950_AM],case when t1.[10_AM] = 1 then '1' else '0' end [10_AM],case when t1.[1010_AM] = 1 then '1' else '0' end [1010_AM],case when t1.[1020_AM] = 1 then '1' else '0' end [1020_AM],case when t1.[1030_AM] = 1 then '1' else '0' end [1030_AM],case when t1.[1040_AM] = 1 then '1' else '0' end [1040_AM],case when t1.[1050_AM] = 1 then '1' else '0' end [1050_AM],case when t1.[11_AM] = 1 then '1' else '0' end [11_AM],case when t1.[1110_AM] = 1 then '1' else '0' end [1110_AM],case when t1.[1120_AM] = 1 then '1' else '0' end [1120_AM],case when t1.[1130_AM] = 1 then '1' else '0' end [1130_AM],case when t1.[1140_AM] = 1 then '1' else '0' end [1140_AM],case when t1.[1150_AM] = 1 then '1' else '0' end [1150_AM],case when t1.[12_PM] = 1 then '1' else '0' end [12_PM],case when t1.[1210_PM] = 1 then '1' else '0' end [1210_PM],case when t1.[1220_PM] = 1 then '1' else '0' end [1220_PM],case when t1.[1230_PM] = 1 then '1' else '0' end [1230_PM],case when t1.[1240_PM] = 1 then '1' else '0' end [1240_PM],case when t1.[1250_PM] = 1 then '1' else '0' end [1250_PM],case when t1.[1_PM] = 1 then '1' else '0' end [1_PM],case when t1.[110_PM] = 1 then '1' else '0' end [110_PM],case when t1.[120_PM] = 1 then '1' else '0' end [120_PM],case when t1.[130_PM] = 1 then '1' else '0' end [130_PM],case when t1.[140_PM] = 1 then '1' else '0' end [140_PM],case when t1.[150_PM] = 1 then '1' else '0' end [150_PM],case when t1.[2_PM] = 1 then '1' else '0' end [2_PM],case when t1.[210_PM] = 1 then '1' else '0' end [210_PM],case when t1.[220_PM] = 1 then '1' else '0' end [220_PM],case when t1.[230_PM] = 1 then '1' else '0' end [230_PM],case when t1.[240_PM] = 1 then '1' else '0' end [240_PM],case when t1.[250_PM] = 1 then '1' else '0' end [250_PM],case when t1.[3_PM] = 1 then '1' else '0' end [3_PM],case when t1.[310_PM] = 1 then '1' else '0' end [310_PM],case when t1.[320_PM] = 1 then '1' else '0' end [320_PM],case when t1.[330_PM] = 1 then '1' else '0' end [330_PM],case when t1.[340_PM] = 1 then '1' else '0' end [340_PM],case when t1.[350_PM] = 1 then '1' else '0' end [350_PM],case when t1.[4_PM] = 1 then '1' else '0' end [4_PM],case when t1.[410_PM] = 1 then '1' else '0' end [410_PM],case when t1.[420_PM] = 1 then '1' else '0' end [420_PM],case when t1.[430_PM] = 1 then '1' else '0' end [430_PM],case when t1.[440_PM] = 1 then '1' else '0' end [440_PM],case when t1.[450_PM] = 1 then '1' else '0' end [450_PM],case when t1.[5_PM] = 1 then '1' else '0' end [5_PM],case when t1.[510_PM] = 1 then '1' else '0' end [510_PM],case when t1.[520_PM] = 1 then '1' else '0' end [520_PM],case when t1.[530_PM] = 1 then '1' else '0' end [530_PM],case when t1.[540_PM] = 1 then '1' else '0' end [540_PM],case when t1.[550_PM] = 1 then '1' else '0' end [550_PM],case when t1.[6_PM] = 1 then '1' else '0' end [6_PM],case when t1.[610_PM] = 1 then '1' else '0' end [610_PM],case when t1.[620_PM] = 1 then '1' else '0' end [620_PM],case when t1.[630_PM] = 1 then '1' else '0' end [630_PM],case when t1.[640_PM] = 1 then '1' else '0' end [640_PM],case when t1.[650_PM] = 1 then '1' else '0' end [650_PM],t1.Uptime,t1.UptimeHr from tbl_Camera_UP_Down_10min_1 t1 inner join tbl_District_1 d on d.Id = t1.DistrictId inner join tbl_School_1 s on s.Id = t1.SchoolId";


        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);

        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}

        //public DataSet GetCameraSetting(string streamname)
        //{
        //    SqlConnection conn = new SqlConnection(connstr);
        //    DataSet ds = new DataSet();
        //    try
        //    {

        //        string query = "select prourl, deviceid from " + table_prefix + "streamlist where streamname='" + streamname + "'";

        //        SqlCommand cmd = new SqlCommand(query, conn);
        //        //cmd.Parameters.AddWithValue("@streamname", streamname);
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        conn.Open();
        //        da.Fill(ds);

        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetCameraSetting()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();

        //    }
        //    return ds;
        //}
        //public DataSet GetBoothListFOR_Status_Time_WITH_MIN_New(string district, string pc, string location, bool isgrid, int st_id, string sel_date)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {

        //        // string select_date_db = "dt_" + Convert.ToDateTime(sel_date, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat).ToString("ddMMyyyy");
        //        string query = string.Empty;


        //        string tblname = string.Empty;
        //        string whereto = "";

        //        string start_time_ele = start_hour.ToString("yyyy-MM-dd HH:mm:ss");
        //        string end_time_ele = end_hour.ToString("yyyy-MM-dd HH:mm:ss");

        //        using (SqlConnection newConn = new SqlConnection(connstr))
        //        {
        //            SqlCommand sqlComm = new SqlCommand("Report_SP_Minwise", conn);
        //            sqlComm.Parameters.AddWithValue("@District", district);
        //            sqlComm.Parameters.AddWithValue("@pc", pc);
        //            sqlComm.Parameters.AddWithValue("@SchoolName", location);
        //            sqlComm.Parameters.AddWithValue("@Starttime", start_time_ele);
        //            sqlComm.Parameters.AddWithValue("@EndTime", end_time_ele);

        //            sqlComm.CommandType = CommandType.StoredProcedure;

        //            SqlDataAdapter da = new SqlDataAdapter();
        //            da.SelectCommand = sqlComm;

        //            da.Fill(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothList()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        //public DataSet getCameraMatchData()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "select * from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id order by  district";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("getCameraMatchData()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        public DataSet getUnMappedCamera()
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = "select * from " + table_prefix + "streamlist where id not in (select streamid from " + table_prefix + " booth) and status='RUNNING'";
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("getCameraMatchData()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }

        //public DataSet GetAssemblyWizeTotleVehicalData()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "GetAssemblyWizeTotleVehicalData";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("getLastMinuteBusData()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetVehicleData(string district, string assembly)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "GetVehicleData";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.Add(new SqlParameter("@district", district));
        //        command.Parameters.Add(new SqlParameter("@accode", assembly));
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, false, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("getLastMinuteBusData()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        public DataSet GetAllDistrictByStateId(int stateid)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string dist = string.Empty;
                string tblname = string.Empty;

                query = "select district,id from(SELECT district,id, ROW_NUMBER() over(partition by district order by district) rn  from " + table_prefix + ".[district] WHERE stateid=" + stateid + " ) as tbl where rn=1";

                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, false);
            }
            catch (Exception ex)
            {
                Common.Log("GetDistrictList()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        //public DataSet GetAllPinkDistrictByStateId(int stateid)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string dist = string.Empty;
        //        string tblname = string.Empty;

        //        query = "GetAllPinkDistrictByStateId";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@stateid", stateid);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, false);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetDistrictList()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllPinkAssemblyByStateIdAndDistirict(int stateid, string district)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string dist = string.Empty;
        //        string tblname = string.Empty;

        //        query = "GetAllPinkAssemblyByStateIdAndDistirict";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@stateid", stateid);
        //        command.Parameters.AddWithValue("@district", district);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, false);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetDistrictList()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllPinkschoolByStateIdAndacname(int stateid, string acname)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string dist = string.Empty;
        //        string tblname = string.Empty;

        //        query = "GetAllPinkSchoolByStateIdAndaccode";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@stateid", stateid);
        //        command.Parameters.AddWithValue("@acname", acname);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, false);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetDistrictList()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        public DataSet GetAllAssemblyByDistrict(int stateid, string district)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "SELECT accode,acname  from " + table_prefix + "district WHERE stateid=" + stateid + " AND district='" + district + "' ORDER BY District ASC;";
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, false, true);
            }
            catch (Exception ex)
            {
                Common.Log("GetAllAssembly()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        //public DataSet GetAllSchoolByAssembly(string acname)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT DISTINCT location from booth b WHERE b.Isdisplay=1 and b.acname='" + acname.Replace("'", "''") + "' ORDER BY location ASC;";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, false, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllAssembly()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllVehicleByAcCode(string accode)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT Vehicle_no, vehicalId FROM " + table_prefix + "vehicalDetail WHERE Accode ='" + accode + "' AND isdeleted = 0;";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllVehicleDetail()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetGPSStopReasonsByID(int ID)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "GetGPSStopReasonsByID";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@id", ID);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetGPSStopReasonsByID()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public void SaveGPSStopReasonsByID(int ID, string Reason)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = query = "SaveGPSStopReasonsByID";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.CommandType = CommandType.StoredProcedure;
        //        SQLcommand.Parameters.Add(new SqlParameter("@id", ID));
        //        SQLcommand.Parameters.Add(new SqlParameter("@Reason", Reason));
        //        SQLconn.Open();
        //        SQLcommand.ExecuteNonQuery();
        //        SQLconn.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("SaveGPSStopReasonsByID()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public DataSet GetStopVehicleDetails(int districtID, string ACCode, int vehicleID, string FromDt, string ToDt)
        //{
        //    DataSet ds = new DataSet();
        //    DataSet retDs = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "GetStopVehicleDetails";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@districtID", districtID);
        //        command.Parameters.AddWithValue("@ACCode", ACCode);
        //        command.Parameters.AddWithValue("@vehicleID", vehicleID);
        //        command.Parameters.AddWithValue("@FromDt", FromDt);
        //        command.Parameters.AddWithValue("@ToDt", ToDt);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        //DataTable dt = ds.Tables[0].AsEnumerable()
        //        //   .GroupBy(r => new { Col1 = r["Col1"], Col2 = r["Col2"] })
        //        //   .Select(g => g.OrderBy(r => r["PK"]).First())
        //        //   .CopyToDataTable();
        //        DataTable dt = new DataTable();
        //        dt.Columns.Add("Id");
        //        dt.Columns.Add("vehicalId");
        //        dt.Columns.Add("Vehicle_No");
        //        dt.Columns.Add("DeviceId");
        //        dt.Columns.Add("district");
        //        dt.Columns.Add("Accode");
        //        dt.Columns.Add("servername");
        //        dt.Columns.Add("streamname");
        //        dt.Columns.Add("StartTime");
        //        dt.Columns.Add("StopTime");
        //        dt.Columns.Add("CreateDate");
        //        dt.Columns.Add("ModifyDate");
        //        dt.Columns.Add("Reason");
        //        dt.Columns.Add("ReasonDate");
        //        dt.Columns.Add("Status");
        //        DateTime PrevStopTime = DateTime.MinValue;
        //        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        //        {
        //            DataRow item = ds.Tables[0].Rows[i];
        //            DateTime startTime = Convert.ToDateTime(item["StartTime"]);
        //            DateTime stopTime = Convert.ToDateTime(item["StopTime"] == DBNull.Value ? new DateTime(startTime.Year, startTime.Month, startTime.Day, 23, 59, 59) : item["StopTime"]);
        //            DateTime createDate = Convert.ToDateTime(item["CreateDate"]);
        //            DateTime modifyDate = Convert.ToDateTime(item["ModifyDate"]);
        //            DateTime DayStartTime = new DateTime(startTime.Year, startTime.Month, startTime.Day, 0, 0, 0);

        //            if (PrevStopTime == DateTime.MinValue || i > 0 && !ds.Tables[0].Rows[i - 1]["vehicalId"].ToString().Equals(item["vehicalId"].ToString()))
        //            {
        //                PrevStopTime = new DateTime(startTime.Year, startTime.Month, startTime.Day, 0, 0, 0);
        //            }
        //            DateTime DayStopTime = new DateTime(startTime.Year, startTime.Month, startTime.Day, 23, 59, 59);
        //            if (startTime > PrevStopTime)
        //            {
        //                if (startTime <= DayStopTime && PrevStopTime >= DayStartTime)
        //                {
        //                    dt.Rows.Add(item["Id"], item["vehicalId"], item["Vehicle_No"], item["DeviceId"], item["district"]
        //                    , item["Accode"], item["servername"], item["streamname"], PrevStopTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), startTime.ToString("yyyy-MM-dd HH:mm:ss.fff")
        //                    , PrevStopTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), PrevStopTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), "", DBNull.Value, "online");
        //                }
        //                if (stopTime > DayStopTime && PrevStopTime > DayStartTime)
        //                {
        //                    dt.Rows.Add(item["Id"], item["vehicalId"], item["Vehicle_No"], item["DeviceId"], item["district"]
        //                    , item["Accode"], item["servername"], item["streamname"], startTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), DayStopTime.ToString("yyyy-MM-dd HH:mm:ss.fff")
        //                    , createDate.ToString("yyyy-MM-dd HH:mm:ss.fff"), modifyDate.ToString("yyyy-MM-dd HH:mm:ss.fff"), item["Reason"], (item["ReasonDate"] == DBNull.Value ? "" : Convert.ToDateTime(item["ReasonDate"]).ToString("yyyy-MM-dd HH:mm:ss.fff")), "offline");

        //                    DateTime NextStartTime = new DateTime(stopTime.Year, stopTime.Month, stopTime.Day, 0, 0, 0);
        //                    dt.Rows.Add(item["Id"], item["vehicalId"], item["Vehicle_No"], item["DeviceId"], item["district"]
        //                    , item["Accode"], item["servername"], item["streamname"], NextStartTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), stopTime.ToString("yyyy-MM-dd HH:mm:ss.fff")
        //                    , createDate.ToString("yyyy-MM-dd HH:mm:ss.fff"), modifyDate.ToString("yyyy-MM-dd HH:mm:ss.fff"), item["Reason"], (item["ReasonDate"] == DBNull.Value ? "" : Convert.ToDateTime(item["ReasonDate"]).ToString("yyyy-MM-dd HH:mm:ss.fff")), "offline");
        //                }
        //                else
        //                {
        //                    dt.Rows.Add(item["Id"], item["vehicalId"], item["Vehicle_No"], item["DeviceId"], item["district"]
        //                    , item["Accode"], item["servername"], item["streamname"], startTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), stopTime.ToString("yyyy-MM-dd HH:mm:ss.fff")
        //                    , createDate.ToString("yyyy-MM-dd HH:mm:ss.fff"), modifyDate.ToString("yyyy-MM-dd HH:mm:ss.fff"), item["Reason"], (item["ReasonDate"] == DBNull.Value ? "" : Convert.ToDateTime(item["ReasonDate"]).ToString("yyyy-MM-dd HH:mm:ss.fff")), "offline");
        //                }

        //                PrevStopTime = stopTime;
        //                DateTime NextStartTime2 = DateTime.MinValue;
        //                if ((i + 1) < ds.Tables[0].Rows.Count)
        //                {
        //                    NextStartTime2 = Convert.ToDateTime(ds.Tables[0].Rows[i + 1]["StartTime"]);
        //                    if (NextStartTime2 > DayStopTime)
        //                    {
        //                        DateTime NextDayStartTime = new DateTime(NextStartTime2.Year, NextStartTime2.Month, NextStartTime2.Day, 0, 0, 0);
        //                        dt.Rows.Add(item["Id"], item["vehicalId"], item["Vehicle_No"], item["DeviceId"], item["district"]
        //                        , item["Accode"], item["servername"], item["streamname"], stopTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), DayStopTime.ToString("yyyy-MM-dd HH:mm:ss.fff")
        //                        , DayStopTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), DayStopTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), "", DBNull.Value, "online");

        //                        dt.Rows.Add(item["Id"], item["vehicalId"], item["Vehicle_No"], item["DeviceId"], item["district"]
        //                        , item["Accode"], item["servername"], item["streamname"], NextDayStartTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), NextStartTime2.ToString("yyyy-MM-dd HH:mm:ss.fff")
        //                        , DayStopTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), DayStopTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), "", DBNull.Value, "online");
        //                    }
        //                }

        //                if ((i + 1) == ds.Tables[0].Rows.Count && stopTime <= DayStopTime)
        //                {
        //                    dt.Rows.Add(item["Id"], item["vehicalId"], item["Vehicle_No"], item["DeviceId"], item["district"]
        //                    , item["Accode"], item["servername"], item["streamname"], stopTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), DayStopTime.ToString("yyyy-MM-dd HH:mm:ss.fff")
        //                    , DayStopTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), DayStopTime.ToString("yyyy-MM-dd HH:mm:ss.fff"), "", DBNull.Value, "online");
        //                }
        //            }
        //        }
        //        retDs.Tables.Add(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetStopVehicleList()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return retDs;
        //}

        //public DataSet GetStopVehicleList(string FromDt, string ToDt, int districtid, string accode, int vehicleId, int ShiftID)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "GetStopVehicleList";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@FromDt", FromDt);
        //        command.Parameters.AddWithValue("@ToDt", ToDt);
        //        command.Parameters.AddWithValue("@districtid", districtid);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@vehicleId", vehicleId);
        //        command.Parameters.AddWithValue("@ShiftID", ShiftID);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetStopVehicleList()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetStopVehicleTotalList(string FromDt, string ToDt, int districtid, string accode, int vehicleId, int ShiftID)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "GetStopVehicleTotalList";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@FromDt", FromDt);
        //        command.Parameters.AddWithValue("@ToDt", ToDt);
        //        command.Parameters.AddWithValue("@districtid", districtid);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@vehicleId", vehicleId);
        //        command.Parameters.AddWithValue("@ShiftID", ShiftID);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetStopVehicleTotalList()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetManualStopVehicleReasonList(string FromDt, string ToDt, string district, string acname, string vehicleno, int ShiftID)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "GetManualStopVehicleReasonList";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@FromDt", FromDt);
        //        command.Parameters.AddWithValue("@ToDt", ToDt);
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@acname", acname);
        //        command.Parameters.AddWithValue("@vehicleno", vehicleno);
        //        command.Parameters.AddWithValue("@ShiftID", ShiftID);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetStopVehicleTotalList()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllManualVehicleStopReasons()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [id] ,[districtname] as district, [acname], [vehicleNo], [startTime], [stopTime], [reason], [addedOn] FROM [dbo].[StopReasons]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetManualVehicleStopReasonById(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [id] ,[districtname], [acname], [vehicleNo], [startTime], [stopTime], [reason], [addedOn] FROM [dbo].[StopReasons] WHERE [id] = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetReasonById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet AddManualVehicleStopReason(string districtname, string acname, string vehicleNo, string stoptime, string starttime, string reason)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "INSERT INTO [dbo].[StopReasons] VALUES ('" + districtname + "','" + acname + "','" + vehicleNo + "',CONVERT(Datetime,'" + starttime + "'), CONVERT(Datetime,'" + stoptime + "'), '" + reason + "', CONVERT(Datetime,'" + DateTime.Now.Date + "'));";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddMaterial()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet UpdateManualVehicleStopReason(string districtname, string acname, string vehicleNo, string stoptime, string starttime, string reason)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "UPDATE [dbo].[StopReasons] SET [districtname] = '" + districtname + "', [acname] = '" + acname + "', [vehicleNo] = '" + vehicleNo + "', [startTime] = CONVERT(Datetime,'" + starttime + "'), [stopTime] = CONVERT(Datetime,'" + stoptime + "'), [reason] = '" + reason + "', [addedOn] = CONVERT(Datetime,'" + DateTime.Now.Date.ToString() + "');";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddMaterial()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet DeleteManualVehicleStopReason(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "DELETE FROM [dbo].[StopReasons] WHERE Id = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("DeleteMaterialById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet GetAllInventoryUpdationReport(string FromDt, string ToDt, string districtid, string accode, string vehicleId, int ShiftID)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetInventoryUpdationReport";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@FromDt", FromDt);
        //        command.Parameters.AddWithValue("@ToDt", ToDt);
        //        command.Parameters.AddWithValue("@districtid", districtid);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@vehicleId", vehicleId);
        //        command.Parameters.AddWithValue("@ShiftID", ShiftID);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllInventoryUpdationReport()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllInventoryUpdation()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [id] ,[districtname] as district,[acname] ,[vehicleNo] ,[material] ,[oldsnno] ,[newsnno] ,[date] FROM [dbo].[inventoryupdatation]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet AddInventoryUpdation(string districtname, string acname, string vehicleNo, string material, string oldsnno, string newsnno, string accode, int status, string startdate, string enddate, string username)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "INSERT INTO [dbo].[inventoryupdatation] (districtname, acname, vehicleNo, material,oldsnno, newsnno, accode, [repaired/replaced], startdate, enddate, AddedBy, LastEditedBy) VALUES('" + districtname + "','" + acname + "','" + vehicleNo + "','" + material + "','" + oldsnno + "','" + newsnno + "', '" + accode + "', '" + status + "', '" + startdate + "', '" + enddate + "', '" + username + "', '" + username + "');";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddMaterial()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet UpdateInventoryUpdation(int id, string districtname, string acname, string vehicleNo, string material, string oldsnno, string newsnno, int status, string startdate, string enddate, string username)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "UPDATE [dbo].[inventoryupdatation] SET [districtname] = '" + districtname + "', [acname] = '" + acname + "', [vehicleNo] = '" + vehicleNo + "', [material] = '" + material + "', [oldsnno] = '" + oldsnno + "', [repaired/replaced] = '" + status + "', [enddate] = CONVERT(datetime, '" + enddate + "',103), [startdate] = CONVERT(datetime, '" + startdate + "',103), [AddedBy] = '" + username + "', [LastEditedBy] = '" + username + "', [newsnno] = '" + newsnno + "'  WHERE id= " + id + ";";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddMaterial()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet DeleteInventoryUpdation(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "DELETE FROM [dbo].[inventoryupdatation] WHERE Id = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("DeleteMaterialById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetInventoryUpdationById(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [id] ,[districtname] ,[acname] ,[vehicleNo] ,[material] ,[oldsnno] ,[newsnno] ,[repaired/replaced], [startdate], [enddate] FROM [dbo].[inventoryupdatation] WHERE [id] = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetReasonById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}


        //public DataSet GetAllMaterial()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [id], [name], [desc], [active] FROM [dbo].[material]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllMaterial()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet AddMaterial(string name, string desc, int status)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "INSERT INTO [DBO].[material] VALUES ('" + name.Replace("'", "''") + "','" + desc.Replace("'", "''") + "'," + status + ");";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddMaterial()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet UpdateMaterialById(int id, string name, string desc, int status)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "UPDATE [dbo].[material] SET [name] = '" + name.Replace("'", "''") + "' , [desc] = '" + desc.Replace("'", "''") + "', [active] = " + status + "  WHERE [id] = " + id + ";";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("UpdateMaterialById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet DeleteMaterialById(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "DELETE FROM [DBO].[material] WHERE Id = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("DeleteMaterialById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetMaterialById(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [id],[name],[desc],[active] FROM [dbo].[material] WHERE [id] = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetMaterialById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllReason()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [id], [name], [desc], [active] FROM [dbo].[reason]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet AddReason(string name, string desc, int status)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "INSERT INTO [DBO].[reason] VALUES ('" + name.Replace("'", "''") + "','" + desc.Replace("'", "''") + "'," + status + ");";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetReasonById(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [id],[name],[desc],[active] FROM [dbo].[reason] WHERE [id] = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetReasonById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet UpdateReasonById(int id, string name, string desc, int status)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "UPDATE [dbo].[reason] SET [name] = '" + name.Replace("'", "''") + "' , [desc] = '" + desc.Replace("'", "''") + "', [active] = " + status + "  WHERE [id] = " + id + ";";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("UpdateReasonById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet DeleteReasonById(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "DELETE FROM [DBO].[reason] WHERE Id = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("DeleteReasonById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllVehicleDetails()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetVehicleDetail";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllVehicleShift()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [id],[name],[starttime],[endtime],[active] FROM [dbo].[vehicleshift]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllVehicleShift()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet DeleteVehicleShift(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "DELETE FROM [DBO].[vehicleshift] WHERE Id = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("DeleteVehicleShift()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetVehicleShiftById(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [id],[name],[starttime],[endtime],[active] FROM [dbo].[vehicleshift] WHERE [id] = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetVehicleShiftById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet UpdateVehicleShiftById(int id, string name, string sTime, string eTime, int status)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "UPDATE [dbo].[vehicleshift] SET [name] = '" + name + "' , [starttime] = CONVERT(TIME,'" + sTime + "'), [endtime] = CONVERT(TIME,'" + eTime + "'), [active] = " + status + "  WHERE [id] = " + id + ";";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("UpdateVehicleShiftById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet AddVehicleShift(string name, string sTime, string eTime, int status)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "INSERT INTO [DBO].[vehicleshift] VALUES ('" + name + "',CONVERT(TIME,'" + sTime + "'),CONVERT(TIME,'" + eTime + "')," + status + ", 0);";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddVehicleShift()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet AddVehicleDetail(string districtName, string assemblyName, string vehicleNo, string ShiftName, string CameraDID,
        //    string vehicleType, string driverName, string driverContactNo, string FLVStaffName, string FLVStaffContactNo, string GPSDeviceId)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "AddVehicleDetail";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@districtName", districtname);
        //        command.Parameters.AddWithValue("@acName", assemblyname);
        //        command.Parameters.AddWithValue("@vehicleNo", vehicleNo);
        //        command.Parameters.AddWithValue("@shiftName", ShiftName);
        //        command.Parameters.AddWithValue("@cameraDid", CameraDID);
        //        command.Parameters.AddWithValue("@vehicleType", vehicleType);
        //        command.Parameters.AddWithValue("@driverName", driverName);
        //        command.Parameters.AddWithValue("@driverContactNo", driverContactNo);
        //        command.Parameters.AddWithValue("@flvStaffName", FLVStaffName);
        //        command.Parameters.AddWithValue("@flvStaffContactNo", FLVStaffContactNo);
        //        command.Parameters.AddWithValue("@GpsDeviceId", GPSDeviceId);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet GetAllCamaraDID()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT DISTINCT id,[streamname] FROM [dbo].[streamlist]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllCamaraDIDForMaster(string vehicleno)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetAllCamaraDIDForMaster";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@vehicleNo", vehicleno);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetALLFSVStaff()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [Id], [name], [contact_no], [Type] FROM [dbo].[Staff_Info] WHERE [isdeleted] = 0";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetFSVStaffById(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [Id],[name], [contact_no], [Type] FROM [dbo].[Staff_Info] WHERE [id] = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetVehicleShiftById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet AddFSVStaff(string name, string contactNo, string Type)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "INSERT INTO [DBO].[Staff_Info] VALUES ('" + name.Replace("'", "''") + "','" + contactNo.Replace("'", "''") + "'," + Type + ", 0);";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddVehicleShift()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}


        //public DataSet UpdateFSVStaff(int id, string name, string contactNo, string Type)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "UPDATE [DBO].[Staff_Info] SET [name] = '" + name.Replace("'", "''") + "', [contact_no] = '" + contactNo.Replace("'", "''") + "', Type = " + Type + " WHERE Id = " + id + ";";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddVehicleShift()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet DeleteFSVStaff(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "UPDATE [DBO].[Staff_Info] SET [isdeleted] = 1 WHERE [Id] = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddVehicleShift()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetDefaultStopReasons()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetDefaultStopReasons";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetDefaultStopReasons()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //} 
        //public DataSet GetVehicleInstallationList(string FromDt, string ToDt, string district, string accode, string vehicleno, int status)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[GetVehicleInstallation]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@vehicleno", vehicleno);
        //        command.Parameters.AddWithValue("@FromDt", FromDt);
        //        command.Parameters.AddWithValue("@ToDt", ToDt);
        //        command.Parameters.AddWithValue("@status", status);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetVehicleInstallationList()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GETVehicleInstallationByID(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[GETVehicleInstallationByID]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@ID", id);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetVehicleInstallationList()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet DeleteVehicleInstallationByID(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[DeleteVehicleInstallationByID]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@ID", id);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("DeleteVehicleInstallationByID()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //} 
        //public DataSet GetStopVehicleListForPopup(string FromDt, string ToDt, int districtid, string accode, int vehicleId, int ShiftID)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "GetStopVehicleListForPopup";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@FromDt", FromDt);
        //        command.Parameters.AddWithValue("@ToDt", ToDt);
        //        command.Parameters.AddWithValue("@districtid", districtid);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@vehicleId", vehicleId);
        //        command.Parameters.AddWithValue("@ShiftID", ShiftID);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetStopVehicleListForPopup()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetReasonListForPopup()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "GetReasonListForPopup";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetReasonListForPopup()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetVehicleInstallationList(string FromDt, string ToDt, string district, string accode, string vehicleno, Byte status)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[GetVehicleInstallation]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@vehicleno", vehicleno);
        //        command.Parameters.AddWithValue("@FromDt", FromDt);
        //        command.Parameters.AddWithValue("@ToDt", ToDt);
        //        command.Parameters.AddWithValue("@status", status);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetVehicleInstallationList()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        ////public DataSet GETVehicleInstallationByID(int id)
        ////{
        ////    DataSet ds = new DataSet();
        ////    SqlConnection conn = new SqlConnection(connstr);
        ////    try
        ////    {
        ////        string query = string.Empty;
        ////        query = "[dbo].[GETVehicleInstallationByID]";
        ////        SqlCommand command = new SqlCommand(query, conn);
        ////        command.CommandType = CommandType.StoredProcedure;
        ////        command.Parameters.AddWithValue("@ID", id);
        ////        command.CommandType = CommandType.StoredProcedure;
        ////        SqlDataAdapter da = new SqlDataAdapter(command);
        ////        da.Fill(ds);
        ////    }
        ////    catch (Exception ex)
        ////    {
        ////        Common.Log("GetVehicleInstallationList()--> " + ex.Message);
        ////        throw new ApplicationException(ex.Message, ex);
        ////    }
        ////    finally
        ////    {
        ////        conn.Close();
        ////    }
        ////    return ds;
        ////}

        ////public DataSet DeleteVehicleInstallationByID(int id)
        ////{
        ////    DataSet ds = new DataSet();
        ////    SqlConnection conn = new SqlConnection(connstr);
        ////    try
        ////    {
        ////        string query = string.Empty;
        ////        query = "[dbo].[DeleteVehicleInstallationByID]";
        ////        SqlCommand command = new SqlCommand(query, conn);
        ////        command.CommandType = CommandType.StoredProcedure;
        ////        command.Parameters.AddWithValue("@ID", id);

        ////        SqlDataAdapter da = new SqlDataAdapter(command);
        ////        da.Fill(ds);
        ////    }
        ////    catch (Exception ex)
        ////    {
        ////        Common.Log("DeleteVehicleInstallationByID()--> " + ex.Message);
        ////        throw new ApplicationException(ex.Message, ex);
        ////    }
        ////    finally
        ////    {
        ////        conn.Close();
        ////    }
        ////    return ds;
        ////}

        //public DataSet InsertUpdateVehicleInstallation(int id, string district, string accode, string vehicleno, string vehicletype,
        //                                                string schduledDate, string actualDateOfArrival, string installationDate, int status)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[InsertUpdateVehicleInstallation]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@id", id);
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@vehicleno", vehicleno);
        //        command.Parameters.AddWithValue("@vehicletype", vehicletype);
        //        command.Parameters.AddWithValue("@SchduledDate", schduledDate);
        //        command.Parameters.AddWithValue("@ActualDateOfArrival", actualDateOfArrival);
        //        command.Parameters.AddWithValue("@InstallationDate", installationDate);
        //        command.Parameters.AddWithValue("@status", status);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("DeleteVehicleInstallationByID()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet InsertUpdateVehicleInstallation(int id, string district, string accode, string vehicleno, string vehicletype,
        //                                                string schduledDate, string actualDateOfArrival, string installationDate, int status, string Zone)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[InsertUpdateVehicleInstallation]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@id", id);
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@vehicleno", vehicleno);
        //        command.Parameters.AddWithValue("@vehicletype", vehicletype);
        //        command.Parameters.AddWithValue("@SchduledDate", schduledDate);
        //        command.Parameters.AddWithValue("@ActualDateOfArrival", actualDateOfArrival);
        //        command.Parameters.AddWithValue("@InstallationDate", installationDate);
        //        command.Parameters.AddWithValue("@status", status);
        //        command.Parameters.AddWithValue("@Zone", Zone);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("DeleteVehicleInstallationByID()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet InsertUpdateVehicleInstallation(int id, string district, string accode, string vehicleno, string vehicletype,
        //                                                string schduledDate, string actualDateOfArrival, string installationDate, int status, string Zone,
        //                                                string Camera, int DriverId, int StaffID, string UserName)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[InsertUpdateVehicleInstallation]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@id", id);
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@vehicleno", vehicleno);
        //        command.Parameters.AddWithValue("@vehicletype", vehicletype);
        //        command.Parameters.AddWithValue("@SchduledDate", schduledDate);
        //        command.Parameters.AddWithValue("@ActualDateOfArrival", actualDateOfArrival);
        //        command.Parameters.AddWithValue("@InstallationDate", installationDate);
        //        command.Parameters.AddWithValue("@status", status);
        //        command.Parameters.AddWithValue("@Zone", Zone);
        //        command.Parameters.AddWithValue("@Camera", Camera);
        //        command.Parameters.AddWithValue("@DriverId", DriverId);
        //        command.Parameters.AddWithValue("@StaffID", StaffID);
        //        command.Parameters.AddWithValue("@UserName", UserName);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("DeleteVehicleInstallationByID()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet InsertUpdateVehicleInstallation(DataTable dataTable)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[InsertUpdateVehicleInstallationViaDataTable]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@table", dataTable);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("DeleteVehicleInstallationByID()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllDriverStaff()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [Id], [name], [contact_no] FROM [dbo].[Staff_Info] WHERE [isdeleted] = 0 AND [Type] = 1";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllDriverStaffForMaster(string vehicleno)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetAllDriverStaffForMaster";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@vehicleNo", vehicleno);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetVehicleDetailByVehicleNoAndShiftName(string vehicleNo, string shiftName)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetVehicleDetail";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@vehicleNo", vehicleNo);
        //        command.Parameters.AddWithValue("@ShiftName", shiftName);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet DeleteVehicleDetail(string vehicleNo, string shiftName, string userName)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "DeleteVehicleDetail";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@vehicleNo", vehicleNo);
        //        command.Parameters.AddWithValue("@ShiftName", shiftName);
        //        command.Parameters.AddWithValue("@UserName", userName);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet AddVehicleDetail(string districtName, string assemblyName, string vehicleNo, int ShiftId, int streamId,
        //    string vehicleType, int driverId, int staffId, string userName)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "AddVehicleDetail";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@districtName", districtName);
        //        command.Parameters.AddWithValue("@acName", assemblyName);
        //        command.Parameters.AddWithValue("@vehicleNo", vehicleNo);
        //        command.Parameters.AddWithValue("@shiftId", ShiftId);
        //        command.Parameters.AddWithValue("@streamId", streamId);
        //        command.Parameters.AddWithValue("@vehicleType", vehicleType);
        //        command.Parameters.AddWithValue("@driverId", driverId);
        //        command.Parameters.AddWithValue("@staffId", staffId);
        //        command.Parameters.AddWithValue("@UserName", userName);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllFLVStaffForMaster(string vehicleno)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetAllFLVStaffForMaster";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@vehicleNo", vehicleno);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllFLVStaff()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [Id], [name], [contact_no] FROM [dbo].[Staff_Info] WHERE [isdeleted] = 0 AND [Type] = 2";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        public DataSet FilterDataByAccess(DataSet ds, bool filterbyDistrict, bool filterbyAssembly)
        {
            if (ds != null)
            {
                if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dtAccess = (DataTable)HttpContext.Current.Session["userAssemblyAccess"];
                    var districtlist = string.Join(",", dtAccess.AsEnumerable().Select(r => r.Field<string>("district")).ToArray());
                    var assemblylist = string.Join(",", dtAccess.AsEnumerable().Select(r => r.Field<string>("acname")).ToArray());
                    DataTable dt = null;
                    if (filterbyDistrict)
                    {
                        var a = ds.Tables[0].AsEnumerable().Where(x => districtlist.Contains(x.Field<string>("district")));
                        if (a != null && a.Count() > 0)
                            dt = ds.Tables[0].AsEnumerable().Where(x => districtlist.Contains(x.Field<string>("district"))).CopyToDataTable();
                    }
                    if (filterbyAssembly)
                    {
                        dt = ds.Tables[0];
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            var b = dt.AsEnumerable().Where(x => assemblylist.Contains(x.Field<string>("acname")));
                            if (b != null && b.Count() > 0)
                                dt = dt.AsEnumerable().Where(x => assemblylist.Contains(x.Field<string>("acname"))).CopyToDataTable();
                        }
                    }
                    DataSet returnds = new DataSet();
                    if (dt != null)
                        returnds.Tables.Add(dt.Copy());
                    return returnds;
                }
            }
            return ds;
        }

        public DataSet GetDistrictAssemblyList()
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = "GetDistrictAssemblyList";

                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetDistrictAssemblyList()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        public DataSet GetUserById(int id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "SELECT *  FROM [dbo].[users] WHERE [id] = " + id;
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetUserById()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        public DataSet DeleteUserById(int id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "DELETE FROM [DBO].[users] WHERE Id = " + id;
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("DeleteUserById()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        public DataSet GetAllUsers()
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "GetUserDetails";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetAllUsers()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        public DataSet UpdateUserDetails(string username, string password, int identifier, int isenable, int stateid, int userid, string AssemblyAccesIds, string usercode)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "UpdateUserDetails";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);
                command.Parameters.AddWithValue("@identifier", identifier);
                command.Parameters.AddWithValue("@isenable", isenable);
                command.Parameters.AddWithValue("@stateid", stateid);
                command.Parameters.AddWithValue("@userid", userid);
                command.Parameters.AddWithValue("@AssemblyAccesIds", AssemblyAccesIds);
                command.Parameters.AddWithValue("@usercode", usercode);

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("UpdateUserDetails()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        public DataSet GetDashboardList(string district, string accode, int UserID)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);

            DateTime chklastseendt = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);

            try
            {
                string query = string.Empty;
                query = "GetDashboardList";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@lastseen", chklastseendt);
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@accode", accode);
                command.Parameters.AddWithValue("@UserID", UserID);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, false);
            }
            catch (Exception ex)
            {
                Common.Log("GetDashboardList()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        public DataSet GetIndoorOutDoorForGraph(string district, string accode, int UserID)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);

            DateTime chklastseendt = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);

            try
            {
                string query = string.Empty;
                query = "GetIndoorOutDoorForGraph";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@lastseen", chklastseendt);
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@accode", accode);
                command.Parameters.AddWithValue("@UserID", UserID);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, false);
            }
            catch (Exception ex)
            {
                Common.Log("GetDashboardList()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        //public DataSet GetDashboardDetailList(string district, string status, string CameraType = "", int IsPink = -1)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetDashboardDetailList";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@status", status);
        //        command.Parameters.AddWithValue("@CameraType", CameraType);
        //        command.Parameters.AddWithValue("@IsPink", IsPink);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetDashboardDetailList()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        public DataSet GetDashboardDetailListByAssembly(string acname, string status, string CameraType = "", int IsPink = -1)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "GetDashboardDetailListByAcName";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@acname", acname);
                command.Parameters.AddWithValue("@status", status);
                command.Parameters.AddWithValue("@CameraType", CameraType);
                command.Parameters.AddWithValue("@IsPink", IsPink);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, true);
            }
            catch (Exception ex)
            {
                Common.Log("GetDashboardDetailList()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        //public DataSet GetDashboardInsideList(string district, string accode, int UserID)
        //{
        //    DateTime chklastseendt = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);

        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetDashboardInsideList";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@lastseen", chklastseendt);
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@UserID", UserID);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, false);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetDashboardList()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetDashboardOutsideList(string district, string accode, int UserID)
        //{
        //    DataSet ds = new DataSet();
        //    DateTime chklastseendt = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetDashboardOutsideList";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@lastseen", chklastseendt);
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@UserID", UserID);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, false);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetDashboardList()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetDashboardAroList(string district, string accode, int UserID)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[GetDashboardAroList]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@UserID", UserID);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, false, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetDashboardList()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetDashboardPinkList(string district, string accode, int UserID)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        DateTime chklastseendt = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);
        //        string query = string.Empty;
        //        query = "[dbo].[GetDashboardPinkList]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@lastseen", chklastseendt);
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@UserID", UserID);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, false);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetDashboardList()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        public DataSet GetPTZViewData(string vehicleNo)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "GetPTZViewData";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@vehicalno", vehicleNo);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetDashboardDetailList()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        public DataSet GetShiftWizeVehicleByAcCode(string accode)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "GetShiftWizeVehicleByAcCode";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@accode", accode);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetShiftWizeVehicleByAcCode()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        public DataSet GetCameraOfflineList(string FromDt, string ToDt, string district, string accode, string vehicleNo, string shift)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "GetCameraOfflineList";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@accode", accode);
                command.Parameters.AddWithValue("@psnum", vehicleNo);
                command.Parameters.AddWithValue("@FromDt", FromDt);
                command.Parameters.AddWithValue("@ToDt", ToDt);
                command.CommandTimeout = 240;
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetShiftWizeVehicleByAcCode()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        //public DataSet GetCameraOfflineList3(string FromDt, string ToDt, string district, string accode, string vehicleNo, string shift)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetCameraOfflineList_Tripura";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@psnum", vehicleNo);
        //        command.Parameters.AddWithValue("@FromDt", FromDt);
        //        command.Parameters.AddWithValue("@ToDt", ToDt);
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetShiftWizeVehicleByAcCode()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetCameraOfflineListStatic(string district, string accode, string date)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetCameraOfflineReportStatic";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@AcName", accode);
        //        command.Parameters.AddWithValue("@Date", date);
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetCameraOfflineReportStatic()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        public DataSet GetCameraStatusReport(string FromDt, string ToDt, string district, string accode, string vehicleNo)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "[dbo].[GetCameraStatusReport]";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@accode", accode);
                command.Parameters.AddWithValue("@psnum", vehicleNo);
                command.Parameters.AddWithValue("@FromDt", FromDt);
                command.Parameters.AddWithValue("@ToDt", ToDt);
                command.CommandTimeout = 240;
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetShiftWizeVehicleByAcCode()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        //public DataSet GetCameraStatusReport3(string FromDt, string ToDt, string district, string accode, string vehicleNo)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[GetCameraStatusReport_Tripura]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@psnum", vehicleNo);
        //        command.Parameters.AddWithValue("@FromDt", FromDt);
        //        command.Parameters.AddWithValue("@ToDt", ToDt);
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetShiftWizeVehicleByAcCode()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetCameraStatusReportStatic(string district, string accode, string date)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[GetCameraStatusReportStatic]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@AcName", accode);
        //        command.Parameters.AddWithValue("@Date", date);
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetShiftWizeVehicleByAcCode()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllCameraExemptionReason()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [id], [name], [desc], [active] FROM [dbo].[CameraOfflineReasonMaster]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        public DataSet GetUserLoginHistoryReport(string dt)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "GetUserLoginHistoryReport";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@dt", dt);
                command.CommandTimeout = 240;
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetUserLoginHistoryReport()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        //public DataSet AddCameraExemptionReason(string name, string desc, int status)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "INSERT INTO [DBO].[CameraOfflineReasonMaster] VALUES ('" + name.Replace("'", "''") + "','" + desc.Replace("'", "''") + "'," + status + ");";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddCameraExemptionReason()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet UpdateCameraExemptionReasonById(int id, string name, string desc, int status)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "UPDATE [dbo].[CameraOfflineReasonMaster] SET [name] = '" + name.Replace("'", "''") + "' , [desc] = '" + desc.Replace("'", "''") + "', [active] = " + status + "  WHERE [id] = " + id + ";";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("UpdateReasonById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet DeleteCameraExemptionReasonById(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "DELETE FROM [DBO].[CameraOfflineReasonMaster] WHERE Id = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("DeleteReasonById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetCameraExemptionReasonById(int id)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT [id],[name],[desc],[active] FROM [dbo].[CameraOfflineReasonMaster] WHERE [id] = " + id;
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetReasonById()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetCameraOfflineListForPopup(string FromDt, string ToDt, string district, string accode, string vehicleNo, int UserID = 0)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetCameraOfflineListForPopup";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@FromDt", FromDt);
        //        command.Parameters.AddWithValue("@ToDt", ToDt);
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@vehicleno", vehicleNo);
        //        command.Parameters.AddWithValue("@UserID", UserID);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetShiftWizeVehicleByAcCode()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public void SaveCameraStopReasonsByID(int ID, string Reason)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = query = "SaveCameraStopReasonsByID";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.CommandType = CommandType.StoredProcedure;
        //        SQLcommand.Parameters.Add(new SqlParameter("@id", ID));
        //        SQLcommand.Parameters.Add(new SqlParameter("@Reason", Reason));
        //        SQLconn.Open();
        //        SQLcommand.ExecuteNonQuery();
        //        SQLconn.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("SaveGPSStopReasonsByID()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
        //public DataSet GetReasonListForCameraPopup()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "GetReasonListForCameraPopup";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetReasonListForCameraPopup()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        public DataSet UploadMasterData(DataTable dataTable)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "[dbo].[UploadMasterData]";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@tbl", dataTable);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("UploadMasterData()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        //public bool VehicleNoAlreadyExistCheck(string vehicleNo)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT * FROM vehicalDetail WHERE Vehicle_No = '" + vehicleNo + "'";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        if (ds.Tables[0].Rows.Count > 0) return true;
        //        else return false;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("UploadMasterData()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //}
        //public DataSet GetIncidenceDetails(int incidenceid = 0, string fromDt = "", string toDt = "", string district = "", int assembly = 0)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetIncidenceDetails";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@incidenceid", incidenceid);
        //        command.Parameters.AddWithValue("@FromDt", fromDt);
        //        command.Parameters.AddWithValue("@ToDt", toDt);
        //        command.Parameters.AddWithValue("@districtName", district);
        //        command.Parameters.AddWithValue("@accode", assembly);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllIncidenceDetails()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet AddIncidenceDetail(string districtNme, string assemblyNme, int vehicleId, string incidenceDetailText, string UserName, int incidenceid, string incidentDate)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "AddIncidenceDetail";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@districtName", districtNme);
        //        command.Parameters.AddWithValue("@acName", assemblyNme);
        //        command.Parameters.AddWithValue("@UserName", UserName);
        //        command.Parameters.AddWithValue("@vehicleId", vehicleId);
        //        command.Parameters.AddWithValue("@incidenceDetailText", incidenceDetailText);
        //        command.Parameters.AddWithValue("@incidenceid", incidenceid);
        //        command.Parameters.AddWithValue("@incidenceDateTime", incidentDate);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddIncidenceDetail()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet DeleteIncidenceDetail(int incidenceId, string UserName)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "DeleteIncidenceDetail";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@IncidenceID", incidenceId);
        //        command.Parameters.AddWithValue("@UserName", UserName);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("DeleteIncidenceDetail()--> " + ex.Message);
        //        throw new ApplicationException(ex.Message, ex);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetPollingStationList(string district, string accode)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetPollingStationList";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetPollingStationList()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet GetBoothWiseCamOperator(string district, string accode, string designation)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetBoothWiseCamOperator";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@accode", accode);
        //        command.Parameters.AddWithValue("@designation", designation);
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothWiseCamOperator()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetAllDesignations()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        query = "select distinct designation from operator_info";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllDesignations()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        public DataSet GetCameraHourList(string district, string accode, string date)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "[DBO].[GetCameraHourList]";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@accode", accode);
                command.Parameters.AddWithValue("@FromDt", date);
                command.CommandTimeout = 240;
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetAllDesignations()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        //public DataSet GetMapBoothOnceCount(string district, string assembly, string status, int isPink = -1, int isARO = -1, int islive = -1)
        //{

        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = " SELECT *,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b inner join streamlist s on b.streamid = s.id    INNER JOIN operator_info op on b.operatorid = op.id    AND ((@district='') OR (b.district = @district))    AND ((@assembly='') OR (b.acname = @assembly))   AND ((@status='') OR (status = @status))    AND ((@isPink = -1) OR (b.IsPink = @isPink)) AND ((@isARO = -1) OR (b.IsAro = @isARO)) AND ((@isLive = -1) OR (s.isLive =@islive)) and  ISnull(b.isdelete,0)=0 ORDER BY b.district, b.acname, b.location, b.cameralocationtype  ;";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        //command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@assembly", assembly);
        //        command.Parameters.AddWithValue("@status", status);
        //        command.Parameters.AddWithValue("@isPink", isPink);
        //        command.Parameters.AddWithValue("@isARO", isARO);
        //        command.Parameters.AddWithValue("@islive", islive);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);

        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetMapBoothListNew()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        public DataSet GetUnmappedCameraList(string CameraID, string status)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                SqlCommand command = new SqlCommand("GetUnmappedCameraList", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@CameraID", CameraID);
                command.Parameters.AddWithValue("@Status", status);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetUserData()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        public bool SaveLoginUserHistory(int userid, string ipaddress)
        {
            SqlConnection SQLconn = new SqlConnection(connstr);
            try
            {
                SqlCommand SQLcommand = new SqlCommand("SaveLoginUserHistory", SQLconn);
                SQLcommand.CommandType = CommandType.StoredProcedure;
                SQLcommand.Parameters.Add(new SqlParameter("@UserID", userid));
                SQLcommand.Parameters.Add(new SqlParameter("@IPAddress", ipaddress));
                SQLconn.Open();
                SQLcommand.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                SQLconn.Close();
            }
        }

        public DataSet SwapCameraIDs(int id1, int id2)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                SqlCommand command = new SqlCommand("swapCameraIDs", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@id1", id1);
                command.Parameters.AddWithValue("@id2", id2);
                conn.Open();
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Common.Log("SwapCameraIDs()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }
        public DataSet AddUnmapToMapCamera(int id, int stremid,string username)
        {
            SqlConnection SQLconn = new SqlConnection(connstr);
            try
            {
                string query = "UnMapToMapCamera";
                SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
                SQLcommand.CommandType = CommandType.StoredProcedure;
                SQLcommand.Parameters.AddWithValue("@id", id);
                SQLcommand.Parameters.AddWithValue("@StremlistID", stremid);
                SQLcommand.Parameters.AddWithValue("@UserName", username);
                SQLcommand.Parameters.AddWithValue("@IPAddress", System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString());
                SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
                DataSet ds = new DataSet();
                SQLconn.Open();
                adp.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                Common.Log("AddUnmapToMapCamera()--> " + ex.Message);
                return new DataSet();
            }
            finally
            {
                SQLconn.Close();
            }
        }

        public DataSet SwapCamera(int id, int id1, int stremid, int stremid1, string username)
        {
            SqlConnection SQLconn = new SqlConnection(connstr);
            try
            {
                string query = "SwapCamemainLocation";
                SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
                SQLcommand.CommandType = CommandType.StoredProcedure;
                SQLcommand.Parameters.AddWithValue("@id", id);
                SQLcommand.Parameters.AddWithValue("@id1", id1);
                SQLcommand.Parameters.AddWithValue("@StremlistID", stremid);
                SQLcommand.Parameters.AddWithValue("@StremlistID1", stremid1);
                SQLcommand.Parameters.AddWithValue("@UserName", username);
                SQLcommand.Parameters.AddWithValue("@IPAddress", System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString());
                SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
                DataSet ds = new DataSet();
                SQLconn.Open();
                adp.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                Common.Log("SwapCamera()--> " + ex.Message);
                return new DataSet();
            }
            finally
            {
                SQLconn.Close();
            }
        }
        public DataSet GETMultimappedCamera()
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                SqlCommand command = new SqlCommand("GETMultimappedCamera", conn);
                command.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetUserData()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        public DataSet GetassemblywiseLocation(string district, string assembly)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = "GetAssemblyWiseLocation";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@assembly", assembly);
                command.Parameters.AddWithValue("@flag", "Location");
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetassemblywiseLocation()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        public DataSet Getstremid(string district, string assembly, int boothid)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = "GetAssemblyWiseLocation";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@assembly", assembly);
                command.Parameters.AddWithValue("@boothID", boothid);
                command.Parameters.AddWithValue("@flag", "stremid");
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("Getstremid()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        public DataSet GetOperatorName(int stateid, string district)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                query = "select * from operator_info WHERE stateid=" + stateid + " AND district='" + district + "'";

                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetOperatorName()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        public DataSet GetTrailRunRpt(string district, string assembly, string status)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                SqlCommand command = new SqlCommand("GetBoothListTrailRunRpt_new", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@assembly", assembly);
                command.Parameters.AddWithValue("@status", status);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetTrailRunRpt()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }

        //public DataSet GetTrailRunRptStatic(string district, string assembly)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        SqlCommand command = new SqlCommand("TrialRunRpt", conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@assembly", assembly);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetTrailRunRpt()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        public DataSet GetMapBoothListNew_Download(string district, string assembly, string status, int isPink = -1, int isARO = -1, string booth = "", string streamname = "", string orderBy = "", string date = "")
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                SqlCommand command = new SqlCommand("GetBoothListNew_download", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@assembly", assembly);
                command.Parameters.AddWithValue("@status", status);
                command.Parameters.AddWithValue("@isPink", isPink);
                command.Parameters.AddWithValue("@isARO", isARO);
                command.Parameters.AddWithValue("@booth", booth);
                command.Parameters.AddWithValue("@streamname", streamname);
                command.Parameters.AddWithValue("@OrderBY", orderBy);
                command.Parameters.AddWithValue("@date", orderBy);
                command.CommandTimeout = 420;
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, true);
            }
            catch (Exception ex)
            {
                Common.Log("GetMapBoothListNew()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }

        //public DataSet GetCameraStatusReportStatic(string district, string accode)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[GetCameraStatusReportStatic]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@AcName", accode);
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetCameraStatusReportStatic()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        public int SaveStreamList(string deviceid, string servername, string prourl,string userName, string PageName)
        {
            DataSet ds = new DataSet();
            SqlConnection SQLconn = new SqlConnection(connstr);
            try
            {
                SqlCommand SQLcommand = new SqlCommand("SaveStreamList", SQLconn);
                SQLcommand.CommandType = CommandType.StoredProcedure;
                SQLcommand.Parameters.Add(new SqlParameter("@deviceid", deviceid));
                SQLcommand.Parameters.Add(new SqlParameter("@servername", servername));
                SQLcommand.Parameters.Add(new SqlParameter("@prourl", prourl));
                SQLcommand.Parameters.Add(new SqlParameter("@UserName", userName));
                SQLcommand.Parameters.Add(new SqlParameter("@PageName", PageName));
                SQLconn.Open();
                SqlDataAdapter sqa = new SqlDataAdapter(SQLcommand);
                sqa.Fill(ds);
                int.TryParse(ds.Tables[0].Rows[0]["ID"].ToString(), out int ID);
                return ID;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                SQLconn.Close();
            }
        }
        //Booth Master Function
        public DataSet GetMapBoothListNew_Master(string district, string assembly, string Search, string cameratype)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                SqlCommand command = new SqlCommand("GetBoothList", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@acname", assembly);
                command.Parameters.AddWithValue("@search", Search);
                command.Parameters.AddWithValue("@cameratype", cameratype);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, true);
            }
            catch (Exception ex)
            {
                Common.Log("GetMapBoothListNew()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }
        public DataSet GetDeviceID(string DID)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                SqlCommand command = new SqlCommand("GetStreamNameListAutoComplete", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@search", DID);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetDeviceID()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }
        public DataSet GETInvStreamName(string DID)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                SqlCommand command = new SqlCommand("GetInvStreamListAutoComplete", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@search", DID);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GETInvStreamName()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }
        public DataSet GetBoothListMaster(int id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                SqlCommand command = new SqlCommand("GetBoothListByID", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", id);

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, true);
            }
            catch (Exception ex)
            {
                Common.Log("GetMapBoothListNew()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }
        public DataSet SaveBooth(int id, int streamid, string OpName, string OpMobNo, string OpDesignation, string district, string accode, string acname, string PSNum, string location, string cameralocationtype, string userName)
        {
            SqlConnection SQLconn = new SqlConnection(connstr);
            try
            {
                string query = "SaveBoothByID";
                SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
                SQLcommand.CommandType = CommandType.StoredProcedure;
                SQLcommand.Parameters.AddWithValue("@id", id);
                SQLcommand.Parameters.AddWithValue("@streamid", streamid);
                SQLcommand.Parameters.AddWithValue("@OperatorName", OpName);
                SQLcommand.Parameters.AddWithValue("@OperatorNumber", OpMobNo);
                SQLcommand.Parameters.AddWithValue("@OperatorDesignation", OpDesignation);
                SQLcommand.Parameters.AddWithValue("@district", district);
                SQLcommand.Parameters.AddWithValue("@accode", accode);
                SQLcommand.Parameters.AddWithValue("@acname", acname);
                SQLcommand.Parameters.AddWithValue("@PSNum", PSNum);
                SQLcommand.Parameters.AddWithValue("@location", location);
                SQLcommand.Parameters.AddWithValue("@cameralocationtype", cameralocationtype);
                SQLcommand.Parameters.AddWithValue("@UserName", userName);
                SQLcommand.Parameters.AddWithValue("@IPAddress", System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString());
                SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
                DataSet ds = new DataSet();
                SQLconn.Open();
                adp.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                Common.Log("SaveBooth()--> " + ex.Message);
                return new DataSet();
            }
            finally
            {
                SQLconn.Close();
            }
        }
        public bool DeleteBoothListMaster(int id, string UserName)
        {
            SqlConnection SQLconn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string tblname = string.Empty;
                SqlCommand comm = new SqlCommand("DeleteBoothByID", SQLconn);
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.AddWithValue("@id", id);
                comm.Parameters.AddWithValue("@UserName", UserName);
                comm.Parameters.AddWithValue("@IPAddress", System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString());
                SQLconn.Open();
                comm.ExecuteNonQuery();
                SQLconn.Close();
                return true;
            }
            catch (Exception ex)
            {
                Common.Log("deletebooth()--> " + ex.Message);
                return false;
            }
            finally
            {
                SQLconn.Close();
            }
        }

        public static string DeleteBoothByID(int id, string UserName, string IPAddress)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString);
            try
            {
                string query = "DeleteBoothByID";
                SqlCommand cmd = new SqlCommand(query);
                cmd.Connection = con;
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@UserName", UserName);
                cmd.Parameters.AddWithValue("@IPAddress", IPAddress);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                return i > 0 ? "Deleted" : "Failed";
            }
            catch (Exception ex)
            {
                Common.Log("deletebooth()--> " + ex.Message);
                return "Failed";
            }
            finally
            {
                con.Close();
            }
        }
        //streamlist master
        public DataSet GetStreamListMaster(string Search)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                SqlCommand command = new SqlCommand("GetStreamList", conn);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@search", Search);

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, true);
            }
            catch (Exception ex)
            {
                Common.Log("GetStreamListNew()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }
        public DataSet GetStreamListMaster(int id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                SqlCommand command = new SqlCommand("GetStreamlistByID", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", id);

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, true);
            }
            catch (Exception ex)
            {
                Common.Log("GetMapBoothListNew()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }
        //public DataSet SaveStreamListwithAI(int id, string deviceid, string servername, string prourl, bool isAi, string username)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        SqlCommand SQLcommand = new SqlCommand("SaveStreamMaster", SQLconn);
        //        SQLcommand.CommandType = CommandType.StoredProcedure;
        //        SQLcommand.Parameters.Add(new SqlParameter("@id", id));
        //        SQLcommand.Parameters.Add(new SqlParameter("@deviceid", deviceid));
        //        SQLcommand.Parameters.Add(new SqlParameter("@servername", servername));
        //        SQLcommand.Parameters.Add(new SqlParameter("@prourl", prourl));
        //        SQLcommand.Parameters.Add(new SqlParameter("@isAI", isAi));
        //        SQLcommand.Parameters.Add(new SqlParameter("@username", username));
        //        SQLconn.Open();
        //        SqlDataAdapter sqa = new SqlDataAdapter(SQLcommand);
        //        sqa.Fill(ds);
        //        //int.TryParse(ds.Tables[0].Rows[0]["Id"].ToString(), out int ID);

        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet SaveCameraOfflineStatic(string iDistrict, string iAssembly, string iPsNo, string iLocation, string iOperator, string iCameraDID, string iDate, string iStartTime, string iEndTime, string iTime, string iRemark)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "InsertOfflineStaticRpt";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.CommandType = CommandType.StoredProcedure;
        //        SQLcommand.Parameters.AddWithValue("@id", "1");
        //        SQLcommand.Parameters.AddWithValue("@District", iDistrict);
        //        SQLcommand.Parameters.AddWithValue("@Assembly", iAssembly);
        //        SQLcommand.Parameters.AddWithValue("@PsNo", iPsNo);
        //        SQLcommand.Parameters.AddWithValue("@Location", iLocation);
        //        SQLcommand.Parameters.AddWithValue("@Operator", iOperator);
        //        SQLcommand.Parameters.AddWithValue("@CameraDID", iCameraDID);
        //        SQLcommand.Parameters.AddWithValue("@Date", iDate);
        //        SQLcommand.Parameters.AddWithValue("@StartTime", iStartTime);
        //        SQLcommand.Parameters.AddWithValue("@EndTime", iEndTime);
        //        SQLcommand.Parameters.AddWithValue("@Time", iTime);
        //        SQLcommand.Parameters.AddWithValue("@Remark", iRemark);
        //        SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
        //        DataSet ds = new DataSet();
        //        SQLconn.Open();
        //        adp.Fill(ds);
        //        return ds;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("SaveCameraOfflineStatic()--> " + ex.Message);
        //        return new DataSet();
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        public DataSet SaveBulkStreamList(DataTable dt,string username,string updatedfrom)
        {
            DataSet ds = new DataSet();
            SqlConnection SQLconn = new SqlConnection(connstr);
            try
            {
                SqlCommand SQLcommand = new SqlCommand("BulkInsertCamera", SQLconn);
                SQLcommand.CommandType = CommandType.StoredProcedure;
                SQLcommand.Parameters.AddWithValue("@tblData", dt);
                SQLcommand.Parameters.AddWithValue("@UserName", username);
                SQLcommand.Parameters.AddWithValue("@UpdatedFrom", updatedfrom);
                SQLconn.Open();
                SqlDataAdapter sqa = new SqlDataAdapter(SQLcommand);
                sqa.Fill(ds);
            }
            catch (Exception ex)
            {
            }
            finally
            {
                SQLconn.Close();
            }
            return ds;
        }
        public DataSet getDataSet(string Action, int id)
        {
            SqlConnection sqlConnection = new SqlConnection(connstr);
            string CommandText2 = "GetLatestBoothHistoryByID";
            SqlCommand sqlCommand = new SqlCommand(CommandText2, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@BoothId", id);
            sqlCommand.Parameters.AddWithValue("@Action", Action);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sqlDataAdapter = new System.Data.SqlClient.SqlDataAdapter();
            sqlDataAdapter.SelectCommand = sqlCommand;
            DataSet dataSet = new DataSet();
            try
            {
                sqlDataAdapter.Fill(dataSet, "header");
                sqlConnection.Close();
            }
            catch (Exception ex)
            {
                sqlConnection.Close();
                return null;
            }
            return dataSet;
        }

        //public DataSet GETAICamera()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        SqlCommand command = new SqlCommand("GetAIViewCamera", conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GETAICamera()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet GetColumnName(string RptName)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "[dbo].[GetColumnName]";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@flag", RptName);
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetColumnName()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet SaveRptSetting(string flag,string username, string columnName, string isActive)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        SqlCommand SQLcommand = new SqlCommand("GetColumnName", SQLconn);
        //        SQLcommand.CommandType = CommandType.StoredProcedure;
        //        SQLcommand.Parameters.AddWithValue("@flag", flag);
        //        SQLcommand.Parameters.AddWithValue("@UpdatedBy", username);
        //        SQLcommand.Parameters.AddWithValue("@ColumnName", columnName);
        //        if(flag== "OfflineUpdate")
        //        {
        //            SQLcommand.Parameters.AddWithValue("@IsActive", isActive);
        //        }
        //       else
        //        {
        //            SQLcommand.Parameters.AddWithValue("@IsStatusActive", isActive);
        //        }
        //        SQLconn.Open();
        //        SqlDataAdapter sqa = new SqlDataAdapter(SQLcommand);
        //        sqa.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet GetMapBoothListNew_Network(string district, string assembly, string status, string booth, string streamname, string Minkbps, string maxkbps)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        SqlCommand command = new SqlCommand("GetNetworkDtlsRpt", conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@assembly", assembly);
        //        command.Parameters.AddWithValue("@status", status);
        //        command.Parameters.AddWithValue("@booth", booth);
        //        command.Parameters.AddWithValue("@streamname", streamname);
        //        if(Minkbps=="" || maxkbps=="")
        //        {
        //            command.Parameters.AddWithValue("@MinKbps", 0);
        //            command.Parameters.AddWithValue("@MaxKbps", 0);
        //        }
        //        else
        //        {
        //            command.Parameters.AddWithValue("@MinKbps", Convert.ToInt32(Minkbps));
        //            command.Parameters.AddWithValue("@MaxKbps", Convert.ToInt32(maxkbps));
        //        }
               
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetMapBoothListNew()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}

        public DataSet GetMapBoothListView(string district, string assembly, string status, int isPink = -1, int isARO = -1, string booth = "", string streamname = "", string orderBy = "")
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                SqlCommand command = new SqlCommand("GetMapBoothListViewNew", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@assembly", assembly);
                command.Parameters.AddWithValue("@status", status); 
                command.Parameters.AddWithValue("@booth", booth);
                command.Parameters.AddWithValue("@streamname", streamname);
                command.Parameters.AddWithValue("@OrderBY", orderBy);

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, false);
            }
            catch (Exception ex)
            {
                Common.Log("GetMapBoothListNew()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }
        ////-----------------Inventory ------------------------------------
        //public DataSet GetAllOwnerInventory(string District, string Assembly,string Location)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetInventoryMaster";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@District", District);
        //        command.Parameters.AddWithValue("@Assembly", Assembly);
        //        command.Parameters.AddWithValue("@Location", Location);
        //        command.Parameters.AddWithValue("@flag", "OwnerName");
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllOwnerInventory()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet GetAllDistrictInventory()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetInventoryMaster";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@flag", "District");
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllDistrictInventory()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet GetAllAssemblyInventory(string District)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetInventoryMaster";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@District", District);
        //        command.Parameters.AddWithValue("@flag", "ASSEMBLY");
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllAssemblyInventory()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet GetAllLocationInventory(string District, string Assembly)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetInventoryMaster";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@District", District);
        //        command.Parameters.AddWithValue("@Assembly", Assembly);
        //        command.Parameters.AddWithValue("@flag", "Location");
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetAllLocationInventory()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}
        //public DataSet GetInventoryTrn(string District, string Assembly, string Location, string status, string Search, string OwnerName)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "GetInventoryMaster";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@District", District);
        //        command.Parameters.AddWithValue("@Assembly", Assembly);
        //        command.Parameters.AddWithValue("@Location", Location);
        //        command.Parameters.AddWithValue("@Status", status);
        //        command.Parameters.AddWithValue("@search", Search);
        //        command.Parameters.AddWithValue("@OwnerName", OwnerName);
        //        command.Parameters.AddWithValue("@flag", "InventoryList");
        //        command.CommandTimeout = 240;
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetShiftWizeVehicleByAcCode()--> " + ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public DataSet GetInventoryTrnByID(int id, string flag)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        SqlCommand command = new SqlCommand("GetInventoryMaster", conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@ID", id);
        //        command.Parameters.AddWithValue("@flag", flag);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetMapBoothListNew()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        //public DataSet GetInventoryTrnByDID(string DID, string flag)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        SqlCommand command = new SqlCommand("GetInventoryMaster", conn);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@StreamID", DID);
        //        command.Parameters.AddWithValue("@flag", flag);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //        ds = FilterDataByAccess(ds, true, true);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetMapBoothListNew()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        //public DataSet SaveInventoryTrn(string id,string iDistrict, string iAssembly,string iLocation,string iCameraDID, string iOwnerFrom, string iOwnerName, string iOwnerMob, string iAddDate, string iAddTime, string iStatus)
        //    {
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "GetInventoryMaster";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.CommandType = CommandType.StoredProcedure;
        //        SQLcommand.Parameters.AddWithValue("@ID",Convert.ToInt32(id));
        //        SQLcommand.Parameters.AddWithValue("@District", iDistrict);
        //        SQLcommand.Parameters.AddWithValue("@Assembly", iAssembly);
        //        SQLcommand.Parameters.AddWithValue("@Location", iLocation);
        //        SQLcommand.Parameters.AddWithValue("@StreamID", iCameraDID);
        //        SQLcommand.Parameters.AddWithValue("@OwnerFrom", iOwnerFrom);
        //        SQLcommand.Parameters.AddWithValue("@OwnerName", iOwnerName);
        //        SQLcommand.Parameters.AddWithValue("@OwnerMob", iOwnerMob);
        //        SQLcommand.Parameters.AddWithValue("@AddDate",iAddDate);
        //        SQLcommand.Parameters.AddWithValue("@AddTime",iAddTime);
        //        SQLcommand.Parameters.AddWithValue("@Status", iStatus);
        //        SQLcommand.Parameters.AddWithValue("@flag", "Save");
        //        SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
        //        DataSet ds = new DataSet();
        //        SQLconn.Open();
        //        adp.Fill(ds);
        //        return ds;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("SaveCameraOfflineStatic()--> " + ex.Message);
        //        return new DataSet();
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
        ////-----------------END Inventory ------------------------------------

        public DataSet GetAlllocationbyAcCode(string accode)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "SELECT location FROM  booth WHERE Accode ='"+accode+"'";
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetAllVehicleDetail()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        public DataSet getLocationWise(string district,string acname,string Location)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = "getlocationwisedeviceid"; 
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@acname", acname);
                command.Parameters.AddWithValue("@location", Location);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            { 
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        public DataSet getgaugechartdtls()
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr); 
            try
            {
                string query = string.Empty;
                query = "gaugechartdistrictwise";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure; 
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds); 
            }
            catch (Exception ex)
            {
                Common.Log("gaugechartdistrictwise()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        public DataSet getImgNotification(string flag)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "GetImagenotification";
                SqlCommand command = new SqlCommand(query, conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@flag", flag);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("getImgNotification()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        public DataSet Getnotification(string district, string assembly, string sel_date, string todt, string streamname, string imagurl = "", int type = 0)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                
                SqlCommand command = new SqlCommand("GetAnalyticsNotification", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@assembly", assembly);
                command.Parameters.AddWithValue("@dt", sel_date);
                command.Parameters.AddWithValue("@todt", todt);
                command.Parameters.AddWithValue("@DID", streamname);
                command.Parameters.AddWithValue("@ImageURL", imagurl);
                command.Parameters.AddWithValue("@Type", type);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, true);
            }
            catch (Exception ex)
            {
                Common.Log("GetMapBoothListNew()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }

    }
}
