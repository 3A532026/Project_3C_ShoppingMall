<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPurchase.aspx.cs" Inherits="MyWebApplication.AddPurchase1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <title></title>
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
        background-color:#444444;
        color:white;
    }
    .gvStyle {
    border-style:none;
    width:100%;
    }
    /*Header 標題*/
    .gvStyle th
    {
    background-color: #333;
    color:white;
    font-weight: lighter;
    border-bottom: 1px solid #ccc;
    height:25px;
    text-align:center;
    }
    /*OnMouseOver 滑鼠移過列表時, 背景色變更*/
    .gvStyle tr:hover
    {
    background-color:#DDDDDD;
    }
    /*Rows 列表顏色*/
    .gvStyle td
    {
    border-bottom: 1px solid #ccc;
    height:25px;
    text-align:center;
    }

    /*Page 分頁顏色*/
    .gvStyle .pgr table
    {
    
    }
    .gvStyle .pgr td
    {
    background-color:#E2EAF2;
    border-width: 0px;
    padding:0px 3px 0px 3px;
    }
    .gvStyle .pgr a
    {
    color: #666; text-decoration:underline;
    padding:0px 3px 0px 3px;
    }
    .gvStyle .pgr a:hover
    {
    color: #FF0000; text-decoration: none;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <div>
                        <h1>Step1：選擇供應商</h1>
                        <hr />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [Supplier]" ></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="supplierid" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField HeaderText="供應商">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select" CommandArgument='<%#Eval("Supplierid") %>' Text='<%#Eval("Supplier") %>' ></asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
                        <br />
                        <asp:Button ID="Button6" runat="server" CssClass="btn" Text="上一頁"  PostBackUrl="~/Purchase.aspx"/>
                    </div>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div>
                        <h1>Step2：選擇產品</h1>
                        <label  style="width:150px;"><b>供應商編號</b></label>
                        <asp:Label ID="supplierid" runat="server"></asp:Label>
                        <br />
                        <label  style="width:150px;"><b>供應商名稱</b></label>
                        <asp:Label ID="supplier" runat="server"></asp:Label>
                        <hr />
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [Product] WHERE Supplierid=@Supplierid">
                <SelectParameters>
                    <asp:Parameter Name="Supplierid"/>
                </SelectParameters>
            </asp:SqlDataSource>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="&lt;-上一頁" />
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="下一步" />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnRowDataBound="GridView2_RowDataBound" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chose" runat="server" OnCheckedChanged="Chose_CheckedChanged" AutoPostBack="true"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="產品編號" ReadOnly="True" InsertVisible="False" SortExpression="Productid"></asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="產品名稱" SortExpression="ProductName"></asp:BoundField>
                    <asp:BoundField DataField="Category" HeaderText="類別" SortExpression="category"></asp:BoundField>
                    <asp:BoundField DataField="Store" HeaderText="庫存" SortExpression="inventory"></asp:BoundField>
                    <asp:BoundField DataField="Safety" HeaderText="安全存量" SortExpression="safetystock"></asp:BoundField>
                    <asp:TemplateField HeaderText="差額"></asp:TemplateField>
                    <asp:TemplateField HeaderText="存貨警告"></asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <div style="text-align:center;">
            <asp:Label ID="productid" runat="server" Visible="false"></asp:Label>
            <span style="margin-left:100px;"></span>
            </div></div>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <div>
                        <h1>Step3：輸入進貨明細</h1>
                        <label  style="width:150px;"><b>供應商編號</b></label>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                        <br />
                        <label  style="width:150px;"><b>供應商名稱</b></label>
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        <hr />
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center" OnRowDataBound="GridView3_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="產品編號" ReadOnly="True" InsertVisible="False" SortExpression="Productid"></asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="產品名稱" SortExpression="ProductName"></asp:BoundField>
                    <asp:TemplateField HeaderText="成本單價">
                        <ItemTemplate>
                            <asp:TextBox ID="p" runat="server" OnTextChanged="P_TextChanged" AutoPostBack="true"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="進貨數量">
                        <ItemTemplate>
                            <asp:TextBox ID="q" runat="server" OnTextChanged="Q_TextChanged" AutoPostBack="true"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="成本單位">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text="Label">件</asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="小計"></asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div style="text-align:center;">
            <h3>總計：<asp:Label ID="total" runat="server" ></asp:Label></h3>
            <br />
            <asp:Button ID="Button3" runat="server" Text="<-上一頁" OnClick="Button3_Click"/>
            <span style="margin-left:100px;"></span>
            <asp:Button ID="Button4" runat="server" Text="確認" OnClick="Button4_Click"/>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"  InsertCommand="INSERT INTO [PurchaseOrder] (Purchaseid,Supplierid,Supplier,userid,Date,Total,Status) VALUES (@Purchaseid,@Supplierid,@Supplier,@userid,@Date,@Total,@Status)" SelectCommand="SELECT * FROM [PurchaseOrder]">
                <InsertParameters>
                    <asp:Parameter Name="Purchaseid"/>
                    <asp:Parameter Name="Supplierid"/>
                    <asp:Parameter Name="Supplier"/>
                    <asp:Parameter Name="userid"/>
                    <asp:Parameter Name="Date"/>
                    <asp:Parameter Name="Total"/>
                    <asp:Parameter Name="Status"/>
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"  InsertCommand="INSERT INTO [PurchaseOrderDetail] (Purchaseid,Productid,Product,Quantity,Cost) VALUES (@Purchaseid,@Productid,@Product,@Quantity,@Cost)" SelectCommand="SELECT * FROM [PurchaseOrderDetail]">
                <InsertParameters>
                    <asp:Parameter Name="Purchaseid"/>
                    <asp:Parameter Name="Productid"/>
                    <asp:Parameter Name="Product"/>
                    <asp:Parameter Name="Quantity"/>
                    <asp:Parameter Name="Cost"/>
                </InsertParameters>
            </asp:SqlDataSource>
            </div>
                    </div>
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <div>
                        <h1>Step4：確認採購單</h1>
                        <hr />
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [PurchaseOrder] where Purchaseid =@purchaseid">
                <SelectParameters>
                    <asp:Parameter Name="purchaseid"/>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="purchaseid" DataSourceID="SqlDataSource6" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="Purchaseid" HeaderText="採購單編號" ReadOnly="True" SortExpression="Purchaseid"></asp:BoundField>
                    <asp:BoundField DataField="Supplierid" HeaderText="廠商編號" SortExpression="Supplierid"></asp:BoundField>
                    <asp:BoundField DataField="Supplier" HeaderText="廠商名稱" SortExpression="Supplier"></asp:BoundField>
                    <asp:BoundField DataField="Userid" HeaderText="處理者" SortExpression="Account"></asp:BoundField>
                    <asp:BoundField DataField="Date" HeaderText="開立日期" SortExpression="Date"></asp:BoundField>
                    <asp:BoundField DataField="Total" HeaderText="總計" SortExpression="Total"></asp:BoundField>
                    <asp:BoundField DataField="Status" HeaderText="狀態" SortExpression="Status"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <h2>進貨明細</h2>
            <hr />
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [PurchaseOrderDetail] where Purchaseid =@purchaseid" >
                <SelectParameters>
                    <asp:Parameter Name="purchaseid"/>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="pruchasedetailid" DataSourceID="SqlDataSource7" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="Productid" HeaderText="產品編號" SortExpression="Productid"></asp:BoundField>
                    <asp:BoundField DataField="Product" HeaderText="產品名稱" SortExpression="Product"></asp:BoundField>
                    <asp:BoundField DataField="Cost" HeaderText="成本單價" SortExpression="Cost"></asp:BoundField>
                    <asp:BoundField DataField="Quantity" HeaderText="進貨數量" SortExpression="Quantity"></asp:BoundField>
                </Columns>
            </asp:GridView>
                        <br />
                        <asp:Button ID="Button5" runat="server" CssClass="btn" Text="確認"  PostBackUrl="~/Purchase.aspx"/>
                    </div>
                </asp:View>
            </asp:MultiView>

        </div>
    </form>
</body>
</html>
