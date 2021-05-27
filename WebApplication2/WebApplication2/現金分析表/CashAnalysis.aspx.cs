using journal.DBManager;
using journal.Helpers;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.SS.Util;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            var a = GetReportMS();
        }

        public MemoryStream GetReportMS()
        {
            Year = Convert.ToInt32(this.yearSelect.SelectedValue);      //Year為目前選單所選的項目

            DataSet ds = OutputCashMonth2(Year);
            List<Income> income_list = NewMethod.incomelist(ds, (int)MoneyType.Income);
            List<ex> ex_list = NewMethod.exlist(ds, (int)MoneyType.Expenditure);
            List<Balance> bl_list = NewMethod.OutputBalance(ds, (int)MoneyType.Balance);

            IWorkbook workbook = new HSSFWorkbook();
            ISheet sheet1 = workbook.CreateSheet("sheet1");

            sheet1.AddMergedRegion(new CellRangeAddress(0, 2, 0, 12));
            ICell title = sheet1.CreateRow(0).CreateCell(0);
            title.SetCellValue(Year.ToString() + "年現金分析表");
            ICellStyle cellstyle = workbook.CreateCellStyle();
            cellstyle.Alignment = HorizontalAlignment.Center; 
            cellstyle.VerticalAlignment = VerticalAlignment.Center;
            IFont font = workbook.CreateFont();
            font.FontName = "新細明體";
            font.FontHeightInPoints = 25;
            font.IsBold = true;

            cellstyle.SetFont(font);
            title.CellStyle = cellstyle;


            IRow header_row1 = sheet1.CreateRow(3);
            IRow income_row = sheet1.CreateRow(4);
            IRow ex_row = sheet1.CreateRow(5);
            IRow bl_row = sheet1.CreateRow(6);


            for (var i = 0; i < 12; i++)
            {
                ICell cell = header_row1.CreateCell(i + 1);
                cell.SetCellValue((i + 1).ToString() + "月");
                cell.CellStyle.Alignment= HorizontalAlignment.Right;
                ICell cellIn = income_row.CreateCell(i + 1);
                cellIn.SetCellValue(income_list[i].moneylistIn);

                ICell cellex = ex_row.CreateCell(i + 1);
                cellex.SetCellValue(ex_list[i].moneylistOut);

                ICell cellbl = bl_row.CreateCell(i + 1);
                cellbl.SetCellValue(bl_list[i].BalanceList);


            }

            string path = "D:\\logs\\temp.xls";

            using (FileStream file = new FileStream(path, FileMode.Create))
            {
                workbook.Write(file);
            }

            MemoryStream ms = new MemoryStream();
            workbook.Write(ms);
            return ms;
        }
    }
}