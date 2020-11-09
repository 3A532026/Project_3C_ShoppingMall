<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="MyWebApplication.Checkout" %>
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
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div class="container">
                <div class="well" style="border-bottom: 2px solid #90c31f;">選擇配送付款方式</div>
                <asp:RadioButton ID="RadioButton1" runat="server" Text="7-11取貨付款" GroupName="paytype"/><br />
                <asp:RadioButton ID="RadioButton2" runat="server" Text="宅配貨到付款" GroupName="paytype"/>
                <br /><br />
                <div class="well" style="border-bottom: 2px solid #90c31f;">訂購人資訊</div>
                <label for="namelabel" style="margin-right:150px;"><b>姓名</b></label>
                <asp:TextBox ID="name" runat="server" ></asp:TextBox><br />
                <label for="phonelabel" style="margin-right:109px;"><b>聯絡方式</b></label>
                <asp:TextBox ID="phone" runat="server" ></asp:TextBox><br />
                <label for="emaillabel" style="margin-right:138px;"><b>Email</b></label>
                <asp:TextBox ID="email" runat="server" ></asp:TextBox><br />
                <label for="addresslabel" style="margin-right:150px;"><b>住址</b></label>
                <asp:TextBox ID="address" runat="server" ></asp:TextBox><br />
                <br /><br />
                <div class="well" style="border-bottom: 2px solid #90c31f;">收件人資訊</div>
                <label for="takenamelabel" style="margin-right:129px;"><b>收件人</b></label>
                <asp:TextBox ID="takename" runat="server" ></asp:TextBox><br />
                <label for="takephonelabel" style="margin-right:109px;"><b>聯絡方式</b></label>
                <asp:TextBox ID="takephone" runat="server" ></asp:TextBox><br />
                <label for="takeemaillabel" style="margin-right:138px;"><b>Email</b></label>
                <asp:TextBox ID="takeemail" runat="server" ></asp:TextBox><br />
                <label for="takeaddresslabel" style="margin-right:150px;"><b>住址</b></label>
                <asp:TextBox ID="takeaddress" runat="server" ></asp:TextBox><br />
                <asp:CheckBox ID="CheckBox1" runat="server" Text="同訂購人資訊" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True" />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="<-返回購物車" CssClass="btn" BackColor="#ff6600" ForeColor="#ffffff" PostBackUrl="~/Cart.aspx"/>
                <asp:Button ID="GoToConfirm" runat="server" Text="->下一步" CssClass="btn" BackColor="#ff0000" ForeColor="White" OnClick="GoToConfirm_Click"/>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="container">
            <div class="well" style="border-bottom: 2px solid #90c31f;">購物明細</div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="productid" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" ShowFooter="true" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="productid" HeaderText="商品編號" InsertVisible="False" ReadOnly="True" SortExpression="productid"/>
                    <asp:BoundField DataField="productname" HeaderText="商品名稱" SortExpression="productname" />
                    <asp:BoundField DataField="price" HeaderText="售價" SortExpression="price" DataFormatString="{0:#}"/>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [productid], [productname], [price] FROM [Products]"></asp:SqlDataSource>
            <asp:Label ID="total" runat="server" Text="Label" Visible="false"></asp:Label><br />
            <div class="well" style="border-bottom: 2px solid #90c31f;">付款方式與寄送資訊</div>
            <table>
                <tr>
                    <td>
                        配送付款方式
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        收件人
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        聯絡方式
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        取貨地址
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="Button2" runat="server" Text="<-上一步" CssClass="btn" BackColor="#ff6600" ForeColor="#ffffff"/>
            <asp:Button ID="btn_checkout" runat="server" Text="->送出訂單" CssClass="btn" BackColor="#ff0000" ForeColor="White" OnClick="btn_checkout_Click"/>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [Order] (orderid,status,deliver_status,total, name, email, address, phone, takename, takeemail, takeaddress, takephone, paytype, purchasedate,userid) VALUES (@orderid,@status,@deliver_status,@total, @name, @email,@address, @phone, @takename, @takeemail, @takeaddress, @takephone, @paytype,@purchasedate,@userid)" SelectCommand="SELECT * FROM [Order]">
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO OrderDetail(orderid, productid, quantity) VALUES (@orderid, @productid, @quantity)" SelectCommand="SELECT * FROM [OrderDetail]">
                <InsertParameters>
                    <asp:Parameter Name="orderid" />
                    <asp:Parameter Name="productid" />
                    <asp:Parameter Name="quantity" />
                </InsertParameters>
            </asp:SqlDataSource></div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <div class="container">
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [total],[takename], [takeemail], [paytype], [takeaddress], [orderid] FROM [Order] WHERE orderid=@orderid">
                 <SelectParameters>
                <asp:Parameter Name="orderid"/>
            </SelectParameters>
            </asp:SqlDataSource>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="orderid" DataSourceID="SqlDataSource4">
                <ItemTemplate>
                    <div class="well" style="border-bottom: 2px solid #90c31f;">訂單編號  <asp:Label Text='<%# Eval("orderid") %>' runat="server" ID="orderidLabel" /></div>
                    <p>收件人資料</p>
                    <table>
                        <tr>
                            <td>
                                姓名:
                            </td>
                            <td><asp:Label Text='<%# Eval("takename") %>' runat="server" ID="takenameLabel" />

                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email:
                            </td>
                            <td><asp:Label Text='<%# Eval("takeemail") %>' runat="server" ID="takeemailLabel" />

                            </td>
                        </tr>
                        <tr>
                            <td>
                                付款方式:
                            </td>
                            <td>
                                <asp:Label Text='<%# Eval("paytype") %>' runat="server" ID="paytypeLabel" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                收貨地點:
                            </td>
                            <td>
                                <asp:Label Text='<%# Eval("takeaddress") %>' runat="server" ID="takeaddressLabel" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div class="well" style="border-bottom: 2px solid #90c31f;">訂單明細</div>
                    <div style="float:left;">消費總額:<asp:Label Text='<%# Eval("total") %>' runat="server" ID="Label7" /></div>
                </ItemTemplate>
            </asp:DataList>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5">
                    <Columns>
                        <asp:BoundField DataField="productname" HeaderText="商品名稱" SortExpression="productname"></asp:BoundField>
                        <asp:BoundField DataField="price" HeaderText="售價" SortExpression="price" DataFormatString="{0:#}"></asp:BoundField>
                        <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Products.productname, Products.price, OrderDetail.quantity FROM [OrderDetail] INNER JOIN [Products] ON [Products].ProductId=[OrderDetail].productid  WHERE [OrderDetail].orderid=@orderid ">
                <SelectParameters>
                <asp:Parameter Name="orderid"/>
            </SelectParameters>
            </asp:SqlDataSource></div>
        </asp:View>
    </asp:MultiView></div>
</asp:Content>
