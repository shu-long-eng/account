<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucNav.ascx.cs" Inherits="WebApplication2.ucNav" %>

 <div class="sidebar-header">

            
                <div class="sidebar-header">

                    <h3>財務管理系統</h3>
                </div>

                <ul class="list-unstyled components">

                    <p>功能表</p>
                    
                    <li class="list-group-item list-group-item-action list-group-item-primary">
                        <a href="../現金日記帳.aspx">現金日記帳</a>
                    </li>

                    <li class="list-group-item list-group-item-action list-group-item-primary">
                        <a href="../現金分析表/CashAnalysis.aspx">現金分析表</a>
                    </li>

                    

                   <li class="list-group-item list-group-item-action list-group-item-primary">
                        <a href="../PettyCashList.aspx">零用金</a>
                    </li>

                    <%--<li class="list-group-item list-group-item-action list-group-item-primary">
                        <a href="#">稅務資料</a>
                    </li>--%>
                     <li class="list-group-item list-group-item-action list-group-item-primary">
                        <a href="../ReceiptList.aspx">稅務管理</a>
                    </li>

                    

                     <li class="list-group-item list-group-item-action list-group-item-primary">                 
                         <asp:PlaceHolder ID="LoginPlc" runat="server" Visible="false">
                         <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">登出</asp:LinkButton>
                         </asp:PlaceHolder> 
                         <asp:PlaceHolder ID="LogoutPlc" runat="server" Visible="false">
                             <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">登入</asp:LinkButton>
                         </asp:PlaceHolder>
                    </li>

                </ul>
     </div>