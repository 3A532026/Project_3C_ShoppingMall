<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BangMemberOrdersDetail.aspx.cs" Inherits="MyWebApplication.BangMemberOrdersDetail" %>

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
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="orderid" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="well" style="border-bottom: 2px solid #90c31f;">訂單編號   <asp:Label Text='<%# Eval("orderid") %>' runat="server" ID="orderidLabel" />   <span style="color:red;">(<asp:Label Text='<%# Eval("deliver_status") %>' runat="server" ID="Label1" />)</span></div>
                    <p>收件人資料</p>
                    <table>
                    <tr>
                    <td>姓名:</td>
                    <td><asp:Label Text='<%# Eval("takename") %>' runat="server" ID="takenameLabel" /></td>
                    </tr>
                    <tr>
                    <td>Email:</td>
                    <td><asp:Label Text='<%# Eval("takeemail") %>' runat="server" ID="takeemailLabel" /></td>
                    </tr>
                    <tr>
                    <td>付款方式:</td>
                    <td><asp:Label Text='<%# Eval("paytype") %>' runat="server" ID="paytypeLabel" /></td>
                    </tr>
                    <tr>
                    <td>收貨地點:</td>
                    <td><asp:Label Text='<%# Eval("takeaddress") %>' runat="server" ID="takeaddressLabel" /></td>
                    </tr>
                    </table>
                    <br />
                    <div class="well" style="border-bottom: 2px solid #90c31f;">訂單明細</div>
                    <div style="float:left;">消費總額:<asp:Label Text='<%# Eval("total") %>' runat="server" ID="Label7" /></div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [total],[takename], [takeemail], [paytype], [takeaddress], [orderid],[deliver_status] FROM [Orders] WHERE orderid=@orderid">
        <SelectParameters>
                    <asp:QueryStringParameter Name="orderid" QueryStringField="orderid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="商品名稱" SortExpression="productname"></asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="售價" SortExpression="price" DataFormatString="{0:#}"></asp:BoundField>
                        <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT Product.Name, Product.Price, OrderDetail.quantity FROM [OrderDetail] INNER JOIN [Product] ON [Product].Id=[OrderDetail].productid  WHERE [OrderDetail].orderid=@orderid ">
        <SelectParameters>
                    <asp:QueryStringParameter Name="orderid" QueryStringField="orderid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" Text="<-上一頁" CssClass="btn" BackColor="#ff6600" ForeColor="#ffffff" PostBackUrl="~/BangMemberOrders.aspx"/>
    
    </form>
</body>
</html>
