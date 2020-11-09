<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyWebApplication.Login" %>
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
    <div style="text-align:center;">
    <h1>Login</h1>
    <hr />
    <label style="margin-right:150px;"><b>使用者帳號</b></label>
    <br />
    <asp:TextBox ID="id" runat="server" ></asp:TextBox>
    <br /><br />
    <label style="margin-right:210px;"><b>密碼</b></label>
    <br />
    <asp:TextBox ID="psw" runat="server" TextMode="Password"></asp:TextBox>
    <br />
    
    <br /><br />
    <asp:Button ID="btn_login" runat="server" CssClass="btn" Text="登入"  BackColor="#8fc31f"  BorderColor="#86b81b" BorderWidth="1px" ForeColor="White" OnClick="Btn_login_Click" />
    <br />
    <br />
    <asp:Button ID="btn_register" runat="server" CssClass="btn" Text="加入會員"  BackColor="#ffffff" BorderColor="Black" BorderWidth="1px" PostBackUrl="~/Register.aspx"/>    
</div>
</asp:Content>
