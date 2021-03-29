using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace WebApplication2
{
    public partial class UC確認頁面 : System.Web.UI.UserControl
    {

        
        public string Text1 { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string date = this.TextBox1.Text;
            string sub = this.TextBox2.Text;
            string usefor = this.TextBox3.Text;
            int money = Convert.ToInt32(this.TextBox4.Text);
            string OutIn = this.DropDownList1.Text;
            DB.insertDB(date,sub,usefor,money,OutIn);
            
        }
    }
}