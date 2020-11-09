<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="MyWebApplication.Purchase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <title></title>
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
        background-color:#444444;
        color:white;
    }
    .gvStyle {
    border-style:none;
    width:100%;
    }
    /*Header 標題*/
    .gvStyle th
    {
    background-color: #333;
    color:white;
    font-weight: lighter;
    border-bottom: 1px solid #ccc;
    height:25px;
    text-align:center;
    }
    /*OnMouseOver 滑鼠移過列表時, 背景色變更*/
    .gvStyle tr:hover
    {
    background-color:#DDDDDD;
    }
    /*Rows 列表顏色*/
    .gvStyle td
    {
    border-bottom: 1px solid #ccc;
    height:25px;
    text-align:center;
    }

    /*Page 分頁顏色*/
    .gvStyle .pgr table
    {
    
    }
    .gvStyle .pgr td
    {
    background-color:#E2EAF2;
    border-width: 0px;
    padding:0px 3px 0px 3px;
    }
    .gvStyle .pgr a
    {
    color: #666; text-decoration:underline;
    padding:0px 3px 0px 3px;
    }
    .gvStyle .pgr a:hover
    {
    color: #FF0000; text-decoration: none;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#menu70">產品庫存</a></li>
        </ul>

        <div class="tab-content">
        <!--公告欄#menu60-->
        <div id="menu70" class="tab-pane fade in active">
            <br />
            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" AutoPostBack="true"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="查詢" CssClass="btn" OnClick="Button1_Click" />
            <span style="float:right;">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/PurchaseOrder.aspx">採購單列表</asp:HyperLink>
                <br />
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AddPurchase.aspx">+新增採購單</asp:HyperLink>
            </span>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [Id], [Name], [Category], [Store], [safety] FROM [Product]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowDataBound="GridView1_RowDataBound" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Id", "PurchaseDetail.aspx?Id={0}") %>'>查詢</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="產品編號" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="產品名稱" SortExpression="Name"></asp:BoundField>
                    <asp:BoundField DataField="Category" HeaderText="類別" SortExpression="Category"></asp:BoundField>
                    <asp:BoundField DataField="Price" HeaderText="售價" SortExpression="Price"></asp:BoundField>
                    <asp:BoundField DataField="cost" HeaderText="成本" SortExpression="cost"></asp:BoundField>
                    <asp:BoundField DataField="Store" HeaderText="庫存" SortExpression="Store"></asp:BoundField>
                    <asp:BoundField DataField="Safety" HeaderText="安全存量" SortExpression="Safety"></asp:BoundField>
                    <asp:TemplateField HeaderText="差額"></asp:TemplateField>
                    <asp:TemplateField HeaderText="存貨警告"></asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        </div>
        </div>
    </form>
</body>
</html>
