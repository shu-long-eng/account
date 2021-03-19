using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication2
{
    public class accountDB
    {
        static string connectionstring = "Data Source=localhost\\SQLExpress;Initial Catalog=財經系統; Integrated Security=true";
        public static Boolean confirmAcc(string account)
        {
            string querystr = $@"select Account from [User] where Account = @account;";

            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand command = new SqlCommand(querystr, con);

                command.Parameters.AddWithValue("@account", account);

                try
                {
                    con.Open();

                    SqlDataReader reader =  command.ExecuteReader();

                    if (!reader.Read())
                    {
                        reader.Close();
                        return true;
                    }
                    else
                    {
                        reader.Close();
                        return false;
                    }

          
                }
                catch (Exception e)
                {
                    HttpContext.Current.Response.Write(e);

                    return true;
                }
            }
        }
        public static Boolean confirmPw(string pw)
        {
            string querystr = $@"select password from [User] where password = @pw;";

            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand command = new SqlCommand(querystr, con);

                command.Parameters.AddWithValue("@pw", pw);

                try
                {
                    con.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    if (!reader.Read())
                    {
                        reader.Close();
                        return true;
                    }
                    else
                    {
                        reader.Close();
                        return false;
                    }


                }
                catch (Exception e)
                {
                    HttpContext.Current.Response.Write(e);

                    return true;
                }
            }
        }
    }
}