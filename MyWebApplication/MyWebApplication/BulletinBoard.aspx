<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BulletinBoard.aspx.cs" Inherits="MyWebApplication.BulletinBoard1" %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <label style="width:150px;"><b>標題名稱</b></label>
    <asp:TextBox ID="bulletin" runat="server"></asp:TextBox>
    <br />
    <label style="width:150px;"><b>發佈時間</b></label>
    <asp:Label ID="time" runat="server" ></asp:Label>
    <br />
    <label style="width:150px;"><b>發佈者</b></label>
    <asp:Label ID="userid" runat="server" ></asp:Label>
    <br />
    <label style="width:150px;"><b>類別</b></label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [BulletinBoard]"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="category"></asp:DropDownList>
    <br />
    <label style="width:150px;"><b>內容</b></label>
    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Button ID="addd" runat="server" class="btn" Text="修改資料"  OnClick="addd_Click"/>
    <asp:Button ID="clearr" runat="server" class="btn" Text="重設資料"  OnClick="clearr_Click"/>
    <asp:Button ID="Button1" runat="server" class="btn" Text="上一頁"  PostBackUrl="~/Bulletin.aspx"/>
    <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
    <script type="text/javascript">
    CKEDITOR.replace('<%=TextBox1.ClientID %>',{width:1000,height:250});
    </script>
    </div>
    </form>
</body>
</html>
