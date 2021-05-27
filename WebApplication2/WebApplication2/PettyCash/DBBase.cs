using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication2.PettyCash
{
    public class DBBase
    {
        public string _ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ContextModel1"].ConnectionString;

        public DataTable GetDataTable(string dbCommand, List<SqlParameter> parameters)
        {
            using (SqlConnection connection = new SqlConnection(_ConnectionString))
            {
                SqlCommand command = new SqlCommand(dbCommand, connection);
                command.Parameters.AddRange(parameters.ToArray());

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    reader.Close();

                    return dt;
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        public object GetScale(string dbCommand, List<SqlParameter> parameters)
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

                try
                {
                    connection.Open();
                    return command.ExecuteScalar();
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
    }
}