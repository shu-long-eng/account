using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2
{
    public class accountDB
    {
        static string connectionstring = "Data Source=localhost\\SQLExpress;Initial Catalog=財經系統; Integrated Security=true";
        public static void confirm()
        {
            string querystr = $@"select Account from User ";
        }
    }
}