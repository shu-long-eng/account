<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="現金日記帳.aspx.cs" Inherits="WebApplication2.現金日記帳" %>

<%@ Register Src="~/UC新增日記帳.ascx" TagPrefix="uc1" TagName="UC新增日記帳" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />

    <style>
        #content{
            margin-top:85px;
            margin-left:300px;
            width:1100px;
        }
        #insert{
            margin-bottom:20px;
        }
        #confirm{
            margin-left:500px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UC新增日記帳 runat="server" id="UC新增日記帳" /> <%--使用者控制項--%>
    <div id="content">
        <div id="insert"><button type="button" data-target="#myModal" data-toggle="modal" id="btn" class="btn btn-primary">新增資料</button></div>
        <table id="myDataTalbe">
            <thead>
                <tr>
                    <th>No</th>
                    <th>日期</th>
                    <th>科目</th>
                    <th>摘要</th>
                    <th>金額</th>
                    <th>收/支</th>
                    <th>餘額</th>
                    <th>刪除/修改</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("ID") %></td>
                            <td><%#Eval("日期") %></td>
                            <td><%#Eval("科目") %></td>
                            <td><%#Eval("摘要") %></td>
                            <td><%#Eval("金額") %></td>
                            <td><%#Eval("收/支") %></td>
                            <td><%#Eval("餘額") %></td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="修改" />
                                <asp:Button ID="Button2" runat="server" Text="刪除" commandName="deleteItem" CommandArgument='<%# Eval("ID") %>'/>
                            </td>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!--引用jQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!--引用dataTables.js-->
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
     
    <script type="text/javascript">
        $(function () {
            $("#myDataTalbe").DataTable({
  
             
            });
        });

        document.getElementById("btn").onclick = function () {
            $("#myModel").modal('show');
            

        }


        document.getElementById("confirmBtn").onclick = function () {
            $("#confirm").modal('show');
        }
        $(function () {
            $('#Text1').datepicker();
        });
    </script>
</asp:Content>
