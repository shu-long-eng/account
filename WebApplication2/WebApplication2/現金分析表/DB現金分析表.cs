using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static WebApplication2.現金分析表.月份金額;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication2.現金分析表
{
    public class DB現金分析表
    {
        const string connectionstring = "Data Source=localhost\\SQLExpress;Initial Catalog=財經系統;Integrated Security=true";
        const int month = 12;
       public static List<monthMoney> monthTotalOutIn(int year,string outIn) //一個儲存每月收入/支出的方法
        {

            using(SqlConnection con = new SqlConnection(connectionstring))
            {
                
                try
                {
                    con.Open();

                    List<monthMoney> monthMoney = new List<monthMoney>();

                    for(var i = 1;i<= month; i++)
                    {
                        string mon;
                        if (i < 10)//如果月份小於10在數字前面加一個"-0"，在最後加入"%"代表SQL的模糊查詢語法  (資料庫存入的格式為yyyy-MM-dd)
                        {
                            mon = "-0" + i.ToString()+"%";
                        }
                        else
                        {
                            mon = "-"+i.ToString() + "%"; //大於零在數字前面加一個"-"，在最後加入"%"代表SQL的模糊查詢語法
                        }
                        string querystring = @"SELECT  SUM(Money) FROM Assets where IncomeAndExpenditure =@outIn and [date] like @date;";
                        SqlCommand command = new SqlCommand(querystring, con);
                        command.Parameters.AddWithValue("@date",year + mon);
                        command.Parameters.AddWithValue("@outIn", outIn);
                        int? total = 0;

                        total = command.ExecuteScalar() as int?; //ExecuteScalar()輸出一筆資料


                        if (total != null) { //不等於null就存入數字
                        monthMoney.Add(new monthMoney() {
                            monthInOut = total
                        });
                        }
                        else
                        {
                            monthMoney.Add(new monthMoney()//等於null就存入0
                            {
                                monthInOut = 0
                            });
                        }
                    }
                    return monthMoney;
                }
                catch(Exception e)
                {
                    throw;
                }
            }
        }
       public static List<monthBalance> monthBalance(int year)
        {
            //string querystring = @"SELECT TOP (1) [total] FROM [Assets] where [date] like @date ORDER BY [Date]DESC,ID DESC;";

            using(SqlConnection con = new SqlConnection(connectionstring))
            {
                try
                {
                    con.Open();
                    List<monthBalance> monthBalances = new List<monthBalance>();

                    for(int i = 1; i <= month; i++)
                    {
                        string mon;
                        if (i < 10)//如果月份小於10在數字前面加一個"-0"，在最後加入"%"代表SQL的模糊查詢語法  (資料庫存入的格式為yyyy-MM-dd)
                        {
                            mon = "-0" + i.ToString() + "%";
                        }
                        else
                        {
                            mon = "-" + i.ToString() + "%"; //大於零在數字前面加一個"-"，在最後加入"%"代表SQL的模糊查詢語法
                        }
                        string querystring = @"SELECT TOP (1) [total] FROM [Assets] where [date] like @date ORDER BY [Date]DESC,ID DESC;";

                        string date = year + mon;

                        SqlCommand command = new SqlCommand(querystring, con);

                        command.Parameters.AddWithValue("@date", date);

                        int? balance = 0;

                        balance = command.ExecuteScalar() as int?;

                        if(balance != null)
                        {
                            monthBalances.Add(new monthBalance() { 
                                balance = balance
                            });
                        }
                        else
                        {
                            monthBalances.Add(new monthBalance()
                            {
                                balance = 0
                            });
                        }

                    }
                    return monthBalances;
                }
                catch (Exception e)
                {
                    throw;
                }
            }
        }
       public static DataTable showSub()
        {
            string querystring = @"select [SubList] from [SubList];";

            using(SqlConnection con = new SqlConnection(connectionstring))
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
                } catch (Exception e)
                {
                    throw;
                }
        }
    }
}