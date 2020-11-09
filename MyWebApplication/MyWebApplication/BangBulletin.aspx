<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BangBulletin.aspx.cs" Inherits="MyWebApplication.BangBulletin" %>

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
var s = document.getElementById('timer1');
    s.innerHTML = s.innerHTML - 1;

if (s.innerHTML == 0)
window.location = 'https://www.youtube.com/?gl=TW';
else
setTimeout('countdown()', 1000);
}
</script>
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
                                        <a href="BangLogin.aspx">
                                            <i class="zmdi zmdi-account"></i>
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

        
        <!-- END HEADER AREA -->
   
        <!-- Start page content -->
        <div id="page-content" class="page-wrapper" >
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns ="False" hight="1500" Width="1094px" ForeColor="Black" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="category" HeaderText="公告類別"/>                    
                    <asp:TemplateField HeaderText="公告標題">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("bullentin") %>' ForeColor="Black"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl='<%# Bind("bulletinid", "BangBulletinDetail.aspx?bulletinid={0}") %>' Text='<%# Bind("bulletin") %>' CssClass="aa"></asp:HyperLink>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="time" HeaderText="公告時間"/>   
                    
                   </Columns>
            </asp:GridView>
           
           </div>
        <br/>
        <hr/>
        
           
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