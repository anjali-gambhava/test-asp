using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.IO;
using exam.DAL;
using System.Data.OleDb;
using System.Collections;
using System.Text.RegularExpressions;
using ClosedXML.Excel;
using exam.services;

namespace exam
{
    public partial class addcam : System.Web.UI.Page
    {
        db_data _dbdata = new db_data();
        db_data_admin _db = new db_data_admin();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddevent_Click(object sender, EventArgs e)
        {

         

        }
     
    }
}