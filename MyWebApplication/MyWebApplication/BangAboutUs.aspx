<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BangAboutUs.aspx.cs" Inherits="MyWebApplication.BangAboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="Subas/img/icon/favicon.png"/>

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

    <!-- Modernizr JS -->
    <script src="Subas/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

    <style type="text/css">

        .font-text
        {
            font-size:large;
            color:black;
            font-family:Microsoft JhengHei;
        }

    </style>
    

<body>
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->  

 <div class="wrapper">

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
                                   <li>
                                        <a href="BangLogin.aspx">
                                            <i class="zmdi zmdi-account"> </i>
                                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>     
                                        </a>
                                    </li>
                                       
                                    <li>
                                        <a href="BangCart.aspx">
                                            <i class="zmdi zmdi-favorite"></i>
                                            購物車
                                        </a>
                                    </li>
                                    <li>
                                        <a href="BangMember.aspx">
                                            <i class="zmdi zmdi-lock"></i>
                                            會員專區
                                        </a>
                                    </li>
                                   
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             </header>
            <!-- header-middle-area -->
        <header>
            <div id="sticky-header" class="header-middle-area plr-185">
                <div class="container-fluid">
                    <div class="full-width-mega-dropdown">
                        <div class="row">
                            <!-- logo -->
                            <div class="col-md-2 col-sm-6 col-xs-12">
                                <div class="logo">
                                    <a href="index.html">
                                        <img src="Images/NCUTLogo.jpg" alt="NCUT Logo" height="80" width="175"/>
                                    </a>
                                </div>
                            </div>
        
                            <!-- primary-menu -->
                            <div class="col-md-8 hidden-sm hidden-xs">
                                <nav id="primary-menu">

                                    <ul class="main-menu text-center">     
                                        
                                         <li class="mega-parent"><a href="BangBulletin.aspx">公告</a> </li>

                                        <li class="mega-parent"><a href="BangShop.aspx">回到商店</a> </li>

                                        <li class="mega-parent"><a href="BangShop.aspx">耳機／手機殼</a>
                                            <div class="mega-menu-area clearfix">
                                                <div class="mega-menu-link f-left">
                                                    <ul class="single-mega-item">
                                                        <li class="menu-title">耳機</li>

                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=藍芽耳機">藍芽耳機</a></li>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=耳塞式耳機">耳塞式耳機</a></li>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=耳罩式耳機">耳罩式耳機</a></li>
                                                    </ul>


                                                    <ul class="single-mega-item">
                                                        <li class="menu-title">手機殼</li>
                                                            <li><a href="BangShopSearchByCategory.aspx?SearchKey=APPLE">Apple</a></li>
                                                            <li><a href="BangShopSearchByCategory.aspx?SearchKey=SAMSUNG">Samsung</a></li>
                                                            <li><a href="BangShopSearchByCategory.aspx?SearchKey=SONY">SONY</a></li>
                                                            <li><a href="BangShopSearchByCategory.aspx?SearchKey=OPPO">OPPO</a></li>
                                                            <li><a href="BangShopSearchByCategory.aspx?SearchKey=HTC">HTC</a></li>
                                                    </ul>
 
                                                </div>            
                                            </div>
                                        </li>

                                        <li class="mega-parent"><a href="#">其他商品 </a>
                                                                
                                            <div class="mega-menu-area mega-menu-area-2 clearfix">
                                                <div class="mega-menu-link mega-menu-link-2  f-left">
                                                   
                                                    <ul class="single-mega-item">
                                                        <li class="menu-title">手機保護</li>
                                                            <li><a href="BangShopSearchByCategory.aspx?SearchKey=防塵塞">防塵塞</a></li>
                                                            <li><a href="BangShopSearchByCategory.aspx?SearchKey=保護膜">保護膜</a></li>
                                                    </ul>

                                                    <ul class="single-mega-item">
                                                        <li class="menu-title">手機周邊</li>
                                                            <li><a href="BangShopSearchByCategory.aspx?SearchKey=傳輸線">傳輸線</a></li>
                                                            <li><a href="BangShopSearchByCategory.aspx?SearchKey=記憶卡">記憶卡</a></li>
                                                            <li><a href="BangShopSearchByCategory.aspx?SearchKey=行動電源">行動電源</a></li>
                                                            <li><a href="BangShopSearchByCategory.aspx?SearchKey=手機支架">手機支架</a></li>
                                                    </ul>

                                                     <ul class="single-mega-item">
                                                        <li class="menu-title">其他</li>
                                                             <li><a href="BangShopSearchByCategory.aspx?SearchKey=其他">其他商品</a></li>
                                                     </ul>

                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <a href="BangAboutUs.aspx">關於我們 </a>
                                           
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            <!-- header-search & total-cart -->
                                    <!-- total-cart -->
                                    
                                </div>
                            </div>
                        </div>
                    </div>
            </header>
     </div>   
            <!-- ABOUT SECTION START -->

    <!-- 1 -->
            <div class="about-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-title text-left ">
                                <h1> <b> 學校資訊 </b></h1>                              
                            </div>
                        </div>
                    </div>     
                    
                    <div class="row">
                        <div class="col-md-5">
                            <div class="about-photo p-20 bg-img-0">
                                <img src="/Images/NCUTLogo.jpg" alt="NCUTLogo.jpg"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div >
                                <div>

                                <p class="font-text">
                                
                                勤益創立於民國60年，是一所不同於其他學校的國立科技大學，它本是私人興學，
                                繼而於民國81年捐獻給國家而改制國立。創辦人張明將軍、王國秀女士以取之於社會，
                                還諸於社會的無私精神，來實踐<br /> <b style="color:red;">「教育無他，榜樣而已」</b>的理念。
                                <br />民國81年，李登輝總統以「功宏化育」的贊語來肯定他們對社會的貢獻，
                                兩位創辦人並先後於民國94年及99年分別獲得總統的褒揚令。<br />
                                學校發展歷程分為私立專科學校(60.08~81.06)、國立專科學校(81.07~88.07)，
                                國立技術學院(88.08~96.01)及國立勤益科技大學(96.02迄今)等四大階段。

                                </p>

                                </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    <!-- Body main wrapper end -->


    <!-- Placed JS at the end of the document so the pages load faster -->

    <!-- jquery latest version -->
    <script src="Subas/js/vendor/jquery-3.1.1.min.js"></script>
    <!-- Bootstrap framework js -->
    <script src="Subas/js/bootstrap.min.js"></script>
    <!-- jquery.nivo.slider js -->
    <script src="Subas/lib/js/jquery.nivo.slider.js"></script>
    <!-- All js plugins included in this file. -->
    <script src="Subas/js/plugins.js"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="Subas/js/main.js"></script>

</body>

</html>    </form>
</body>
</html>
