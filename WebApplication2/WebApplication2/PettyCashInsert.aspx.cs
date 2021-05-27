using System;
using System.Windows.Forms;
using WebApplication2.PettyCash;

namespace WebApplication2
{
    public partial class PettyCashInsert : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (IsUpdateMode()) //確認是否為更新模式
            {
                Guid temp; //宣告Guid TEMP暫存Guid
                if (Guid.TryParse(Request.QueryString["ID"], out temp)) //將網址抓到的ID帶到暫存內
                {
                    this.LoadCase(temp);//把值帶進輸入欄
                }
            }
            else if (Request.QueryString["ID"] != null && !IsUpdateMode()) //有ID但不吻合資料庫時
            {
                MessageBox.Show("無效的ID，將轉跳回零用金管理畫面", "錯誤訊息", //先設定MessageBox的內文,再設定標題
                MessageBoxButtons.OK, MessageBoxIcon.Warning); // 新增確認按紐，和警示ICON
                Response.Redirect("PettyCashList.aspx"); //轉跳回管理畫面
            }
        }

        protected void insert_Click(object sender, EventArgs e)　　　　//當確認被按下時
        {
            if (string.IsNullOrWhiteSpace(this.dateinpu.Value) ||    // 檢測申請日期是否為空值
                string.IsNullOrWhiteSpace(this.Case.Value) ||        // 檢測案件編號是否為空值
                string.IsNullOrWhiteSpace(this.Paytxt.Value) ||      // 檢測申請金額是否為空值
                string.IsNullOrWhiteSpace(this.invoiceTxt.Value))    // 檢測發票號碼是否為空值
            {
                this.Label1.Text = ("請填滿所有選項");                 //當欄位有空時出現的警告字
                return;
            }

            int Number; //宣告數字型別的比對變數
            if (!int.TryParse(this.Case.Value.ToString(), out Number) || //確認案件編號的欄位輸入的是數字
                !int.TryParse(this.Paytxt.Value.ToString(), out Number)) //確認支付金額欄位輸入的是數字
            {
                this.Label1.Text = ("請檢查「金額」和「案件標號」欄的輸入值是否為數字"); //金額和案件編號不為數字時出現的警告字
                return;
            }

            var model = new PettyCashmodel(); //在本頁實作Model

            model.Date = Convert.ToDateTime(this.dateinpu.Value.Trim()); //宣告Model.date裝日期輸入的值 , Trim移除開頭和結尾的所有空白字元。
            model.CaseID = Convert.ToInt32(this.Case.Value.Trim());      //宣告Model.CaseID裝案件編號輸入的值 , Trim移除開頭和結尾的所有空白字元。
            model.Class = this.ItemclassTxt.SelectedValue;               //宣告Model.Class裝下拉選單-課目所選的值。
            model.pay = Convert.ToDecimal(this.Paytxt.Value.Trim());     //宣告Model.pay 裝金額輸入的值 , Trim移除開頭和結尾的所有空白字元。
            model.Event = this.reasonTxt.SelectedValue;                  //宣告Model.Event裝下拉選單-課目所選的值。
            model.invoiceCode = this.invoiceTxt.Value.Trim();            //宣告Model.invoiceCode裝發票輸入的值 , Trim移除開頭和結尾的所有空白字元。

            DialogResult myResult =
            MessageBox.Show
            ("請確認輸入的資料正確無誤,確認完後再按下'是(Y)'以執行。要取消請按否(N)", "確認提示", //先設定MessageBox的內文,再設定標題
            MessageBoxButtons.YesNo, MessageBoxIcon.Question);  //加入Yes,NO按鍵,加入問題ICON
            if (IsUpdateMode() && myResult == DialogResult.Yes) //如果現在是更新模式且按鈕按下Yes
            {
                Guid temp; //宣告Guid TEMP暫存Guid
                Guid.TryParse(Request.QueryString["ID"], out temp); //將網址抓到的ID帶到暫存內
                PettyCashDB.Updata(model, temp); //執行SQL更新　(依照ID做MODEL資料更新)
                Response.Redirect("PettyCashList.aspx");//回管理頁面
            }
            else if (myResult == DialogResult.Yes) //一般新增模式
            {
                PettyCashDB.insert(model);//執行新增SQL (將新增到Model的資料寫入到資料庫)
                Response.Redirect("PettyCashList.aspx");//回管理頁面
            }
        }
        private bool IsUpdateMode() //檢驗是否為更新模式
        {
            string qsID = Request.QueryString["ID"]; //抓取網址的QueryString["ID"]

            Guid temp;  //宣告Guid TEMP暫存Guid
            if (Guid.TryParse(qsID, out temp)) //如果QueryString["ID"]是GUID的話回傳給TEMP做比對
                return true; //過的話把TRUE回傳給這函式

            return false; //沒過回傳false
        }

        private void LoadCase(Guid id) //偵測有無GUID
        {
            var manager = new PettyCashmanager(); //實體化PettyCashmanager
            var model = manager.GetCashmodel(id); //引用PettyCashmanager的GetCashmodel 依GUID為KEY來帶出其他資料

            if (model == null) //如果沒這筆資料頁面轉回管理畫面
                Response.Redirect("PettyCashList.aspx"); //畫面轉回零用金管理

            this.titalable.Text = "零用金修改"; //將標題改為"零用金修改"
            this.dateinpu.Value = model.Date.ToString("yyyy-MM-dd"); //將申請日期的值帶入輸入框
            this.Case.Value = model.CaseID.ToString(); //將案件編號的值帶入輸入框
            this.ItemclassTxt.SelectedValue = model.Class; //將課目的值帶入下拉式選單
            this.Paytxt.Value = model.pay.ToString(); //將金額的值帶入輸入框
            this.reasonTxt.SelectedValue = model.Event; // 將事由的值帶入下拉式選單
            this.invoiceTxt.Value = model.invoiceCode; // 將發票的值帶入輸入框
        }
    }
}