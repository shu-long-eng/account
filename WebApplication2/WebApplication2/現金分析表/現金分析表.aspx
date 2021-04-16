<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="現金分析表.aspx.cs" Inherits="WebApplication2.現金分析表.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #content{
            margin-left:300px;
            width:75%;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron"><h1 class="display-4"><asp:Label ID="title" runat="server" Text="Label"></asp:Label>年現金分析表</h1></div>
    

<div id="content">
    <asp:DropDownList ID="yearSelect" runat="server"  OnSelectedIndexChanged="yearSelect_SelectedIndexChanged" AutoPostBack="True">
        <asp:ListItem Value="2021">2021</asp:ListItem>
        <asp:ListItem Value="2022">2022</asp:ListItem>
        <asp:ListItem Value="2023">2023</asp:ListItem>
        <asp:ListItem Value="2024">2024</asp:ListItem>
    </asp:DropDownList><span>年</span>
    <br />
    <button type="button" class="btn btn-success">匯出EXCEL</button>
    <table class="table table-bordered table-hover table-striped">
        <thead>
            <tr>
                <th>項目</th>
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
                <td>月收入</td>
                <asp:Repeater ID="monthIncome" runat="server">
                    <ItemTemplate>
                        <td><%# Eval("monthInOut")  %></td>
                    </ItemTemplate>
                </asp:Repeater>
            </tr>
            <tr>
                <td>月支出</td>
                <asp:Repeater ID="monthExpenditure" runat="server">
                    <ItemTemplate>
                        <td><%# Eval("monthInOut")  %></td>
                    </ItemTemplate>
                </asp:Repeater>
            </tr>
            <tr>
                <td>月餘額</td>
                <asp:Repeater ID="monthBalance" runat="server">
                    <ItemTemplate>
                        <td><%# Eval("balance")  %></td>
                    </ItemTemplate>
                </asp:Repeater>
            </tr>

            <tr>
                <td colspan="13" align="center">收入</td>
            </tr>


            <%--<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("SubList")  %></td>
                        <asp:Repeater ID="Repeater2" runat="server"><ItemTemplate><td><%# Eval("balance")  %></td></ItemTemplate></asp:Repeater>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>--%>




        </tbody>
    </table>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   
</asp:Content>
