<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Membership.aspx.cs" Inherits="MyWebApplication.Membership" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
        font-size:20px;
    }
    #mySearch {
    width: 100%;
    font-size: 18px;
    padding: 11px;
    border:1px solid #ddd;
    }

    /* Style the navigation menu inside the left column */
    #myMenu {
    list-style-type: none;
    padding: 0;
    margin: 0;
    }

    #myMenu li a {
    padding: 12px;
    text-decoration: none;
    font-size: 18px;
    color: black;
    display: block
    }

    #myMenu li a:hover {
    background-color: #eee;
    }
        </style>
    <div >
    <!--左條列欄 -->  
    <div class="col-md-3">
    <input type="text" id="mySearch" onkeyup="myFunction()" placeholder="Search.." title="Type in a category">
    <ul id="myMenu" class="nav nav-pills nav-stacked">
    <li class="active"><a data-toggle="tab" href="#home">會員中心</a></li>
    <li><a data-toggle="tab" href="#menu1">基本資料修改</a></li>
    <li><a data-toggle="tab" href="#menu2">修改密碼</a></li>
    <li><a data-toggle="tab" href="#menu3">訂單查詢</a></li>
    </ul>
    </div>
    <!--右內容區 -->
    <div class="col-md-8">
    <div class="tab-content">
    <!--會員系統#home -->
    <div id="home" class="tab-pane fade in active">
    <h3>歡迎光臨網站會員系統</h3>
    </div>
    <!--基本資料修改#menu1 -->
    <div id="menu1" class="tab-pane fade">
        <h4>個人資料</h4>
        <hr />
        <label style="width:150px;"><b>使用者帳號</b></label>
        <asp:Label ID="id" runat="server"></asp:Label>
        <br />
        <label style="width:150px;"><b><span style="color:red;">*</span>姓名</b></label>
        <asp:TextBox ID="name" runat="server" width="350px"></asp:TextBox>
        <br />
        <label style="width:150px;"><b><span style="color:red;">*</span>性別</b></label>
        <asp:RadioButton ID="man" runat="server" GroupName="sex" Text="男" Checked="true"/>
        <asp:RadioButton ID="female" runat="server" GroupName="sex" Text="女" />
        <br />
        <label style="width:150px;"><b><span style="color:red;">*</span>生日</b></label>
        <asp:TextBox ID="date" runat="server" width="350px" TextMode="Date"></asp:TextBox>
        <br />
        <label style="width:150px;"><b><span style="color:red;">*</span>聯絡方式</b></label>
        <asp:TextBox ID="phone" runat="server" width="350px" ></asp:TextBox>
        <br />
        <label style="width:150px;"><b><span style="color:red;">*</span>電子郵件</b></label>
        <asp:TextBox ID="mail" runat="server" width="350px" TextMode="Email"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>住址</b></label>
        <asp:TextBox ID="address" runat="server" width="350px"></asp:TextBox>
        <br />
        <asp:Button ID="btn_update" runat="server" class="btn" Text="修改資料"  BackColor="#ffffff" BorderColor="Black" BorderWidth="1px" OnClick="btn_update_Click"/>
        <asp:Button ID="clear" runat="server" class="btn" Text="重設資料"  BackColor="#ffffff" BorderColor="Black" BorderWidth="1px" OnClick="clear_Click"/>
    </div>
    <!--修改密碼#menu2 -->
    <div id="menu2" class="tab-pane fade">
        <label style="width:150px;"><b>使用者帳號</b></label>
        <asp:Label ID="userid" runat="server"></asp:Label>
        <br />
        <label style="width:150px;"><b>新密碼</b></label>
        <asp:TextBox ID="psw" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <label style="width:150px;"><b>重複密碼</b></label>
        <asp:TextBox ID="re_psw" runat="server" TextMode="Password"></asp:TextBox>
        <br /><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="psw" ControlToValidate="re_psw"></asp:CompareValidator><br />
        <asp:Button ID="update_psw" runat="server" class="btn" Text="修改密碼"  BackColor="#ffffff" BorderColor="Black" BorderWidth="1px" OnClick="update_psw_Click"/>
    </div>
    <!--訂單管理#menu3 -->
    <div id="menu3" class="tab-pane fade">
    <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#menu30">未出貨</a></li>
    <li><a data-toggle="tab" href="#menu31">已出貨</a></li>
    <li><a data-toggle="tab" href="#menu32">已結案</a></li>
    </ul>

    <div class="tab-content">
    <!--未出貨#menu30 -->
    <div id="menu30" class="tab-pane fade in active">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="orderid">
            <AlternatingRowStyle Width="500px"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField HeaderText="查詢">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" Text="查詢" DataField="orderid" SortExpression="orderid" NavigateUrl='<%# Eval("orderid", "Orderdetail.aspx?orderid={0}") %>' ></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="orderid" HeaderText="訂單編號" SortExpression="orderid" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="purchasedate" HeaderText="消費總額" SortExpression="purchasedate"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="總金額" SortExpression="total"></asp:BoundField>
                <asp:BoundField DataField="paytype" HeaderText="付款方式" SortExpression="paytype"></asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="付款狀態" SortExpression="status"></asp:BoundField>
                <asp:BoundField DataField="deliver_status" HeaderText="出貨狀態" SortExpression="deliver_status"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [orderid], [purchasedate], [total], [paytype], [status], [deliver_status] FROM [Orders] WHERE [deliver_status] like N'已出貨' and [userid] like @userid ORDER BY [purchasedate] DESC">
            <SelectParameters>
                <asp:Parameter Name="userid"/>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <!--已出貨#menu31 -->
    <div id="menu31" class="tab-pane fade">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:TemplateField HeaderText="查詢">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" Text="查詢" DataField="orderid" SortExpression="orderid" NavigateUrl='<%# Eval("orderid", "Orderdetail.aspx?orderid={0}") %>' ></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="orderid" HeaderText="訂單編號" SortExpression="orderid"></asp:BoundField>
                <asp:BoundField DataField="purchasedate" HeaderText="消費日期" SortExpression="purchasedate"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="消費總額" SortExpression="total"></asp:BoundField>
                <asp:BoundField DataField="paytype" HeaderText="付款方式" SortExpression="paytype"></asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="付款狀態" SortExpression="status"></asp:BoundField>
                <asp:BoundField DataField="deliver_status" HeaderText="出貨狀態" SortExpression="deliver_status"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [orderid], [purchasedate], [total], [paytype], [status], [deliver_status] FROM [Orders] WHERE [deliver_status] like N'已出貨' and [userid] like @userid ORDER BY [purchasedate] DESC">
            <SelectParameters>
                <asp:Parameter Name="userid"/>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <!--已結案#menu31 -->
    <div id="menu32" class="tab-pane fade">
        <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource3" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="查詢">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" Text="查詢" DataField="orderid" SortExpression="orderid" NavigateUrl='<%# Eval("orderid", "Orderdetail.aspx?orderid={0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="orderid" HeaderText="訂單編號" SortExpression="orderid"></asp:BoundField>
                <asp:BoundField DataField="purchasedate" HeaderText="消費日期" SortExpression="purchasedate"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="消費總額" SortExpression="total"></asp:BoundField>
                <asp:BoundField DataField="paytype" HeaderText="付款方式" SortExpression="paytype"></asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="付款狀態" SortExpression="status"></asp:BoundField>
                <asp:BoundField DataField="deliver_status" HeaderText="出貨狀態" SortExpression="deliver_status"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [orderid], [purchasedate], [total], [paytype], [status], [deliver_status] FROM [Orders] WHERE [deliver_status] like N'已出貨' and [userid] like @userid ORDER BY [purchasedate] DESC">
            <SelectParameters>
                <asp:Parameter Name="userid"/>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
   </div>
  </div>
    </div>
  </div>
 </div>
<script>
function myFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("mySearch");
  filter = input.value.toUpperCase();
  ul = document.getElementById("myMenu");
  li = ul.getElementsByTagName("li");
  for (i = 0; i < li.length; i++) {
    a = li[i].getElementsByTagName("a")[0];
    if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";
    }
  }
}
</script>
</asp:Content>
