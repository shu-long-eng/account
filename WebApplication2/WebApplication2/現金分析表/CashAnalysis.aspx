<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CashAnalysis.aspx.cs" Inherits="WebApplication2.現金分析表.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../TableExport/table2excel.js"></script>

    <style>
        #content{
            margin-left:300px;
            width:75%;
        }
        td{
            padding:6px !important;
        }
        th{
            padding:6px !important;
        }
        .TableTitle{
            width:100px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron"><h1 class="display-4"><asp:Label ID="title" runat="server" Text="Label"></asp:Label>年現金分析表</h1></div>
    

<div id="content">
   

    <asp:DropDownList ID="yearSelect" runat="server" AutoPostBack="true">

    </asp:DropDownList>

    <span>年</span>
    <br />
    <button type="button" class="btn btn-success" id="mybtn">匯出EXCEL</button>

    <asp:Button ID="Button1" runat="server" Text="ExportExcel" OnClick="Button1_Click"/>
    <table class="table table-bordered table-hover table-striped" id="MoneyList">
        <thead>
            <tr>
                <th class="TableTitle">項目</th>
                <th>1月</th>
                <th>2月</th>
                <th>3月</th>
                <th>4月</th>
                <th>5月</th>
                <th>6月</th>
                <th>7月</th>
                <th>8月</th>
                <th>9月</th>
                <th>10月</th>
                <th>11月</th>
                <th>12月</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="TableTitle">月收入</td>
                <asp:Repeater ID="monthIncome" runat="server">
                    <ItemTemplate>
                        <td><%# Eval("moneylistIn")  %></td>
                    </ItemTemplate>
                </asp:Repeater>
            </tr>
            <tr>
                <td class="TableTitle">月支出</td>
                <asp:Repeater ID="monthExpenditure" runat="server">
                    <ItemTemplate>
                        <td><%# Eval("moneylistOut")  %></td>
                    </ItemTemplate>
                </asp:Repeater>
            </tr>
            <tr>
                <td class="TableTitle">月餘額</td>
                <asp:Repeater ID="monthBalance" runat="server">
                    <ItemTemplate>
                        <td><%# Eval("BalanceList")  %></td>
                    </ItemTemplate>
                </asp:Repeater>
            </tr>

            <tr>
                <td colspan="13" align="center">收入</td>
            </tr>

            <asp:Repeater ID="MonthSubIncome" runat="server">
                <ItemTemplate>
                    <tr>
                        <td class="TableTitle"><%# Eval("subType")  %></td>
                        <td><%# Eval("Jan")  %></td>
                        <td><%# Eval("Feb")  %></td>
                        <td><%# Eval("Mar")  %></td>
                        <td><%# Eval("Apr")  %></td>
                        <td><%# Eval("May")  %></td>
                        <td><%# Eval("Jun")  %></td>
                        <td><%# Eval("Jul")  %></td>
                        <td><%# Eval("Aug")  %></td>
                        <td><%# Eval("Sep")  %></td>
                        <td><%# Eval("Oct")  %></td>
                        <td><%# Eval("Nov")  %></td>
                        <td><%# Eval("Dec")  %></td>
                    </tr>


                </ItemTemplate>
            </asp:Repeater>

            <tr>
                <td colspan="13" align="center">支出</td>
            </tr>

            <asp:Repeater ID="MonthSubEx" runat="server">
                <ItemTemplate>
                    <tr>
                        <td class="TableTitle"><%# Eval("subType")  %></td>
                        <td><%# Eval("Jan")  %></td>
                        <td><%# Eval("Feb")  %></td>
                        <td><%# Eval("Mar")  %></td>
                        <td><%# Eval("Apr")  %></td>
                        <td><%# Eval("May")  %></td>
                        <td><%# Eval("Jun")  %></td>
                        <td><%# Eval("Jul")  %></td>
                        <td><%# Eval("Aug")  %></td>
                        <td><%# Eval("Sep")  %></td>
                        <td><%# Eval("Oct")  %></td>
                        <td><%# Eval("Nov")  %></td>
                        <td><%# Eval("Dec")  %></td>
                    </tr>


                </ItemTemplate>
            </asp:Repeater>








            


        </tbody>
    </table>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   <script>
       
          

       document.getElementById("mybtn").addEventListener('click', function () {
           var table2excel = new Table2Excel();
           table2excel.export(document.querySelectorAll("#MoneyList"));
       });

       
   </script>
</asp:Content>
