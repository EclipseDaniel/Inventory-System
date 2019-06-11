<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductionModule.aspx.cs" Inherits="Inventory_System.ProductionModule" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Cafe by the Ruins</title>

    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>


    <!-- css files -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/prodStyle.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //css files -->
</head>

<body>
    <div class="production_form">
        <div class="container">
            <!-- main content -->
            <div class="left_div">
                <div class="cafe_details">
                    <asp:Panel ID="Panel1" runat="server" BorderColor="Violet"></asp:Panel>
                </div>

            </div>

            <div class="stock_info">
                <div>
                    <asp:Panel ID="Panel2" runat="server" BorderColor="SteelBlue"></asp:Panel>
                </div>
            </div>
            <!-- main content -->
        </div>
        <!-- footer -->
        <div class="footer">
            <p>&copy; 2019 Cafe Inventory System Production Module. All Rights Reserved | Design by <a href="#" target="blank">TeamCafeByTheRuins</a></p>
        </div>
        <!-- footer -->
    </div>

</body>
</html>
