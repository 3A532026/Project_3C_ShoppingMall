<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MyWebApplication.Cart" %>
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
   <div class="container text-center">   
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
             <div class="container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="productid" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" ShowFooter="true" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="Productid" HeaderText="商品編號" InsertVisible="False" ReadOnly="True" SortExpression="ProductId" />
                    <asp:BoundField DataField="Productname" HeaderText="商品名稱" SortExpression="Productname" />
                    <asp:BoundField DataField="Price" HeaderText="售價" SortExpression="Price" DataFormatString="{0:#}" />
                    <asp:TemplateField HeaderText="數量">
                        <ItemTemplate>
                            <asp:TextBox runat="server" id="Qty" OnTextChanged="Qty_TextChanged" AutoPostBack="true"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="小計"></asp:TemplateField>
                    <asp:TemplateField HeaderText="刪除">
                        <ItemTemplate>
                            <asp:CheckBox ID="Del" runat="server" OnCheckedChanged="Del_CheckedChanged" AutoPostBack="true"/>
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Productid], [Productname], [Price] FROM [Products]"></asp:SqlDataSource>
            <asp:Button ID="btn_check" runat="server" Text="->結帳" CssClass="btn" BackColor="#ff0000" ForeColor="White" PostBackUrl="~/Checkout.aspx"/></div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <h3>尚無商品!!</h3>
            <asp:Button ID="Button1" runat="server" Text="繼續購物" CssClass="btn" BackColor="#ff0000" ForeColor="White" PostBackUrl="~/Goods.aspx"/>
        </asp:View>
    </asp:MultiView></div>
    </asp:Content>
