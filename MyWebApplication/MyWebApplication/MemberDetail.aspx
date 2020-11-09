<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberDetail.aspx.cs" Inherits="MyWebApplication.MemberDetail" %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <!--會員管理#menu1-->
        <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#menu10">個人資料</a></li>
        </ul>
        <div class="tab-content">
        <!--會員資料#menu10-->
        <div id="menu10" class="tab-pane fade in active">
        <hr />
        <label style="width:150px;"><b>使用者帳號</b></label>
        <asp:Label ID="id" runat="server"></asp:Label>
        <br />
        <label style="width:150px;"><b>姓名</b></label>
        <asp:TextBox ID="name" runat="server" width="350px"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>身分</b></label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="level" DataValueField="level"></asp:DropDownList>
        <br />
        <label style="width:150px;"><b>性別</b></label>
        <asp:RadioButton ID="man" runat="server" GroupName="sex" Text="男" Checked="true"/>
        <asp:RadioButton ID="female" runat="server" GroupName="sex" Text="女"/>
        <br />
        <label style="width:150px;"><b>生日</b></label>
        <asp:TextBox ID="date" runat="server" width="350px" TextMode="Date"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>聯絡方式</b></label>
        <asp:TextBox ID="phone" runat="server" width="350px" ></asp:TextBox>
        <br />
        <label style="width:150px;"><b>電子郵件</b></label>
        <asp:TextBox ID="mail" runat="server" width="350px" TextMode="Email"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>住址</b></label>
        <asp:TextBox ID="address" runat="server" width="350px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="b_update" runat="server" class="btn" Text="修改資料"  OnClick="b_update_Click"/>
        <asp:Button ID="b_clear" runat="server" class="btn" Text="重設資料"  OnClick="b_clear_Click"/>
        <asp:Button ID="Button1" runat="server" class="btn" Text="上一頁"  PostBackUrl="~/Member.aspx"/>
        </div>
        </div>
        </div>
    </form>
</body>
</html>
