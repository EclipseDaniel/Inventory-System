<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductionTimerReport.aspx.cs" Inherits="Inventory_System.ProductionTimerReport" %>

<!DOCTYPE html>

<head runat="server">
    <title>Cafe by the Ruins</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Cafe Inventory System Production form a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        } 
    </script>

    <!-- //Meta-Tags -->

    <!-- css files -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/prodStyle.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //css files -->

    <!-- google fonts -->
    <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- //google fonts -->

</head>
<html>
<body>
    <form id="form1" runat="server">
        <h1>Production Data</h1>
        <div class="text-center" style="margin: 10px,10px,10px,10px; align-content: center flex-start;">
            <asp:GridView ID="gridOrderedDish" runat="server" AutoGenerateColumns="false" CssClass="Grid" HorizontalAlign="Center">
                <HeaderStyle CssClass="GridHeader" />
                <AlternatingRowStyle CssClass="GridAltItem" />


                <Columns>
                    <asp:BoundField DataField="Dish" HeaderText="Dish" />
                    <asp:BoundField DataField="Order" HeaderText="Order" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="Order" HeaderText="Expected Time" />
                    <asp:BoundField DataField="Dish" HeaderText="Time Started" />
                    <asp:BoundField DataField="Order" HeaderText="Time Ended" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
