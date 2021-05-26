using journal.DBManager;
using journal.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;
using System.Windows;
using static journal.DBManager.NewMethod;

namespace WebApplication2.現金分析表
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        int Year;

        

        protected void Page_load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                yearSelect.DataSource = Enumerable.Range(DateTime.Now.Year - 3, 4).Reverse(); //動態增加選單項目
                yearSelect.DataBind();
            }
            
            Year = Convert.ToInt32(this.yearSelect.SelectedValue);      //Year為目前選單所選的項目
            this.title.Text = this.yearSelect.SelectedValue;            //隨年份更改標題

            DataSet ds = OutputCashMonth2(Year);
            
            
            this.monthIncome.DataSource = NewMethod.incomelist(ds,(int)MoneyType.Income);
            this.monthIncome.DataBind();

            this.monthExpenditure.DataSource = NewMethod.exlist(ds, (int)MoneyType.Expenditure);//列出每月支出
            this.monthExpenditure.DataBind();


            this.monthBalance.DataSource = NewMethod.OutputBalance(ds, (int)MoneyType.Balance);
            this.monthBalance.DataBind();

            this.MonthSubIncome.DataSource = DBCashAnalysis.subMoneyIn(Year,"收入");　//每個月分個別科目的收入
            this.DataBind();

            this.MonthSubEx.DataSource = DBCashAnalysis.subMoneyIn(Year, "支出");//每個月分個別科目的輸出
            this.DataBind();

            DataTable data = NewMethod.SaveData();



           
        }

        
    }
}