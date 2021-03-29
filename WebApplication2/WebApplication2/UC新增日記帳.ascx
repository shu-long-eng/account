<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC新增日記帳.ascx.cs" Inherits="WebApplication2.UC確認頁面" %>

<div class="modal fade" id="myModel" data-backdrop="static">
         <div class="modal-dialog modal-sm">
             <div class="modal-content">
                 <div class="modal-header">
                     <div class="modal-title ">
                        <h6>新增資料</h6>
                     </div>
                     <button type="button" class="close" data-dismiss="modal">
                         <span>&times;</span>
                     </button>
                 </div>
                 <div class="modal-body">
                     <p>日期: <asp:TextBox ID="TextBox1" runat="server" type="date"></asp:TextBox></p>
                     <p>科目: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></p>
                     <p id="textup">摘要: <asp:TextBox ID="TextBox3" runat="server" type="textarea"></asp:TextBox></p>
                     <p>金額: <asp:TextBox class="text" ID="TextBox4" runat="server" onkeyup="value=value.replace(/[^\d]/g,'') " ></asp:TextBox></p>
                     <p>收/支:
                     <asp:DropDownList ID="DropDownList1" runat="server">
                         <asp:ListItem>收入</asp:ListItem>
                         <asp:ListItem>支出</asp:ListItem>
                     </asp:DropDownList>
                         </p>
                 </div>
                 <div class="modal-footer">
                     <button class="btn btn-secondary" data-dismiss="modal">取消</button>
                     <button type="button" class="btn btn-primary" data-target="confirm" data-toggle="modal" id="confirmBtn">儲存</button>
                 </div>
             </div>
         </div> 
     </div>
<div class="modal fade modal-sm" id="confirm" role="dialog" data-backdrop="static" >
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="popover-header">
                        <div class="modal-title">
                            確認
                        </div>
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                    </div>
                    <div class="modal-body">
                        是否要新增資料
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">否</button>
                        <asp:Button ID="Button1" runat="server" Text="是" class="btn btn-primary" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
        </div>