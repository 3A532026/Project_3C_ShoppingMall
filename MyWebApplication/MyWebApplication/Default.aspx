<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyWebApplication.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 20px;
        }
        .btn{
        border-radius: 5px;
        font-size:20px;
        } 
        #myBtn {
        display: none;
        position: fixed;
        bottom: 20px;
        right: 30px;
        z-index: 99;
        font-size: 18px;
        border: none;
        outline: none;
        background-color: red;
        color: white;
        cursor: pointer;
        padding: 15px;
        border-radius: 4px;
        }
        #myBtn:hover {
        background-color: #555;
        }
        /* Remove the navbar's default margin-bottom and rounded borders */ 
        .navbar {
        margin-bottom: 0;
        border-radius: 0;
        }
        /* Add a gray background color and some padding to the footer */
        footer {
        background-color: #f2f2f2;
        padding: 25px;
        }
        .carousel-inner img {
        width: 100%; /* Set width to 100% */
        margin: auto;
        min-height:200px;
        }
        /* Hide the carousel text when the screen is less than 600 pixels wide */
        @media (max-width: 600px) {
        .carousel-caption {
        display: none; 
            }
        }
    </style>
    <div>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="image/banner_15508212745c6fa79a6b96c.jpg" alt="Image">
        <div class="carousel-caption">
          <h3></h3>
          <p></p>
        </div>      
      </div>

      <div class="item">
        <img src="image/banner_15469110265c33fd3260dd7.jpg" alt="Image">
        <div class="carousel-caption">
          <h3></h3>
          <p></p>
        </div>      
      </div>
    </div>
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

<div class="container text-center">    
  <h1>推薦商品</h1>
    <br>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Top 3 * FROM [Products] WHERE [status]=N'上架中'">
    </asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="productid" DataSourceID="SqlDataSource2" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" >
        <ItemTemplate>
            <table>
                <tr>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#"data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("img")) %>' Height="300px" Width="400px" PostBackUrl='<%# Eval("productid", "GoodsDetail.aspx?productid={0}") %>'/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ProductIdLabel" runat="server" Text='<%# Eval("productid") %>' Visible="false"/><br />
                        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("productname") %>' Font-Size="X-Large" Font-Bold="true" NavigateUrl='<%# Eval("productid", "GoodsDetail.aspx?productid={0}") %>'></asp:HyperLink><br />
                        <span style="font-size:X-Large;color:red;">$</span><asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price","{0:#}") %>' Font-Size="X-Large" ForeColor="Red"/><br />
                        庫存量:<asp:Label ID="InventoryLabel" runat="server" Text='<%# Eval("inventory") %>' Font-Size="Large" /><br />
                        <asp:Button ID="btn_car" runat="server" Text="+加入購物車" CssClass="btn" ForeColor="White" BackColor="Red" CommandName="AddtoCart" CommandArgument='<%# Eval("productid") %>' /><br /><br /><br />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
        <p style="float:right;"><asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Goods.aspx" Font-Size="Larger">所有商品-></asp:LinkButton></p>     
  <div class="row">
      <h3></h3><br>
    <div class="col-sm-4">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Current Project</p>
    </div>
    <div class="col-sm-4"> 
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Project 2</p>    
    </div>
    <div class="col-sm-4">
      <div class="well">
       <p>Some text..    </div>
      <div class="well">
       <p>Some text..</p>
      </div>
    </div>
  </div>
</div>
<br>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
</div>
   <script>
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};
function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}
// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script> 
</asp:Content>
