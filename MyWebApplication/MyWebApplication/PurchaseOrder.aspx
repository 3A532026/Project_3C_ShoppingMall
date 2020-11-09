<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseOrder.aspx.cs" Inherits="MyWebApplication.PurchaseOrder1" %>

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
        <li class="active"><a data-toggle="tab" href="#menu70">所有採購單</a></li>
        <li ><a data-toggle="tab" href="#menu71">未收貨</a></li>
        <li ><a data-toggle="tab" href="#menu72">已收貨</a></li>
        </ul>

        <div class="tab-content">
        <!--公告欄#menu60-->
        <div id="menu70" class="tab-pane fade in active">
            <br />
            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" AutoPostBack="true"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="查詢" CssClass="btn" OnClick="Button1_Click" />
            <br />
            <span style="float:right;">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AddPurchase.aspx">+新增採購採購單</asp:HyperLink>
            </span>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [PurchaseOrder]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="purchaseid" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
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
            </div>
            <div id="menu71" class="tab-pane fade">
            <br />
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="查詢" CssClass="btn" OnClick="Button3_Click" />
            <br />
            <span style="float:right;">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/AddPurchase.aspx">+新增採購採購單</asp:HyperLink>
            </span>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [PurchaseOrder]"></asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="purchaseid" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
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
            </div>
            <div id="menu72" class="tab-pane fade">
            <br />
            <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged" AutoPostBack="true"></asp:TextBox>
            <asp:Button ID="Button4" runat="server" Text="查詢" CssClass="btn" OnClick="Button4_Click" />
            <br />
            <span style="float:right;">
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/AddPurchase.aspx">+新增採購採購單</asp:HyperLink>
            </span>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [PurchaseOrder]"></asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="purchaseid" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
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
            </div>
            </div>
            <br />
            <asp:Button ID="Button2" runat="server" class="btn" Text="上一頁"  PostBackUrl="~/Purchase.aspx"/>
        </div>
    </form>
</body>
</html>
