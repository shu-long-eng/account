using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WebApplication2.PettyCash;
using System.Windows.Forms;


namespace WebApplication2
{
    public partial class PettyCashList : System.Web.UI.Page
    {
        //const 為設固定參數 通常用來設定不可變更的變數
        const int _pageSize = 8;
        //自動生頁數MODEL
        internal class PagingLink
        {
            public string Name { get; set; }
            public string Link { get; set; }
            public string Title { get; set; }
            public string Color { get; set; }
        }

        public class PagingHelper
        {
            //實作分頁的函式
            public static int CalculatePages(int totalSize, int pageSize)
            {
                // 頁 = 總比數 / 單頁資料數
                int pages = totalSize / pageSize;
                //如果有餘數就再+一頁
                if (totalSize % pageSize != 0)
                    pages += 1;
                //回傳給頁
                return pages;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LoadPettyCashView();
                this.SaveKeyword();
            }
        }

        private string GetQueryString(bool includePage, int? pageIndex)
        {
            //----- Get Query string parameters -----
            string page = Request.QueryString["Page"];
            string Keyword_DD = Request.QueryString["Keyword_DD"];
            string Keyword_txt = Request.QueryString["Keyword_txt"];
            //----- Get Query string parameters -----

            List<string> conditions = new List<string>();

            if (!string.IsNullOrEmpty(page) && includePage)
                conditions.Add("Page=" + page);

            if (!string.IsNullOrEmpty(Keyword_DD))
                conditions.Add("Keyword_DD=" + Keyword_DD);

            if (!string.IsNullOrEmpty(Keyword_txt))
                conditions.Add("Keyword_txt=" + Keyword_txt);

            if (pageIndex.HasValue)
                conditions.Add("Page=" + pageIndex.Value);

            string retText =
                (conditions.Count > 0)
                    ? "?" + string.Join("&", conditions)
                    : string.Empty;

            return retText;
        }

        //一般:從DB抓總表資料出來根據PAGE進行分頁     搜尋:抓取Keyword資料，進DB後將篩選的資料依據PAGE進行分頁
        private void LoadPettyCashView()
        {
            //----- Get Query string parameters -----
            string page = Request.QueryString["Page"];
            int pIndex = 0;
            //當頁面不為0時,進入預設第一頁
            if (string.IsNullOrEmpty(page))
                pIndex = 1;
            else
            {
                //將PAGE轉為數字，回傳pIndex
                int.TryParse(page, out pIndex);
                //如果回傳值小於0,強制轉成1
                if (pIndex <= 0)
                    pIndex = 1;
            }
            //----- Get Query string parameters -----
            //設定關鍵搜尋網址
            string Keyword_DD = Request.QueryString["Keyword_DD"];
            string Keyword_txt = Request.QueryString["Keyword_txt"];
            int totalSize = 0;

            var manager = new PettyCashmanager();
            var list = manager.ViewAllPettyCash(Keyword_DD, Keyword_txt, out totalSize, pIndex, _pageSize);
            int pages = PagingHelper.CalculatePages(totalSize, _pageSize);

            List<PagingLink> pagingList = new List<PagingLink>();
            for (var i = 1; i <= pages; i++)
            {
                pagingList.Add(new PagingLink()
                {
                    Link = $"PettyCashList.aspx{this.GetQueryString(false, i)}",
                    Name = $"{i}",
                    Title = $"前往第 {i} 頁",
                    Color = (i == pIndex) ? "BLACK" : ""
                });
            }

            this.repPaging.DataSource = pagingList;
            this.repPaging.DataBind();

            this.tableRepeater.DataSource = list;
            this.tableRepeater.DataBind();
        }

        protected void tableRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string cmdName = e.CommandName;
            string cmdArgu = e.CommandArgument.ToString();

            if ("DeleteItem" == cmdName)
            {
                //沒有確認是否刪除
                DialogResult myResult =
                    MessageBox.Show
                    ("請確認所選的是否為要刪除的資料,確認完後再按下'是(Y)'以執行。要取消刪除請按否(N)", "刪除確認提示", //先內文,再標題
                    MessageBoxButtons.YesNo, MessageBoxIcon.Question); //加入按鍵,加入問題ICON
                if (myResult == DialogResult.Yes)
                {
                    Response.Write("<script> alert('刪除成功');</script>");
                    PettyCashDB.Delete(cmdArgu);
                    this.LoadPettyCashView();
                }
                else
                {
                    Response.Write("<script> alert('已取消刪除,將返回零用金管理頁面');</script>");
                }
            }

            if ("UpdateItem" == cmdName)
            {
                string targetUrl = "~/PettyCashInsert.aspx?ID=" + cmdArgu;
                Response.Redirect(targetUrl);
            }
        }

        protected void Searchbtn_Click(object sender, EventArgs e)
        {
            string Keyword_DD = this.KeyWordDDList.SelectedValue;
            string Keyword_txt = this.Searchtxt.Text;

            string template = "?Page=1";

            if (!string.IsNullOrEmpty(Keyword_DD))
                template += "&Keyword_DD=" + Keyword_DD;

            if (!string.IsNullOrEmpty(Keyword_txt))
                template += "&Keyword_txt=" + Keyword_txt;
            
            Response.Redirect("PettyCashList.aspx" + template);
        }

        private void SaveKeyword()
        {
            var DDval = Request.QueryString["Keyword_DD"];
            var txtval = Request.QueryString["Keyword_txt"];

            if (!string.IsNullOrEmpty(DDval) && !string.IsNullOrEmpty(txtval))
            {
                this.KeyWordDDList.SelectedValue = DDval;
                this.Searchtxt.Text = txtval;
            }
        }
    }
}