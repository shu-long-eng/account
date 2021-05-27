using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;


namespace WebApplication2.PettyCash
{
    public class PettyCashDB
    {
        public static string _ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ContextModel1"].ConnectionString;

        #region 新增
        public static void insert(PettyCashmodel model)
        {
            string queryString =
                $@" INSERT INTO 零用金
                    (GUID,CaseID,Date,class,pay,Event,invoiceCode,Createtime,Isdelete)
                    VALUES
                    (@GUID,@CaseID,@date,@cla,@pay,@Evn,@invo,@Createtime,@Isdelete)";

            List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@GUID",Guid.NewGuid()),
                new SqlParameter("@CaseID",model.CaseID),
                new SqlParameter("@date",model.Date),
                new SqlParameter("@cla",model.Class),
                new SqlParameter("@pay",model.pay),
                new SqlParameter("@Evn",model.Event),
                new SqlParameter("@invo",model.invoiceCode),
                new SqlParameter("@Createtime",DateTime.Now),
                new SqlParameter("@Isdelete",false)
            };

            PettyCashmanager.ExecuteNonQuery(queryString, parameters);
        }

        #endregion

        #region 修改
        public static void Updata(PettyCashmodel model, Guid GUID)
        {
            string queryString =
                $@" UPDATE 零用金
                    SET  CaseID = @CaseID, date = @date, class = @cla , pay = @pay, Event = @Evn, invoiceCode = @invo , Updatetime = @Updatetime
                    WHERE GUID = @GUID";

            List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@GUID",GUID),
                new SqlParameter("@CaseID",model.CaseID),
                new SqlParameter("@date",model.Date),
                new SqlParameter("@cla",model.Class),
                new SqlParameter("@pay",model.pay),
                new SqlParameter("@Evn",model.Event),
                new SqlParameter("@invo",model.invoiceCode),
                new SqlParameter("@Updatetime",DateTime.Now)
            };

            PettyCashmanager.ExecuteNonQuery(queryString, parameters);
        }
        #endregion

        #region 刪除
        public static DataTable Delete(string newID)
        {
            
            string queryString =
                $@" UPDATE 零用金
                    SET Isdelete = @Isdelete
                    WHERE GUID = @GUID";

            using (SqlConnection connection = new SqlConnection(_ConnectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Parameters.AddWithValue("@GUID", newID);
                command.Parameters.AddWithValue("@Isdelete", true);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    reader.Close();
                    return dt;
                }
                catch
                {
                    throw;
                }
            }
        }
        #endregion
    }
}

