<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GoodsDetail.aspx.cs" Inherits="MyWebApplication.GoodsDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
    body {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    }
    
    .btn{
        border-radius: 5px;
        font-size:20px;
    }  
        </style>
    <div style="clear:both">   
    <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="2" DataKeyField="ProductId" DataSourceID="SqlDataSource1" ForeColor="Black"  OnItemCommand="DataList1_ItemCommand" HorizontalAlign="Center">
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
    <table>
        <tr>
            <td>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("img")) %>' Height="300px" Width="400px"/>
            </td>
            <td>
                <div>
                <asp:Label ID="ProductIdLabel" runat="server" Text='<%# Eval("productid") %>' Visible="false"/><br />
                <b><asp:Label ID="productnameLabel" runat="server" CssClass="city" Font-Size="X-Large" Text='<%# Eval("productname") %>' /></b><br />
                產品分類:<asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("category") %>' /><br />
                產品庫存:<asp:Label ID="InventoryLabel" runat="server" Text='<%# Eval("inventory") %>'></asp:Label><br />
                <b><span style="color:red;font-size:x-large">$</span><asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price","{0:#}") %>' ForeColor="Red" Font-Size="X-Large"/></b><br />
                <asp:Button ID="btn_car" runat="server" Text="+加入購物車" CssClass="btn" ForeColor="White" BackColor="Red"  CommandName="AddtoCart" CommandArgument='<%# Eval("productid") %>' />
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            <hr />
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("description") %>'></asp:Label>
            </td>
        </tr>
    </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Products] WHERE ([productid] = @productid)">
        <SelectParameters>
                    <asp:QueryStringParameter Name="productid" QueryStringField="productid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>
