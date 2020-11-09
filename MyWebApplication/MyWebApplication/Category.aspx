<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="MyWebApplication.Category" %>

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
        <li class="active"><a data-toggle="tab" href="#menu20">產品類別資料</a></li>
        </ul>
        <div class="tab-content">
        <!--商品類別資料#menu20-->
        <div id="menu20" class="tab-pane fade in active">
        <br />
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查詢" CssClass="btn" OnClick="Button1_Click" />
        <br />
        <span style="float:right;">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">+新增商品類別資料</asp:LinkButton>
        <asp:Panel ID="Panel1" runat="server" Visible="false">
        <label for="categ" style="width:150px;"><b>類別名稱</b></label>
        <asp:TextBox ID="categ" runat="server" width="350px"></asp:TextBox>
        <asp:Button ID="add_categ" runat="server" class="btn" Text="新增資料" OnClick="add_categ_Click"/>
        </asp:Panel>
        </span>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="categoryid" OnRowCommand="GridView1_RowCommand" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
        <Columns>  
            <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("categoryid", "CategoryDetail.aspx?categoryid={0}") %>'>查詢</asp:HyperLink>
                        <br />
                        <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Bdelete" CommandArgument='<%#Eval("categoryid") %>' OnClientClick="return confirm('確定要刪除這筆類別嗎?');">刪除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:BoundField DataField="categoryid" HeaderText="類別編號" InsertVisible="False" ReadOnly="True" SortExpression="categoryid" />
            <asp:BoundField DataField="category" HeaderText="類別名稱" SortExpression="Category" />
        </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        <hr />
        <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Size="Larger" Visible="false" >無法刪除!該類別尚有以下商品...</asp:Label>
            <br />
            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="productid" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="productid" HeaderText="商品編號" ReadOnly="True" InsertVisible="False" SortExpression="productid"></asp:BoundField>
                    <asp:BoundField DataField="productname" HeaderText="商品名稱" SortExpression="productname"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [productid], [productname] FROM [Products] WHERE [categoryid]=@categoryid">
                <SelectParameters>
                <asp:Parameter Name="categoryid"/>
            </SelectParameters>
            </asp:SqlDataSource>
        </div>
      </div>
    </div>
    </form>
</body>
</html>
