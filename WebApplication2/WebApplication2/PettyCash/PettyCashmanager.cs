using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WebApplication2.PettyCash;
using System.Web.UI.WebControls;

namespace WebApplication2.PettyCash
{
    public class PettyCashmanager : DBBase
    {
        public static string _ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ContextModel1"].ConnectionString;

        //搜尋跟顯示Table資料
        public List<PettyCashmodel> ViewAllPettyCash(
            string DDclass, string keyword, out int totalSize, int currentSize = 1, int pageSize = 8)

        {
            //----- Process filter conditions -----
            List<string> conditions = new List<string>();
            if (!string.IsNullOrEmpty(DDclass) && !string.IsNullOrEmpty(keyword))
                conditions.Add($" {DDclass} LIKE '%' + @keyword + '%'");

            string filterConditions =
                (conditions.Count > 0)
                    ? (" WHERE " + string.Join(" AND ", conditions))
                    : string.Empty;
            //----- Process filter conditions -----

            string Query =
                $@"
                    SELECT TOP {8} * FROM
                    (
                    SELECT *, ROW_NUMBER() OVER(ORDER BY CaseID) AS ROWNUM
                    FROM 零用金
                    {filterConditions}) a
                    WHERE ROWNUM > {pageSize * (currentSize - 1)} AND Isdelete='false';";
            /*搜尋從最上面數來8筆資料
             (創建一個ROWNUM條列 依照CaseID排序)
            條件(影響總比數):ROWNUM的 > (一頁內的資料數 * (連結頁面 - 1) = 起始資料第幾項 ) AND 被刪除資料是false*/

            string countQuery =
                $@"
                    SELECT 
                        COUNT (CaseID)
                    FROM 零用金
                    {filterConditions}
                ";

            List<SqlParameter> dbParameters = new List<SqlParameter>();

            if (!string.IsNullOrWhiteSpace(DDclass))
            {
                dbParameters.Add(new SqlParameter("@DDclass", DDclass));
            }

            if (!string.IsNullOrWhiteSpace(keyword))
            {
                dbParameters.Add(new SqlParameter("@keyword", keyword));
            }

            var dt = this.GetDataTable(Query, dbParameters);

            List<PettyCashmodel> list = new List<PettyCashmodel>();

            foreach (DataRow dr in dt.Rows)
            {
                PettyCashmodel model = new PettyCashmodel();
                model.ID = (Guid)dr["GUID"];
                model.CaseID = (int)dr["CaseID"];
                model.Date = (DateTime)dr["Date"];
                model.Class = (string)dr["class"];
                model.pay = (decimal)dr["pay"];
                model.Event = (string)dr["Event"];
                model.invoiceCode = (string)dr["invoiceCode"];

                list.Add(model);
            }

            int? totalSize2 = this.GetScale(countQuery, dbParameters) as int?;
            totalSize = (totalSize2.HasValue) ? totalSize2.Value : 0;

            return list;
        }

        public PettyCashmodel GetCashmodel(Guid id)
        {
            string queryString = $@" SELECT
                                     GUID, CaseID, Date,class,pay,Event,invoiceCode
                                     FROM 零用金
                                     WHERE GUID = @id";

            using (SqlConnection connection = new SqlConnection(_ConnectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Parameters.AddWithValue("@id", id);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    PettyCashmodel model = null;

                    while (reader.Read())
                    {
                        model = new PettyCashmodel();
                        model.ID = (Guid)reader["GUID"];
                        model.CaseID = (int)reader["CaseID"];
                        model.Date = (DateTime)reader["Date"];
                        model.Class = (string)reader["class"];
                        model.pay = (decimal)reader["pay"];
                        model.Event = (string)reader["Event"];
                        model.invoiceCode = (string)reader["invoiceCode"];
                    }

                    reader.Close();

                    return model;
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
        }

        public static int ExecuteNonQuery(string dbCommand, List<SqlParameter> parameters)
        {
            using (SqlConnection connection = new SqlConnection(_ConnectionString))
            {
                SqlCommand command = new SqlCommand(dbCommand, connection);

                List<SqlParameter> parameters2 = new List<SqlParameter>();
                foreach (var item in parameters)
                {
                    parameters2.Add(new SqlParameter(item.ParameterName, item.Value));
                }

                command.Parameters.AddRange(parameters2.ToArray());

                connection.Open();
                SqlTransaction sqlTransaction = connection.BeginTransaction();
                command.Transaction = sqlTransaction;

                try
                {
                    int totalChange = command.ExecuteNonQuery();
                    sqlTransaction.Commit();

                    return totalChange;

                }
                catch (Exception ex)
                {
                    sqlTransaction.Rollback();

                    throw;
                }

            }
        }
    }
}