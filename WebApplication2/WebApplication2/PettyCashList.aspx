<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PettyCashList.aspx.cs" Inherits="WebApplication2.PettyCashList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Scripts/bootstrap.min.css">
    <script src="Scripts/jquery-3.5.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/popper.js"></script>
    <!-- 以裝置寬度為顯⽰寬度，並預設縮放比例為1.0 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 引入jQuery Mobile樣式表 -->
    <link rel="stylesheet" href="Scripts/jquery.mobile-1.4.5.css">
    <!-- 引入jQuery核⼼程式庫 -->
    <script src="Scripts/jquery-1.11.0.min.js"></script>
    <!-- 引入jQuery Mobile核⼼程式庫 -->
    <script src="Scripts/jquery.mobile-1.4.5.min.js"></script>

    <style>
        .table {
            text-align: center;
            width: 80%;
            padding: 10px 10px 10px 10px;
            margin: 0px 10px 10px 275px;
        }

        #toolbar {
            padding: 10px 10px 10px 10px;
            margin: 10px 0px 10px 10px;
            background-color: rgba(0, 148, 255, 0.3);
        }

        #droplist {
            margin: 3px 3px 3px 3px;
        }

        #insert_btn {
            margin: 2px 2px 2px 2px;
        }

        .footer {
            margin-left: 750px;
            padding: 10px 10px 10px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: aquamarine; margin-left: 150px">
        <h1>零用金管理</h1>
    </div>
    <div id="insert_btn" class="d-grid gap-2 d-flex justify-content-end">
        <a href="PettyCashInsert.aspx" class="btn btn-outline-success">申請零用金</a>
    </div>
    <div id="toolbar" class="d-grid gap-2 d-flex justify-content-end">
        <div id="droplist">
            <asp:DropDownList ID="KeyWordDDList" runat="server">
                <asp:ListItem Value="CaseID">案件編號</asp:ListItem>
                <asp:ListItem Value="Date">申請日期</asp:ListItem>
                <asp:ListItem Value="calss">支出課目</asp:ListItem>
                <asp:ListItem Value="pay">支出金額</asp:ListItem>
                <asp:ListItem Value="Event">申請事由</asp:ListItem>
                <asp:ListItem Value="invoiceCode">發票號碼</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <asp:TextBox ID="Searchtxt" runat="server" placeholder="請輸入關鍵字"></asp:TextBox>
            <asp:Button class="btn btn-info" ID="Searchbtn" runat="server" Text="搜尋" OnClick="Searchbtn_Click" />
        </div>
        <div runat="server" id="Msg"></div>
    </div>
    <div id="table">
        --<table class="table table-striped">
            <thead class="table-info">
                <tr>
                    <th>案件編號</th>
                    <th>日期</th>
                    <th>課目</th>
                    <th>支出</th>
                    <th>事由</th>
                    <th>發票/收據號碼</th>
                    <th>刪除/修改</th>
                </tr>
            </thead>
            <asp:Repeater ID="tableRepeater" runat="server" OnItemCommand="tableRepeater_ItemCommand">
                <ItemTemplate>
                    <tbody class="table table-bordered border-info">
                        <tr>
                            <td><%# Eval("CaseID")%></td>
                            <td><%# Eval("Date","{0: yyyy-MM-dd}")%></td>
                            <td><%# Eval("class")%></td>
                            <td><%# Eval("Pay")%></td>
                            <td><%# Eval("Event")%></td>
                            <td><%# Eval("invoiceCode")%></td>
                            <td>
                                <asp:Button CssClass="btn btn-danger btn-sm" ID="Delete" runat="server" Text="刪除" CommandName="DeleteItem" CommandArgument='<%# Eval("ID") %>' />&nbsp;
                                <asp:Button CssClass="btn btn-warning btn-sm" ID="Updata" runat="server" Text="修改" CommandName="UpdateItem" CommandArgument='<%# Eval("ID") %>' />
                            </td>
                        </tr>
                    </tbody>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <div class="footer">
            <asp:Repeater runat="server" ID="repPaging">
                <ItemTemplate>
                    <a style="color: <%# Eval("Color") %>" href="<%# Eval("Link") %>" title="<%# Eval("Title") %>">第<%# Eval("Name") %>頁</a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

