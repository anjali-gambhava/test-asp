using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using System.Timers;

namespace CameraStatusService
{
    public partial class Service1 : ServiceBase
    {
        public Service1()
        {
            InitializeComponent();
            //SetCameraStatus();
            //    Logs.InsertLog("Started");
            //CameraStatusAPI api = new CameraStatusAPI();
            //DataTable dt = api.GetCameraStatusList();
            //    Logs.InsertLog("SQL Started: " + dt.Rows.Count.ToString());
            //bool status = api.SaveCameraStatus(dt);
            //    Logs.InsertLog("Stopped");
         }

        void checkForTime_Elapsed(object sender, ElapsedEventArgs e)
        {
            try
            {
                SetCameraStatus();
            }
            catch (Exception ex)
            {
                Logs.InsertLog(ex.Message);
            }
        }

        protected override void OnStart(string[] args)
        {
            try
            {
                Logs.InsertLog("Service Started");

                SetCameraStatus();

                double interval60Minutes = Convert.ToInt32(ConfigurationManager.AppSettings["TimeInterval"]) * 1000; // milliseconds
                Logs.InsertLog("Time Interval is set to " + interval60Minutes.ToString());

                Timer checkForTime = new Timer(interval60Minutes);
                checkForTime.Elapsed += new ElapsedEventHandler(checkForTime_Elapsed);
                checkForTime.Enabled = true;
            }
            catch (Exception ex)
            {
                Logs.InsertLog("Service OnStart Error: " + ex.Message);
            }
        }

        protected override void OnStop()
        {
            Logs.InsertLog("Service Stopped");
        }

        protected void SetCameraStatus()
        {
            try
            {
                CameraStatusAPI api = new CameraStatusAPI();
                DataTable dt = api.GetCameraStatusList();
               // DataTable dt1 = api.GetCameraStreamList();
               // DataTable dt2 = api.GetSDCardDtls(dt1);
              //  bool status1 = api.SaveSDCardDtls(dt2);
                bool status = api.SaveCameraStatus(dt);
                if (status)
                {
                    Logs.InsertLog("Camera Status Synced successfully.");
                }
                else
                {
                    Logs.InsertLog("Some error occurred while sync Camera Status.");
                }
            }
            catch (Exception ex)
            {
                Logs.InsertLog("SetCameraStatus() Error: " + ex.Message);
            }
            
        }
    }
}
