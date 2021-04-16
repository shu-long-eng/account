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
            public int? moneyIn { get; set; }
        }


    }
}