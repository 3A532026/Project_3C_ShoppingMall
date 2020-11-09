<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Orderdetail.aspx.cs" Inherits="MyWebApplication.Orderdtail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
    body {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    }
    input{
        border-radius:3px;
        border: 0.5px groove #000;
    }
    input:focus {
        border: 0.5px groove #808080;
    }
    .btn{
        border-radius: 5px;
        width:255px;
        font-size:20px;
    }
        </style>
    <div class="container text-center">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="orderid" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="well" style="border-bottom: 2px solid #90c31f;">訂單編號   <asp:Label Text='<%# Eval("orderid") %>' runat="server" ID="orderidLabel" />   <span style="color:red;">(<asp:Label Text='<%# Eval("deliver_status") %>' runat="server" ID="Label1" />)</span></div>
                    <p>收件人資料</p>
                    <table>
                    <tr>
                    <td>姓名:</td>
                    <td><asp:Label Text='<%# Eval("takename") %>' runat="server" ID="takenameLabel" /></td>
                    </tr>
                    <tr>
                    <td>Email:</td>
                    <td><asp:Label Text='<%# Eval("takeemail") %>' runat="server" ID="takeemailLabel" /></td>
                    </tr>
                    <tr>
                    <td>付款方式:</td>
                    <td><asp:Label Text='<%# Eval("paytype") %>' runat="server" ID="paytypeLabel" /></td>
                    </tr>
                    <tr>
                    <td>收貨地點:</td>
                    <td><asp:Label Text='<%# Eval("takeaddress") %>' runat="server" ID="takeaddressLabel" /></td>
                    </tr>
                    </table>
                    <br />
                    <div class="well" style="border-bottom: 2px solid #90c31f;">訂單明細</div>
                    <div style="float:left;">消費總額:<asp:Label Text='<%# Eval("total") %>' runat="server" ID="Label7" /></div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT [total],[takename], [takeemail], [paytype], [takeaddress], [orderid],[deliver_status] FROM [Orders] WHERE orderid=@orderid">
        <SelectParameters>
                    <asp:QueryStringParameter Name="orderid" QueryStringField="orderid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="商品名稱" SortExpression="Name"></asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="售價" SortExpression="Price" DataFormatString="{0:#}"></asp:BoundField>
                        <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT Products.Name, Products.Price, OrderDetail.quantity FROM [OrderDetail] INNER JOIN [Product] ON [Product].Id=[OrderDetail].productid  WHERE [OrderDetail].orderid=@orderid ">
        <SelectParameters>
                    <asp:QueryStringParameter Name="orderid" QueryStringField="orderid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" Text="<-上一頁" CssClass="btn" BackColor="#ff6600" ForeColor="#ffffff" PostBackUrl="~/Membership.aspx/#menu3"/>
    </div>
</asp:Content>
