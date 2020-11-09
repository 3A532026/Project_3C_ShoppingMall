<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Freight.aspx.cs" Inherits="MyWebApplication.Freight" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="Scripts/ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="Scripts/ckfinder/ckfinder.js" type="text/javascript"></script>
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
        <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#menu80">運費</a></li>
        </ul>

        <div class="tab-content">
        <!--公告欄#menu60-->
        <div id="menu80" class="tab-pane fade in active">
            <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' SelectCommand="SELECT * FROM [Freight]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Freight] WHERE [freightid] = @original_freightid AND (([freight] = @original_freight) OR ([freight] IS NULL AND @original_freight IS NULL)) AND (([free] = @original_free) OR ([free] IS NULL AND @original_free IS NULL))" InsertCommand="INSERT INTO [Freight] ([freightid], [freight], [free]) VALUES (@freightid, @freight, @free)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Freight] SET [freight] = @freight, [free] = @free WHERE [freightid] = @original_freightid AND (([freight] = @original_freight) OR ([freight] IS NULL AND @original_freight IS NULL)) AND (([free] = @original_free) OR ([free] IS NULL AND @original_free IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_freightid" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_freight" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_free" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="freightid" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="freight" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="free" Type="Int32"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="freight" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="free" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_freightid" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_freight" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_free" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="freightid" DataSourceID="SqlDataSource1" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" GridLines="Horizontal" HorizontalAlign="Center">
            <Columns>
                <asp:CommandField ShowEditButton="True"></asp:CommandField>
                <asp:BoundField DataField="freight" HeaderText="運費" SortExpression="freight"></asp:BoundField>
                <asp:BoundField DataField="free" HeaderText="免運制度" SortExpression="free"></asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>
    </div>
    </div>
    </form>
</body>
</html>
