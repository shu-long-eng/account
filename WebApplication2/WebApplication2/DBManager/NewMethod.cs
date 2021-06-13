using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace journal.DBManager
{
    public class NewMethod
    {
        static string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["ContextModel1"].ToString();

        public class Income
        {
            public int moneylistIn { get; set; }
            
        }

        public class ex
        {
            public int moneylistOut { get; set; }
        }

        public class Balance
        {
            public int BalanceList { get; set; }
        }




        public static DataTable SaveData()
        {
            string querystr = @"SELECT * FROM [Assets] WHERE IsDelete = 'False';";
            using(SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand command = new SqlCommand(querystr, con);
                try
                {
                    con.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    DataTable dt = new DataTable();

                    dt.Load(reader);

                    con.Close();

                    return dt;
                }catch(Exception e)
                {
                    HttpContext.Current.Response.Write(e);

                    return null;
                }
            }

        }

        

        public static DataSet OutputCashMonth2(int year)
        {
        string querystring = @"SELECT *
        FROM (SELECT YEAR([CreateTime])[Year], 
        DatePart(MONTH, [CreateTime])[Month], 
        SUM(Money) [Money],
	    IncomeAndExpenditure
        FROM Assets
        WHERE IsDelete = 'False'
        GROUP BY YEAR([CreateTime]), 
        DatePart(MONTH, [CreateTime]),IncomeAndExpenditure) AS 
	    MontlySalesData where MontlySalesData.IncomeAndExpenditure = '收入' and [Year] = @year order by [Month];
        SELECT *
        FROM (SELECT YEAR([CreateTime])[Year], 
        DatePart(MONTH, [CreateTime])[Month], 
        SUM(Money) [Money],
	    IncomeAndExpenditure
        FROM Assets
        WHERE IsDelete = 'False'
        GROUP BY YEAR([CreateTime]), 
        DatePart(MONTH, [CreateTime]),IncomeAndExpenditure) AS 
	    MontlySalesData where MontlySalesData.IncomeAndExpenditure = '支出' and [Year] = @year order by [Month];
        select table1.month,table1.time,Assets.Total,table1.Year from
        (select MONTH(CreateTime) as [month],MAX(CreateTime) as [time],YEAR(CreateTime) as [Year] from Assets group by MONTH(CreateTime),YEAR(CreateTime)) 
        as table1 left join Assets on table1.[time] = Assets.CreateTime where table1.Year = @year;
        ";

            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand command = new SqlCommand(querystring, con);
                command.Parameters.AddWithValue("@year", year);
                

                try
                {
                    con.Open();
                    SqlDataAdapter Dap = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    Dap.Fill(ds);
                    con.Close();

                    return ds;
                }
                catch (Exception e)
                {
                    HttpContext.Current.Response.Write(e);
                    return null;
                }
            }

        }

        public static List<Income> incomelist(DataSet ds,int index)
        {
            
            DataTable dt = ds.Tables[index];
            List<Income> incomelist = new List<Income>();
            if (dt.Rows.Count > 0)
            {
                for (var i = 1; i <= 12; i++)
                {
                    bool needadd = true;

                    for (var j = 0; j < dt.Rows.Count; j++)
                    {

                        if (Convert.ToInt32(dt.Rows[j]["Month"]) == i)
                        {
                            needadd = false;
                            incomelist.Add(new Income { moneylistIn = Convert.ToInt32(dt.Rows[j]["Money"]) });
                            break;
                        }


                    }
                    if (needadd)
                        incomelist.Add(new Income { moneylistIn = 0 });
                }

            }
            else
            {
                for (var i = 1; i <= 12; i++)
                {
                    incomelist.Add(new Income { moneylistIn = 0 });
                }
            }

           
            return incomelist;
        }


        public static List<ex> exlist(DataSet ds, int index)
        {
            
            DataTable dt = ds.Tables[index];
            List<ex> exlist = new List<ex>();
            if (dt.Rows.Count > 0)
            {
                for (var i = 1; i <= 12; i++)
                {
                    bool needadd = true;

                    for (var j = 0; j < dt.Rows.Count; j++)
                    {

                        if (Convert.ToInt32(dt.Rows[j]["Month"]) == i)
                        {
                            needadd = false;
                            exlist.Add(new ex { moneylistOut = Convert.ToInt32(dt.Rows[j]["Money"]) });
                            break;
                        }


                    }
                    if (needadd)
                        exlist.Add(new ex { moneylistOut = 0 });
                }

            }
            else
            {
                for (var i = 1; i <= 12; i++)
                {
                    exlist.Add(new ex { moneylistOut = 0 });
                }
            }


            return exlist;
        }


        public static List<Balance> OutputBalance(DataSet ds, int index)
        {

            DataTable dt = ds.Tables[index];
            List<Balance> list = new List<Balance>();
            if (dt.Rows.Count > 0)
            {
                for (var i = 1; i <= 12; i++)
                {
                    bool needadd = true;

                    for (var j = 0; j < dt.Rows.Count; j++)
                    {

                        if (Convert.ToInt32(dt.Rows[j]["Month"]) == i)
                        {
                            needadd = false;
                            list.Add(new Balance { BalanceList = Convert.ToInt32(dt.Rows[j]["Total"]) });
                            break;
                        }


                    }
                    if (needadd)
                        list.Add(new Balance { BalanceList = 0 });
                }

            }
            else
            {
                for (var i = 1; i <= 12; i++)
                {
                    list.Add(new Balance { BalanceList = 0 });
                }
            }


            return list;
        }
    }
}