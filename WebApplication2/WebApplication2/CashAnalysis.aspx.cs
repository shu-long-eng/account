using System;


namespace WebApplication2.現金分析表
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            int Year = Convert.ToInt32(this.yearSelect.SelectedValue); //year為下拉選單選擇年分
            this.monthIncome.DataSource = DBCashAnalysis.monthTotalOutIn(Year,"收入");//列出每月收入
            this.monthIncome.DataBind();

            this.monthExpenditure.DataSource = DBCashAnalysis.monthTotalOutIn(Year, "支出");//列出每月支出
            this.monthExpenditure.DataBind();

            this.monthBalance.DataSource = DBCashAnalysis.monthBalance(Year);//每月餘額
            this.monthBalance.DataBind();

            this.title.Text = this.yearSelect.SelectedValue;            //隨年份更改標題

            this.MonthSubIncome.DataSource = DBCashAnalysis.subMoneyIn(Year,"收入");　//每個月分個別科目的收入
            this.DataBind();

            this.MonthSubEx.DataSource = DBCashAnalysis.subMoneyIn(Year, "支出");//每個月分個別科目的輸出
            this.DataBind();

           
        }

       

       
    }
}