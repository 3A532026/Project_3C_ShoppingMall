<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BangShop.aspx.cs" Inherits="MyWebApplication.BangShop" %>

<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Subash || Shop</title>
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
</head>
    <!-- Modernizr JS -->
    <script src="Subas/js/vendor/modernizr-2.8.3.min.js"></script>



<body>
    <form runat="server">
      
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
                                        <a href="BangLogin.aspx">
                                            <i class="zmdi zmdi-account"></i>
                                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
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
   
        <!-- END HEADER AREA -->

        <!-- Start page content -->
        <div id="page-content" class="page-wrapper">

            <!-- SHOP SECTION START -->
            <div class="shop-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-md-push-3 col-sm-12">
                            <div class="shop-content">
                                <!-- shop-option start -->
                                <div class="shop-option box-shadow mb-30 clearfix">
                                    <!-- Nav tabs -->
                                    <ul class="shop-tab f-left" role="tablist">
                                        <li class="active">
                                            <a href="#grid-view" data-toggle="tab"><i class="zmdi zmdi-view-module"></i></a>
                                        </li>
                                        <li>
                                            <a href="#list-view" data-toggle="tab"><i class="zmdi zmdi-view-list-alt"></i></a>
                                        </li>
                                    </ul>
                                    <!-- showing -->
                                   
                                </div>
                                <!-- shop-option end -->
                                <!-- Tab Content start -->
                                <div class="tab-content">
                                    <!-- grid-view -->
                                    <div role="tabpanel" class="tab-pane active" id="grid-view">
                                        <div class="row">
                                            <!--  product-item start -->
                                           <% foreach (Product product in productArray) {%>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="product-item">
                                                    <div class="product-img">
                                                    <% =product.getImage() %>
                                                        
                                                  <!--  <img src="data:image/png;base64,% =product.getImage() %>" style="height:300px; width:270px;" alt="沒圖片啦" />  
                                                     -->   
                                                    </div>
                                                    
                                                    <div class="product-info">
                                                        <h6 class="product-title">
                                                             <%= product.getProductName() %>
                                                       
                                                        </h6>

                                                        <h3 class="pro-price" style="color:red" ><asp:Label ID="Label1" runat="server" Text="$"  ></asp:Label><%= product.getPrice() %></h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}%>
                                            
                                        </div>
                                    </div>
                                    <!-- list-view -->
                                    <div role="tabpanel" class="tab-pane" id="list-view">
                                        <div class="row">
                                            <!-- product-item start -->

                                             <% foreach (Product product in productArray) {%>
                                            <div class="col-md-12">
                                                <div class="shop-list product-item">
                                                    <div class="product-img">
                                                       <% =product.getImage() %>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="clearfix">
                                                            <h6 class="product-title f-left" >
                                                               <%= product.getProductName() %>
                                                            </h6>
                                                        </div>
                                                        
                                                        <h3 class="pro-price" style="color:red"> <asp:Label ID="Label2" runat="server" Text="$"></asp:Label><%= product.getPrice() %></h3>
                                                                                                         
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- product-item end -->
                                            <%}%>
                                           
                                        </div>                                        
                                    </div>
                                </div>
                                <!-- Tab Content end -->
                            </div>
                        </div>

                        <div class="col-md-3 col-md-pull-9 col-sm-12">
                            <!-- widget-search -->
                            <aside class="widget-search mb-30">
                                
                             <!-- SearchButton --> 
 
                                <form action="#">
                                    
                                  <button type="submit" id="SearchButton" onclick="Search()"><i class="zmdi zmdi-search"></i></button> 
                                    
                                   <input type="text" id="SearchKey" placeholder="Search here..." /> 
                                    <script>
                                        function Search()
                                        {
                                            var Str = document.getElementById("SearchKey").value;
                                            var Key = Str.toUpperCase();
                                            //alert(Key);
                                           window.open('BangShopSearch.aspx?SearchKey=' + Key);
                                        }
                                   </script>
                               </form>
                            </aside>
                            <!-- widget-categories -->
                            <aside class="widget widget-categories box-shadow mb-30">
                                <h6 class="widget-title border-left mb-20">商品類別</h6>
                                <div id="cat-treeview" class="product-cat">
                                   <ul>
                                        <li class="opened"><a href="BangShop.aspx">商品一覽</a>
                                            <ul>

                                            </ul>
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
            
        </div>
        
        <!-- End page content -->

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

