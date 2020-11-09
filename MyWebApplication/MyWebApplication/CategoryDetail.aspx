<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryDetail.aspx.cs" Inherits="MyWebApplication.CategoryDetail1" %>

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
        <li class="active"><a data-toggle="tab" href="#menu20">類別資料</a></li>
        </ul>
        <div class="tab-content">
        <!--商品類別資料#menu20-->
        <div id="menu20" class="tab-pane fade in active">
        <br />
    <asp:TextBox ID="categ" runat="server" width="350px"></asp:TextBox>
    <asp:Button ID="add" runat="server" class="btn" Text="修改資料" OnClick="add_Click"/>
    <asp:Button ID="clear" runat="server" class="btn" Text="重設資料"  OnClick="clear_Click"/>
    <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
    <br />
    <hr />
    <h3>此類別下商品:</h3>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="商品編號" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="名稱" SortExpression="Name"></asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="售價" SortExpression="Price"></asp:BoundField>
            <asp:BoundField DataField="cost" HeaderText="成本" SortExpression="cost"></asp:BoundField>
            <asp:BoundField DataField="Store" HeaderText="庫存" SortExpression="Store"></asp:BoundField>
            <asp:BoundField DataField="Category" HeaderText="類別" SortExpression="Category"></asp:BoundField>
            <asp:BoundField DataField="Safety" HeaderText="安全存量" SortExpression="Safety"></asp:BoundField>
            <asp:BoundField DataField="supplier" HeaderText="供應商" SortExpression="supplier"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [Product] WHERE [categoryid]=@categoryid">
                <SelectParameters>
                <asp:Parameter Name="categoryid"/>
            </SelectParameters>
            </asp:SqlDataSource>
        <br />
        <span style="float:right;">
        <asp:Button ID="Button1" runat="server" class="btn" Text="上一頁" PostBackUrl="~/Category.aspx"/>
        </span>
        </div>
        </div>
        </div>
    </form>
</body>
</html>
