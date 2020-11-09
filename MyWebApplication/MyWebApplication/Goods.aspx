<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Goods.aspx.cs" Inherits="MyWebApplication.Goods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
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
        </style>
    <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
    <div>
      <div class="col-sm-2">
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="categoryid" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" ShowFooter="true">
        <Columns>
            <asp:TemplateField HeaderText="商品分類">
                <HeaderTemplate>
                    <asp:Label ID="Label2" runat="server" Text="商品分類" Font-Size="X-Large"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("category") %>' CommandName="SelectCategory" Text='<%# Eval("category") %>' Font-Size="Larger"></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                         <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="%" CommandName="SelectCategory" Font-Size="Larger">所有分類</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM Category ORDER BY categoryid"></asp:SqlDataSource>
      </div> 
          <div class="col-sm-8">
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM Products WHERE (category LIKE @category)and[status]=N'上架中'">
        <SelectParameters>
            <asp:Parameter DefaultValue="%" Name="category" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="productid" DataSourceID="SqlDataSource2" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
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

                        <span style="font-size:X-Large;color:red;">$</span><asp:Label ID="priceLabel"  runat="server" Text='<%# Eval("price","{0:#}") %>' Font-Size="X-Large" ForeColor="Red"/><br />
                        庫存量:<asp:Label ID="InventoryLabel" runat="server" Text='<%# Eval("inventory") %>' Font-Size="Large" /><br />
                        <asp:Button ID="btn_car" runat="server" Text="+加入購物車" CssClass="btn" ForeColor="White" BackColor="Red" CommandName="AddtoCart" CommandArgument='<%# Eval("productid") %>'/><br /><br /><br />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
          </div>
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
