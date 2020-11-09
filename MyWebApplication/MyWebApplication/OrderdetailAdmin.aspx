<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderdetailAdmin.aspx.cs" Inherits="MyWebApplication.OrderdetailAdmin1" %>

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
                訂單編號<asp:Label runat="server" ID="orderid" />
                <span style="float:right;">
                    <asp:Button ID="Button1" runat="server" Text="上一頁" CssClass="btn" PostBackUrl="~/Order.aspx"/>
                </span>
            </div>
            <span style="float:right;width:50%;padding-left:50px;">
            <label style="width:150px;"><b>消費日期</b></label>
            <asp:Label ID="purchasedate" runat="server"></asp:Label>
            <br />
            <label style="width:150px;"><b>交易方式</b></label>
            <asp:Label ID="paytype" runat="server"></asp:Label>
            <br />
                <label style="width:150px;"><b>交易狀態</b></label>
                <br />
                <asp:Image ID="Image1" runat="server" Width="400" Height="250"/>
                <br />
                <br />
                <asp:Button ID="btn1" runat="server" Text="出貨" Visible="false" CssClass="btn" OnClick="Btn1_Click"/>
                <asp:Button ID="btn2" runat="server" Text="收款" Visible="false" CssClass="btn" OnClick="Btn2_Click"/>
                <asp:Button ID="btn3" runat="server" Text="結案" Visible="false" CssClass="btn" OnClick="Btn3_Click"/>
            </span>
            <span style="clear:both;"><b>訂購人資訊</b></span>
            <br />
            <label style="width:150px;"><b>使用者帳號</b></label>
            <asp:Label ID="userid" runat="server"></asp:Label>
            <br />
            <label style="width:150px;"><b>姓名</b></label>
            <asp:Label ID="name" runat="server"></asp:Label>
            <br />
            <label style="width:150px;"><b>Email</b></label>
            <asp:Label ID="email" runat="server"></asp:Label>
            <br />
            <label style="width:150px;"><b>聯絡方式</b></label>
            <asp:Label ID="phone" runat="server"></asp:Label>
            <br />
            <label style="width:150px;"><b>聯絡地址</b></label>
            <asp:Label ID="address" runat="server"></asp:Label>
            <br />
            <hr style="float:left;width:50%" />
            <span style="clear:both;"><b>收件人資訊</b></span>
            <br />
            <label style="width:150px;"><b>姓名</b></label>
            <asp:Label ID="takename" runat="server"></asp:Label>
            <br />
            <label style="width:150px;"><b>Email</b></label>
            <asp:Label ID="takeemail" runat="server"></asp:Label>
            <br />
            <label style="width:150px;"><b>聯絡方式</b></label>
            <asp:Label ID="takephone" runat="server"></asp:Label>
            <br />
            <label style="width:150px;"><b>收貨地點</b></label>
            <asp:Label ID="takeaddress" runat="server"></asp:Label>
            <br />
            <br />
            <div class="well" style="border-bottom: 2px solid #90c31f;">訂單明細</div>
            <label style="width:150px;"><b>總金額</b></label>
            <asp:Label ID="total" runat="server"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [OrderDetail] WHERE orderid=@orderid">
                <SelectParameters>
                    <asp:Parameter Name="orderid"/>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="orderdetailid" DataSourceID="SqlDataSource1" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="orderid" HeaderText="商品編號" SortExpression="orderid"></asp:BoundField>                 
                    <asp:TemplateField HeaderText="商品名稱"></asp:TemplateField>
                    <asp:TemplateField HeaderText="售價"></asp:TemplateField>
                    <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity"></asp:BoundField>
                    <asp:TemplateField HeaderText="小計"></asp:TemplateField>
                    <asp:TemplateField HeaderText="庫存" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="inv" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="出貨後剩餘庫存" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="subinv" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [Product]" UpdateCommand="Update [Product] set inventory=@inventory where productid = @productid">
                <UpdateParameters>
                    <asp:Parameter Name="Store"/>
                    <asp:Parameter Name="Id"/>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Label ID="status" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="deliver_status" runat="server" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
