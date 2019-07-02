﻿<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="ProductionModule.aspx.cs" Inherits="Inventory_System.ProductionModule1" %>

<!DOCTYPE html>
<html lang="en">
<head>
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
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
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
  <div class="dropdown">
    <button class="dropbtn">Dropdown 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
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

                        <%-- Production Form--%>
                        <div class="prod_info">
                            <h2>Enter Order</h2>
                            <p>Enter order quantity</p>

                            <label>Ordered Dish</label>
                            <div class="dropdown">
                                <span class="fa fa-bars" aria-hidden="true"></span>
                                <asp:DropDownList ID="ddlMenuList" class="dropdown-content" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMenuList_SelectedIndexChanged"></asp:DropDownList>
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

                            <%--Hidden Text box for Dish Id Validation for SQL Script--%>
                            <asp:TextBox ID="txtbox_DishID" runat="server" required="" Visible="false"></asp:TextBox>

                        </div>
                    </div>
                    <%-- Production Form--%>

                    <%--Datagrid and Header for checking production stock levels--%>
                    <div class="prodTable_Info" >
                        <h1>Production Data</h1>
                        <div class="text-center" style="margin:10px,10px,10px,10px;align-content:center flex-start;">
                            <asp:GridView ID="gridOrderedDish" runat="server" AutoGenerateColumns="false" BorderStyle="Solid">
                                <Columns>
                                    <asp:BoundField DataField="Dish" HeaderText="Dish" />
                                    <asp:BoundField DataField="Order" HeaderText="Order" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="text-center">
                            <asp:Button ID="btn_Proceed" style="margin-top:30px" class="btn btn-dark" runat="server" Text="Next" OnClick="btn_Proceed_Click" />
                            
                        </div>

                        <div class="text-center" style="margin-top:200px;align-content:center flex-start;">
                            <asp:GridView ID="gridProdMod" runat="server" AutoGenerateColumns="false" CssClass="Grid">
                                <HeaderStyle CssClass ="GridHeader"/>
                                <AlternatingRowStyle CssClass ="GridAltItem" />
                                <Columns>
                                    <asp:BoundField DataField="Dish" HeaderText="Dish" />
                                    <asp:BoundField DataField="Ingredients" HeaderText="Ingredients" />
                                    <asp:BoundField DataField="TotalQty" HeaderText="Quantity" />
                                    <asp:BoundField DataField="ItemQuantity" HeaderText="Stock Level" />
                                     <asp:BoundField DataField="QtyLeft" HeaderText="QtyLeft" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="text-center">
                            <%--<asp:Button ID="btn_ProceedProcess" class="btn btn-dark" runat="server" Text="Calculate" OnClick="btn_ProceedProcess_Click" style="margin-left:10px" />--%>
                            <asp:Button ID="btn_Validate" class="btn btn-dark" runat="server" Text="Validate"  OnClick="btn_Validate_Click" style="margin-left:10px" />
                            <asp:Button ID="btn_PurchaseGood" class="btn btn-dark" runat="server" Text="Purchase Goods" OnClick="btn_PurchaseGood_Click" style="margin-left:10px"/>
                            <asp:Button ID="btn_ProcessOrder" class="btn btn-dark" runat="server" Text="Process Order" OnClick="btn_ProcessOrder_Click"  style="margin-left:10px"/>
                        </div>
                    </div>
                    <%--Datagrid and Header for checking production stock levels--%>
                </div>

                <!-- //main content -->
            </form>
            <%--            form--%>
        </div>
        <!-- footer -->
        <div class="footer">
            <p>&copy; 2019 Cafe Inventory System Production form. All Rights Reserved | Design by <a href="#" target="blank">TeamCafeByTheRuins</a></p>
        </div>
        <!-- footer -->
    </div>
</body>
</html>
