using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.零用金表
{
    public partial class CashListPage : System.Web.UI.Page
    {
        protected void Page_init(object sender, EventArgs e)
        {
            string DBName = "PettyCash";
            this.showMoneyList.DataSource = DB.showTotalDB(DBName);
            this.showMoneyList.DataBind();
        }
        
        protected void showMoneyList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string cmdName = e.CommandName;
            string ArgName = e.CommandArgument.ToString();
            if("deleteItem" == cmdName)
            {
                Response.Write("<Script language='JavaScript'>alert('刪除了');</Script>");
               
            }
            else if("EditItem" == cmdName)
            {
                Response.Write("<Script language='JavaScript'>alert('修改了');</Script>");
            }
        }

        protected void NewData_Click(object sender, EventArgs e)
        {
            string targetUrl =
                    "~/零用金表/EditCash.aspx";

            Response.Redirect(targetUrl);
        }
    }
}