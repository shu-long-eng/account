using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!LoginHelper.HasLogined()) //判斷是否已經登入
            {
                string targetUrl =
                    "~/Login.aspx";

                Response.Redirect(targetUrl);  //如果沒登入跳轉至登入頁
            }
        }
    }
}