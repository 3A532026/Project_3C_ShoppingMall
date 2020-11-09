<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="MyWebApplication.Product" ValidateRequest="False" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="Scripts/ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="Scripts/ckfinder/ckfinder.js" type="text/javascript"></script>
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
    <li class="active"><a data-toggle="tab" href="#menu30">產品資料</a></li>
    <li><a data-toggle="tab" href="#menu31">新增產品</a></li>
    </ul>

    <div class="tab-content">
    <!--商品資料#menu30-->
    <div id="menu30" class="tab-pane fade in active">
        <br />
        <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查詢" CssClass="btn" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCommand="GridView1_RowCommand" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Id", "ProductDetail.aspx?Id={0}") %>'>查詢</asp:HyperLink>
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Bdelete" CommandArgument='<%#Eval("Id") %>' OnClientClick="return confirm('確定要刪除這筆記錄嗎?');">刪除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="Label1" runat="server" Text="修改狀態"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="start" CommandArgument='<%#Eval("Id") %>'>上架</asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="stop" CommandArgument='<%#Eval("Id") %>'>下架</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Id" HeaderText="商品編號" SortExpression="Id" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="名稱" SortExpression="Name"></asp:BoundField>
                <asp:BoundField DataField="Category" HeaderText="類別" SortExpression="Category"></asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="售價" SortExpression="Price"></asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="成本" SortExpression="Price"></asp:BoundField>
                <asp:BoundField DataField="Store" HeaderText="庫存" SortExpression="Store"></asp:BoundField>
                <asp:BoundField DataField="Supplier" HeaderText="供應商" SortExpression="Supplier"></asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="狀態" SortExpression="Status"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [Id], [Name],[Category], [Price], [Price], [Store], [Supplier],[Status] FROM [Product]"></asp:SqlDataSource>
        </div>
        <!--新增商品#menu31-->
        <div id="menu31" class="tab-pane fade">
        <br />
        <span style="float:right;width:50%">
        <label  style="width:150px;"><b>轉入庫存數量</b></label>
        <asp:TextBox ID="inventory" runat="server" width="350px"></asp:TextBox><span>件</span>
        <br />
        <label  style="width:150px;"><b>安全存量</b></label>
        <asp:TextBox ID="safetystock" runat="server" width="350px" ></asp:TextBox><span>件</span>
        <br />
        <label  style="width:150px;"><b>單位成本</b></label>
        <asp:TextBox ID="cost" runat="server" width="350px" ></asp:TextBox><span>元</span>
        <br />
        <label  style="width:150px;"><b>售價</b></label>
        <asp:TextBox ID="price" runat="server" width="350px" ></asp:TextBox><span>元</span>
        </span>
        <label  style="width:150px;"><b>商品名稱</b></label>
        <asp:TextBox ID="productname" runat="server" width="350px"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>商品類別</b></label>
        <asp:DropDownList ID="ddcategory" runat="server" DataSourceID="SqlDataSource2" DataTextField="category" DataValueField="categoryid"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        <br />
        <label  style="width:150px;"><b>供應商</b></label>
        <asp:DropDownList ID="ddsupplier" runat="server" DataSourceID="SqlDataSource3" DataTextField="supplier" DataValueField="supplierid"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [Supplier]"></asp:SqlDataSource>
        <br />
        <label  style="width:150px;"><b>商品封面照</b></label>
        <asp:FileUpload ID="FileUpload1" runat="server"  />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="100px" Height="100px"></asp:TextBox>
        <br />
         <asp:Button ID="btn_add2" runat="server" CssClass="btn" Text="新增資料"  OnClick="Btn_add2_Click"/>
        <asp:Button ID="clear" runat="server" CssClass="btn" Text="重設資料"  OnClick="Clear_Click"/>
      </div>
    </div>
        </div>
        </form>
    <script type="text/javascript">
        CKEDITOR.replace('<%=TextBox1.ClientID %>',{width:1000,height:150});
    </script>
</body>
</html>
