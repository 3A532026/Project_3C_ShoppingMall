<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BangBulletinDetail.aspx.cs" Inherits="MyWebApplication.BangBulletinDetail" %>

<!DOCTYPE html>


<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    
    <title>公告頁面</title>
    <!--每隔content秒重整一次頁面-->
    <meta http-equiv="refresh" content="200; url=https://www.youtube.com/?gl=TW"/>
    <meta name="description" content="這裡打上對該網頁的描述"/>
    <meta name="Author" content="作者"/>
    <meta name="Creation-Date" content="25-mar-2019 20:36:01"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!--<script id="直接傳址">
  location.href= ('http://n.sfs.tw');
    </script>-->
    <script>

    </script>
    <!-- Favicon -->
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
    <!-- User style -->
    <link rel="stylesheet" href="Subas/css/custom.css"/>
    
    <!-- Style customizer (Remove these two lines please) -->
    <link rel="stylesheet" href="Subas/css/style-customizer.css"/>
    <link href="#" data-style="styles" rel="stylesheet"/>

    <!-- Modernizr JS -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

 <body>
<!--JS做幾秒後轉跳頁面 -->
<script type='text/javascript'>
setTimeout('countdown()', 1000);
function countdown() {
var s = document.getElementById('tim');
    s.innerHTML = s.innerHTML - 1;

if (s.innerHTML == 0)
window.location = 'https://www.youtube.com/?gl=TW';
else
setTimeout('countdown()', 1000);
}
</script>
     <form id="form1" runat="server">





          <style>
.bAAA {  display:table-cell;
    vertical-align: middle;
position: absolute;

}

.ASS{
      width: 450px;/*必須要設定你整個DIV區塊的寬度*/
  position: absolute;
  margin: -100px 0px 0px -200px;/*調整水平垂直置中*/
  top: 50%;
  left: 50%;
  overflow: auto;
}

</style>
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
                                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>                                     
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

        <!-- BREADCRUMBS SETCTION START -->
    <!--    <div class="breadcrumbs-section plr-200 mb-80">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">product grid view</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="index.html">Home</a></li>
                                    <li>product grid view</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMBS SETCTION END -->

        <!-- Start page content -->
        <div id="page-content" class="page-wrapper" >
            <div>
 <asp:DetailsView ID="DetailsView1"  runat="server" CssClass="ASS" AutoGenerateRows="False" DataKeyNames="bulletinid" Height="200px" BorderWidth="0px" CellPadding="0" CellSpacing="1" Width="85%" >
                <Fields >
                    <asp:BoundField DataField="category"  SortExpression="category" />
                    <asp:BoundField DataField="bulletin"  SortExpression="bulletin" />
                    <asp:TemplateField  SortExpression="Content">
 <EditItemTemplate>
                           
<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Content") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Content") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>                            
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Content") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Date"  SortExpression="Date" />                            
                </Fields>
            </asp:DetailsView>
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <asp:Button ID="Btn_Back" runat="server" Text="返回" Height="22px" OnClick="Btn_Back_Click"/>
        </div>
            </div>

        <!-- End page content -->

        <!-- START QUICKVIEW PRODUCT -->
        <div id="quickview-wrapper">
            <!-- Modal -->
            <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-product clearfix">
                                <div class="product-images">
                                    <div class="main-image images">
                                        <img alt="" src="img/product/quickview.jpg">
                                    </div>
                                </div><!-- .product-images -->
                                
                                <div class="product-info">
                                    <h1>Aenean eu tristique</h1>
                                    <div class="price-box-3">
                                        <div class="s-price-box">
                                            <span class="new-price">£160.00</span>
                                            <span class="old-price">£190.00</span>
                                        </div>
                                    </div>
                                    <a href="single-product-left-sidebar.html" class="see-all">See all features</a>
                                    <div class="quick-add-to-cart">
                                        <form method="post" class="cart">
                                            <div class="numbers-row">
                                                <input type="number" id="french-hens" value="3">
                                            </div>
                                            <button class="single_add_to_cart_button" type="submit">Add to cart</button>
                                        </form>
                                    </div>
                                    <div class="quick-desc">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero.
                                    </div>
                                    <div class="social-sharing">
                                        <div class="widget widget_socialsharing_widget">
                                            <h3 class="widget-title-modal">Share this product</h3>
                                            <ul class="social-icons clearfix">
                                                <li>
                                                    <a class="facebook" href="#" target="_blank" title="Facebook">
                                                        <i class="zmdi zmdi-facebook"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="google-plus" href="#" target="_blank" title="Google +">
                                                        <i class="zmdi zmdi-google-plus"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="twitter" href="#" target="_blank" title="Twitter">
                                                        <i class="zmdi zmdi-twitter"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="pinterest" href="#" target="_blank" title="Pinterest">
                                                        <i class="zmdi zmdi-pinterest"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="rss" href="#" target="_blank" title="RSS">
                                                        <i class="zmdi zmdi-rss"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div><!-- .product-info -->
                            </div><!-- .modal-product -->
                        </div><!-- .modal-body -->
                    </div><!-- .modal-content -->
                </div><!-- .modal-dialog -->
            </div>
            <!-- END Modal -->
        </div>
        <!-- END QUICKVIEW PRODUCT -->  
    
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
