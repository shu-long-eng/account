using System;
using System.Collections.Generic;
using System.Data;
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
            string DBName = "SubList";

            DataTable dt = DB.ShowDataTable(DBName);

            for (int i = 0; i<dt.Rows.Count; i++)
            {
                if (!IsPostBack) { 
                string Sublist = dt.Rows[i].Field<string>("SubList");

                this.DropDownList2.Items.Add(Sublist);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // 如果日期為空白跳出警告
            if (this.TextBox1.Text == "")
            {
                this.TextBox1.Text = "";  
                
                this.TextBox3.Text = "";
                this.TextBox4.Text = "";
                this.DropDownList1.SelectedValue = "收入";
                Response.Write("<Script language='JavaScript'>alert('欄位不可空白');</Script>");
                return;
            }
            // 如果欄位為空白跳出警告
            if ( this.DropDownList2.Text != "" || this.TextBox3.Text != "" || this.TextBox4.Text != "" )
            {
                string date = this.TextBox1.Text;
                string sub = this.DropDownList2.Text;
                string usefor = this.TextBox3.Text;
                int money = Convert.ToInt32(this.TextBox4.Text);
                string OutIn = this.DropDownList1.SelectedItem.Value;

                
                this.TextBox1.Text="";
                this.TextBox3.Text="";
                this.TextBox4.Text="";
                this.DropDownList1.SelectedValue = "收入";
                //確認支出是否高於餘額
                if (DB.BalanceCheck(money)&& OutIn == "支出")
                {
                    Response.Write("<Script language='JavaScript'>alert('支出不可高於餘額');</Script>");
                    return;
                }

                DB.insertDB(date, sub, usefor, money, OutIn);  
            }
            else
            {
                Response.Write("<Script language='JavaScript'>alert('欄位不可空白');</Script>");
            }
       
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            this.DropDownList2.Items.Add(this.NewSub.Text);

            DB.AddSubList(this.NewSub.Text);
        }

        
    }
}