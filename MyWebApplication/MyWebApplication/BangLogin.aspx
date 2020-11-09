<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BangLogin.aspx.cs"  Inherits="MyWebApplication.BangLogin"  %>

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
                                    <li>
                                        <a href="Login.aspx">
                                            <i class="zmdi zmdi-star"></i>
                                            管理員登入
                                        </a>
                                    </li>
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

                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <!-- END HEADER AREA -->

    <form id="form1" runat="server" >
                            <div class="registered-customers" style="position:center">
                                                   
                                    <div class="login-account p-30 box-shadow"  style=" text-align:center ">
                                        <p><strong style="font-size: x-large">這裡登入</strong></p>

                                        <div class="col-sd-3" style="position:center">
                                  
                                        <input type="text" name="Acc" placeholder="帳號" style="width:20%;" /> 
                                        <br />

                                       <input type="password" name="Pass" placeholder="密碼" style="width:20%;" /> 
                                        <br />
                                        
                                        <input type="image" id="catchImage" src="catchadraw.aspx" onclick="" style="width:20%; height:20%"/>
                                       
                                        <br/>

                                      <asp:Label id="RandonCode"  runat="server"  Visible="false" style="width:20%;" ></asp:Label> 
                                        <input type="text" name="Ran" placeholder="請輸入驗證碼" style="width:20%;"/>
                                        <br />
                                        
                                        <p><small><a href="BangForgetPassword.aspx" >忘記密碼？</a></small></p>

                                       <p><small><a href="BangRegister.aspx" >註冊帳號</a></small></p>
                                      
                                        <asp:Button CssClass="submit-btn-1 btn-hover-1" id="LoginButton" runat="server" Text="登入" OnClick="LoginButton_Click" style="left: 0px; top: 0px" />                                          
                            </div>                                
                            </div>
                            </div>
    </form>
</body>
</html>