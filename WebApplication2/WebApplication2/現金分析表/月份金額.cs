using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.現金分析表
{
    public class 月份金額
    {
        public class monthMoney
        {
            public int? monthInOut { get; set; }
        }
        public class monthBalance
        {
            public int? balance { get; set; }
        }
        public class subMoneyIn
        {
            public string subTypeIn { get; set; }
            public int? JanIn { get; set; }
            public int? FebIn { get; set; }
            public int? MarIn { get; set; }
            public int? AprIn { get; set; }
            public int? MayIn { get; set; }
            public int? JunIn { get; set; }
            public int? JulIn { get; set; }
            public int? AugIn { get; set; }
            public int? SepIn { get; set; }
            public int? OctIn { get; set; }
            public int? NovIn { get; set; }
            public int? DecIn { get; set; }
        }


    }
}