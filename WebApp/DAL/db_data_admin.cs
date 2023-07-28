using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace exam.DAL
{
    public class db_data_admin
    {
        db_data _boothlist = new db_data();
        public string connstr = Common.DecodeConnectionstring(ConfigurationManager.ConnectionStrings["connectionstr"].ToString());
        public int minute = Convert.ToInt32(ConfigurationManager.AppSettings["minute"]);
        public string currentphase = ConfigurationManager.AppSettings["stateid"].ToString();
        public string uploadphase = ConfigurationManager.AppSettings["uploadstateid"].ToString();
        public string stcode = ConfigurationManager.AppSettings["stcode"].ToString();
        public string table_prefix = ConfigurationManager.AppSettings["tb_prefix"].ToString();
        string allKeyword = ConfigurationManager.AppSettings["AllSelectKeword"].ToString() + " "; 
        string districtname = ConfigurationManager.AppSettings["district"].ToString();
        string assemblyname = ConfigurationManager.AppSettings["assemblyname"].ToString();    


        public DataSet GetUser(string username, string password)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = "SELECT * FROM " + table_prefix + "adminlogin WHERE admin_user=@username and admin_pwd=@password and IsEnable=1";
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
                string query = "SELECT * FROM " + table_prefix + "users WHERE username=@username and IsEnable=1 and isDVR=0";
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
        //public bool updatestreamselect(int id, bool setselect)
        //{
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        query = "update " + table_prefix + "streamlist set selected=@selected where id=@id";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@selected", setselect);

        //        command.Parameters.AddWithValue("@id", id);

        //        conn.Open();
        //        command.ExecuteNonQuery();

        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("updateuserlist()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }

        //}
        //public DataSet GetBoothData()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        query = "SELECT COUNT(CASE s.status WHEN 'RUNNING' then 1 ELSE NULL END) as ActualLive, count(DISTINCT s.id) as TotalBooth, COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce' From " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on s.id=b.streamid where b.boothstateid='" + ConfigurationManager.AppSettings["stateid"].ToString() + "';select * from " + table_prefix + "static_count";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}

        //public bool updatecount(int count)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "UPDATE " + table_prefix + "static_count SET staticcount=@staticcount";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.Add(new SqlParameter("@staticcount", count));
        //        SQLconn.Open();
        //        SQLcommand.ExecuteNonQuery();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        return false;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        public DataSet GetBoothList()
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string tblname = string.Empty;
                if (currentphase != uploadphase)
                {
                    tblname = "p" + uploadphase;
                    query = "SELECT Distinct(b.id),b.district,b.acname,b.location,b.isdisplay,STUFF((SELECT ', ' + s.streamname FROM streamlist" + tblname + " s WHERE ( b.id = s.schoolid ) FOR XML PATH ('')),1,2,'') as streamnames From booth" + tblname + " b,streamlist" + tblname + " s1 where b.id = s1.schoolid and s1.stateID='" + uploadphase + "'";
                }
                else
                {
                    query = "SELECT Distinct(b.id),b.district,b.acname,b.location,b.isdisplay,STUFF((SELECT ', ' + s.streamname FROM streamlist s WHERE ( b.streamid = s.id ) FOR XML PATH ('')),1,2,'') as streamnames From " + table_prefix + "booth b," + table_prefix + "streamlist s where b.streamid = s.id and b.boothstateid='" + ConfigurationManager.AppSettings["stateid"].ToString() + "'";
                }
             
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("Get" + table_prefix + "boothList()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }

        //public DataSet GetList(string dst, string acname, int flag)
        //{   DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        if (dst.StartsWith(allKeyword + districtname))
        //        {
        //            query = "SELECT Distinct(b.id),b.district,b.acname,b.location,b.isdisplay,b.accode,b.PSNum as psnum,isnull(o.operatorName,'') as operatorname,isnull((convert(nvarchar(50),o.operatorNumber)),'') as operatornumber,isnull((convert(nvarchar(50),o.operatorAltNumber)),'') as operatorAltnumber, STUFF((SELECT ', ' + s.streamname FROM streamlist s WHERE ( b.streamid = s.id ) FOR XML PATH ('')),1,2,'') as streamname, STUFF((SELECT ', ' + s.status FROM streamlist s WHERE ( b.streamid = s.id ) FOR XML PATH ('')),1,2,'') as [status] From " + table_prefix + "booth b inner join streamlist s on b.streamid = s.id left join operator_info o on o.id = b.operatorid where boothstateid=" + currentphase + "";
        //        }
        //        else
        //        {
        //            if (flag > 0)//if>0 load District wise
        //                query = "SELECT b.*,oi.*,s.* From " + table_prefix + "booth b left outer join " + table_prefix + "streamlist s ON b.streamid=s.id  left outer join " + table_prefix + "operator_info oi ON oi.id=b.operatorid where b.district=N'" + dst + "' and boothstateid=" + currentphase + "";
        //            else
        //            {
        //                query = "SELECT b.*,oi.*,s.* From " + table_prefix + "booth b left outer join " + table_prefix + "streamlist s ON b.streamid=s.id  left outer join " + table_prefix + "operator_info oi ON oi.id=b.operatorid where b.district=N'" + dst + "'";
        //                if(acname != allKeyword + assemblyname )
        //                query=query+"and b.acname=N'" + acname + "' ";
        //                query=query+ " and boothstateid=" + currentphase + "";
        //            }
        //        }

        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}
        //public DataSet GetOperatorList(string dst, string acname)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //       query = "SELECT o.* From " + table_prefix + "operator_info o where o.district=N'" + dst + "'";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}
        //public DataSet GetManagerList(string mtype)
        //{
        //    DataSet ds = new DataSet();

        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT m.* From " + table_prefix + "managers_info m where m.usertype=@utype";
        //        using (SqlConnection conn = new SqlConnection(connstr))
        //        using (SqlCommand command = new SqlCommand(query, conn))
        //        {
        //            command.Parameters.Add(new SqlParameter("@utype", mtype));
        //            SqlDataAdapter da = new SqlDataAdapter(command);
        //            da.Fill(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}
        //public DataSet GetListgreen(string dst)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT s.*,b.accode,b.acname,b.location,b.psnum,s.selected From " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on s.id=b.streamid where b.district=N'" + dst + "' and b.boothstateid='" + ConfigurationManager.AppSettings["stateid"].ToString() + "'";
        //       SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}
        //public DataSet GetListgreenwithmanual(string dst)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        query = "SELECT s.*,b.acname,b.location,b.psnum,s.selected From " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on s.id=b.streamid where b.district=N'" + dst + "' and b.statusFlag=2 and b.boothstateid='" + ConfigurationManager.AppSettings["stateid"].ToString() + "'";

        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}

        //public DataSet Getlivereport(string district)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //         if (district == "ALL")
        //        {
        //            query = "SELECT b.district,b.acname,b.location,slist.streamname,slist.isLive,slog.day1,slog.day2 FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist slist on slist.schoolid = b.id inner join " + table_prefix + "streamlog slog on slog.streamname = slist.streamname where slist.stateID = '" + ConfigurationManager.AppSettings["stateid"].ToString() + "'";
        //        }
        //        else
        //        {
        //            query = "SELECT b.district,b.acname,b.location,slist.streamname,slist.isLive,slog.day1,slog.day2 FROM " + table_prefix + "booth b inner join " + table_prefix + "streamlist slist on slist.schoolid = b.id inner join " + table_prefix + "streamlog slog on slog.streamname = slist.streamname where b.district='" + district + "' and slist.stateID = '" + ConfigurationManager.AppSettings["stateid"].ToString() + "'";
        //        }
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}

        //public DataSet GetDataList(string strm, int schid)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //          string query = "select s.schoolid,b.district,b.acname,b.location,s.streamname,s.servername,s.status from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.id=s.schoolid where s.IsEnable=1 and s.schoolid='" + schid + "' and s.streamname='" + strm + "' and b.boothstateid='" + ConfigurationManager.AppSettings["stateid"].ToString() + "'";
        //      SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //    }
        //    return ds;
        //}

        //public DataSet GetBoothListDVR()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT Distinct(b.id),b.district,b.acname,b.location,b.isdisplay,STUFF((SELECT ', ' + s.streamname FROM dvrlist s WHERE ( b.streamid = s.id ) FOR XML PATH ('')),1,2,'') as streamnames From " + table_prefix + "booth b,dvrlist where b.id = dvrlist.schoolid and dvrlist.stateID='" + ConfigurationManager.AppSettings["stateid"].ToString() + "'";
        //        SqlCommand command = new SqlCommand(query, conn);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetBoothListDVR()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        
        //public DataSet GetStreamlistDVR()
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        query = "SELECT * from dvrlist where stateID='" + ConfigurationManager.AppSettings["stateid"].ToString() + "'";
        //        SqlCommand command = new SqlCommand(query, conn);

        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GetStreamlistDVR()--> " + ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //    return ds;
        //}
        //public bool ISExist(string streamname)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string tblname = string.Empty;
        //        string query = string.Empty;

        //        if (currentphase != uploadphase)
        //        {
        //            tblname = "p" + uploadphase;
        //            query = "SELECT COUNT(id) from streamlist" + tblname + " where streamname=@streamname and stateID='" + uploadphase + "';";
        //        }
        //        else
        //        {
        //            query = "SELECT COUNT(id) from " + table_prefix + "streamlist where streamname=@streamname and stateID='" + ConfigurationManager.AppSettings["stateid"].ToString() + "';";
        //        }
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@streamname", streamname);
        //        SQLconn.Open();
        //        int result = (int)SQLcommand.ExecuteScalar();
        //        SQLconn.Close();
        //        if (result > 0)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("ISExist()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
        //public bool ISExistDVR(string streamname)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "SELECT COUNT(id) from dvrlist where streamname=@streamname and stateID='" + ConfigurationManager.AppSettings["stateid"].ToString() + "';";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@streamname", streamname);
        //        SQLconn.Open();
        //        int result = (int)SQLcommand.ExecuteScalar();
        //        SQLconn.Close();
        //        if (result > 0)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("ISExistDVR()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
        //public bool InsertStream(string deviceid, string streamname, string server, string stateID)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string tblname = string.Empty;

        //        if (currentphase != uploadphase)
        //        {
        //            tblname = "p" + uploadphase;
        //            query = "INSERT INTO streamlist" + tblname + " (deviceid,streamname,servername,stateID) VALUES ('" + deviceid + "', '" + streamname + "','" + server + "','" + uploadphase + "');";
        //        }
        //        else
        //        {
        //            query = "INSERT INTO " + table_prefix + "streamlist (deviceid,streamname,servername,stateID) VALUES ('" + deviceid + "','" + streamname + "','" + server + "','" + stateID + "');";
        //        }
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLconn.Open();
        //        SQLcommand.ExecuteNonQuery();
        //        SQLconn.Close();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("InsertStream()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
        //public bool InsertStreamDVR(string streamname, string server, string stateID)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "INSERT INTO dvrlist (streamname,servername,stateID) VALUES ('" + streamname + "','" + server + "','" + stateID + "');";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLconn.Open();
        //        SQLcommand.ExecuteNonQuery();
        //        SQLconn.Close();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("InsertStreamDVR()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
        //public bool UpdateSchoolStream(List<string> listToUpdate, int schoolid)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string tblname = string.Empty;
        //        if (currentphase != uploadphase)
        //        {
        //            tblname = "p" + uploadphase;
        //            query = "UPDATE streamlist" + tblname + " SET schoolid=@schoolid WHERE stateID='" + uploadphase + "' and streamname IN  ('{0}');";
        //        }
        //        else
        //        {
        //            query = "UPDATE " + table_prefix + "streamlist SET schoolid=@schoolid WHERE stateID='" + ConfigurationManager.AppSettings["stateid"].ToString() + "' and streamname IN  ('{0}');";
        //        }
        //        String formatted = String.Format(query, String.Join("','", listToUpdate.ToArray()));
        //        SqlCommand comm = new SqlCommand(formatted, SQLconn);
        //        comm.Parameters.AddWithValue("@schoolid", schoolid);
        //        SQLconn.Open();
        //        comm.ExecuteNonQuery();
        //        SQLconn.Close();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("UpdateSchoolStream()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public int ADDoperatorlist(string operatorname, string operatormobile, string operatormobile_alternate,string operatorDesig, string district)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string tblname = string.Empty;
        //        // query = "UPDATE booth SET displayname = @displayname, displaymobile=@displaymobile WHERE id IN ({0});";
        //        query = "insert into " + table_prefix + "operator_info (operatorName,operatorNumber,operatorAltNumber,district,designation) output INSERTED.id values (@operatorName,@operatormobile,@operatorAltNumber,@district, @operatorDesig)";

        //        SqlCommand comm = new SqlCommand(query, SQLconn);

        //        comm.Parameters.AddWithValue("@operatorName", operatorname);
        //        comm.Parameters.AddWithValue("@operatormobile", decimal.Parse(operatormobile == string.Empty ? "0.00" : operatormobile));
        //        comm.Parameters.AddWithValue("@operatorAltNumber", decimal.Parse(operatormobile_alternate == string.Empty ? "0.00" : operatormobile_alternate));
        //        comm.Parameters.AddWithValue("@district", district);
        //        comm.Parameters.AddWithValue("@operatorDesig", operatorDesig);

        //        SQLconn.Open();
        //        int result = (int)comm.ExecuteScalar();

        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("UpdateSchoolStream()--> " + ex.Message);
        //        return 0;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public DataSet operatorexist(string operatorno)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        query = "SELECT * from " + table_prefix + "operator_info where operatornumber=@operatornumber";

        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@operatornumber", operatorno);
        //        SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
        //        DataSet ds = new DataSet();
        //        SQLconn.Open();
        //        adp.Fill(ds);
        //        return ds;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("operatorexist()--> " + ex.Message);
        //        return new DataSet();
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public bool AddUpdateManagers(string email, string mobile, string altmobile, string mtype, int mid)
        //{

        //    try
        //    {
        //        string query = string.Empty;
        //        if (mid == 0)
        //        {
        //            query = "UPDATE " + table_prefix + "managers_info SET mobile=@mobile, mobile_alt = @altmobile WHERE email=@email and usertype=@utype IF (@@ROWCOUNT = 0) Insert Into " + table_prefix + "managers_info Values(@email,@mobile,@altmobile,@utype)";
        //        }
        //        else
        //        {
        //            query = "UPDATE " + table_prefix + "managers_info SET mobile=@mobile, mobile_alt = @altmobile ,email=@email , usertype=@utype where id=@mid";
        //        }

        //        using (SqlConnection SQLconn = new SqlConnection(connstr))
        //        using (SqlCommand SQLcommand = new SqlCommand(query, SQLconn))
        //        {
        //            SQLcommand.Parameters.AddWithValue("@email", email);
        //            SQLcommand.Parameters.AddWithValue("@utype", mtype);
        //            SQLcommand.Parameters.AddWithValue("@mobile", mobile);
        //            SQLcommand.Parameters.AddWithValue("@altmobile", altmobile);
        //            if (mid > 0)
        //                SQLcommand.Parameters.AddWithValue("@mid", mid);
        //            SQLconn.Open();
        //            SQLcommand.ExecuteNonQuery();
        //            SQLconn.Close();
        //        }
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("AddUpdateManagers()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {

        //    }
        //}

        //public bool UpdateSchoolStreamDVR(List<string> listToUpdate, int schoolid)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "UPDATE dvrlist SET schoolid=@schoolid WHERE stateID='" + ConfigurationManager.AppSettings["stateid"].ToString() + "' and streamname IN  ('{0}');";
        //        String formatted = String.Format(query, String.Join("','", listToUpdate.ToArray()));
        //        SqlCommand comm = new SqlCommand(formatted, SQLconn);
        //        comm.Parameters.AddWithValue("@schoolid", schoolid);
        //        SQLconn.Open();
        //        comm.ExecuteNonQuery();
        //        SQLconn.Close();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("UpdateSchoolStreamDVR()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
        //public int GETSchoolIDofStream(string stream)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string tblname = string.Empty;
        //        if (currentphase != uploadphase)
        //        {
        //            tblname = "p" + uploadphase;
        //            query = "SELECT schoolid from streamlist" + tblname + " where streamname=@stream and stateID='" + uploadphase + "';";
        //        }
        //        else
        //        {
        //            query = "SELECT schoolid from " + table_prefix + "streamlist where streamname=@stream and stateID='" + ConfigurationManager.AppSettings["stateid"].ToString() + "';";
        //            //  query = "SELECT s.id from streamlist s inner join booth b ON b.streamid=s.id where s.streamname=@stream and b.boothstateid='" + ConfigurationManager.AppSettings["stateid"].ToString() + "';";
        //        }
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@stream", stream);
        //        SQLconn.Open();
        //        int result = (int)SQLcommand.ExecuteScalar();
        //        SQLconn.Close();
        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GETSchoolIDofStream()--> " + ex.Message);
        //        return -1;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public DataSet GETSchoolIDofStreamwithbooth(string stream)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string tblname = string.Empty;
        //        if (currentphase != uploadphase)
        //        {
        //            tblname = "p" + uploadphase;
        //            query = "SELECT schoolid from streamlist where streamname=@stream and stateID='" + uploadphase + "';";
        //        }
        //        else
        //        {
        //            query = "SELECT * from streamlist s where s.streamname=@stream";
        //        }
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@stream", stream);
        //        SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
        //        DataSet ds = new DataSet();
        //        SQLconn.Open();
        //        adp.Fill(ds);
        //        return ds;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GETSchoolIDofStreamwithbooth()--> " + ex.Message);
        //        return new DataSet();
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        public DataSet GetStreamDetailsByDID(string DID)
        {
            SqlConnection SQLconn = new SqlConnection(connstr);
            try
            {
                SqlCommand SQLcommand = new SqlCommand("GetStreamDetailsByDID", SQLconn);
                SQLcommand.CommandType = CommandType.StoredProcedure;
                SQLcommand.Parameters.AddWithValue("@DID", DID);
                SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
                DataSet ds = new DataSet();
                SQLconn.Open();
                adp.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                Common.Log("GetStreamDetailsByDID()--> " + ex.Message);
                return new DataSet();
            }
            finally
            {
                SQLconn.Close();
            }
        }

        public DataSet GetStreamlist()
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                string tblname = string.Empty;
                if (currentphase != uploadphase)
                {
                    tblname = "p" + uploadphase;
                    query = "SELECT * from streamlist" + tblname + " where stateID='" + uploadphase + "'";
                }
                else
                {
                    query = "SELECT * from " + table_prefix + "streamlist where stateID='" + ConfigurationManager.AppSettings["stateid"].ToString() + "'";
                }
                SqlCommand command = new SqlCommand(query, conn);

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetStreamlist()--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }

        public DataSet getuserlist(string username, string status, string dstsch)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                if (status == "loaduserslist")
                {
                    query = "select * from " + table_prefix + "users where usercode != 'admin' and usercode=@usercode";
                }
                else if (status == "chkuserslist")
                {
                    query = "select id,username from " + table_prefix + "users where username=@username";
                }

                SqlCommand command = new SqlCommand(query, conn);
                if (username != "")
                {
                    command.Parameters.AddWithValue("@username", username);
                }
                else
                {
                    command.Parameters.AddWithValue("@usercode", dstsch);
                }
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("getuserlist() - " + status + "--> " + ex.Message);
            }
            finally
            {

            }
            return ds;
        }

        public bool updateuserlist(int userid, string username, string password, int identifier)
        {
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;

                query = "update " + table_prefix + "users set username=@username,password=@password,identifier=@identifier where id=@id";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);
                command.Parameters.AddWithValue("@identifier", identifier);
                command.Parameters.AddWithValue("@id", userid);

                conn.Open();
                command.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Common.Log("updateuserlist()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return true;
        }

        public bool adduser(string username, string password, string usercode, int stateid, int user_identifier)
        {
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                query = "insert into " + table_prefix + "users (username,password,usercode,isDvr,stateID,identifier) values (@username,@password,@usercode,@isDvr,@stateID,@identifier)";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);
                command.Parameters.AddWithValue("@usercode", usercode);
                command.Parameters.AddWithValue("@isDvr", 0);
                command.Parameters.AddWithValue("@stateID", stateid);
                command.Parameters.AddWithValue("@identifier", user_identifier);

                conn.Open();
                command.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Common.Log("adduser()--> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return true;
        }
        public int addAssemblyIfNotExist(string district, string acname, int st_id)
        {
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                   query = " IF NOT EXISTS (SELECT * FROM " + table_prefix + "district WHERE district=@district and acname=@acnum and stateid=@stateid) " +
                " BEGIN " +
                "     insert into " + table_prefix + "district (district,acname,isenable,stateid) output INSERTED.id values (@district,@acnum,'true',@stateid) " +
                " END  " +
                " ELSE SELECT 0";
                // "IF NOT EXISTS (SELECT * FROM district WHERE district = @district and acname=@acnum)   BEGIN insert into district (district,schoolname,isenable) output INSERTED.id values (@district,@acnum,@isenable) END";
               SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@district", district.ToUpper());
                command.Parameters.AddWithValue("@acnum", acname);
                command.Parameters.AddWithValue("@stateid", st_id);
                // command.Parameters.AddWithValue("@isenable", Boolean.TrueString);
                conn.Open();
                int id = Convert.ToInt32(command.ExecuteScalar());
                return id;

            }
            catch (Exception ex)
            {
                Common.Log("adduser()--> " + ex.Message);
                return 0;
            }
            finally
            {
                conn.Close();
            }

        }
        
        public DataSet GetDistrictList(string user_type, int st_id)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                if (user_type == "admin")
                {
                    query = "SELECT distinct(district), district as SelValue  FROM " + table_prefix + "district where stateid=@stateid ORDER BY District ASC;";
                }
                else
                {
                    if (user_type.Contains("dst_"))
                    {
                        user_type = user_type.Replace("dst_", "");
                    }
                    query = "SELECT distinct(district),district as SelValue  FROM " + table_prefix + "district where district=N'" + user_type + "' and stateid=@stateid ORDER BY District ASC;";
                }
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@stateid", st_id);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
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

        public DataSet GetPCList(string district)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                 query = "SELECT distinct(b.accode),b.accode,b.acname,b.accode SelValue  FROM " + table_prefix + "district b where b.district=@pc and stateid=" + currentphase + " ORDER BY b.accode ASC;";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@pc", district);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetPCList()--> " + ex.Message);
            }
            finally
            {
            }
            return ds;
        }

        public DataSet GetACList(string district, string pcname)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                if (string.IsNullOrEmpty(pcname))
                {
                    query = "SELECT distinct(b.acname),b.acname SelValue FROM " + table_prefix + "district b where b.district=@district and stateid="+currentphase+ " ORDER BY b.acname ASC;";
                }
                else
                {
                    query = "SELECT distinct(b.acname),b.acname SelValue FROM " + table_prefix + "district b where b.district=@district and b.accode=@pc and stateid=" + currentphase + " ORDER BY b.acname ASC;";
                }
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@district", district);
                if (!string.IsNullOrEmpty(pcname))
                {
                    command.Parameters.AddWithValue("@pc", pcname);
                }
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("GetACList()--> " + ex.Message);
            }
            finally
            {
            }
            return ds;
        }
        
        public DataSet LiveCounter(string usertype)
        {
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string result = string.Empty;
                string query = string.Empty;
                query = "select b.district,count(b.streamid) as lastseen from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid = s.id where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=" + currentphase + " and lastseen >= DateAdd(minute,-" + ConfigurationManager.AppSettings["minute"] + ",CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME)) group by b.district";
                DateTime chklastseen = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);
                string chklastseenString = chklastseen.ToString("yyyy-MM-dd HH:mm:ss");
                query = "select MAX(b.district) as district,b.district as DATA,Cast(COUNT(b.acname) as nvarchar(MAX)) as ac, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth,COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce' from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=" + currentphase + " group by district";
                if (usertype.Contains("dst_"))
                {
                    query = "select b.acname,count(b.streamid) as lastseen from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid = s.id where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' and lastseen >= DateAdd(minute,-" + ConfigurationManager.AppSettings["minute"] + ",CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') as DATETIME)) group by b.acname";
                }
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter adp = new SqlDataAdapter(command);
                DataSet ds = new DataSet();
                conn.Open();
                adp.Fill(ds);

                return ds;
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
        public DataSet allcountlive(string usertype)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                //sDate = dDate.ToString("MM/dd/yyyy hh:mm:ss tt");
           //     DateTime utcdate = DateTime.ParseExact(DateTime.Now.ToString("M/dd/yyyy h:mm:ss tt"), "M/dd/yyyy h:mm:ss tt", CultureInfo.InvariantCulture);
        //        var istdate = TimeZoneInfo.ConvertTimeFromUtc(utcdate, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));

                DateTime chklastseendt = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);
                DateTime chklastseendefaultdt = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minutedefault"]) * -1);
                string chklastseen = chklastseendt.ToString("MM/dd/yyyy HH:mm:ss");

                string chklastseendefault = chklastseendefaultdt.ToString("MM/dd/yyyy HH:mm:ss");
                //if (ConfigurationManager.AppSettings["envirnment"].ToString().ToLower() == "live")
                //{
                //     chklastseen = TimeZoneInfo.ConvertTimeFromUtc(DateTime.ParseExact(chklastseendt.ToString("M/dd/yyyy h:mm:ss tt"), "M/dd/yyyy h:mm:ss tt", CultureInfo.InvariantCulture), TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("MM/dd/yyyy HH:mm:ss");

                //     chklastseendefault = TimeZoneInfo.ConvertTimeFromUtc(DateTime.ParseExact(chklastseendefaultdt.ToString("M/dd/yyyy h:mm:ss tt"), "M/dd/yyyy h:mm:ss tt", CultureInfo.InvariantCulture), TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("MM/dd/yyyy HH:mm:ss");
                //}

               


                //DateTime utcdate = DateTime.ParseExact(DateTime.Now.ToString("M/dd/yyyy h:mm:ss tt"), "M/dd/yyyy h:mm:ss tt", CultureInfo.InvariantCulture);
                //var istdate = TimeZoneInfo.ConvertTimeFromUtc(utcdate, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));

                //        string chklastseenString = chklastseen.ToString("yyyy-MM-dd HH:mm:ss");
                /* add "- b.acname" in data */
                //  query = "select MAX(b.district) as district,b.accode+'-'+b.acname as DATA,Cast(COUNT(b.schoolname) as nvarchar(MAX)) as ac,SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode)) as odr, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=" + currentphase + " group by b.accode,schoolname order by len(SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode))),odr";
                query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',MAX(b.district) as district,b.district as DATA,Cast(COUNT(b.acname) as nvarchar(MAX)) as ac, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " group by district";

                if (usertype.Contains("dst_"))
                {
                    /* add "- b.acname" in data */
                    query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',MAX(b.district) as district,b.accode+'-'+b.acname as DATA,Cast(COUNT(b.acname) as nvarchar(MAX)) as ac,SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode)) as odr, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' group by b.accode,b.acname order by len(SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode))),odr";
                    if (usertype.Split('_')[1] == allKeyword + districtname)
                    {
                        query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',MAX(b.district) as district,b.accode+'-'+b.acname as DATA,Cast(COUNT(b.acname) as nvarchar(MAX)) as ac,SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode)) as odr, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " group by b.accode,b.acname order by len(SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode))),odr";
                    }
                }
                if (usertype.Contains("pc_"))
                {
                    query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' and b.accode=N'" + usertype.Split('_')[2] + "' group by b.acname";
                    if (usertype.Split('_')[1] == allKeyword + districtname)
                    {
                        query = "select COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce', MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive',(count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.accode=N'" + usertype.Split('_')[2] + "' group by b.acname";
                    }

                }
                if (usertype.Contains("pc1_"))
                {
                    query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive',(count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.accode=N'" + usertype.Split('_')[2] + "' group by b.acname";
                    if (usertype.Split('_')[1] == allKeyword + districtname)
                    {
                        query = "select COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce', MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.accode=N'" + usertype.Split('_')[2] + "' group by b.acname";
                    }
                }
                if (usertype.Contains("sch1_"))
                {
                    query = "select COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce', MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.accode=N'" + usertype.Split('_')[2] + "' and b.acname=N'" + usertype.Split('_')[3] + "' group by b.acname";
                }
                if (usertype.Contains("sch_"))
                {
                    if (usertype.Split('_')[1] == allKeyword + districtname)
                    {
                        query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive',(count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.accode=N'" + usertype.Split('_')[2] + "' and b.acname=N'" + usertype.Split('_')[3] + "' group by b.acname";

                    }
                    else
                    {
                        query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce', MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive',COUNT(CASE WHEN lastseen < '" + chklastseen + "' then 1 ELSE NULL END) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' and b.accode=N'" + usertype.Split('_')[2] + "' and b.acname=N'" + usertype.Split('_')[3] + "' group by b.acname";

                    }
                }
                if (usertype.Contains("psbooth_"))
                {
                    query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',MAX(b.district) as district,MAX(b.accode) as ac,MAX(b.acname) as ac2,b.location as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' and b.accode=N'" + usertype.Split('_')[2] + "' and b.acname=N'" + usertype.Split('_')[3] + "' and b.psnum=N'" + usertype.Split('_')[4] + "' group by b.location";
                    if (usertype.Split('_')[1] == allKeyword + districtname)
                    {
                        query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',MAX(b.district) as district,MAX(b.accode) as ac,MAX(b.acname) as ac2,b.location as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.accode=N'" + usertype.Split('_')[2] + "' and b.acname=N'" + usertype.Split('_')[3] + "' and b.psnum=N'" + usertype.Split('_')[4] + "' group by b.location";

                    }
                }
                if (usertype == allKeyword + districtname)
                {
                    query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce', b.district as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive',(count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " group by b.district";
                }
                if (usertype.StartsWith("SELDistrict_"))
                {
                    query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',b.district as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' group by b.district";
                }
                if (usertype == "ALL AC Name")
                {
                    query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',MAX(b.district) as district,MAX(b.accode) as pc, b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " group by b.acname";

                }
                if (usertype.StartsWith("ACFROMDISTRICT_"))
                {
                    query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce', MAX(b.district) as district,MAX(b.accode) as pc, b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' group by b.acname";
                    if (usertype.Split('_')[1] == allKeyword + districtname)
                    {
                        query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce', MAX(b.district) as district,MAX(b.accode) as pc, b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " group by b.acname";
                    }


                }
                if (usertype.StartsWith("ALLBOOTH_"))
                {
                    query = "select  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',district,accode,acname,psnum,location,streamname,status,islive from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + "";

                }
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                conn.Open();
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                Common.Log("allcountlive()==>> " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        public DataSet allcountlivenew(string usertype, int UserID, string cameraType = "", int pink = -1)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                DateTime chklastseendt = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);
                DateTime chklastseendefaultdt = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minutedefault"]) * -1);

                string query = string.Empty;
                query = "GetAllLiveCount";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@lastseen", chklastseendt);
                command.Parameters.AddWithValue("@lastseendefault", chklastseendefaultdt);
                command.Parameters.AddWithValue("@UserID", UserID);
                command.Parameters.AddWithValue("@cameratype", cameraType);
                command.Parameters.AddWithValue("@Ispink", pink);
                command.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                ds = FilterDataByAccess(ds, true, false);
            }
            catch (Exception ex)
            {
                Common.Log("allcountlivenew()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        

        public DataSet allcountlive_assembly(string usertype)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string query = string.Empty;
                DateTime chklastseen = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);
                DateTime chklastseendefault = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minutedefault"]) * -1);
                /* add "- b.acname" in data */
                //  query = "select MAX(b.district) as district,b.accode+'-'+b.acname as DATA,Cast(COUNT(b.acname) as nvarchar(MAX)) as ac,SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode)) as odr, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=" + currentphase + " group by b.accode,acname order by len(SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode))),odr";
                query = "select COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',MAX(b.district) as district,b.district as DATA,Cast(COUNT(b.acname) as nvarchar(MAX)) as ac,SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode)) as odr, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " group by district,pc order by len(SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode))),odr";


                if (usertype.Contains("pc_"))
                {
                    query = "select COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce', MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' and b.accode=N'" + usertype.Split('_')[2] + "' group by b.acname";
                    if (usertype.Split('_')[1] == allKeyword + districtname)
                    {
                        query = "select COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',COUNT(CASE WHEN lastseen >= '" + chklastseendefault + "' OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive',(count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[2] + "' group by b.acname";
                    }

                }
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(command);
                conn.Open();
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
        public DataSet allcountlive_assemblynew(string district, int UserID, string cameraType = "", int pink = -1)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                DateTime chklastseendt = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);
                DateTime chklastseendefaultdt = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minutedefault"]) * -1);

                string query = string.Empty;
                query = "GetAllLiveCountDetails";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@lastseen", chklastseendt);
                command.Parameters.AddWithValue("@lastseendefault", chklastseendefaultdt);
                command.Parameters.AddWithValue("@district", district);
                command.Parameters.AddWithValue("@UserID", UserID);
                command.Parameters.AddWithValue("@cameratype", cameraType);
                command.Parameters.AddWithValue("@Ispink", pink);
                command.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
             //   ds = FilterDataByAccess(ds, false, true);
            }
            catch (Exception ex)
            {
                Common.Log("allcountlive_assemblynew()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
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

        public DataSet allcountliveondashboard(int UserID)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                DateTime chklastseendt = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1); 

                string query = string.Empty;
                query = "GetDashbordAllLiveCount";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@lastseen", chklastseendt); 
                command.Parameters.AddWithValue("@UserID", UserID); 
                command.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds); 
            }
            catch (Exception ex)
            {
                Common.Log("allcountlivenew()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }
        public DataSet ExportDashboardStatus(string usertype, int UserID, string cameraType = "", int pink = -1)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                DateTime chklastseendt = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);
                DateTime chklastseendefaultdt = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minutedefault"]) * -1);

                string query = string.Empty;
                query = "GetAllLiveCount_04042023";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@lastseen", chklastseendt);
                command.Parameters.AddWithValue("@lastseendefault", chklastseendefaultdt);
                command.Parameters.AddWithValue("@UserID", UserID);
                command.Parameters.AddWithValue("@cameratype", cameraType);
                command.Parameters.AddWithValue("@Ispink", pink);
                command.CommandType = CommandType.StoredProcedure; 
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds); 
            }
            catch (Exception ex)
            {
                Common.Log("allcountlivenew()--> " + ex.Message);
                throw new ApplicationException(ex.Message, ex);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }


        //public DataSet getBoothNumber(string streamname)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "Select * from " + table_prefix + "streamlist s inner join " + table_prefix + "booth b ON b.streamid=s.id WHERE streamname = @streamname; Select s.id from " + table_prefix + "streamlist s WHERE streamname = @streamname";
        //        SqlCommand command = new SqlCommand(query, SQLconn);
        //        command.Parameters.AddWithValue("@streamname", streamname);
        //        SqlDataAdapter adp = new SqlDataAdapter(command);
        //        DataSet ds = new DataSet();
        //        SQLconn.Open();
        //        adp.Fill(ds);
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

        //public void UpdateStramNameUsingSchoolid(string streamname, int schoolid)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "UPDATE " + table_prefix + "streamlist SET schoolid=" + schoolid + " WHERE streamname = @streamname;";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.Add(new SqlParameter("@streamname", streamname));
        //        SQLconn.Open();
        //        SQLcommand.ExecuteNonQuery();
        //        SQLconn.Close();
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
        //public bool Updateboothdetail(string schdt, int bid, int streamid, string status, int operatorid, string updatedby, string updatedFrom, string IsPink, string outsidebooth, string cameralocationtype, string isARO)
        //{
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string update_data, query;
        //        update_data = "location=N'" + schdt + "',operatorid=@operatorid";

        //        if (status == "updatestreamid")
        //        {
        //            // query = "Update booth set streamid=@streamid,operatorid=@operatorid where id=" + bid;
        //            update_data = "streamid=@streamid,operatorid=@operatorid";
        //        }
        //        if (status == "updateboothwithstream")
        //        {
        //            //  query = "Update booth set location=N'" + schdt + "',streamid=@streamid where id=" + bid;
        //            update_data = "location=N'" + schdt + "',streamid=@streamid";
        //        }
        //        if (status == "update_operatorid")
        //        {
        //            //  query = "Update booth set operatorid=@operatorid where where id=" + bid;
        //            update_data = "operatorid=@operatorid";
        //        }
        //        if (status == "updateboothwithalldata")
        //        {
        //            if (schdt != "")
        //            {
        //                //query = "insert into " + table_prefix + "booth (district,accode,acname,psnum,location,streamid,updatedby,updateddate,updatedFrom,operatorid,boothstateid,longitude,latitude,IsPink,IsOutsideBooth,isdisplay,cameralocationtype,isARO) output INSERTED.id values (@district,@pc,@schoolname,@psnum,@location,@streamid,@updatedby,@updateddate,@updatedFrom,@operatorid,@boothstateid,@longitude,@latitude,@IsPink,@outsidebooth,1, @cameralocationtype, @isARO)";
        //                update_data = "location=N'" + schdt + "',streamid=@streamid,updatedby=@updatedby,updateddate=@updateddate,updatedFrom=@updatedFrom,operatorid=@operatorid,IsPink=@IsPink,IsOutsideBooth=@IsOutsideBooth,cameralocationtype=@cameralocationtype,isARO=@isARO";
        //                // update_data = "location=N'" + schdt + "',streamid=@streamid,operatorid=@operatorid";
        //            }
        //            else
        //            {
        //                update_data = "streamid=@streamid,updatedby=@updatedby,updateddate=@updateddate,updatedFrom=@updatedFrom,operatorid=@operatorid,IsPink=@IsPink,IsOutsideBooth=@IsOutsideBooth,cameralocationtype=@cameralocationtype,isARO=@isARO";
        //            }

        //        }
        //        query = "Update " + table_prefix + "booth set " + update_data + " where id=" + bid;
        //        SqlCommand cmd = new SqlCommand(query, conn);
        //        if (status != "updateboothwithstream")
        //        {
        //            cmd.Parameters.AddWithValue("@operatorid", operatorid);
        //        }
        //        if (status == "updatestreamid")
        //        {
        //            cmd.Parameters.AddWithValue("@streamid", streamid);
        //        }
        //        if (status == "updateboothwithstream")
        //        {
        //            cmd.Parameters.AddWithValue("@streamid", streamid);
        //        }
        //        if (status == "updateboothwithalldata")
        //        {
        //           cmd.Parameters.AddWithValue("@streamid", streamid);
        //            cmd.Parameters.AddWithValue("@updatedby", updatedby);
        //            cmd.Parameters.AddWithValue("@updateddate", DateTime.Now);
        //            cmd.Parameters.AddWithValue("@updatedFrom", updatedFrom);
        //            //cmd.Parameters.AddWithValue("@operatorid", operatorid);
        //            cmd.Parameters.AddWithValue("@IsPink", IsPink);
        //            cmd.Parameters.AddWithValue("@IsOutsideBooth", outsidebooth);
        //            cmd.Parameters.AddWithValue("@cameralocationtype", cameralocationtype);
        //            cmd.Parameters.AddWithValue("@isARO", isARO);
        //        }

        //        conn.Open();
        //        cmd.ExecuteNonQuery();

        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        return false;
        //    }
        //    finally
        //    {
        //        conn.Close();

        //    }
        //}

        //public bool UpdateOperator(string operator_name, string operator_mobile, string operator_alt_mobile,string operatorDesig, int bid, string district)
        //{
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "Update " + table_prefix + "operator_info set operatorname=@operatorname,operatornumber=@operatornumber,operatoraltnumber=@operatoraltnumber,district=@district, Designation=@operatorDesig where id=@id";
        //        SqlCommand cmd = new SqlCommand(query, conn);
        //        cmd.Parameters.AddWithValue("@operatorname", operator_name);
        //        cmd.Parameters.AddWithValue("@operatornumber", decimal.Parse(operator_mobile == string.Empty ? "0.00" : operator_mobile));
        //        cmd.Parameters.AddWithValue("@operatoraltnumber", decimal.Parse(operator_alt_mobile == string.Empty ? "0.00" : operator_alt_mobile));
        //        cmd.Parameters.AddWithValue("@district", district);
        //        cmd.Parameters.AddWithValue("@id", bid);
        //        cmd.Parameters.AddWithValue("@operatorDesig", operatorDesig);
        //        conn.Open();
        //        cmd.ExecuteNonQuery();
        //        conn.Close();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        return false;
        //    }
        //    finally
        //    {
        //        conn.Close();

        //    }
        //}

        //public bool updatestreamgreen(int id, string servername, bool setgreen)
        //{
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        int sFlag = 0; string status = "STOPPED";
        //        if (setgreen)
        //        {
        //            sFlag = 2;
        //            status = "RUNNING";
        //        }
        //        query = "update " + table_prefix + "streamlist set status='" + status + "',lastseen='" + DateTime.Now + "',islive=1,statusFlag=" + sFlag + ",isvod=1,isdownload=@isdownload where id=@id";
        //        SqlCommand command = new SqlCommand(query, conn);
        //        // command.Parameters.AddWithValue("@servername", servername);
        //        command.Parameters.AddWithValue("@isdownload", setgreen);
        //        command.Parameters.AddWithValue("@id", id);
        //        conn.Open();
        //        command.ExecuteNonQuery();

        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("updateuserlist()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }

        //}

        //public bool deletebooth(int id, int streamid)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string tblname = string.Empty;
        //        query = "delete from " + table_prefix + "booth WHERE id=@id";
        //        SqlCommand comm = new SqlCommand(query, SQLconn);
        //        comm.Parameters.AddWithValue("@id", id);
        //        SQLconn.Open();
        //        comm.ExecuteNonQuery();
        //        SQLconn.Close();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("deletebooth()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public bool deleteOperator(int op_id)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string tblname = string.Empty;
        //        query = "delete from " + table_prefix + "operator_info WHERE id=@op_id";
        //        SqlCommand comm = new SqlCommand(query, SQLconn);
        //        comm.Parameters.AddWithValue("@op_id", op_id);
        //        SQLconn.Open();
        //        comm.ExecuteNonQuery();
        //        SQLconn.Close();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("deletebooth()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
        //public bool deletemanager(int m_id)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string tblname = string.Empty;
        //        query = "delete from " + table_prefix + "managers_info WHERE id=@m_id";
        //        SqlCommand comm = new SqlCommand(query, SQLconn);
        //        comm.Parameters.AddWithValue("@m_id", m_id);
        //        SQLconn.Open();
        //        comm.ExecuteNonQuery();
        //        SQLconn.Close();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("deletemanager()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public bool UpdateBoothdisplay(List<int> listToUpdate, int updatebooth_status)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "UPDATE " + table_prefix + "booth SET isdisplay=@isdisplay WHERE id IN ({0});";
        //        String formatted = String.Format(query, String.Join(",", listToUpdate.ToArray()));
        //        SqlCommand comm = new SqlCommand(formatted, SQLconn);
        //        comm.Parameters.AddWithValue("@isdisplay", updatebooth_status);
        //        SQLconn.Open();
        //        comm.ExecuteNonQuery();
        //        SQLconn.Close();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("UpdateBoothdisplay()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
        //public DataSet allcountliveMisReport(string usertype)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        DateTime chklastseen = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["minute"]) * -1);
        //        string chklastseenString = chklastseen.ToString("yyyy-MM-dd HH:mm:ss");
        //        /* add "- b.schoolname" in data */
        //        //  query = "select MAX(b.district) as district,b.accode+'-'+b.schoolname as DATA,Cast(COUNT(b.schoolname) as nvarchar(MAX)) as ac,SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode)) as odr, COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseen + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=" + currentphase + " group by b.accode,schoolname order by len(SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode))),odr";
        //        query = "select MAX(b.district) as district,b.district as DATA,Cast(COUNT(b.acname) as nvarchar(MAX)) as ac, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0  and b.boothstateid=" + currentphase + " group by district";

        //        if (usertype.Contains("dst_"))
        //        {
        //            /* add "- b.schoolname" in data */
        //            query = "select MAX(b.district) as district,b.accode+'-'+b.acname as DATA,Cast(COUNT(b.acname) as nvarchar(MAX)) as ac,SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode)) as odr, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0  and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' group by b.accode,b.acname order by len(SUBSTRING(b.accode, 0, CHARINDEX('-',b.accode))),odr";
        //        }
        //        if (usertype.Contains("pc_"))
        //        {
        //            query = "select MAX(b.district) as district,MAX(b.accode) as ac,b.schoolname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0  and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' and b.accode=N'" + usertype.Split('_')[2] + "' group by b.schoolname";
        //            if (usertype.Split('_')[1] == allKeyword + districtname)
        //            {
        //                query = "select MAX(b.district) as district,MAX(b.accode) as ac,b.schoolname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live',(count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0  and b.boothstateid=" + currentphase + " and b.accode=N'" + usertype.Split('_')[2] + "' group by b.acname";
        //            }

        //        }
        //        if (usertype.Contains("pc1_"))
        //        {
        //            query = "select MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0  and b.boothstateid=" + currentphase + " and b.accode=N'" + usertype.Split('_')[2] + "' group by b.acname";
        //            if (usertype.Split('_')[1] == allKeyword + districtname)
        //            {
        //                query = "select MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0  and b.boothstateid=" + currentphase + " and b.accode=N'" + usertype.Split('_')[2] + "' group by b.acname";
        //            }
        //        }
        //        if (usertype.Contains("sch1_"))
        //        {
        //            query = "select MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0  and b.boothstateid=" + currentphase + " and b.accode=N'" + usertype.Split('_')[2] + "' and b.acname=N'" + usertype.Split('_')[3] + "' group by b.acname";
        //        }
        //        if (usertype.Contains("sch_"))
        //        {
        //            if (usertype.Split('_')[1] == allKeyword + districtname)
        //            {
        //                query = "select MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0  and b.boothstateid=" + currentphase + " and b.accode=N'" + usertype.Split('_')[2] + "' and b.acname=N'" + usertype.Split('_')[3] + "' group by b.acname";

        //            }
        //            else
        //            {
        //                query = "select MAX(b.district) as district,MAX(b.accode) as ac,b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' and b.accode=N'" + usertype.Split('_')[2] + "' and b.acname=N'" + usertype.Split('_')[3] + "' group by b.acname";

        //            }
        //        }
        //        if (usertype.Contains("psbooth_"))
        //        {
        //            query = "select MAX(b.district) as district,MAX(b.accode) as ac,MAX(b.acname) as ac2,b.location as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' and b.accode=N'" + usertype.Split('_')[2] + "' and b.acname=N'" + usertype.Split('_')[3] + "' and b.psnum=N'" + usertype.Split('_')[4] + "' group by b.location";
        //            if (usertype.Split('_')[1] == allKeyword + districtname)
        //            {
        //                query = "select MAX(b.district) as district,MAX(b.accode) as ac,MAX(b.acname) as ac2,b.location as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.accode=N'" + usertype.Split('_')[2] + "' and b.acname=N'" + usertype.Split('_')[3] + "' and b.psnum=N'" + usertype.Split('_')[4] + "' group by b.location";

        //            }
        //        }
        //        if (usertype == allKeyword + districtname)
        //        {
        //            query = "select b.district as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " group by b.district";
        //        }
        //        if (usertype.StartsWith("SELDistrict_"))
        //        {
        //            query = "select b.district as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' group by b.district";
        //        }
        //        if (usertype == "ALL AC Name")
        //        {
        //            query = "select MAX(b.district) as district,MAX(b.accode) as pc, b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " group by b.acname";

        //        }
        //        if (usertype.StartsWith("ACFROMDISTRICT_"))
        //        {
        //            query = "select MAX(b.district) as district,MAX(b.accode) as pc, b.acname as DATA, COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END) as 'Live', (count(DISTINCT b.id)-COUNT(CASE WHEN lastseen >= '" + chklastseenString + "' OR statusFlag=2 then 1 ELSE NULL END)) as 'stop', count(DISTINCT b.id) as TotalBooth from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' group by b.acname";

        //        }
        //        if (usertype.StartsWith("ALLBOOTH_"))
        //        {
        //            query = "select district,accode,acname,psnum,location,streamname,status,islive from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and ISNULL(b.isdelete,'')=0 and b.boothstateid=" + currentphase + "";

        //        }
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        conn.Open();
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}


        //public DataSet districtcountlive(string usertype)
        //{
        //    DataSet ds = new DataSet();
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //        query = "select b.district as DATA, COUNT(CASE s.status WHEN 'RUNNING' then 1 ELSE NULL END) as Live, count(DISTINCT b.id) as TotalBooth, COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce' from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=" + currentphase + " group by b.district";
        //        if (usertype.Contains("dst_"))
        //        {
        //            query = "select b.acname as DATA, COUNT(CASE s.status WHEN 'RUNNING' then 1 ELSE NULL END) as Live, count(DISTINCT b.id) as TotalBooth, COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce' from " + table_prefix + "booth b inner join " + table_prefix + "streamlist s on b.streamid=s.id where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=" + currentphase + " and b.district=N'" + usertype.Split('_')[1] + "' group by b.acname";
        //        }
        //        SqlCommand command = new SqlCommand(query, conn);
        //        SqlDataAdapter da = new SqlDataAdapter(command);
        //        conn.Open();
        //        da.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return ds;
        //}

        //public int addboothlocation(string district, string pc, string acname, string psnum, string location, int streamid, string updatedby, string updatedFrom, int operatorid, string longitude,string latitude, string IsPink, string outsidebooth, string cameralocationtype, string isARO)
        //{
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        int acnum = 0;
        //              query = "insert into " + table_prefix + "booth (district,accode,acname,psnum,location,streamid,updatedby,updateddate,updatedFrom,operatorid,boothstateid,longitude,latitude,IsPink,IsOutsideBooth,isdisplay,cameralocationtype,isARO) output INSERTED.id values (@district,@pc,@schoolname,@psnum,@location,@streamid,@updatedby,@updateddate,@updatedFrom,@operatorid,@boothstateid,@longitude,@latitude,@IsPink,@outsidebooth,1, @cameralocationtype, @isARO)";
        //              //if (acname.Contains("-"))
        //              //{
        //              //    acnum = Convert.ToInt32(acname.Split('-')[0]);
        //              //}
        //        SqlCommand command = new SqlCommand(query, conn);
        //        command.Parameters.AddWithValue("@district", district);
        //        command.Parameters.AddWithValue("@pc", pc);
        //        command.Parameters.AddWithValue("@schoolname", acname);
        //        command.Parameters.AddWithValue("@location", location);
        //    //    command.Parameters.AddWithValue("@acnum", acnum);
        //        command.Parameters.AddWithValue("@psnum", psnum);
        //        command.Parameters.AddWithValue("@streamid", streamid);
        //        command.Parameters.AddWithValue("@updatedby", updatedby);
        //        command.Parameters.AddWithValue("@updateddate", DateTime.Now);
        //        command.Parameters.AddWithValue("@updatedFrom", updatedFrom);
        //        command.Parameters.AddWithValue("@operatorid", operatorid);
        //        command.Parameters.AddWithValue("@boothstateid", currentphase);
        //        command.Parameters.AddWithValue("@longitude", longitude);
        //        command.Parameters.AddWithValue("@latitude", latitude);
        //        command.Parameters.AddWithValue("@IsPink", IsPink);
        //        command.Parameters.AddWithValue("@outsidebooth", outsidebooth);
        //        command.Parameters.AddWithValue("@cameralocationtype", cameralocationtype);
        //        command.Parameters.AddWithValue("@isARO", isARO);
        //        conn.Open();
        //        int id = Convert.ToInt32(command.ExecuteScalar());
        //        return id;

        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("adduser()--> " + ex.Message);
        //        return 0;
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }

        //}
        //public DataSet boothexist(string district, string pc, string acname, string psnum, string streamname)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //       string query = "SELECT * from " + table_prefix + "booth where district=N'" + district + "' and accode=N'" + pc + "' and acname=N'" + acname + "' and psnum=@psnum;select * from " + table_prefix + "streamlist where streamname=@streamname";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@psnum", psnum);
        //        SQLcommand.Parameters.AddWithValue("@streamname", streamname);
        //        SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
        //        DataSet ds = new DataSet();
        //        SQLconn.Open();
        //        adp.Fill(ds);
        //        return ds;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("IsSchoolExist()--> " + ex.Message);
        //        return new DataSet();
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public DataSet GETSchoolIDofStreamwithbooth()
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "CreateNewFakeStreamName";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
        //        DataSet ds = new DataSet();
        //        SQLconn.Open();
        //        adp.Fill(ds);
        //        return ds;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GETSchoolIDofStreamwithbooth()--> " + ex.Message);
        //        return new DataSet();
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
        //public bool UpdateboothdetailFAKE(int bid, int streamid)
        //{
        //    SqlConnection conn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "Update " + table_prefix + "booth set streamid=@streamid where id=" + bid;
        //        SqlCommand cmd = new SqlCommand(query, conn);

        //        cmd.Parameters.AddWithValue("@streamid", streamid);

        //        conn.Open();
        //        cmd.ExecuteNonQuery();

        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        return false;
        //    }
        //    finally
        //    {
        //        conn.Close();

        //    }
        //}
        //public int GETSchoolIDofStreamDVR(string stream)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = "SELECT schoolid from dvrlist where streamname=@stream and stateID='" + ConfigurationManager.AppSettings["stateid"].ToString() + "';";
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@stream", stream);
        //        SQLconn.Open();
        //        int result = (int)SQLcommand.ExecuteScalar();
        //        SQLconn.Close();
        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("GETSchoolIDofStreamDVR()--> " + ex.Message);
        //        return -1;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
        //public int InsertSchool(string strdistrict, string schoolname, string psnum, string location, int streamid, string username, string latitude, string longitude, string opt_name, string opt_num)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;
        //        string tblname = string.Empty;
        //        if (currentphase != uploadphase)
        //        {
        //            tblname = "p" + uploadphase;
        //             query = "INSERT INTO booth" + tblname + " (district,acname,location) output INSERTED.id VALUES (@strdistrict,@schoolname,@location);";
        //        }
        //        else
        //        {
        //            query = "INSERT INTO " + table_prefix + "booth (district,acname,location,PSNum,streamid,updatedby,updateddate,updatedfrom,latitude,longitude) output INSERTED.id VALUES (@strdistrict,@schoolname,@location,@PSNum,@streamid,@updatedby,@updateddate,@updatedfrom,@latitude,@longitude);";
        //        }
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@strdistrict", strdistrict);
        //        SQLcommand.Parameters.AddWithValue("@schoolname", schoolname);
        //        SQLcommand.Parameters.AddWithValue("@location", location);
        //        SQLcommand.Parameters.AddWithValue("@PSNum", psnum);
        //        SQLcommand.Parameters.AddWithValue("@streamid", streamid);


        //        SQLcommand.Parameters.AddWithValue("@updatedby", username);
        //        SQLcommand.Parameters.AddWithValue("@updateddate", DateTime.Now);
        //        SQLcommand.Parameters.AddWithValue("@updatedfrom", "Excel");
        //        SQLcommand.Parameters.AddWithValue("@latitude", decimal.Parse(latitude == string.Empty ? "0.00" : latitude));
        //        SQLcommand.Parameters.AddWithValue("@longitude", decimal.Parse(longitude == string.Empty ? "0.00" : longitude));

        //        SQLconn.Open();
        //        int id = Convert.ToInt32(SQLcommand.ExecuteScalar());
        //        SQLconn.Close();
        //        return id;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("InsertSchool()--> " + ex.Message);
        //        return -1;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public int IsSchoolExist(string strdistrict, string strpc, string schoolname, string psno)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string tblname = string.Empty;
        //        string query = string.Empty;

        //        if (currentphase != uploadphase)
        //        {
        //            tblname = "p" + uploadphase;
        //              query = "SELECT id from " + table_prefix + "booth" + tblname + " where district=@district and accode=@pc and acname=@schoolname and location=@location";
        //        }
        //        else
        //        {
        //            query = "SELECT id from " + table_prefix + "booth where district=@district and accode=@pc and acname=@schoolname and psnum=@psnum";
        //     }
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@district", strdistrict);
        //        SQLcommand.Parameters.AddWithValue("@pc", strpc);
        //        SQLcommand.Parameters.AddWithValue("@schoolname", schoolname);
        //        SQLcommand.Parameters.AddWithValue("@psnum", psno);
        //        SQLconn.Open();
        //        int result = Convert.ToInt32(SQLcommand.ExecuteScalar());
        //        SQLconn.Close();
        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("IsSchoolExist()--> " + ex.Message);
        //        return -1;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public int IsStreamIDExists(int streamid)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string tblname = string.Empty;
        //        string query = string.Empty;

        //        query = "SELECT id from " + table_prefix + "booth" + tblname + " where boothstateid=@boothstateid and streamid=@streamid";

        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@boothstateid", currentphase);
        //        SQLcommand.Parameters.AddWithValue("@streamid", streamid);
        //        SQLconn.Open();
        //        int result = Convert.ToInt32(SQLcommand.ExecuteScalar());
        //        SQLconn.Close();
        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("IsStreamIDExists()--> " + ex.Message);
        //        return -1;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public bool isExistStreaminBooth(string streamName)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string tblname = string.Empty;
        //        string query = string.Empty;

        //        query = "Select COUNT(b.id) from booth b inner join streamlist s on b.streamid=s.id where deviceid=@streamName";

        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@streamName", streamName);
        //        SQLconn.Open();
        //        int result = Convert.ToInt32(SQLcommand.ExecuteScalar());
        //        SQLconn.Close();
        //        if(result>0)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("IsStreamIDExists()--> " + ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public int IsStreamNameExists(string streamname)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string tblname = string.Empty;
        //        string query = string.Empty;

        //        query = "SELECT id from " + table_prefix + "booth b" + tblname + " inner join streamlist sl on sl.streamid = b.streamid where b.boothstateid=@boothstateid and sl.streamname=@streamname";

        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@boothstateid", currentphase);
        //        SQLcommand.Parameters.AddWithValue("@streamname", streamname);
        //        SQLconn.Open();
        //        int result = Convert.ToInt32(SQLcommand.ExecuteScalar());
        //        SQLconn.Close();
        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("IsStreamNameExists()--> " + ex.Message);
        //        return -1;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}

        //public int IsSchoolExist2(string district, string acname, string psnum)
        //{
        //    SqlConnection SQLconn = new SqlConnection(connstr);
        //    try
        //    {
        //        string query = string.Empty;

        //          query = "SELECT * from " + table_prefix + "booth b where district=N'" + district + "' and acname=N'" + acname + "' and psnum=@psnum";
        //       if (string.IsNullOrEmpty(acname))
        //        {
        //            query = "SELECT * from " + table_prefix + "booth b where district=N'" + district + "' and psnum=@psnum";
        //        }
        //        SqlCommand SQLcommand = new SqlCommand(query, SQLconn);
        //        SQLcommand.Parameters.AddWithValue("@psnum", psnum);
        //        SqlDataAdapter adp = new SqlDataAdapter(SQLcommand);
        //        DataSet ds = new DataSet();
        //        SQLconn.Open();
        //        int result = Convert.ToInt32(SQLcommand.ExecuteScalar());
        //        adp.Fill(ds);


        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        Common.Log("IsSchoolExist()--> " + ex.Message);
        //        return 0;
        //    }
        //    finally
        //    {
        //        SQLconn.Close();
        //    }
        //}
    }
}
