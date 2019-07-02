<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuModule.aspx.cs" Inherits="Inventory_System.ProductionModule" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cafe by the Ruins</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Cafe Inventory System  Menu form a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
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

<%--<body>--%>
    <%--<div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                 <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/">Cafe by the Ruins</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="~/">Home</a></li>
                        <li><a runat="server" href="~/ProductionModule">Production</a></li>
                         <li><a runat="server" href="~/MenuModule">Menu Setting</a></li>
                        <li><a runat="server" href="~/InventoryModule">Inventory</a></li>
                        <li><a runat="server" href="~/SupplierModule">Supplier</a></li>
                                               
                    </ul>
                </div>
            </div>
        </div>--%>
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
  <a href="InventoryReportView.aspx">Forecasting</a>
  <div class="dropdownReport">
    <button class="dropbtnReport">Reports 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="contentNavbar">
      <a href="Reports.aspx">Purchase Order Reports</a>
      <a href="ProductionReports">Production Reports</a>
      <a href="CrystelReportsItemDetails.aspx">Item Details Reports</a>
    </div>
  </div> 
</div>
    <div class="productionform">
        <div class="container">
            <form action="#" method="post" runat="server">
                <!-- main content -->
                <div class="divider_info">
                    <div class="prod_form">

                       <%-- Menu Form for adding Data in Datagrid--%>
                        <div class="prod_info">
                            <h2>Enter Dish Name</h2>
                            <p>Enter dish ingredients.</p>

                            <label>Dish Name</label>
                            <div class="input-group">
                                <span class="fa fa-bars" aria-hidden="true"></span>
                                <asp:TextBox ID="txtbox_DishName" runat="server" placeholder="Enter Your Dish Name" required="" OnTextChanged="txtbox_DishName_TextChanged"></asp:TextBox>
                            </div>

                            <div class="text-center">
                                <asp:Button Class="btn btn-dark" ID="btn_Next" Style="justify-content: center; display: flex; align-items: center" runat="server" Text="Lock" OnClick="btn_Next_Click" />
                                <asp:Button Class="btn btn-dark" ID="btn_Unlock" Style="justify-content: center; display: flex; align-items: center" runat="server" Text="Unlock" OnClick="btn_Unlock_Click" />
                                <br />
                            </div>

                            <label>Ingredients</label>
                            <div class="input-group">
                                <span class="fa fa-shopping-cart" aria-hidden="true"></span>
                                <asp:TextBox ID="txtbox_Ingre" runat="server" placeholder="Enter Your Ingredient" required=""></asp:TextBox>
                            </div>

                            <label>Quantity</label>
                            <div class="input-group">
                                <span class="fa fa-plus-circle" aria-hidden="true"></span>
                                <asp:TextBox ID="txtbox_Quantity" runat="server" placeholder="Enter Quantity " required=""></asp:TextBox>
                            </div>

                            <div class="text-center">
                                <asp:Button ID="btn_Cancel" class="btn btn-dark" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
                                <asp:Button ID="btn_Add" Style="margin-left: 10px;" class="btn btn-dark" runat="server" Text="Add" OnClick="btn_Add_Click" />
                            </div>

                            <%--Hidden Text box for Menu Id Validation for SQL Script--%>
                            <asp:TextBox ID="txtbox_MenuId" runat="server" required="" Visible="false"></asp:TextBox>

                        </div>
                    </div>
                     <%-- Menu Form for adding Data in Datagrid--%>

                    <%--Datagrid and Header for adding Production Details--%>
                    <div class="prodTable_Info">
                        <h1>Production Stock Details</h1>
                        <div>
                            <asp:GridView ID="gridDishMenu" runat="server" AutoGenerateColumns="false" CssClass="Grid" HorizontalAlign="Center">
                             <HeaderStyle CssClass ="GridHeader"/>
                             <AlternatingRowStyle CssClass ="GridAltItem" />
                                <Columns>
                                    <asp:BoundField DataField="Dish" HeaderText="Dish" />
                                    <asp:BoundField DataField="Ingredients" HeaderText="Ingredients" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <%--Datagrid and Header for adding Production Details--%>
                </div>

                <!-- //main content -->
            </form>
            <%--            form--%>
        </div>
        <!-- footer -->
        <div class="footer">
            <p>&copy; 2019 Cafe Inventory System Menu form. All Rights Reserved | Design by <a href="#" target="blank">TeamCafeByTheRuins</a></p>
        </div>
        <!-- footer -->
    </div>
</body>
</html>
