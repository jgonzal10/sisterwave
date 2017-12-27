using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace sisterwave.Models
{
    public class ConnectionProvider
    {

        public SqlConnection myConnection2 = new SqlConnection();


        public ConnectionProvider()
        {
            
            this.myConnection2.ConnectionString = @"Data Source=MAQ7;Initial Catalog=sisterwave;Integrated Security=False;User Id=sa;Password=12345678;";

        }
    }
}