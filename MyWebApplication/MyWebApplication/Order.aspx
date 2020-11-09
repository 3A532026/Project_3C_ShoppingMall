<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="MyWebApplication.Order" %>

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
    <li class="active"><a data-toggle="tab" href="#menu50">所有資料</a></li>
        <li><a data-toggle="tab" href="#menu51">未出貨</a></li>
    <li><a data-toggle="tab" href="#menu52">已出貨</a></li>
    <li><a data-toggle="tab" href="#menu53">已結案</a></li>
    </ul>

    <div class="tab-content">
    <!--所有資料#menu50-->
    <div id="menu50" class="tab-pane fade in active">
        <br />
        <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查詢" CssClass="btn" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [orderid], [purchasedate], [total], [paytype], [status], [deliver_status] FROM [Orders]"></asp:SqlDataSource>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="orderid"  CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center" >
            <Columns>
                <asp:TemplateField HeaderText="查詢">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" Text="查詢" DataField="orderid" SortExpression="orderid" NavigateUrl='<%# Eval("orderid", "OrderdetailAdmin.aspx?orderid={0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="orderid" HeaderText="訂單編號" ReadOnly="True" SortExpression="orderid"></asp:BoundField>
                <asp:BoundField DataField="purchasedate" HeaderText="消費日期" SortExpression="purchasedate"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="消費總額" SortExpression="total"></asp:BoundField>
                <asp:BoundField DataField="paytype" HeaderText="付款方式" SortExpression="paytype"></asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="付款方式" SortExpression="status"></asp:BoundField>
                <asp:BoundField DataField="deliver_status" HeaderText="出貨狀態" SortExpression="deliver_status"></asp:BoundField>
            </Columns>
        </asp:GridView>  
    </div>
    <!--未出貨#menu51-->
    <div id="menu51" class="tab-pane fade">
        <br />
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox2_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="查詢" CssClass="btn" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [orderid],[purchasedate], [total], [paytype], [deliver_status] FROM [Order] WHERE deliver_status=N'未出貨' ORDER BY [purchasedate] DESC"></asp:SqlDataSource>
    </div>
    <!--已出貨#menu52-->
    <div id="menu52" class="tab-pane fade">
        <br />
        <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:Button ID="Button3" runat="server" Text="查詢" CssClass="btn" OnClick="Button3_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
            <Columns>
                <asp:TemplateField HeaderText="查詢">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" Text="查詢" DataField="orderid" SortExpression="orderid" Target="_top" NavigateUrl='<%# Eval("orderid", "OrderdetailAdmin.aspx?orderid={0}") %>' ></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="orderid" HeaderText="訂單編號" SortExpression="orderid"></asp:BoundField>
                <asp:BoundField DataField="purchasedate" HeaderText="消費日期" SortExpression="purchasedate"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="消費總額" SortExpression="total"></asp:BoundField>
                <asp:BoundField DataField="paytype" HeaderText="付款方式" SortExpression="paytype"></asp:BoundField>
                <asp:BoundField DataField="deliver_status" HeaderText="出貨狀態" SortExpression="deliver_status"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [orderid],[purchasedate], [total], [paytype], [deliver_status] FROM [Order] WHERE deliver_status=N'已出貨' ORDER BY [purchasedate] DESC"></asp:SqlDataSource>
    </div>
    <!--已結案#menu53-->
    <div id="menu53" class="tab-pane fade">
        <br />
        <asp:TextBox ID="TextBox4" runat="server" OnTextChanged="TextBox4_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:Button ID="Button4" runat="server" Text="查詢" CssClass="btn" OnClick="Button4_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"  CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
            <Columns>
                <asp:TemplateField HeaderText="查詢">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" Text="查詢" DataField="orderid" SortExpression="orderid" Target="_top" NavigateUrl='<%# Eval("orderid", "OrderdetailAdmin.aspx?orderid={0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="orderid" HeaderText="訂單編號" SortExpression="orderid"></asp:BoundField>
                <asp:BoundField DataField="purchasedate" HeaderText="消費日期" SortExpression="purchasedate"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="消費總額" SortExpression="total"></asp:BoundField>
                <asp:BoundField DataField="paytype" HeaderText="付款方式" SortExpression="paytype"></asp:BoundField>
                <asp:BoundField DataField="deliver_status" HeaderText="出貨狀態" SortExpression="deliver_status"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:sqldatasource id="SqlDataSource3" runat="server" connectionstring='<%$ ConnectionStrings:ConnectionString2 %>' selectcommand="SELECT [orderid],[purchasedate], [total], [paytype], [deliver_status] FROM [Order] WHERE deliver_status=N'已結案' ORDER BY [purchasedate] DESC"></asp:sqldatasource>
        </div>
      </div>
      </div>
    </form>
</body>
</html>
