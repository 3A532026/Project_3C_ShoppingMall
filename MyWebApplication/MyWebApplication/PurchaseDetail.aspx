<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseDetail.aspx.cs" Inherits="MyWebApplication.PurchaseDetail" %>

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
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [Product] WHERE Id=@Id">
                <SelectParameters>
                    <asp:Parameter Name="Id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div>
        <h2>此產品下的採購單:</h2>
        <hr />
        <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#menu70">未收貨</a></li>
        <li ><a data-toggle="tab" href="#menu71">已收貨</a></li>
        </ul>

        <div class="tab-content">
        <!--公告欄#menu60-->
        <div id="menu70" class="tab-pane fade in active">
            <br />
            <span style="float:right;">
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/AddPurchase.aspx">+新增採購單</asp:HyperLink>
            </span>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Id", "PurchaseOrderDetail.aspx?Id={0}") %>'>查詢</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                    <asp:BoundField DataField="purchaseid" HeaderText="採購單編號" ReadOnly="True" SortExpression="purchaseid"></asp:BoundField>
                    <asp:BoundField DataField="supplierid" HeaderText="供應商編號" SortExpression="supplierid"></asp:BoundField>
                    <asp:BoundField DataField="supplier" HeaderText="供應商" SortExpression="supplier"></asp:BoundField>
                    <asp:BoundField DataField="userid" HeaderText="填表人" SortExpression="userid"></asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="填表日期" SortExpression="date"></asp:BoundField>
                    <asp:BoundField DataField="total" HeaderText="總金額" SortExpression="total"></asp:BoundField>
                    <asp:BoundField DataField="status" HeaderText="狀態" SortExpression="status"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [PurchaseOrder] WHERE (purchaseid=@purchaseid) AND (status=N'未收貨')">
                <SelectParameters>
                    <asp:Parameter Name="purchaseid" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="productid" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="purchaseid" runat="server" Visible="false"></asp:Label>
            </div>
            <div id="menu71" class="tab-pane fade">
            <br />
            <span style="float:right;">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AddPurchase.aspx">+新增採購單</asp:HyperLink>
            </span>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="purchaseid" DataSourceID="SqlDataSource3" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("purchaseid", "PurchaseOrderDetail.aspx?purchaseid={0}") %>'>查詢</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                    <asp:BoundField DataField="purchaseid" HeaderText="採購單編號" ReadOnly="True" SortExpression="purchaseid"></asp:BoundField>
                    <asp:BoundField DataField="supplierid" HeaderText="供應商編號" SortExpression="supplierid"></asp:BoundField>
                    <asp:BoundField DataField="supplier" HeaderText="供應商" SortExpression="supplier"></asp:BoundField>
                    <asp:BoundField DataField="userid" HeaderText="填表人" SortExpression="userid"></asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="填表日期" SortExpression="date"></asp:BoundField>
                    <asp:BoundField DataField="total" HeaderText="總金額" SortExpression="total"></asp:BoundField>
                    <asp:BoundField DataField="status" HeaderText="狀態" SortExpression="status"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [PurchaseOrder] WHERE (purchaseid=@purchaseid) AND (status=N'已收貨')">
                <SelectParameters>
                    <asp:Parameter Name="purchaseid" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
            </div>
            </div>
            <br />
            <asp:Button ID="Button1" runat="server" class="btn" Text="上一頁"  PostBackUrl="~/Purchase.aspx"/>
        </div>
    </form>
</body>
</html>
