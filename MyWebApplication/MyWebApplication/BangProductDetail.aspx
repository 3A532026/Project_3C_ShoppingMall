<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BangProductDetail.aspx.cs" Inherits="MyWebApplication.BangProductDetail" %>


<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Subash || Single Product</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="Subas/img/icon/favicon.png">

    <!-- All CSS Files -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="Subas/css/bootstrap.min.css">
    <!-- Nivo-slider css -->
    <link rel="stylesheet" href="Subas/lib/css/nivo-slider.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="Subas/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="Subas/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="Subas/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="Subas/css/responsive.css">
    <!-- Template color css -->
    <link href="Subas/css/color/color-core.css" data-style="styles" rel="stylesheet">
    <!-- User style -->
    <link rel="stylesheet" href="Subas/css/custom.css">

    <!-- Modernizr JS -->
    <script src="Subas/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <form id="form1" runat="server">
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->  

    <!-- Body main wrapper start -->
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
                                      <!--  <a href="BangLogin.aspx">
                                            <i class="zmdi zmdi-favorite">
                                            會員登入
                                            </i>
                                            
                                        </a>
                                    </li> -->
                                       
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

        
        <!-- END HEADER AREA -->

        <!-- Start page content -->
        <section id="page-content" class="page-wrapper">
<% foreach (Product product in productArray) {%>
            <!-- SHOP SECTION START -->
            <div class="shop-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-xs-12">
                            <!-- single-product-area start -->
                            <div class="single-product-area mb-80">
                                <div class="row">
                                    <!-- imgs-zoom-area start -->
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <div class="imgs-zoom-area">
                                            <img id="<% =product.getId() %>" src="data:image/png;base64,<%= product.getImage() %>" data-zoom-image="" alt="沒照片啦"/>
                                            <div class="row">

                                            </div>
                                        </div>
                                    </div>
                                    <!-- imgs-zoom-area end -->
                                    
                                    <!-- single-product-info start -->
                                    <div class="col-md-7 col-sm-7 col-xs-12"> 
                                        <div class="single-product-info">
                                            <h2 class="text-black-1"><%=product.getProductName() %></h2>                                          
                                            <!-- plus-minus-pro-action -->
                                            <div class="plus-minus-pro-action clearfix">
                                                <div class="sin-plus-minus f-left clearfix" style="font-size:26px;">
                                                    <p class="color-title f-left" style="font-size:18px;">庫存 <% =product.getstore() %></p>
                                                </div>
                                            </div>
                                            <!-- plus-minus-pro-action end -->
                                            <!-- hr -->
                                            <hr>
                                            <!-- single-product-price -->
                                            <h3 class="pro-price" style="font-size:22px">Price:<% =product.getPrice() %></h3>
                                            <!--  hr -->
                                            <hr>
                                            <div>
                                                                                                
                                                  <asp:Button ID="BtnBuy" runat="server" class="text-uppercase" Text="加入購物車" OnClick="BtnBuy_Click" />
                                                
                                           
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-info end -->
                                </div>
                                <!-- single-product-tab -->
                                <div class="row">
                                    <div class="col-md-12">
                                        <!-- hr -->
                                        <hr>
                                        <div class="single-product-tab">
                                            <ul class="reviews-tab mb-20">
                                                <li  class="active"><a href="#description" data-toggle="tab">產品介紹</a></li>
                                            </ul>
                                            <div class="tab-content">
                                                <div role="tabpanel" class="tab-pane active" id="description">
                                                 
                                                    <p style="font-size:22px"><%=product.getDetail() %></p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--  hr -->
                                        <hr>
                                    </div>
                                </div>
                            </div>
                        </div>   
                            <!-- single-product-area end -->
                            <%}%>
                            
                                    
                        <div class="col-md-3 col-xs-12">

                            <!-- widget-categories -->
                                <aside class="widget widget-categories box-shadow mb-30">
                                <h6 class="widget-title border-left mb-20">商品類別</h6>
                                <div id="cat-treeview" class="product-cat">
                                   <ul>
                                        <li class="opened"><a href="BangShop.aspx">商品一覽</a>
                                   </ul>
                                    <ul>
                                        <li class="opened">耳機
                                            <ul>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=藍芽耳機">藍芽耳機</a></li>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=耳塞式耳機">耳塞式耳機</a></li>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=耳罩式耳機">耳罩式耳機</a></li>
                                            </ul>
                                        </li>                                       
                                        <li class="closed">手機殼
                                            <ul>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=APPLE">Apple</a></li>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=SAMSUNG">Samsung</a></li>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=SONY">SONY</a></li>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=OPPO">OPPO</a></li>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=HTC">HTC</a></li>
                                            </ul>
                                        </li>

                                        <li class="closed">手機保護
                                            <ul>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=防塵塞">防塵塞</a></li>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=保護膜">保護膜</a></li>

                                            </ul>
                                        </li>
                                        <li class="closed">手機周邊
                                            <ul>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=傳輸線">傳輸線</a></li>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=記憶卡">記憶卡</a></li>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=行動電源">行動電源</a></li>
                                                <li><a href="BangShopSearchByCategory.aspx?SearchKey=手機支架">手機支架</a></li>
                                            </ul>
                                        </li>
                                         <li class="closed">其他
                                             <ul>
                                             <li><a href="BangShopSearchByCategory.aspx?SearchKey=其他">其他商品</a></li>
                                             </ul>
                                        </li>

                                    </ul>
                                </div>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
            <!-- SHOP SECTION END -->             

        </section>
        <!-- End page content -->
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
        </form>
</body>

</html>