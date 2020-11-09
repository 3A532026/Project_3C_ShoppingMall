<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BangMemberOrders.aspx.cs" Inherits="MyWebApplication.BangMemberOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <script type="text/javascript">
        
    </script>

    <link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.png"/>

    <!-- All CSS Files -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="Subas/css/bootstrap.min.css"/>
    <!-- Nivo-slider css -->
    <link rel="stylesheet" href="Subas/lib/css/nivo-slider.css"/>
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="Subas/css/core.css"/>
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="Subas/css/shortcode/shortcodes.css"/>
    <!-- Theme main style -->
    <link rel="stylesheet" href="Subas/style.css"/>
    <!-- Responsive css -->
    <link rel="stylesheet" href="Subas/css/responsive.css"/>
    <!-- Template color css -->
    <link href="Subas/css/color/color-core.css" data-style="styles" rel="stylesheet"/>
    <!-- User style -->
    <link rel="stylesheet" href="Subas/css/custom.css"/>
    <title>BangShopLogin</title>

</head>
    
<body >
        <!-- START HEADER AREA -->
        <header class="header-area header-wrapper">
            <!-- header-top-bar -->
            <div class="header-top-bar plr-185">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6 hidden-xs">
                            <div class="call-us">
                                <p class="mb-0 roboto">(04) 2392-3363</p>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <div class="top-link clearfix">
                                <ul class="link f-right">
                                   <!-- <li>
                                        <a href="BangMemberEdit.aspx">
                                            <i class="zmdi zmdi-account"></i>
                                            My Account
                                        </a>
                                    </li> -->
                                   <%-- <li>
                                        <a href="Login.aspx">
                                            <i class="zmdi zmdi-star"></i>
                                            管理員登入
                                        </a>
                                    </li>--%>
                                    <!--<li>
                                        <a href="BangLogin.aspx">
                                            <i class="zmdi zmdi-lock"></i>
                                            Login
                                        </a>
                                    </li> -->

                                    <!-- <li>
                                        <a href="BangCart.aspx">
                                            <i class="zmdi zmdi-favorite"></i>
                                            My cart
                                        </a>
                                    </li> 
                                        -->
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- header-middle-area -->
            <div id="sticky-header" class="header-middle-area plr-185">
                <div class="container-fluid">
                    <div class="full-width-mega-dropdown">
                        <div class="row">
                            <!-- logo -->
                            <div class="col-md-2 col-sm-6 col-xs-12">
                                <div class="logo">
                                    
                                        <img src="Images/NCUTLogo.jpg" alt="NCUT Logo" height="80" width="175"/>
                                    
                                </div>
                            </div>
                            <!-- primary-menu -->
                            <div class="col-md-8 hidden-sm hidden-xs">
                                <nav id="primary-menu">

                                    <ul class="main-menu text-center">                 
                                        <li>
                                            <a href="BangShop.aspx">回到商店 </a>                                           
                                        </li>                                                               
                                        <li>
                                            <a href="BangMemberEdit.aspx">修改會員資料 </a>                                           
                                        </li>
                                            <li>
                                            <a href="BangCart.aspx">購物車</a>                                           
                                        </li>
                                        <li>
                                            <a href="BangMemberOrders.aspx">訂單查詢 </a>                                           
                                        </li>
                                    </ul>
                                </nav>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <!-- END HEADER AREA -->
    
    <form id="form1" runat="server" >
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>所有訂單</asp:ListItem>
            <asp:ListItem>未出貨</asp:ListItem>
            <asp:ListItem>已出貨</asp:ListItem>
            <asp:ListItem>已結案</asp:ListItem>
        </asp:DropDownList>
                     <asp:GridView ID="GridView1" runat="server" RowStyle-ForeColor="Black" HeaderStyle-ForeColor="Black" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="orderid">
            <AlternatingRowStyle Width="500px"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField HeaderText="查詢">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" Text="查詢" DataField="orderid" SortExpression="orderid" NavigateUrl='<%# Eval("orderid", "BangMemberOrdersDetail.aspx?orderid={0}") %>' ></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="orderid" HeaderText="訂單編號" SortExpression="orderid" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="purchasedate" HeaderText="消費日期" SortExpression="purchasedate"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="總金額" SortExpression="total"></asp:BoundField>
                <asp:BoundField DataField="paytype" HeaderText="付款方式" SortExpression="paytype"></asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="付款狀態" SortExpression="status"></asp:BoundField>
                <asp:BoundField DataField="deliver_status" HeaderText="出貨狀態" SortExpression="deliver_status"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [orderid], [purchasedate], [total], [paytype], [status], [deliver_status] FROM [Orders] WHERE [deliver_status] like N'未出貨' and [userid] like @userid ORDER BY [purchasedate] DESC">
            <SelectParameters>
                <asp:Parameter Name="userid"/>
            </SelectParameters>
        </asp:SqlDataSource>     
     <asp:GridView ID="GridView2" runat="server" RowStyle-ForeColor="Black" HeaderStyle-ForeColor="Black" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="orderid">
            <AlternatingRowStyle Width="500px"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField HeaderText="查詢">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" Text="查詢" DataField="orderid" SortExpression="orderid" NavigateUrl='<%# Eval("orderid", "BangMemberOrdersDetail.aspx?orderid={0}") %>' ></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="orderid" HeaderText="訂單編號" SortExpression="orderid" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="purchasedate" HeaderText="消費日期" SortExpression="purchasedate"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="總金額" SortExpression="total"></asp:BoundField>
                <asp:BoundField DataField="paytype" HeaderText="付款方式" SortExpression="paytype"></asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="付款狀態" SortExpression="status"></asp:BoundField>
                <asp:BoundField DataField="deliver_status" HeaderText="出貨狀態" SortExpression="deliver_status"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [orderid], [purchasedate], [total], [paytype], [status], [deliver_status] FROM [Orders] WHERE [deliver_status] like N'已出貨' and [userid] like @userid ORDER BY [purchasedate] DESC">
            <SelectParameters>
                <asp:Parameter Name="userid"/>
            </SelectParameters>
        </asp:SqlDataSource>     
         <asp:GridView ID="GridView3" runat="server" RowStyle-ForeColor="Black" HeaderStyle-ForeColor="Black" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" DataKeyNames="orderid">
            <AlternatingRowStyle Width="500px"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField HeaderText="查詢">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" Text="查詢" DataField="orderid" SortExpression="orderid" NavigateUrl='<%# Eval("orderid", "BangMemberOrdersDetail.aspx?orderid={0}") %>' ></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="orderid" HeaderText="訂單編號" SortExpression="orderid" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="purchasedate" HeaderText="消費日期" SortExpression="purchasedate"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="總金額" SortExpression="total"></asp:BoundField>
                <asp:BoundField DataField="paytype" HeaderText="付款方式" SortExpression="paytype"></asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="付款狀態" SortExpression="status"></asp:BoundField>
                <asp:BoundField DataField="deliver_status" HeaderText="出貨狀態" SortExpression="deliver_status"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [orderid], [purchasedate], [total], [paytype], [status], [deliver_status] FROM [Orders] WHERE [deliver_status] like N'已結案' and [userid] like @userid ORDER BY [purchasedate] DESC">
            <SelectParameters>
                <asp:Parameter Name="userid"/>
            </SelectParameters>
        </asp:SqlDataSource>     
         <asp:GridView ID="GridView4" runat="server" RowStyle-ForeColor="Black" HeaderStyle-ForeColor="Black" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" DataKeyNames="orderid">
            <AlternatingRowStyle Width="500px"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField HeaderText="查詢">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" Text="查詢" DataField="orderid" SortExpression="orderid" NavigateUrl='<%# Eval("orderid", "BangMemberOrdersDetail.aspx?orderid={0}") %>' ></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="orderid" HeaderText="訂單編號" SortExpression="orderid" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="purchasedate" HeaderText="消費日期" SortExpression="purchasedate"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="總金額" SortExpression="total"></asp:BoundField>
                <asp:BoundField DataField="paytype" HeaderText="付款方式" SortExpression="paytype"></asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="付款狀態" SortExpression="status"></asp:BoundField>
                <asp:BoundField DataField="deliver_status" HeaderText="出貨狀態" SortExpression="deliver_status"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [orderid], [purchasedate], [total], [paytype], [status], [deliver_status] FROM [Orders] WHERE [userid] like @userid ORDER BY [purchasedate] DESC">
            <SelectParameters>
                <asp:Parameter Name="userid"/>
            </SelectParameters>
        </asp:SqlDataSource>     
    </form>
</body>
</html>


