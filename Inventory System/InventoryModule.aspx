<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventoryModule.aspx.cs" Inherits="Inventory_System.InventoryModule" %>

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

                        <div class="prod_info">
                            <h2>Inventory Details</h2>
                            <p></p>
                            <div class="input-group">
                            <span class="fa fa-cutlery" aria-hidden="true"></span>
                            <asp:TextBox ID="txtCheckQuantity" runat="server"></asp:TextBox>
                            </div>
                            <asp:Button Text="Check Inventory" ID="checkInventory" runat="server" onclick="checkInventory_Click"    />
                            <p></p>
                            <label>Item</label>
                            <div class="input-group">
                                <span class="fa fa-cutlery" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemName" runat="server" placeholder="Enter Item Name"></asp:TextBox>
                            </div>

                            <label>Category</label>
                            <div class="dropdown">
                                <span class="fa fa-tags" aria-hidden="true"></span>
                                <asp:DropDownList ID="ddlistCategory" class="dropdown-content" runat="server">
                                    <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Condiments" Value="Condiments"></asp:ListItem>
                                    <asp:ListItem Text="Seasonings" Value="Seasonings"></asp:ListItem>
                                    <asp:ListItem Text="Meats" Value="Meats"></asp:ListItem>
                                    <asp:ListItem Text="Vegetables" Value="Vegetables"></asp:ListItem>
                                    <asp:ListItem Text="Fruits" Value="Fruits"></asp:ListItem>
                                    <asp:ListItem Text="Pastry" Value="Pastry"></asp:ListItem>
                                    <asp:ListItem Text="Grain" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Beverage" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Oil" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Kitchenware" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <label>Quantity</label>
                            <div class="input-group">
                                <span class="fa fa-plus-circle" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemQuantity" runat="server" placeholder="Enter Quantity"></asp:TextBox>
                            </div>

                            <label>Status</label>
                            <div class="dropdown">
                                <span class="fa fa-dot-circle-o" aria-hidden="true"></span>
                                <asp:DropDownList ID="ddListStatus" class="dropdown-content" runat="server">
                                    <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                                    <asp:ListItem Text="Critical" Value="Critical"></asp:ListItem>
                                    <asp:ListItem Text="Spoiled" Value="Spoiled"></asp:ListItem>
                                </asp:DropDownList>
                            </div>


                            <label>Supplier Name</label>
                            <div class="input-group">
                                <span class="fa fa-user" aria-hidden="true"></span>
                                <asp:TextBox ID="txtSupplierItem" runat="server" placeholder="Enter Supplier Item"></asp:TextBox>
                            </div>

                            <label>Delivery Date</label>
                            <div class="input-group">
                                <span class="fa fa-calendar" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemDeliveryDate" runat="server" placeholder="Enter Delivery Date"></asp:TextBox>
                            </div>

                            <label>Expiration Date</label>
                            <div class="input-group">
                                <span class="fa fa-calendar" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemExpirationDate" runat="server" placeholder="Enter Expiration Date"></asp:TextBox>
                            </div>

                            <div class="text-center">
                                <asp:Button ID="btnSave" class="btn btn-dark" runat="server" Text="Save" OnClick="btnSave_Click" />
                                <asp:Button ID="btn_Delete" class="btn btn-dark" Style="margin-left: 20px;" runat="server" Text="Delete" OnClick="btn_Delete_Click" />
                                <asp:Button ID="btn_Clear" class="btn btn-dark" Style="margin-left: 20px;" runat="server" Text="Clear" OnClick="btn_Clear_Click" />
                            </div>

                            <br />
                            <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
                            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                            <asp:TextBox ID="txtItemNo" runat="server" Visible="false"></asp:TextBox>

                        </div>
                    </div>

                    <div class="prodTable_Info">
                        <h1>Inventory Details</h1>
                        <asp:GridView ID="gridViewItem" runat="server" AutoGenerateColumns="false" CssClass="Grid" HorizontalAlign="Center">
                            <HeaderStyle CssClass ="GridHeader"/>
                            <AlternatingRowStyle CssClass ="GridAltItem" />
                            <Columns>
                                <asp:BoundField DataField="ItemID" HeaderText="Item ID" />
                                <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                                <asp:BoundField DataField="ItemType" HeaderText="Item Type" />
                                <asp:BoundField DataField="ItemQuantity" HeaderText="Item Quantity" />
                                <asp:BoundField DataField="ItemStatus" HeaderText="Item Status" />
                                <asp:BoundField DataField="ItemSupplier" HeaderText="Item Supplier" />
                                <asp:BoundField DataField="ItemDeliveryDate" HeaderText="Item Delivery Date" />
                                <asp:BoundField DataField="ItemExpirationDate" HeaderText="Item Expiration Date" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("ItemID") %>' OnClick="lnk_Click" CausesValidation="false">View</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>


                </div>
                <!-- //main content -->
            </form>

        </div>

        <!-- footer -->
        <div class="footer">
            <p>&copy; 2019 Cafe Inventory System Inventory Details Form. All Rights Reserved | Design by <a href="#" target="blank">TeamCafeByTheRuins</a></p>
        </div>
        <!-- footer -->

    </div>
</body>
</html>
