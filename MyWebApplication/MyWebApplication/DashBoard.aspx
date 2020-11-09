<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="MyWebApplication.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"/>
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#accordion" ).accordion();
      });
  </script>
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
        <div id="accordion">
    <h3>系統公告欄</h3>
    <div>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [BulletinBoard] WHERE category=N'系統'"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="bulletinid"  CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                     <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("bulletinid", "bulletinBoard.aspx?bulletinid={0}") %>'>查詢</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                    <asp:BoundField DataField="bulletin" HeaderText="標題" SortExpression="bulletin" />
                    <asp:BoundField DataField="time" HeaderText="發佈時間" SortExpression="time" />
                    <asp:BoundField DataField="Userid" HeaderText="發佈者" SortExpression="Userid" />
                </Columns>
            </asp:GridView>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Bulletin.aspx">+更多公告</asp:HyperLink>
    </p>
    </div>
    <h3>產品庫存不足</h3>
    <div>
    <p>    
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnRowDataBound="GridView2_RowDataBound" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                    <Columns>
                        <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Id", "PurchaseDetail.aspx?Id={0}") %>'>查詢</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="產品編號" ReadOnly="True" InsertVisible="False" SortExpression="productid"></asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="產品名稱" SortExpression="productname"></asp:BoundField>
                    <asp:BoundField DataField="Category" HeaderText="類別" SortExpression="category"></asp:BoundField>
                    <asp:BoundField DataField="Price" HeaderText="售價" SortExpression="price"></asp:BoundField>
                    <asp:BoundField DataField="Cost" HeaderText="成本" SortExpression="cost"></asp:BoundField>
                    <asp:BoundField DataField="Store" HeaderText="庫存" SortExpression="inventory"></asp:BoundField>
                    <asp:BoundField DataField="Safety" HeaderText="安全存量" SortExpression="safetystock"></asp:BoundField>
                    <asp:TemplateField HeaderText="差額"></asp:TemplateField>
                    <asp:TemplateField HeaderText="存貨警告"></asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [Product] WHERE Store<=Safety"></asp:SqlDataSource>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Product.aspx">+更多產品</asp:HyperLink>
       </p>
    </div>
    <h3>收到訂單</h3>
    <div>
    <p>    
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="orderid" DataSourceID="SqlDataSource3" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                <asp:TemplateField HeaderText="查詢">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" Text="查詢" DataField="orderid" SortExpression="orderid" NavigateUrl='<%# Eval("orderid", "OrderdetailAdmin.aspx?orderid={0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="orderid" HeaderText="訂單編號" SortExpression="orderid"></asp:BoundField>
                <asp:BoundField DataField="purchasedate" HeaderText="消費日期" SortExpression="purchasedate"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="消費總額" SortExpression="total"></asp:BoundField>
                <asp:BoundField DataField="paytype" HeaderText="付款方式" SortExpression="paytype"></asp:BoundField>
                <asp:BoundField DataField="deliver_status" HeaderText="出貨狀態" SortExpression="deliver_status"></asp:BoundField>
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [Orders] WHERE deliver_status=N'未出貨' Order by Purchasedate ASC"></asp:SqlDataSource>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Order.aspx">+更多訂單</asp:HyperLink>
       </p>
    </div>
    <h3>採購單進貨</h3>
    <div>
    <p>    
            <asp:GridView ID="GridView4" runat="server" DataSourceID="SqlDataSource4" AutoGenerateColumns="False" DataKeyNames="purchaseid">
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [PurchaseOrder] WHERE status=N'未出貨' Order by date ASC"></asp:SqlDataSource>
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/PurchaseOrder.aspx">+更多採購單</asp:HyperLink>
        </p>
    </div>
    </div>
    </form>
</body>
</html>
