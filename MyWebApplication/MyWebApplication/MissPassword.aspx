<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MissPassword.aspx.cs" Inherits="MyWebApplication.MissPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
    body {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    }
    input:focus {
    border: 3px solid #555;
    }
    .btn{
        border-radius: 5px;
        width:255px;
        font-size:20px;
    }
        </style>
    <div class="container text-center">   
    <h1>忘記密碼</h1>
    <hr />
    <label style="margin-right:150px;"><b>使用者帳號</b></label>
    <br />
    <asp:TextBox ID="id" runat="server" ></asp:TextBox>
    <br /><br />
    <label style="margin-right:200px;"><b>Email</b></label>
    <br />
    <asp:TextBox ID="email" runat="server" TextMode="Email" ></asp:TextBox>
    <br /><br />
    <asp:Button ID="submit" runat="server" class="btn" Text="寄送新密碼"  BackColor="#8fc31f"  BorderColor="#86b81b" BorderWidth="1px" ForeColor="White" OnClick="submit_Click"/>
    <br />
    <br />
    <asp:Button ID="btn_register" runat="server" class="btn" Text="加入會員"  BackColor="#ffffff" BorderColor="Black" BorderWidth="1px" PostBackUrl="~/Register.aspx"/>
</div>
</asp:Content>
