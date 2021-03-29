using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication2
{
    public class DB
    {
        static string connectionstring = "Data Source=localhost\\SQLExpress;Initial Catalog=財經系統;Integrated Security=true";
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
        public static DataTable showTotalDB()
        {
            string querystring = @"SELECT  * from Assets ORDER BY ID DESC;";

            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand command = new SqlCommand(querystring, con);

                try
                {
                    con.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    DataTable dt = new DataTable();

                    dt.Load(reader);

                    reader.Close();

                    return dt;
                }
                catch (Exception ex)
                {
                    HttpContext.Current.Response.Write(ex);

                    return null;
                }
            }

        }
        public static void insertDB(string date, string sub, string usefor, int money, string outIn)
        {
            string queryTotalMoney = @"select top 1 [餘額] from [Assets] order by [ID] desc ;";

            string querystr = @"insert into Assets (日期,科目,摘要,金額,[收/支],餘額)
                        values (@date,@sub,@usefor,@money,@outIn,@total);";
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand command = new SqlCommand(querystr, con);
                SqlCommand commandMoney = new SqlCommand(queryTotalMoney, con);

                try
                {
                    con.Open();
                    SqlDataReader reader = commandMoney.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(reader);

                    int? total = dt.Rows[0]["餘額"] as int?;

                    if (outIn == "收入")
                    {
                        total = total + money;
                    }
                    else
                    {
                        total = total - money;
                    }
                    command.Parameters.AddWithValue("@date", date);
                    command.Parameters.AddWithValue("@sub",sub);
                    command.Parameters.AddWithValue("@usefor",usefor);
                    command.Parameters.AddWithValue("@money",money);
                    command.Parameters.AddWithValue("@outIn",outIn);
                    command.Parameters.AddWithValue("@total",total);
                    
                    command.ExecuteNonQuery();
                }
                catch(Exception e)
                {
                    HttpContext.Current.Response.Write(e);
                }





            }
        }
        public static void deleteDB(string id)
        {
            string querystr = @"delete Assets where ID=@ID;";

            using(SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand command = new SqlCommand(querystr, con);
                command.Parameters.AddWithValue("@ID", id);

                try
                {
                    con.Open();

                    command.ExecuteNonQuery();

                    con.Close();
                }catch(Exception e)
                {
                    HttpContext.Current.Response.Write(e);
                }
            }
        }
    }
}