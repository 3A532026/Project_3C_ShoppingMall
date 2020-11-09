<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseOrderDetail.aspx.cs" Inherits="MyWebApplication.PurchaseOrderDetail" %>

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
             <div class="well" style="border-bottom: 2px solid #90c31f;">
                採購單編號 <asp:Label ID="purchaseid" runat="server"></asp:Label>
                 <span style="float:right;">
                    <asp:Button ID="Button2" runat="server" Text="收貨" CssClass="btn" OnClick="Button2_Click"/>
                </span>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="purchaseid" DataSourceID="SqlDataSource1" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="purchaseid" HeaderText="採購單編號" ReadOnly="True" SortExpression="purchaseid"></asp:BoundField>
                    <asp:BoundField DataField="supplierid" HeaderText="供應商編號" SortExpression="supplierid"></asp:BoundField>
                    <asp:BoundField DataField="supplier" HeaderText="供應商" SortExpression="supplier"></asp:BoundField>
                    <asp:BoundField DataField="userid" HeaderText="填表人" SortExpression="userid"></asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="填表日期" SortExpression="date"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [PurchaseOrder] WHERE (purchaseid=@purchaseid)">
                <SelectParameters>
                    <asp:Parameter Name="purchaseid" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' UpdateCommand="Update [Product] set Store=@Store where Id = @Id">
                <UpdateParameters>
                    <asp:Parameter Name="Store"/>
                    <asp:Parameter Name="Id"/>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Label ID="status" runat="server" Visible="false"></asp:Label>
            <br />
            <div class="well" style="border-bottom: 2px solid #90c31f;">進貨明細</div>
            <label style="width:150px;"><b>總金額</b></label>
            <asp:Label ID="total" runat="server"></asp:Label>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="pruchasedetailid" DataSourceID="SqlDataSource2" OnRowDataBound="GridView2_RowDataBound" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="productid" HeaderText="產品編號" SortExpression="productid"></asp:BoundField>
                    <asp:BoundField DataField="product" HeaderText="產品名稱" SortExpression="product"></asp:BoundField>
                    <asp:BoundField DataField="cost" HeaderText="成本單價" SortExpression="cost"></asp:BoundField>
                    <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity"></asp:BoundField>
                    <asp:TemplateField HeaderText="小計"></asp:TemplateField>
                    <asp:TemplateField HeaderText="存貨" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="inv" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="相加" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="subinv" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [PurchaseOrderDetail] WHERE purchaseid=@purchaseid">
                <SelectParameters>
                    <asp:Parameter Name="purchaseid" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="Button1" runat="server" class="btn" Text="回採購單列表"  PostBackUrl="~/PurchaseOrder.aspx"/>
        </div>
    </form>
</body>
</html>
