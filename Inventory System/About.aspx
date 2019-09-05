<%@  Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Inventory_System.About" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cafe by the Ruins</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Cafe Inventory System  Supplier Details form a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
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
<body>
    <div class="navbar">
        <a href="About.aspx">Home</a>
        <a href="Contact.aspx">Contacts</a>
        <a href="PurchasingModule.aspx">Purchase</a>
        <a href="InventoryModule.aspx">Inventory</a>
        <a href="MenuModule.aspx">Menu</a>
        <a href="ProductionModule.aspx">Production</a>
        <a href="SupplierModule.aspx">Supplier</a>
        <a href="ProductionTimerModule.aspx">Production Timer</a>
        <div class="dropdownReport">
            <button class="dropbtnReport">
                Reports 
      <i class="fa fa-caret-down"></i>
                <%--</button>--%>
                <div class="contentNavbar">
                    <a href="Reports.aspx">Purchase Order Reports</a>
                    <a href="ReportsOrders.aspx">Production Reports</a>
                    <a href="CrystalReportsItemDetails.aspx">Item Details Reports</a>
                    <a href="CrystalReportsItemExpired.aspx">Wastage Reports</a>
                </div>
        </div>
    </div>
</body>
