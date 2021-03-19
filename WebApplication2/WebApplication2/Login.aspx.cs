using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string account = this.TextBox1.Text;

            string passowrd = this.TextBox2.Text;

            bool acc = accountDB.confirmAcc(account);

            bool pw = accountDB.confirmPw(passowrd);

            if(acc == false && pw == false)
            {
                Server.Transfer("現金日記帳.aspx");
            }
            else
            {
                this.Label1.Visible = true;
            }

        }
    }
}