using Newtonsoft.Json.Linq;
using System;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.UI; 


namespace exam
{
    public partial class cameraset : System.Web.UI.Page
    { 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    try
                    {
                        string deviceid = "";
                        string prourl = "";

                        if (Request.QueryString["did"] != null && Request.QueryString["prourl"] != null)
                        {
                            deviceid = Request.QueryString["did"];
                            prourl = "tcp://" + Request.QueryString["prourl"];
                        }

                        string apiUrl = $"http://142.93.213.150:7000/api/get?uuid={HttpUtility.UrlEncode(deviceid)}";

                        using (var httpClient = new HttpClient())
                        {
                            httpClient.DefaultRequestHeaders.TryAddWithoutValidation("Content-Type", "application/json");

                            var responseTask = httpClient.GetAsync(apiUrl);
                            responseTask.Wait(); // Wait for the response to complete (without using await)

                            var response = responseTask.Result; // Get the result of the completed task

                            if (response.IsSuccessStatusCode)
                            {
                                var responseBodyTask = response.Content.ReadAsStringAsync();
                                responseBodyTask.Wait(); // Wait for the response body to complete

                                string responseBody = responseBodyTask.Result;
                                JObject json = JObject.Parse(responseBody);
                                ViewState["MyJsonData"] = json.ToString();
                                int flipValue = (int)json["imageCfg"]["flip"];
                                int mirrorValue = (int)json["imageCfg"]["mirror"];
                                int ircutmodeValue = (int)json["displayCfg"]["ircutmode"];
                                // Set the flip radio button based on the JSON data
                                if (flipValue == 1)
                                    flip_on_off.Checked = true;
                                else flip_on_off.Checked = false;
                                if (mirrorValue == 1)
                                    mirror_on_off.Checked = true;
                                else mirror_on_off.Checked = false;
                                ircut.SelectedIndex = ircutmodeValue;
                            }
                            else
                            {
                                // Handle unsuccessful response (e.g., log, throw exception, etc.)
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions (e.g., log, throw exception, etc.)
                    }
                }
            }
        } 
        protected void btnsaveconfig_Click(object sender, EventArgs e)
        {
            try
            {
                string storedJson = ViewState["MyJsonData"] as string;
                if (!string.IsNullOrEmpty(storedJson))
                {
                    // Parse the stored JSON string
                    JObject json = JObject.Parse(storedJson);

                    // Get the RadioButton value, assuming you have a RadioButton named "radioButton"
                    bool flip_on_offValue = flip_on_off.Checked;
                    bool mirror_on_offValue = mirror_on_off.Checked;
                     
                    json["imageCfg"]["flip"] = flip_on_offValue ? 1 : 0;
                    json["imageCfg"]["mirror"] = mirror_on_offValue ? 1 : 0;
                    json["displayCfg"]["ircutmode"] = ircut.SelectedIndex;
                    JObject appSettingsBlock = new JObject();
                    appSettingsBlock.Add("appSettings", json);
                    string modifiedJson = appSettingsBlock.ToString();

                    using (var httpClient = new HttpClient())
                    {
                        string apiUrl = "http://142.93.213.150:7000/api/set";

                        // Set the Content-Type header to application/json
                        httpClient.DefaultRequestHeaders.TryAddWithoutValidation("Content-Type", "application/json");

                        // Convert the modified JSON string to HttpContent
                        var content = new StringContent(modifiedJson, Encoding.UTF8, "application/json");

                        // Make a POST request to the API
                        var response = httpClient.PostAsync(apiUrl, content).Result;

                        // Check if the request was successful
                        if (response.IsSuccessStatusCode)
                        {
                            // Handle success if needed
                            // e.g., Display a success message or perform additional actions
                        }
                        else
                        {
                            // Handle failure if needed
                            // e.g., Log the error or display an error message
                        }
                    }

                }
                string script = "<script type=\"text/javascript\">window.close();</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "CloseWindowScript", script);
            }
            catch (Exception ex)
            {
            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
          
        }
    }
}