using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.PettyCash
{
    public class PettyCashmodel
    {
        public Guid ID { get; set; }
        public int CaseID { get; set; }
        public DateTime Date { get; set; }
        public string Class { get; set; }
        public decimal pay { get; set; }
        public string Event { get; set; }
        public string invoiceCode { get; set; }
    }
}