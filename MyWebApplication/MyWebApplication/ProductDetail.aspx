<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="MyWebApplication.ProductDetail1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="Scripts/ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="Scripts/ckfinder/ckfinder.js" type="text/javascript"></script>
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
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#menu30">產品詳細資料</a></li>
        </ul>
        <div class="tab-content">
        <!--商品資料#menu30-->
        <div id="menu30" class="tab-pane fade in active">
        <br />
        <div style="float:right;width:50%;">
        <label style="width:150px;"><b>安全存量</b></label>
        <asp:TextBox ID="safetystock" runat="server"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>單位成本</b></label>
        <asp:TextBox ID="cost" runat="server"></asp:TextBox><span>元</span>
        <br />
        <label style="width:150px;"><b>售價</b></label>
        <asp:TextBox ID="price" runat="server"></asp:TextBox><span>元</span>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div>
        <label style="width:150px;"><b>產品編號</b></label>
        <asp:Label ID="id" runat="server"></asp:Label>
        <br />
        <label style="width:150px;"><b>產品名稱</b></label>
        <asp:TextBox ID="productname" runat="server"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>產品類別</b></label>
        <asp:DropDownList ID="ddcategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="categoryid"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        <br />
        <label style="width:150px;"><b>供應商</b></label>
        <asp:DropDownList ID="ddsupplier" runat="server" DataSourceID="SqlDataSource2" DataTextField="supplier" DataValueField="supplierid"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [Supplier]"></asp:SqlDataSource>
        <br />
        <label style="width:150px;"><b>產品封面照</b></label>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource3">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Picture")) %>' Height="250px" Width="350px"/>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [Picture] FROM [Product] WHERE Id=@Id">
            <SelectParameters>
                <asp:Parameter Name="Id"/>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:FileUpload ID="FileUpload1" runat="server"  />
        <br />
         <asp:Button ID="bb_update" runat="server" class="btn" Text="修改資料"  OnClick="bb_update_Click" />
        <asp:Button ID="bb_clear" runat="server" class="btn" Text="重設資料"  OnClick="bb_clear_Click" />
        <asp:Button ID="Button1" runat="server" class="btn" Text="上一頁"  PostBackUrl="~/Product.aspx"/>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>
        </div>
        </div>
        <script type="text/javascript">
        CKEDITOR.replace('<%=TextBox1.ClientID %>',{width:600,height:200} );
        </script>
        </div>
    </form>
</body>
</html>
