using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    
    public partial class 現金日記帳 : System.Web.UI.Page
    {
        
        protected void Page_init(object sender, EventArgs e)
        {
            this.Repeater1.DataSource = DB.showTotalDB();
            this.Repeater1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.Repeater1.DataSource = DB.showTotalDB();
            this.Repeater1.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string cmdName = e.CommandName;

            string cmdArgu = e.CommandArgument.ToString();

            if ("deleteItem" == cmdName)
            {
                DB.deleteDB(cmdArgu);

                this.Repeater1.DataSource = DB.showTotalDB();
                this.Repeater1.DataBind();

            }
        }
    }
}