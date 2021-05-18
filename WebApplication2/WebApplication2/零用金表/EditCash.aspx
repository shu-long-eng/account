<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditCash.aspx.cs" Inherits="WebApplication2.零用金表.EditCash" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #content{
            margin-left:300px;
            border:1px solid;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        日期:<asp:TextBox ID="CashDateText" runat="server"></asp:TextBox><br />
        用途:<asp:TextBox ID="CashUseText" runat="server"></asp:TextBox><br />
        金額:<asp:TextBox ID="CashCostText" runat="server"></asp:TextBox>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
