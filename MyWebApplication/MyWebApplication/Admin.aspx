<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="MyWebApplication.Admin" validateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="Scripts/ckfinder/ckfinder.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function () {
    var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "home";
    $('#Tabs a[href="#' + tabName + '"]').tab('show');
    $("#Tabs a").click(function () {
        $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
    });
    });
    </script>
    <style type="text/css">
    * {
    box-sizing: border-box;
    }

    body {
    font-family: Arial, Helvetica, sans-serif;
    margin: 0;
    }
    /* Column container */
    .row {  
    display: flex;
    flex-wrap: wrap;
    }

    /* Create two unequal columns that sits next to each other */
    /* Sidebar/left column */
    .side {
    width: 20%;
    height: 100%;
    position: fixed;
    background-color: #333;
    padding-left: 10px;
    padding-right: 10px;
    }
    /* Style the search box */
    #mySearch {
    border-radius:5px;
    width: 100%;
    font-size:large;
    padding: 10px;
    border: 1px solid #ddd;
    }
    /* Style the navigation menu inside the left column */
    #myMenu {
    list-style-type: none;
    padding: 0;
    margin: 0;
    }

    #myMenu li a {
    font-size:large;
    padding:10px;
    text-decoration: none;
    color: white;
    display: block
    }

    #myMenu li a:hover {
    color: black;
    }
    #myMenu li a.active {
    background-color: #666;
    color: black;
    }
    /* Main column */
    .main { 
    width: 81%;
    margin-left: 20%;
    height: 100%;
    position: fixed;
    padding-left:10px;
    }

    /* Fake image, just for this example */
    .fakeimg {
    background-color: #aaa;
    width: 100%;
    padding: 20px;
    }

    /* Responsive layout - when the screen is less than 700px wide, make the two columns stack on top of each other instead of next to each other */
    @media screen and (max-width: 600px) {
    .row {   
    flex-direction: column;
    }
    }

    /* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
    @media screen and (max-width: 400px) {
    .navbar a {
    float: none;
    width:100%;
    }
    }
    .btn{
        border-radius: 5px;
        font-size:20px;
    }
        </style>
<div class="row">
  <div class="side">
    <input type="text" id="mySearch" onkeyup="myFunction()" placeholder="Search.." title="Type in a category">
    <ul id="myMenu" class="nav nav-pills nav-stacked">
    <li class="active"><a data-toggle="tab" href="#home">管理員系統</a></li>
    <li><a data-toggle="tab" href="#menu1">會員管理</a></li>
    <li><a data-toggle="tab" href="#menu2" >類別管理</a></li>
    <li><a data-toggle="tab" href="#menu3" >產品管理</a></li>
    <li><a data-toggle="tab" href="#menu4" >供應商管理</a></li>
    <li><a data-toggle="tab" href="#menu5" >訂單管理</a></li>
    <li><a data-toggle="tab" href="#menu6" >公告管理</a></li>
    <li><a data-toggle="tab" href="#menu7" >商品庫存管理</a></li>
    <li><a data-toggle="tab" href="#menu8" >購物車運費管理</a></li>
    </ul>
  </div>
  <div class="main">
      <asp:HiddenField ID="TabName" runat="server" />
      <span style="float:right;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
    </span>
    <div class="tab-content" style="width:100%;height:95%">
    <!--管理員系統#home-->
    <iframe id="home" class="tab-pane fade in active" src="DashBoard.aspx" style="border:0;height:100%;width:100%"></iframe>
    <!--會員管理#menu1-->
    <iframe id="menu1" class="tab-pane fade" src="Member.aspx" style="border:0;height:100%;width:100%"></iframe>
    <!--類別管理#menu2-->
    <iframe id="menu2" class="tab-pane fade" src="Category.aspx" style="border:0;height:100%;width:100%"></iframe>
    <!--產品管理#menu3-->
    <iframe id="menu3" class="tab-pane fade" src="Product.aspx" style="border:0;height:100%;width:100%"></iframe>
    <!--供應商管理#menu4-->
    <iframe id="menu4" class="tab-pane fade" src="Supplier.aspx" style="border:0;height:100%;width:100%"></iframe>  
    <!--訂單管理#menu5-->
    <iframe id="menu5" class="tab-pane fade" src="Order.aspx" style="border:0;height:100%;width:100%"></iframe>
    <!--公告管理#menu6-->
    <iframe id="menu6" class="tab-pane fade" src="Bulletin.aspx" style="border:0;height:100%;width:100%"></iframe>   
    <!--商品庫存管理#menu7-->
    <iframe id="menu7" class="tab-pane fade" src="Purchase.aspx" style="border:0;height:100%;width:100%"></iframe>   
    <!--購物車運費管理#menu8-->
    <iframe id="menu8" class="tab-pane fade" src="Freight.aspx" style="border:0;height:100%;width:100%"></iframe>   
  </div>
</div>
</div>
<script>
function myFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("mySearch");
  filter = input.value.toUpperCase();
  ul = document.getElementById("myMenu");
  li = ul.getElementsByTagName("li");
  for (i = 0; i < li.length; i++) {
    a = li[i].getElementsByTagName("a")[0];
    if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";
    }
  }
}
</script> 
</asp:Content>
