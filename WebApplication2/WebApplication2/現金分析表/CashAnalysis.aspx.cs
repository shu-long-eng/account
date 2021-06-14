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
using System.Web;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Forms;
using static journal.DBManager.NewMethod;
using static WebApplication2.現金分析表.月份金額;

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
           
            System.Threading.Thread s = new System.Threading.Thread(new System.Threading.ThreadStart(GetReportMS));
            s.ApartmentState = System.Threading.ApartmentState.STA;
            s.Start();
        }

        public void GetReportMS()
        {
            Year = Convert.ToInt32(this.yearSelect.SelectedValue);      //Year為目前選單所選的項目

            


            DataSet ds = OutputCashMonth2(Year);
            List<Income> income_list = NewMethod.incomelist(ds, (int)MoneyType.Income);
            List<ex> ex_list = NewMethod.exlist(ds, (int)MoneyType.Expenditure);
            List<Balance> bl_list = NewMethod.OutputBalance(ds, (int)MoneyType.Balance);
            List<subMoneyIn> Incomelist = DBCashAnalysis.subMoneyIn(Year, "收入");
            List<subMoneyIn> Exportlist = DBCashAnalysis.subMoneyIn(Year, "支出");

            IWorkbook workbook = new HSSFWorkbook();
            ISheet sheet1 = workbook.CreateSheet("sheet1");

            sheet1.AddMergedRegion(new CellRangeAddress(0, 2, 0, 12));
            ICell title = sheet1.CreateRow(0).CreateCell(0);
            title.SetCellValue(Year.ToString() + "年現金分析表");
            ICellStyle cellstyle = workbook.CreateCellStyle();
            cellstyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.Center;
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


            ICell IncomeTitle = income_row.CreateCell(0);
            IncomeTitle.SetCellValue("月收入");

            ICell exTitle = ex_row.CreateCell(0);
            exTitle.SetCellValue("月支出");

            ICell blTitle = bl_row.CreateCell(0);
            blTitle.SetCellValue("月餘額");


            for (var i = 0; i < 12; i++)
            {
                ICell cell = header_row1.CreateCell(i + 1);
                cell.SetCellValue((i + 1).ToString() + "月");
                cell.CellStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.Right;
                ICell cellIn = income_row.CreateCell(i + 1);
                cellIn.SetCellValue(income_list[i].moneylistIn);

                ICell cellex = ex_row.CreateCell(i + 1);
                cellex.SetCellValue(ex_list[i].moneylistOut);

                ICell cellbl = bl_row.CreateCell(i + 1);
                cellbl.SetCellValue(bl_list[i].BalanceList);

            }

            sheet1.AddMergedRegion(new CellRangeAddress(sheet1.LastRowNum+ 1, sheet1.LastRowNum + 1, 0, 12));
            ICell intitle = sheet1.CreateRow(sheet1.LastRowNum + 1).CreateCell(0);
            intitle.SetCellValue("收入");

            ICellStyle TitleCellCtyle = workbook.CreateCellStyle();
            TitleCellCtyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.Center;
            TitleCellCtyle.VerticalAlignment = VerticalAlignment.Center;
            IFont Titlefont = workbook.CreateFont();
            Titlefont.FontName = "新細明體";
            Titlefont.FontHeightInPoints = 10;
            Titlefont.IsBold = true;

            TitleCellCtyle.SetFont(Titlefont);
            intitle.CellStyle = TitleCellCtyle;



            for(var i = 0; i < Incomelist.Count; i++)
            {
                IRow InRow = sheet1.CreateRow(sheet1.LastRowNum + 1);
                ICell SubIn = InRow.CreateCell(0);
                SubIn.SetCellValue(Incomelist[i].subType);

                ICell JanIn = InRow.CreateCell(1);
                JanIn.SetCellValue((double)(Incomelist[i].Jan));
                ICell FebIn = InRow.CreateCell(2);
                FebIn.SetCellValue((double)Incomelist[i].Feb);
                ICell MarIn = InRow.CreateCell(3);
                MarIn.SetCellValue((double)Incomelist[i].Mar);
                ICell AprIn = InRow.CreateCell(4);
                AprIn.SetCellValue((double)Incomelist[i].Apr);
                ICell MayIn = InRow.CreateCell(5);
                MayIn.SetCellValue((double)Incomelist[i].May);
                ICell JunIn = InRow.CreateCell(6);
                JunIn.SetCellValue((double)Incomelist[i].Jun);
                ICell JulIn = InRow.CreateCell(7);
                JulIn.SetCellValue((double)Incomelist[i].Jul);
                ICell AugIn = InRow.CreateCell(8);
                AugIn.SetCellValue((double)Incomelist[i].Aug);
                ICell SepIn = InRow.CreateCell(9);
                SepIn.SetCellValue((double)Incomelist[i].Sep);
                ICell OctIn = InRow.CreateCell(10);
                OctIn.SetCellValue((double)Incomelist[i].Oct);
                ICell NovIn = InRow.CreateCell(11);
                NovIn.SetCellValue((double)Incomelist[i].Nov);
                ICell DecIn = InRow.CreateCell(12);
                DecIn.SetCellValue((double)Incomelist[i].Dec);
            }


            sheet1.AddMergedRegion(new CellRangeAddress(sheet1.LastRowNum + 1, sheet1.LastRowNum + 1, 0, 12));
            ICell extitle = sheet1.CreateRow(sheet1.LastRowNum + 1).CreateCell(0);
            extitle.SetCellValue("支出");
            extitle.CellStyle = TitleCellCtyle;


            for (var i = 0; i < Exportlist.Count; i++)
            {
                IRow ExRow = sheet1.CreateRow(sheet1.LastRowNum + 1);
                ICell SubEx = ExRow.CreateCell(0);
                SubEx.SetCellValue(Exportlist[i].subType);

                ICell JanEx = ExRow.CreateCell(1);
                JanEx.SetCellValue((double)(Exportlist[i].Jan));
                ICell FebEx = ExRow.CreateCell(2);
                FebEx.SetCellValue((double)Exportlist[i].Feb);
                ICell MarEx = ExRow.CreateCell(3);
                MarEx.SetCellValue((double)Exportlist[i].Mar);
                ICell AprEx = ExRow.CreateCell(4);
                AprEx.SetCellValue((double)Exportlist[i].Apr);
                ICell MayEx = ExRow.CreateCell(5);
                MayEx.SetCellValue((double)Exportlist[i].May);
                ICell JunEx = ExRow.CreateCell(6);
                JunEx.SetCellValue((double)Exportlist[i].Jun);
                ICell JulEx = ExRow.CreateCell(7);
                JulEx.SetCellValue((double)Exportlist[i].Jul);
                ICell AugEx = ExRow.CreateCell(8);
                AugEx.SetCellValue((double)Exportlist[i].Aug);
                ICell SepEx = ExRow.CreateCell(9);
                SepEx.SetCellValue((double)Exportlist[i].Sep);
                ICell OctEx = ExRow.CreateCell(10);
                OctEx.SetCellValue((double)Exportlist[i].Oct);
                ICell NovEx = ExRow.CreateCell(11);
                NovEx.SetCellValue((double)Exportlist[i].Nov);
                ICell DecEx = ExRow.CreateCell(12);
                DecEx.SetCellValue((double)Exportlist[i].Dec);
            }











            //給使用者選擇存檔位置
            var path = new SaveFileDialog();
            path.Title = "Save File";
            path.FileName = "CashList.xls";
            path.Filter = "Excel Files(*.xls)|*.xls";
            var isValid = path.ShowDialog();

            if (isValid == DialogResult.OK)
            {
                
                    using (FileStream file = new FileStream(path.FileName, FileMode.Create))
                    {
                        workbook.Write(file);
                    }
                    MemoryStream ms = new MemoryStream();
                    workbook.Write(ms);
                

            }
            //return ms;
        }
    }
}