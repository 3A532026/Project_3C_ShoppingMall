<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BangPaymentInfo.aspx.cs" Inherits="MyWebApplication.BangPaymentInfo" %>

<!Doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>購買資訊</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="../img/icon/favicon.png">

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
    <!-- User style -->
    <link rel="stylesheet" href="Subas/css/custom.css">
    
    <!-- Style customizer (Remove these two lines please) -->
    <link rel="stylesheet" href="css/style-customizer.css">
    <link href="#" data-style="styles" rel="stylesheet">

    <!-- Modernizr JS -->
    <script src="Subas/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->  

    <!-- Body main wrapper start -->
    <!-- START HEADER AREA -->
    <div class="wrapper">
       
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
        <!-- SHOP SECTION START -->

<!-- 進度條 -->
<!--備用
   <div class="progress">       
        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="66.6" aria-valuemin="0" aria-valuemax="100" style="width: 66.6%">
            已完成66.6%
        </div>
    </div>

   <div class="progress">
        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%; min-width:2em;">
            0% Complete
        </div>    
    </div>
     <h1 >目前進度：確認購買商品</h1>-->


   
       
        
    <div class="box_style1">
          <div class="content_box">
            <div class="box vpadding" style=""><img class="pic_timeline02" style="display:block; margin:auto;" src="Image/Progress2.png" /></div>
          </div>
    </div>
        <br/>      
                                <!--購買方式、訂購人資訊、小計、送出-->
                                <!-- checkout start -->
                                <div class="tab-pane" id="checkout">
                                    <div class="checkout-content box-shadow p-30">
                                        <form runat="server">
                                            <div class="row">
                                                <!-- billing details -->
                                                <div class="col-md-6">
                                                    <div class="billing-details pr-10">
                                                        <h6 class="widget-title border-left mb-20">訂購人資訊</h6>
                                                        <asp:Label ID="Lbl1Name" runat="server" Text="訂購人名稱"></asp:Label>
                                                        <asp:TextBox ID="TbName" runat="server"></asp:TextBox>
                                                         <asp:Label ID="LblEmail" runat="server" Text="訂購人Email"></asp:Label>
                                                        <asp:TextBox ID="TbEmail" runat="server"></asp:TextBox>
                                                        <asp:Label ID="LblTbPhone" runat="server" Text="訂購人電話"></asp:Label>
                                                        <asp:TextBox ID="TbPhone" runat="server"></asp:TextBox>
                                                         <asp:Label ID="Lb1Address" runat="server" Text="訂購人地址"></asp:Label>
                                                        <asp:TextBox ID="TbAddress" runat="server" TextMode="MultiLine"></asp:TextBox>  
                                                        <br/>
                                                         <h6 class="widget-title border-left mb-20">收貨人資訊</h6>
                                                        <asp:Label ID="R_Lbl1Name" runat="server" Text="收貨人名稱"></asp:Label>
                                                        <asp:TextBox ID="R_TbName" runat="server"></asp:TextBox>
                                                         <asp:Label ID="R_LblEmail" runat="server" Text="收貨人Email"></asp:Label>
                                                        <asp:TextBox ID="R_TbEmail" runat="server"></asp:TextBox>
                                                        <asp:Label ID="R_LblTbPhone" runat="server" Text="收貨人電話"></asp:Label>
                                                        <asp:TextBox ID="R_TbPhone" runat="server"></asp:TextBox>
                                                         <asp:Label ID="R_Lb1Address" runat="server" Text="收貨人地址"></asp:Label>
                                                        <asp:TextBox ID="R_TbAddress" runat="server" TextMode="MultiLine"></asp:TextBox>   
                                                        <asp:CheckBox ID="CBSynchronize" runat="server" Text="同步訂購人資訊到收貨人資訊" AutoPostBack="true" OnCheckedChanged="CBSynchronize_CheckedChanged" />
                                             
                                                 
                                      </div>
                                                </div>
                                                <div class="col-md-6">                                                    
                                                    <!-- payment-method -->
                                                    <div class="payment-method">
                                                        <h6 class="widget-title border-left mb-20">付款方式</h6>
                                                        <div id="accordion">
                                                            <div class="panel">
                                                                <h4 class="payment-title box-shadow">
                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#bank-transfer" >
                                                                    收貨方式
                                                                    </a>
                                                                </h4>
                                                                <div id="bank-transfer" class="panel-collapse collapse in" >
                                                                    <div class="payment-content">
                                                                    <p> <input type="radio" name="address" value="同個人資料"/>貨到付款
                                                                        <input type="radio" name="address" value="其他地址"/>超商付款</p>                                                                      
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="panel">
                                                                <h4 class="payment-title box-shadow">
                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                                    選擇超商取貨
                                                                    </a>
                                                                </h4>
                                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                                    <div class="payment-content">
                                                                        <p>請選擇地區</p><br/>                                                                                                                                             
		                                                                <select id="college-list"  onchange="changeCollege(this.selectedIndex)"></select>
                                                                        <p>選擇分店</p>
		                                                                <select id="sector-list" name="branch"></select>
 <script type="text/javascript">               
       
            window.onload = function () {
                var colleges = ['請選擇', '新北市', '工學院', '建設學院', '金融學院', '建築專業學院', '國際科技與管理學院', '資電學院', '人文社會學院', '理學院', '經營管理學院', '跨領域設計學院', '跨科系學習'];
                var collegeSelect = document.getElementById("college-list");
                var inner = "";
                for (var i = 0; i < colleges.length; i++) {
                    inner = inner + '<option value=i>' + colleges[i] + '</option>';
                }
                collegeSelect.innerHTML = inner;
            }

            var sectors = new Array();
            sectors[0] = ['請選擇'];
            sectors[1] = ['三重', ' 重慶', ' 新北', ' 台大'];
            sectors[2] = ['機械與電腦輔助工程學系 ', ' 纖維與複合材料學系 ', ' 工業工程與系統管理學系 ', ' 化學工程學系 ', ' 航太與系統工程學系 ', ' 精密系統設計學士學位學程 ', '電聲碩士學位學程 ', ' 綠色能源科技碩士學位學程 ', ' 創意設計碩士學位學程 ', ' 材料與製造工程碩士在職專班 ', ' 智能製造與工程管理碩士在職學位學程 ', '機械與航空工程博士學位學程 '];
            sectors[3] = ['土木工程學系 ', ' 水利工程與資源保育學系 ', ' 都市計畫與空間資訊學系 ', ' 運輸與物流學系 ', ' 土地管理學系 ', '景觀與遊憩碩士學位學程 ', ' 專案管理碩士在職學位學程 ', ' 建設碩士在職學位學程 ', '土木水利工程與建設規劃博士學位學程 '];
            sectors[4] = ['風險管理與保險學系 ', ' 財務金融學系 ', ' 財務工程與精算學士學位學程 ', '金融碩士在職學位學程 ', '金融博士學位學程 '];
            sectors[5] = ['建築專業學院學士班 ', ' 建築學士學位學程 ', ' 室內設計學士學位學程 ', ' 室內設計進修學士班 ', ' 創新設計學士學位學程 ', ' 建築碩士學位學程 ', ' 建築碩士在職學位學程', '澳洲墨爾本皇家理工大學商學與創新雙學士學位學程 ', '美國聖荷西州立大學商學大數據分析雙學士學位學程 ']
            sectors[6] = ['美國普渡大學電機資訊雙學士學位學程 ', '西班牙薩拉戈薩大學物流供應鏈管理與創新創業雙碩士學位學程 ', '國際經營管理碩士學位學程 '];
            sectors[7] = ['資訊工程學系 ', ' 電機工程學系 ', ' 電子工程學系 ', ' 自動控制工程學系 ', ' 通訊工程學系', ' 資電不分系榮譽班 ', '資訊電機工程碩士在職學位學程 ', ' 產業研發碩士專班 ', ' 生醫資訊暨生醫工程碩士學位學程 ', ' 視光科技碩士在職學位學程 ', '電機與通訊工程博士學位學程 ', ' 智慧聯網產業博士學位學程'];
            sectors[8] = ['中國文學系 ', ' 外國語文學系 ', '歷史與文物研究所 ', ' 公共事務與社會創新研究所 '];
            sectors[9] = ['應用數學系 ', ' 環境工程與科學學系 ', ' 材料科學與工程學系 ', ' 光電學系 ', '微積分教學中心 ', ' 物理教學研究中心 '];
            sectors[10] = ['經營管理碩士在職學位學程 ', ' 電子商務碩士在職專班 '];
            sectors[11] = ['大雞雞'];
            sectors[12] = ['通識教育中心 ', ' 雲端學院 ', '外語教學中心 ', ' 國語文教學中心 ', '全校國際生大一不分系學士班 '];

            function changeCollege(index) {
                var Sinner = "";
                for (var i = 0; i < sectors[index].length; i++) {
                    Sinner = Sinner + '<option value=i>' + sectors[index][i] + '</option>';
                }
                var sectorSelect = document.getElementById("sector-list");
                sectorSelect.innerHTML = Sinner;
            }
            changeCollege(document.getElementById("college-list").selectedIndex);

            window.onload = function () {
                document.getElementById("TextBox1").value = name;
            }
        
    </script>
                                                                    </div>
                                                                </div>
                                                            </div>                                                                                                                                                                                          
                                                            <div class="panel">
                                                                <h4 class="payment-title box-shadow">
                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour" >
                                                                    發票
                                                                    </a>
                                                                </h4>
                                                                <div id="collapseFour" class="panel-collapse collapse" >
                                                                    <div class="payment-content">
                                                                        <p>請選擇收據</p>
                                                                        <ul class="payent-type mt-10">
                                                                            <li>
                                                                                <input type="radio" name="invoice" value="開立發票"/>開立發票
                                                                                <input type="radio" name="invoice" value="統編"/>統編                                                                          
                                                                            </li>                                                                          
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- payment-method end -->
                                                    <asp:Button ID="BtnBack" class="submit-btn-1 mt-30 btn-hover-1" runat="server" Text="返回" OnClick="BtnBack_Click" />
                                                    <asp:Button ID="BtnNext" class="submit-btn-1 mt-30 btn-hover-1" runat="server" Text="下一步" OnClick="BtnNext_Click" />
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- checkout end -->
    
                            </div>

            <!-- SHOP SECTION END -->             

      
        <!-- End page content -->

        <!--頁尾結束-->

 
                 
    <!--CSS樣式區域-->
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
</html>
