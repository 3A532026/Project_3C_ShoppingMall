<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BangConfirm.aspx.cs" Inherits="MyWebApplication.BangConfirm" %>

<!DOCTYPE html>

<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>確認購物明細</title>
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
    <div class="wrapper">

        <!--標頭超連結-->
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
                                        <a href="BangMember.aspx">
                                            <i class="zmdi zmdi-account"></i>
                                            會員專區
                                        </a>
                                    </li>

                                   <!-- <li>
                                        <a href="Login.aspx">
                                            <i class="zmdi zmdi-star"></i>
                                            管理員登入
                                        </a>
                                    </li> -->

                                    <!--<li>
                                        <a href="BangLogin.aspx">
                                            <i class="zmdi zmdi-lock"></i>
                                            Login
                                        </a>
                                    </li> -->

                                     <li>
                                        <a href="BangCart.aspx">
                                            <i class="zmdi zmdi-favorite"></i>
                                            購物車
                                        </a>
                                    </li>                                        
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
            <div class="box vpadding" style=""><img class="pic_timeline02" style="display:block; margin:auto;" src="../Image/Progress3.png" /></div>
          </div>
    </div>
        <br/>
       


 

                                                                                                             
                             <!--產生單據-->
                                <!-- order-complete start -->

                              <form  runat="server" style="position:center;text-align:center">
                                <div class="tab-pane" id="order-complete" style="position:center;text-align:center">                                   
                                    <div class="order-complete-content box-shadow" style="text-align:center;position:center">
                                        <div class="thank-you p-30 text-center" style="text-align:center;position:center">
                                            <h6 class="text-black-5 mb-0">請確認是否有誤</h6>
                                        </div>
                                          <div class="table-content table-responsive mb-50">
                                         <table class="text-center">
                                    
                                               
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" ShowFooter="True" OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="商品編號" InsertVisible="False" ReadOnly="True" SortExpression="Id"/>
                    <asp:BoundField DataField="Name" HeaderText="商品名稱" SortExpression="Name" />
                    <asp:BoundField DataField="Price" HeaderText="售價" SortExpression="Price" DataFormatString="{0:#}"/>
                    <asp:TemplateField HeaderText="數量"></asp:TemplateField>
                    <asp:TemplateField HeaderText="小計"></asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />    
                <SortedDescendingHeaderStyle BackColor="#242121" />
                     </asp:GridView>
                                        
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [Cart] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Cart] ([Id], [Name], [Price], [Purchaser]) VALUES (@Id, @Name, @Price, @Purchaser)" SelectCommand="SELECT * FROM [Cart]" UpdateCommand="UPDATE [Cart] SET [Name] = @Name, [Price] = @Price, [Purchaser] = @Purchaser WHERE [Id] = @Id">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="Id" Type="Int32" />
                                                <asp:Parameter Name="Name" Type="String" />
                                                <asp:Parameter Name="Price" Type="Int32" />
                                                <asp:Parameter Name="Purchaser" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Name" Type="String" />
                                                <asp:Parameter Name="Price" Type="Int32" />
                                                <asp:Parameter Name="Purchaser" Type="String" />
                                                <asp:Parameter Name="Id" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                           
                                       </table> 
                                              合計：$<asp:Label ID="total" runat="server" Text="Label"></asp:Label>元
                                          </div>
                                                      
                                        <br/>
          <center> 
             
          <table style="border:1px solid black;text-align: center;width:500px;height:200px;text-align:center;position:center;">
                <tr>
                    <td colspan="2" style="border:1px solid black;"><span style="color:black">訂購人資訊</span></td>
                </tr>
                <tr>
                    <td style="border:1px solid black;color:black"><asp:Label ID="Lbl0001" runat="server" Text="訂購人名稱"></asp:Label></td>
                     <td style="border:1px solid black;color:black"><asp:Label ID="LblName" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td style="border:1px solid black;color:black"><asp:Label ID="Lbl0011" runat="server" Text="訂購人Email"></asp:Label></td>
                     <td style="border:1px solid black;color:black"><asp:Label ID="LblEmail" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td style="border:1px solid black;color:black"><asp:Label ID="Lbl0101" runat="server" Text="訂購人電話"></asp:Label></td>
                     <td style="border:1px solid black;color:black"><asp:Label ID="LblPhone" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td style="border:1px solid black;color:black"><asp:Label ID="Label1" runat="server" Text="訂購人地址"></asp:Label></td>
                     <td style="border:1px solid black;color:black"><asp:Label ID="LblAddress" runat="server" Text=""></asp:Label></td>
                </tr>
                 </table>
            <br/>
           <table style="border:1px solid black;text-align: center;width:500px;height:200px;">
                <tr>
                    <td colspan="2" style="border:1px solid black;color:black">收貨人資訊</td>
                </tr>
                <tr>
                    <td style="border:1px solid black;color:black"><asp:Label ID="Label2" runat="server" Text="收貨人名稱"></asp:Label></td>
                     <td style="border:1px solid black;color:black"><asp:Label ID="R_LblName" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td style="border:1px solid black;color:black"><asp:Label ID="Label4" runat="server" Text="收貨人Email"></asp:Label></td>
                     <td style="border:1px solid black;color:black"><asp:Label ID="R_LblEmail" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td style="border:1px solid black;color:black"><asp:Label ID="Label6" runat="server" Text="收貨人電話"></asp:Label></td>
                     <td style="border:1px solid black;color:black"><asp:Label ID="R_LblPhone" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td style="border:1px solid black;color:black"><asp:Label ID="Label8" runat="server" Text="收貨人地址"></asp:Label></td>
                     <td style="border:1px solid black;color:black"><asp:Label ID="R_LblAddress" runat="server" Text=""></asp:Label></td>
                </tr>
             </table>
                                        <br />
             <table style="border:1px solid black;text-align: center;width:500px;height:200px;">
                <tr>
                    <td colspan="2" style="border:1px solid black;color:black">付款方式</td>
                </tr>
                <tr>
                    <td style="border:1px solid black;color:black"><asp:Label ID="Label3" runat="server" Text="付款方式"></asp:Label></td>
                     <td style="border:1px solid black;color:black"><asp:Label ID="LblPayment" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td style="border:1px solid black;color:black"><asp:Label ID="Label7" runat="server" Text="店家"></asp:Label></td>
                     <td style="border:1px solid black;color:black"><asp:Label ID="LblBranch" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td style="border:1px solid black;color:black"><asp:Label ID="Label10" runat="server" Text="發票"></asp:Label></td>
                     <td style="border:1px solid black;color:black"><asp:Label ID="Lb1Invoice" runat="server" Text=""></asp:Label></td>
                </tr>           
                                         </table>
                                       </div>
                                    <asp:Button ID="BtnBack" class="submit-btn-1 mt-30 btn-hover-1" runat="server" Text="返回" />
                                    <asp:Button ID="BtnSent" class="submit-btn-1 mt-30 btn-hover-1" runat="server" Text="確認送出" OnClick="BtnSent_Click" />
                                    </div>
         <div>
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" InsertCommand="INSERT INTO [Orders] (orderid,status,deliver_status,total, name, email, address, phone, takename, takeemail, takeaddress, takephone, paytype, purchasedate,userid) VALUES (@orderid,@status,@deliver_status,@total, @name, @email,@address, @phone, @takename, @takeemail, @takeaddress, @takephone, @paytype,@purchasedate,@userid)" SelectCommand="SELECT * FROM [Orders]">
                <InsertParameters>
                    <asp:Parameter Name="orderid" />
                    <asp:Parameter Name="status" />
                    <asp:Parameter Name="deliver_status" />
                    <asp:Parameter Name="total" />
                    <asp:Parameter Name="name" />
                    <asp:Parameter Name="email" />
                    <asp:Parameter Name="phone" />
                    <asp:Parameter Name="takename" />
                    <asp:Parameter Name="takeemail" />
                    <asp:Parameter Name="takeaddress" />
                    <asp:Parameter Name="takephone" />
                    <asp:Parameter Name="paytype" />
                    <asp:Parameter Name="purchasedate" />
                    <asp:Parameter Name="address" />
                    <asp:Parameter Name="userid" />
                    <asp:Parameter />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" InsertCommand="INSERT INTO OrderDetail(orderid, productid, quantity) VALUES (@orderid, @productid, @quantity)" SelectCommand="SELECT * FROM [OrderDetail]">
                <InsertParameters>
                    <asp:Parameter Name="orderid" />
                    <asp:Parameter Name="productid" />
                    <asp:Parameter Name="quantity" />
                </InsertParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [total],[takename], [takeemail], [paytype], [takeaddress], [orderid] FROM [Orders] WHERE orderid=@orderid">
                 <SelectParameters>
                <asp:Parameter Name="orderid"/>
            </SelectParameters>
            </asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT Products.productname, Products.price, OrderDetail.quantity FROM [OrderDetail] INNER JOIN [Products] ON [Products].ProductId=[OrderDetail].productid  WHERE [OrderDetail].orderid=@orderid ">
                <SelectParameters>
                <asp:Parameter Name="orderid"/>
            </SelectParameters>
            </asp:SqlDataSource>
             </div>
                                  </center> 
                                  </form>
            <!-- SHOP SECTION END -->             

        <!-- End page content -->


                 
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