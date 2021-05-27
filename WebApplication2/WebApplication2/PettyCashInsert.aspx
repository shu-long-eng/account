<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PettyCashInsert.aspx.cs" Inherits="WebApplication2.PettyCashInsert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        #Page2 {
            width: 450px;
            height: 400px;
            font-size: 20px;
            color: white;
            text-align: center;
            padding: 10px;
            margin: 100px auto; /*前一個數值是從最上往下的距離,第二個數值是由最左往右的距離auto為置中*/
            background-color: rgba(0, 148, 255,0.5);
        }

        #body {
            text-align: left;
            margin-left: 65px;
        }

        #btns {
            margin-right: 50px;
            margin-top: 5px;
            text-align: right;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Page2">
        <div>
            <asp:Label Style="font-size:50px; margin: 10px;" ID="titalable" runat="server" Text="零用金申請"></asp:Label>
            <br />
        </div>
        <div id="body">
            申請日期 :
            <input id="dateinpu" style="width:220px" type="date" runat="server" /><br />
            案件編號 :
            <input id="Case" style="width:220px" type="text" runat="server" placeholder="請輸入報告書編號" maxlength="5" /><br />
            支出科目 :
            <asp:DropDownList ID="ItemclassTxt" runat="server" Style="text-align: right;">
                <asp:ListItem>公費</asp:ListItem>
                <asp:ListItem>補貼</asp:ListItem>
                <asp:ListItem>繳費</asp:ListItem>
                <asp:ListItem>預算</asp:ListItem>
            </asp:DropDownList><br />
            支出金額 :
            <input id="Paytxt" style="width:220px" type="text" runat="server" maxlength="4" /><br />
            申請事由 :
            <asp:DropDownList ID="reasonTxt" runat="server" Style="text-align: right;">
                <asp:ListItem>公差</asp:ListItem>
                <asp:ListItem>餐飲</asp:ListItem>
                <asp:ListItem>繳費</asp:ListItem>
                <asp:ListItem>交通</asp:ListItem>
                <asp:ListItem>文具</asp:ListItem>
                <asp:ListItem>其它</asp:ListItem>
            </asp:DropDownList><br />
            發票號碼 :
            <input id="invoiceTxt" style="width:220px" type="text" runat="server" placeholder="請輸入發票號碼"  maxlength="10" /><br />
            <div id="btns">
                <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label><br />
                <asp:Button class="btn btn-success" ID="insert" runat="server" Text="確認" OnClick="insert_Click" />
                <a href="PettyCashList.aspx" onclick="return confirm('是否取消申請/修改零用金，並轉跳至零用金管理畫面?');" class="btn btn-light">取消</a>
            </div>
        </div>
        
    </div>
</asp:Content>
