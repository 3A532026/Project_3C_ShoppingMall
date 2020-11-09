<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="MyWebApplication.Supplier" %>

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
        <li class="active"><a data-toggle="tab" href="#menu40">供應商資料</a></li>
        <li><a data-toggle="tab" href="#menu41">新增供應商</a></li>
        </ul>

        <div class="tab-content">
        <!--供應商資料#menu40-->
        <div id="menu40" class="tab-pane fade in active">
            <br />
            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" AutoPostBack="true"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="查詢" CssClass="btn" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="supplierid" OnRowCommand="GridView1_RowCommand" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("supplierid", "SupplierDetail.aspx?supplierid={0}") %>'>查詢</asp:HyperLink>
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Bdelete" CommandArgument='<%#Eval("supplierid") %>' OnClientClick="return confirm('確定要刪除這個供應商嗎?');">刪除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="supplierid" HeaderText="供應商編號" InsertVisible="False" ReadOnly="True" SortExpression="supplierid" />
                <asp:BoundField DataField="supplier" HeaderText="名稱" SortExpression="supplier" />
                <asp:BoundField DataField="phone" HeaderText="聯絡方式" SortExpression="phone" />
                <asp:BoundField DataField="email" HeaderText="電子郵件" SortExpression="email" />
                <asp:BoundField DataField="address" HeaderText="住址" SortExpression="address" />
        </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [Supplier]"></asp:SqlDataSource>
            <hr />
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Size="Larger" Visible="false" >無法刪除!該供應商尚有提供以下商品...</asp:Label>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="商品編號" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="商品名稱" SortExpression="Name"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [Id], [productname] FROM [Product] WHERE [supplierid]=@supplierid">
                <SelectParameters>
                <asp:Parameter Name="supplierid"/>
            </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <!--新增供應商#menu41-->
        <div id="menu41" class="tab-pane fade">
        <br />
        <label style="width:150px;"><b>供應商名稱</b></label>
        <asp:TextBox ID="suppliername" runat="server" width="350px"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>聯絡方式</b></label>
        <asp:TextBox ID="supplierphone" runat="server" width="350px"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>Email</b></label>
        <asp:TextBox ID="supplieremail" runat="server" width="350px"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>地址</b></label>
        <asp:TextBox ID="supplieraddress" runat="server" width="350px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btn_add_supplier" runat="server" class="btn" Text="新增資料" OnClick="btn_add_supplier_Click"/>
        <asp:Button ID="btn_clear2" runat="server" class="btn" Text="重設資料" OnClick="btn_clear2_Click"/>
        </div>
      </div>
        </div>
    </form>
</body>
</html>
