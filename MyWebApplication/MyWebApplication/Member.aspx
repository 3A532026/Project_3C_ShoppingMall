<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="MyWebApplication.Member" %>

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
    <!--會員管理#menu1-->
    <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#menu10">會員資料</a></li>
    <li ><a data-toggle="tab" href="#menu11">新增管理員</a></li>
    </ul>
    <div class="tab-content">
    <!--會員資料#menu10-->
    <div id="menu10" class="tab-pane fade in active">
        <br />
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查詢" CssClass="btn" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("UserID", "MemberDetail.aspx?UserID={0}") %>'>查詢</asp:HyperLink>
                        <br />
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Bdelete" CommandArgument='<%#Eval("UserID") %>' OnClientClick="return confirm('確定要刪除這筆記錄嗎?');">刪除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="Label1" runat="server" Text="修改狀態"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="stop" CommandArgument='<%#Eval("UserID") %>' OnClientClick="return confirm('確定要停權此會員嗎?')">停權</asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="start" CommandArgument='<%#Eval("UserID") %>' OnClientClick="return confirm('確定要啟用此會員嗎?')">啟用</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UserID" HeaderText="使用者帳號" SortExpression="UserID" Visible="false"></asp:BoundField>
                <asp:BoundField DataField="Username" HeaderText="姓名" SortExpression="Username"></asp:BoundField>
                <asp:BoundField DataField="Jointime" HeaderText="加入時間" SortExpression="Jointime"></asp:BoundField>
                <asp:BoundField DataField="LastLoginTime" HeaderText="最後登入時間" SortExpression="LastLoginTime"></asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="狀態" SortExpression="Status"></asp:BoundField>
                <asp:BoundField DataField="Level" HeaderText="等級" SortExpression="Level"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [Username], [UserID], [Jointime], [LastLoginTime], [Status], [Level] FROM [Users]"></asp:SqlDataSource>
    </div>
    <!--新增會員#menu11-->
    <div id="menu11" class="tab-pane fade">
        
        <br />
        <label style="width:150px;"><b>帳號</b></label>
        <asp:TextBox ID="userid" runat="server" width="350px"></asp:TextBox>
        <br />
        <label  style="width:150px;"><b>姓名</b></label>
        <asp:TextBox ID="name" runat="server" width="350px"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>性別</b></label>
        <asp:RadioButton ID="man" runat="server" GroupName="sex" Text="男" Checked="true"/>
        <asp:RadioButton ID="female" runat="server" GroupName="sex" Text="女" />
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
        <asp:Button ID="bt_add" runat="server" CssClass="btn" Text="新增資料" OnClick="Bt_add_Click" />
        <asp:Button ID="bt_clear" runat="server" CssClass="btn" Text="重設資料"  OnClick="Bt_clear_Click"/>
        </div>
        </div>
        </div>
    </form>
</body>
</html>
