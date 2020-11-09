<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MyWebApplication.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
    body {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    }
   input{
        border-radius:3px;
        border: 0.5px groove #000;
    }
   input:focus {
   border: 0.5px groove #808080;
   }
    .btn{
        border-radius: 5px;
        width:255px;
        font-size:20px;
    }
        </style>
    <div class="container text-center">
    <h1>Register</h1>
    <p>我們承諾尊重和保護您的隱私，您所提供的訊息將幫助我們提供您更完善的服務。</p>
    <hr />
    <label style="width:150px;"><b><span style="color:red;">*</span>使用者帳號</b></label>
    <asp:TextBox ID="id" runat="server" width="350px"></asp:TextBox>
    <br /><br />
    <label style="width:150px;"><b><span style="color:red;">*</span>姓名</b></label>
    <asp:TextBox ID="username" runat="server" width="350px"></asp:TextBox>
    <br /><br />
    <label style="width:150px;"><b><span style="color:red;">*</span>Email</b></label>
    <asp:TextBox ID="e_mail" runat="server" TextMode="Email" width="350px"></asp:TextBox>
        <br /><br />
    <label for="psw" style="width:150px;"><b><span style="color:red;">*</span>Password</b></label>
    <asp:TextBox ID="psw" runat="server" TextMode="Password" width="350px"></asp:TextBox>
    <br /><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="psw" ControlToValidate="re_psw"></asp:CompareValidator><br />
    <label for="re_psw" style="width:150px;"><b><span style="color:red;">*</span>Repeat Password</b></label>
    <asp:TextBox CssClass="mag" ID="re_psw" runat="server" TextMode="Password" width="350px" ></asp:TextBox>
        <br /><br />
    <asp:Button ID="btn_register" runat="server" class="btn" Text="加入會員"  BackColor="#8fc31f"  BorderColor="#86b81b" BorderWidth="1px" ForeColor="White" OnClick="btn_register_Click"/>    
</div>
</asp:Content>
