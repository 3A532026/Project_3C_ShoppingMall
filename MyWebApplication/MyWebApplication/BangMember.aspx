<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BangMember.aspx.cs" Inherits="MyWebApplication.BangMember" %>

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
                                            <a href="BangShop.aspx">回到商店</a>                                           
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
                           <div class="registered-customers" style="position:center">
                                <div class="login-account p-30 box-shadow"  style=" text-align:center">
                                <h1>歡迎使用會員系統</h1>
                                    <h5>歡迎各位使用會員系統，所有會員功能都需在登入後才可使用。</h5>
                                    <br/>
                                    <h4>
                                        本會員系統有以下功能：
                                    </h4>

                                    <h5>
                                        1.免費加入會員<br/>
                                        2.會員可以修改自身資料<br/>
                                        3.若忘記密碼，可由系統發送電子郵件通知<br/>
                                        4.管理員可以修改、刪除會員資料<br/>
                                        5.若重大影響本系統運行，將會停權會員<br/>
                                        </h5>
                                
                                    </div>
                                </div>
    </form>
</body>
</html>
