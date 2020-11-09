<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SuccessMail.aspx.cs" Inherits="MyWebApplication.SuccessMail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <style type="text/css">
    body {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    }
     </style>
    <div class="container text-center">   
        <h1 style="font-family:Microsoft JhengHei;color:dimgray;">請進行郵件驗證</h1>
        <hr />
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://mail.google.com/mail/u/0/#inbox" Font-Size="X-Large">>>驗證郵件<<</asp:HyperLink>
    </div>
</asp:Content>
