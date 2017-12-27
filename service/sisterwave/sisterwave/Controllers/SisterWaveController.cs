using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using System.Data;
using System.Data.SqlClient;
using sisterwave.Models;

namespace sisterwave.Controllers
{
    public class SisterWaveController : ApiController
    {
        ConnectionProvider connectp = new ConnectionProvider();

        public SisterWaveController() { }




        [System.Web.Http.Route("api/SisterWave/registerUser")]
        [System.Web.Http.HttpGet]
        [System.Web.Http.ActionName("registerUser")]
        public DataTable registerUser(string username, string surname, string useremail, string nickname, string password)
        {
            SqlCommand cmd = new SqlCommand();
            System.Data.DataSet ds = new System.Data.DataSet();

            try
            {
                connectp.myConnection2.Open();

                System.Data.SqlClient.SqlParameter wParam1 = new System.Data.SqlClient.SqlParameter("@username", System.Data.SqlDbType.VarChar, 50);

                wParam1.Value = username;
                cmd.Parameters.Add(wParam1);

                System.Data.SqlClient.SqlParameter wParam2 = new System.Data.SqlClient.SqlParameter("@surname", System.Data.SqlDbType.VarChar, 50);
                wParam2.Value = surname;
                cmd.Parameters.Add(wParam2);

                System.Data.SqlClient.SqlParameter wParam3 = new System.Data.SqlClient.SqlParameter("@useremail", System.Data.SqlDbType.VarChar, 50);
                wParam3.Value = useremail;
                cmd.Parameters.Add(wParam3);

                System.Data.SqlClient.SqlParameter wParam4 = new System.Data.SqlClient.SqlParameter("@nickname", System.Data.SqlDbType.VarChar, 50);
                wParam4.Value = nickname;
                cmd.Parameters.Add(wParam4);

                System.Data.SqlClient.SqlParameter wParam5 = new System.Data.SqlClient.SqlParameter("@password", System.Data.SqlDbType.VarChar, 50);
                wParam5.Value = password;
                cmd.Parameters.Add(wParam5);

                
                cmd.Connection = connectp.myConnection2;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "spRegisterUser";
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                da.Fill(ds, "Table");
            }
            finally
            {
                connectp.myConnection2.Close();
            }

            DataTableCollection dc = ds.Tables;
            DataTable dTable = dc[0];
            return dTable;
        }
        [Route("api/SisterWave/test")]
        [HttpGet]
        [ActionName("test")]
        public string test()
        {
            String a = "test";
            return a;
        }


        [Route("api/SisterWave/changePassword")]
        [HttpGet]
        [ActionName("changePassword")]
        public string changePassword(int userId, string password)
        {
            SqlCommand cmd = new SqlCommand();
            System.Data.DataSet ds = new System.Data.DataSet();

            try
            {
                connectp.myConnection2.Open();

                System.Data.SqlClient.SqlParameter wParam1 = new System.Data.SqlClient.SqlParameter("@userId", System.Data.SqlDbType.Int);
                wParam1.Value = userId;
                cmd.Parameters.Add(wParam1);

                System.Data.SqlClient.SqlParameter wParam2 = new System.Data.SqlClient.SqlParameter("@password", System.Data.SqlDbType.VarChar, 50);

                wParam2.Value = password;

                cmd.Parameters.Add(wParam2);




                cmd.Connection = connectp.myConnection2;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "spChangePassword";
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            finally
            {
                connectp.myConnection2.Close();
            }
            return "ok";
        }
    }
}