<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="測試model.aspx.cs" Inherits="WebApplication2.測試model" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <style>
        #confirm{
            margin-left:500px;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                     <p>日期:<input id="Text1" type="date"  /></p>
                     <p>科目:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></p>
                     <p id="textup">摘要:<textarea id="TextArea1" cols="20" rows="2"></textarea></p>
                     <p>金額:<asp:TextBox class="text" ID="TextBox4" runat="server"></asp:TextBox></p>
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
                        <asp:Button ID="Button1" runat="server" Text="是" class="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
        
        <button type="button" data-target="#myModal" data-toggle="modal" id="btn">按我</button>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    
    
    
    
    
    <script type="text/javascript">
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


</body>
</html>
