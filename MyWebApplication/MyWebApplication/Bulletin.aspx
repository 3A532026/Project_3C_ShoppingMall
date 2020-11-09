<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bulletin.aspx.cs" Inherits="MyWebApplication.Bulletin" %>

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
    .auto-style1 {
        border-style: none;
        width: 100%;
        margin-top: 0px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#menu60">所有公告欄</a></li>
        <li><a data-toggle="tab" href="#menu62">系統</a></li>
        <li><a data-toggle="tab" href="#menu63">活動</a></li>
        <li><a data-toggle="tab" href="#menu61">新增公告</a></li>
        </ul>

        <div class="tab-content">
        <!--公告欄#menu60-->
        <div id="menu60" class="tab-pane fade in active">
            <br />
            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" AutoPostBack="true"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="查詢" CssClass="btn" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="bulletinid" OnRowCommand="GridView1_RowCommand" CssClass="auto-style1" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("bulletinid", "BulletinBoard.aspx?bulletinid={0}") %>'>查詢</asp:HyperLink>
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Bdelete" CommandArgument='<%#Eval("bulletinid") %>' OnClientClick="return confirm('確定要刪除這筆公告嗎?');">刪除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                    <asp:BoundField DataField="category" HeaderText="類別" SortExpression="category" />
                    <asp:BoundField DataField="bulletin" HeaderText="標題" SortExpression="bulletin" />
                    <asp:BoundField DataField="time" HeaderText="發佈時間" SortExpression="time" />
                    <asp:BoundField DataField="Userid" HeaderText="發佈者" SortExpression="Userid" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [BulletinBoard]"></asp:SqlDataSource>
        </div>
        <!--系統#menu62-->
        <div id="menu62" class="tab-pane fade">
            <br />
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="查詢" CssClass="btn" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="bulletinid" OnRowCommand="GridView2_RowCommand" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("bulletinid", "BulletinBoard.aspx?bulletinid={0}") %>'>查詢</asp:HyperLink>
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Bdelete" CommandArgument='<%#Eval("bulletinid") %>' OnClientClick="return confirm('確定要刪除這筆記錄嗎?');">刪除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                    <asp:BoundField DataField="bulletinid" HeaderText="公告編號" InsertVisible="False" ReadOnly="True" SortExpression="bulletinid" />
                    <asp:BoundField DataField="category" HeaderText="類別" SortExpression="category" />
                    <asp:BoundField DataField="bulletin" HeaderText="標題" SortExpression="Bbulletin" />
                    <asp:BoundField DataField="time" HeaderText="發佈時間" SortExpression="Time" />
                    <asp:BoundField DataField="Userid" HeaderText="發佈者" SortExpression="Userid" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [BulletinBoard] WHERE category=N'系統'"></asp:SqlDataSource>
        <br />
        </div>
        <!--活動#menu63-->
        <div id="menu63" class="tab-pane fade">
            <br />
            <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged" AutoPostBack="true"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="查詢" CssClass="btn" OnClick="Button3_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="bulletinid" OnRowCommand="GridView3_RowCommand" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("bulletinid", "BulletinBoard.aspx?bulletinid={0}") %>'>查詢</asp:HyperLink>
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Bdelete" CommandArgument='<%#Eval("bulletinid") %>' OnClientClick="return confirm('確定要刪除這筆記錄嗎?');">刪除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                    <asp:BoundField DataField="bulletinid" HeaderText="公告編號" InsertVisible="False" ReadOnly="True" SortExpression="bulletinid" />
                    <asp:BoundField DataField="category" HeaderText="類別" SortExpression="category" />
                    <asp:BoundField DataField="bulletin" HeaderText="標題" SortExpression="Bbulletin" />
                    <asp:BoundField DataField="time" HeaderText="發佈時間" SortExpression="Time" />
                    <asp:BoundField DataField="Userid" HeaderText="發佈者" SortExpression="Userid" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [BulletinBoard] WHERE category=N'活動'"></asp:SqlDataSource>
        <br />
        </div>
        <!--新增公告#menu61-->
        <div id="menu61" class="tab-pane fade">
        <br />
        <label style="width:150px;"><b>標題</b></label>
        <asp:TextBox ID="bulletin" runat="server" width="350px"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>標題</b></label>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [BulletinBoard]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="category" DataValueField="category"></asp:DropDownList>
        <br />
        <label style="width:150px;"><b>內容</b></label>
        <asp:TextBox ID="bulletincontent" runat="server" TextMode="MultiLine" Height="200px" Width="600px"></asp:TextBox>
        <br />
        <asp:Button ID="btn_add_bulletin" runat="server" CssClass="btn" Text="新增資料" OnClick="Btn_add_bulletin_Click"/>
        <asp:Button ID="btn_clear3" runat="server" CssClass="btn" Text="重設資料" OnClick="Btn_clear3_Click"/>
        </div>
      </div>
        </div>
    </form>
<script type="text/javascript">
    CKEDITOR.replace('<%=bulletincontent.ClientID %>',{width:1000,height:250});
</script>
</body>
</html>
