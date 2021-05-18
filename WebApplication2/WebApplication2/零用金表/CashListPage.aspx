<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CashListPage.aspx.cs" Inherits="WebApplication2.零用金表.CashListPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .jumbotron{
          
          padding-top:10px;
          padding-bottom:10px;
          margin-bottom:5px;
      
        }
        #content{
            
            margin-left:300px;
            width:1100px;
        }
        #InsertBtn{
            margin-top:10px;
            margin-bottom:10px;
        }
        .NewCashData{
            margin-bottom:10px;
            width:275px;
            background-color:red;
        }
        .TextPostion{
            margin-left:31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div class="jumbotron"><h1 class="display-4">零用金表</h1></div>
    <div id="content">
   <div id="InsertBtn"><button type="button" class="btn btn-primary" data-target="#InserDataModal" data-toggle="modal">新增資料</button></div>
    <table id="myDataTalbe"  class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>No</th>
                    <th>日期</th>                   
                    <th>發票號碼</th>
                    <th>用途</th>
                    <th>金額</th>
                    <th>餘額</th>
                    <th>刪除/修改</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="showMoneyList" runat="server" OnItemCommand="showMoneyList_ItemCommand" >
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("ID") %></td>
                            <td><%#Eval("Date") %></td>
                            <td><%#Eval("Receipt") %></td>
                            <td><%#Eval("Usefor") %></td>
                            <td><%#Eval("Money") %></td>
                            <td><%#Eval("Total") %></td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="修改" commandName="EditItem" CommandArgument='<%#Eval("ID") %>' class="btn btn-warning"/>               
                                <asp:Button　data-target="#myModal" data-toggle="modal" ID="Button2" runat="server" Text="刪除" class="btn btn-danger" commandName="deleteItem" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('是否刪除項目？')"/>
                            </td>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <%--輸入資料Modal--%>
    <div id="InserDataModal" class="modal fade" tabindex="-1" aria-hidden="true" data-backdrop="static" data-keyboard="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-title">新增項目</div>
                    <button type="button" data-dismiss="modal" class="close"><span>&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="NewCashData">日期:<span class="TextPostion"><asp:TextBox ID="NewCashDateText" runat="server" type="date"></asp:TextBox></span></div>
                    <div class="NewCashData">發票號碼:<asp:TextBox ID="NewReceiptNumText" runat="server"></asp:TextBox></div>
                    <div class="NewCashData">用途:<asp:TextBox ID="NewCashUseText" runat="server"></asp:TextBox></div>
                    <div class="NewCashData">金額:<asp:TextBox ID="NewCashCostText" runat="server" TextMode="Number" min="0"></asp:TextBox></div>
                </div>
                <div class="modal-footer">
                    <button id="EditDataBtn" class="btn btn-success" onclick="return confirm('是否新增項目？')">新增</button>
                    <button class="btn btn-secondary">取消</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script>
     $(function () {
            $("#myDataTalbe").DataTable({
                "order": [[0, "desc"]]
            });
     });

    </script>
</asp:Content>
