<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CashListPage.aspx.cs" Inherits="WebApplication2.零用金表.CashListPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .jumbotron{
            margin:0;
        }
        #content{
            
            margin-left:300px;
            width:1100px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div class="jumbotron"><h1 class="display-4">零用金表</h1></div>
    <div id="content">
    <asp:Button ID="NewDate" CssClass="btn btn-primary" runat="server" Text="新增資料" />
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
