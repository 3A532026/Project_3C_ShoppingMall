<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/BangMemberEdit.aspx.cs" CodeBehind="BangMemberEdit.aspx.cs" Inherits="MyWebApplication.BangMemberEdit" %>


<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <style>
* {box-sizing: border-box}

body {font-family: Verdana, sans-serif; margin:0}

.mySlides {display:none}

img {vertical-align: middle;}


.slideshow-container {
  width:211px;
  height:1469px;
  position:absolute;
  margin:auto;
}

.SideShowDiv
{
  width: 1636px;
  height: 211px;
  background-repeat: no-repeat;
  position: absolute;
  z-index: auto;
  left: -18%;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next 
{
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover 
{
  background-color: rgba(0,0,0,0.87);
}

/* Caption text */
.text 
{
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext 
{
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot 
{
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 3px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover 
{
  background-color: #717171;
}

/* Fading animation */
.fade 
{
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade 
{
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade 
{
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) 
{
  .prev, .next,.text {font-size: 11px}
}
</style>
    <title>會員資料修改</title>
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
    <script>
        
        var SlideIndex = 0;
        ShowSlides(SlideIndex);

    function plusSlides(n)
    {
        ShowSlides(SlideIndex += n);
    }

    function currentSlide(n)
    {
        ShowSlides(SlideIndex = n);
    }

    /*function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) { SlideIndex = 1 }
        if (n < 1) { SlideIndex = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[SlideIndex - 1].style.display = "block";
        dots[SlideIndex - 1].className += " active";
        } 
        
        var SlideIndex = 0;
        ShowSlides(); */
      
    function ShowSlides()
    {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        for (i = 0; i < slides.length; i++)
        {
            slides[i].style.display = "none"; 
        }

        SlideIndex++;
        if (SlideIndex > slides.length) {SlideIndex = 1} 
        slides[SlideIndex-1].style.display = "block"; 
        setTimeout(ShowSlides, 3000); //每 n ms 換一次圖   1second = 1000 micro second
    }
        
    </script>
 
    

<body>
    <form id="MemberManagement" runat="server" >
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
                                       
                               <%--     <li>
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
                                    </li>--%>
                                   
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
                                        
                                     <%--    <li class="mega-parent"><a href="BangBulletin.aspx">公告</a> </li>

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
                                           
                                        </li>--%>
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

            <!-- LOGIN SECTION START -->
            <div class="login-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="my-account-content" id="accordion2">
                                <!-- My Personal Information -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion2" href="#personal_info">會員資料修改</a>
                                        </h4>
                                    </div>
                                    <div id="personal_info" class="panel-collapse collapse in" role="tabpanel">
                                        <div class="panel-body">
                                            
                                                <div class="new-customers">
                                                    <div class="p-30">
                                                        <div class="row">                                                            
                                                           <div class="col-sm-6">
                                                               <asp:Label ID="LblAccount" runat="server" Text="帳號 : "></asp:Label>
                                                                <asp:TextBox ID="TxtAccount" runat="server" ReadOnly="True"></asp:TextBox>
                                                            </div>
                                                              <div class="col-sm-6">
                                                               <asp:Label ID="LblBirthday" runat="server" Text="生日 : "></asp:Label>
                                                                <asp:TextBox ID="TxtBirthday" runat="server" ReadOnly="True"></asp:TextBox>
                                                            </div>
                                                            <div class="col-sm-6">
                                                        <asp:Label ID="LblName" runat="server" Text="姓名 : "></asp:Label>
                                                        <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                                                           </div>

                                                            <div class="col-sm-6">
                                                               <asp:Label ID="LblEmail" runat="server" Text="電郵 : "></asp:Label>
                                                                <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox>
                                                            </div>
                                   
                                                            <div class="col-sm-6">
                                                               <asp:Label ID="LblPhone" runat="server" Text="電話 : "></asp:Label>
                                                                <asp:TextBox ID="TxtPhone" runat="server"></asp:TextBox>
                                                            </div>

                                                          <div class="col-sm-6">
                                                               <asp:Label ID="LblAddress" runat="server" Text="地址 : "></asp:Label>
                                                                <asp:TextBox ID="TxtAddress" runat="server"></asp:TextBox>
                                                            </div>
                                                     
                                                      
                                                         
                                                    </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <asp:Button CssClass="submit-btn-1 mt-20 btn-hover-1" ID="BtnUpdate" runat="server" Text="修改" OnClick="BtnUpdate_Click" OnClientClick="if (confirm('確定修改嗎？')==false) {return false;}"/>
                                                                <!-- <button class="submit-btn-1 mt-20 btn-hover-1" type="submit" value="register">Save</button> -->
                                                            </div>

                                                            </div>
                                                        </div>
                                                        </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>             
    </body>

</html>