<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierModule.aspx.cs" Inherits="Inventory_System.SupplierDetails" %>

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
  <a href="InventoryReportView.aspx">Forecasting</a>
  <div class="dropdownReport">
    <button class="dropbtnReport">Reports 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="contentNavbar">
      <a href="Reports.aspx">Purchase Order Reports</a>
      <a href="ProductionReports">Production Reports</a>
      <a href="CrystalReportsItemDetails.aspx">Item Details Reports</a>
      <a href="CrystalReportExpiration.aspx">Wastage Reports</a>
    </div>
  </div> 
</div>

    <div class="productionform">
        <div class="container">

            <%--form--%>
            <form action="#" method="post" runat="server">
                <!-- main content -->

                <div class="divider_info">
                    <div class="prod_form">

                        <div class="prod_info">
                            <h2>Supplier Details</h2>
                            <p></p>

                            <label>Supplier Name</label>
                            <div class="input-group">
                                <span class="fa fa-users" aria-hidden="true"></span>
                                <asp:TextBox ID="txtSupplierName" runat="server" placeholder="Enter Supplier Name"></asp:TextBox>
                            </div>

                            <label>Contact Person</label>
                            <div class="input-group">
                                <span class="fa fa-user-o" aria-hidden="true"></span>
                                <asp:TextBox ID="txtSupplierContactPerson" runat="server" placeholder="Enter Contact Person Name"></asp:TextBox>
                            </div>

                            <label>Contact Number</label>
                            <div class="input-group">
                                <span class="fa fa-book" aria-hidden="true"></span>
                                <asp:TextBox ID="txtContactNo" runat="server" placeholder="Enter Contact Number"></asp:TextBox>
                            </div>

                            <label>Address</label>
                            <div class="input-group">
                                <span class="fa fa-university" aria-hidden="true"></span>
                                <asp:TextBox ID="txtSupplierAddress" runat="server" placeholder="Enter Supplier Address"></asp:TextBox>
                            </div>


                            <label>Item</label>
                            <div class="input-group">
                                <span class="fa fa-cutlery" aria-hidden="true"></span>
                                <asp:TextBox ID="txtSupplierItem" runat="server" placeholder="Enter Supplier Item"></asp:TextBox>
                            </div>

                            <label>Price</label>
                            <div class="input-group">
                                <span class="fa fa-money" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemPrice" runat="server" placeholder="Enter Item Price"></asp:TextBox>
                            </div>

                            <label>Category</label>
                            <div class="dropdown">
                                <span class="fa fa-tags" aria-hidden="true"></span>
                                <asp:DropDownList ID="dDlistCategory" class="dropdown-content" runat="server">
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

                            <div class="text-center">
                                <asp:Button ID="btnSave" class="btn btn-dark" runat="server" Text="Save" OnClick="btnSave_Click" />
                                <asp:Button ID="btn_Delete" class="btn btn-dark" Style="margin-left:20px;" runat="server" Text="Delete" OnClick="btn_Delete_Click" />
                                <asp:Button ID="btn_Clear" class="btn btn-dark" Style="margin-left:20px;" runat="server" Text="Clear" OnClick="btn_Clear_Click" />
                            </div>

                            <br />
                            <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
                            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                            <asp:TextBox ID="hfSupplierID" runat="server" Visible="false"></asp:TextBox>

                        </div>
                    </div>

                    <div class="prodTable_Info">
                        <h1>Suppliers Details</h1>
                        `<asp:GridView ID="gridViewSupplier" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" CssClass="Grid">
                            <HeaderStyle CssClass ="GridHeader"/>
                            <AlternatingRowStyle CssClass ="GridAltItem" />

                            <Columns>
                                <asp:BoundField DataField="SupplierID" HeaderText="Supplier ID" />
                                <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" />
                                <asp:BoundField DataField="SupplierPerson" HeaderText="Supplier Contact Person" />
                                <asp:BoundField DataField="SupplierContact" HeaderText="Supplier Contact Number" />
                                <asp:BoundField DataField="SupplierAddress" HeaderText="Address" />
                                <asp:BoundField DataField="SupplierItem" HeaderText="Supplier Item" />
                                <asp:BoundField DataField="ItemPrice" HeaderText="Price" />
                                <asp:BoundField DataField="ItemCategory" HeaderText="Category" />

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("SupplierID") %>' OnClick="lnk_Click" CausesValidation="false">View</asp:LinkButton>
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
            <p>&copy; 2019 Cafe Inventory System Supplier Details Form. All Rights Reserved | Design by <a href="#" target="blank">TeamCafeByTheRuins</a></p>
        </div>
        <!-- footer -->

    </div>
</body>
</html>
