<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchasingModule.aspx.cs" Inherits="Inventory_System.PurchasingModule" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cafe by the Ruins</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Cafe Inventory System  Purchasing form a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">


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
                            <h2>Purchasing Details</h2>
                            <p></p>

                            <label>Item</label>
                            <div class="input-group">

<%--                             <div class="dropdown">
                                <span class="fa fa-cutlery" aria-hidden="true"></span>
                                <asp:DropDownList ID="ddlMenuList" class="dropdown-content"  runat="server" AutoPostBack="true" ></asp:DropDownList>
                            </div>--%>

                            <label>Item Name</label>
                            <div class="input-group">
                                <span class="fa fa-plus-circle" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemName" runat="server" placeholder="Enter Item Name"></asp:TextBox>
                            </div>
                                
                            </div>

                            <label>Category</label>&nbsp;&nbsp;&nbsp;&nbsp;
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
                                    <asp:ListItem Text="Grain" Value="Grain"></asp:ListItem>
                                    <asp:ListItem Text="Beverage" Value="Beverage"></asp:ListItem>
                                    <asp:ListItem Text="Oil" Value="Oil"></asp:ListItem>
                                    <asp:ListItem Text="Kitchenware" Value="Kitchenware"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <label>Quantity</label>
                            <div class="input-group">
                                <span class="fa fa-plus-circle" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemQuantity" runat="server" placeholder="Enter Quantity"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtItemQuantity" ErrorMessage="This field is required" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            </div>

                            <label>Item Unit</label>
                            <div class="input-group">
                                <span class="fa fa-circle" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemUnit" runat="server" placeholer="Enter Item Unit"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="This field is required" ControlToValidate="txtItemUnit" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            </div>

                            <div>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorItemQuantity"
                                        ControlToValidate="txtItemQuantity" runat="server"
                                        ErrorMessage="Only Numbers allowed" ForeColor="Red"
                                        ValidationExpression="\d+">
                            </asp:RegularExpressionValidator>
                            </div>
                            <label>Supplier Name</label>
                            <div class="input-group">
                                <span class="fa fa-user" aria-hidden="true"></span>
                                <asp:TextBox ID="txtSupplierName" runat="server" placeholer="Enter Supplier Name "></asp:TextBox>
                            </div>

                            <label>Shipped-By</label>
                            <div class="input-group">
                                <span class="fa fa-ship " aria-hidden="true"></span>
                                <asp:TextBox ID="txtShippedBy" runat="server" placeholder="Enter Shipped-By"></asp:TextBox>
                            </div>

                            <label>Terms</label>
                            <div class="input-group">
                                <span class="fa fa-file-text-o" aria-hidden="true"></span>
                                <asp:TextBox ID="txtTerms" runat="server" placeholder="Enter Terms"></asp:TextBox>
                            </div>

                            <label>Address</label>
                            <div class="input-group">
                                <span class="fa fa-university" aria-hidden="true"></span>
                                <asp:TextBox ID="txtAddress" runat="server" placeholder="Enter Supplier Address"></asp:TextBox>
                            </div>

                            <label>Notes</label>
                            <div class="input-group">
                                <span class="fa fa-commenting" aria-hidden="true"></span>
                                <asp:TextBox ID="txtNotes" runat="server" Placeholder="Enter Notes"></asp:TextBox>
                            </div>


                            <label>Date</label>
                            <div class="input-group">
                                <span class="fa fa-calendar" aria-hidden="true"></span>
                                <asp:TextBox ID="txtDate" runat="server" placeholder="Enter Date of Purchase"></asp:TextBox>
                            </div>

                            <label>Item Price</label>
                            <div class="input-group">
                                <span class="fa fa-user" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemPrice" runat="server" placeholer="Php per piece/kilo"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtItemPrice" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                             <div>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidatorItemPrice"
                                        ControlToValidate="txtItemPrice" runat="server"
                                        ErrorMessage="Only Numbers allowed" ForeColor="Red"
                                        ValidationExpression="\d+">
                                </asp:RegularExpressionValidator>
                            </div>

                            <label>Total Price</label>
                            <asp:Button ID="btnCompute" Text="Compute" runat="server" OnClick="btnCompute_Click" />
                            <div class="input-group">
                                <span class="fa fa-user" aria-hidden="true"></span>
                                <asp:TextBox ID="txtTotalPrice" runat="server" placeholer="Total Price" ReadOnly="true" BackColor="WhiteSmoke"></asp:TextBox>
                            </div>

                            <label>Item Delivery Date</label>
                            <div class="input-group">
                                <span class="fa fa-user" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemDeliveryDate" runat="server" placeholer="Select Date of Delivery" TextMode="DateTime" ReadOnly="true" BackColor="WhiteSmoke"></asp:TextBox>
                                <br />
                                <asp:Calendar ID="calendarItemDeliveryDate" runat="server" style="margin-top: 8px" OnSelectionChanged="calenderItemDeliveryDate_SelectionChanged" OnDayRender="calendarItemDeliveryDate_DayRender"></asp:Calendar>
                            </div>

                            <label>Item Expiration Date</label>
                            <div class="input-group">
                                <span class="fa fa-user" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemExpirationDate" runat="server" placeholer="Select Expiration Date" TextMode="DateTime" ReadOnly="true" BackColor="WhiteSmoke" />
                                <br />
                                <asp:Calendar ID="calendarItemExpirationDate" runat="server" style="margin-top: 8px" OnSelectionChanged="calendarItemExpirationDate_SelectionChanged" OnDayRender="calendarItemExpirationDate_DayRender"    ></asp:Calendar>
                            </div>

                            <div class="text-center">
                                <asp:Button ID="btnSave" class="btn btn-dark btn-danger" runat="server" Text="Save" OnClick="btnSave_Click" />
                                <asp:Button ID="btn_Delete" class="btn btn-dark " Style="margin-left: 20px;" runat="server" Text="Delete" OnClick="btn_Delete_Click" />
                                <asp:Button ID="btn_Clear" class="btn btn-dark" Style="margin-left: 20px;" runat="server" Text="Clear" OnClick="btn_Clear_Click" />
                                <asp:Button ID="btnReceived" class="btn btn-dark" Style="margin-left: 20px;" runat="server" Text="Receive" Enabled="false" OnClick="btnReceived_Click"  />
                            </div>

                            <br />
                            <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
                            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                            <asp:TextBox ID="txtPurchaseID" runat="server" Visible="false"></asp:TextBox>

                        </div>
                    </div>

                    <div class="prodTable_Info">
                        <h1>Purchase Order Data</h1>
                        <asp:GridView ID="gridViewPurchase" runat="server" AutoGenerateColumns="false"  Width="887px" CssClass="Grid">
                            <HeaderStyle CssClass ="GridHeader"/>
                            <AlternatingRowStyle CssClass ="GridAltItem" />

                            <Columns>
                                <asp:BoundField DataField="PurchaseID" HeaderText="Purchase ID" />
                                <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                                <asp:BoundField DataField="ItemType" HeaderText="Item Type" />
                                <asp:BoundField DataField="ItemQuantity" HeaderText="Item Quantity" />
                                <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" />
                                <asp:BoundField DataField="ShippedBy" HeaderText="Shipped-By" />
                                <asp:BoundField DataField="Terms" HeaderText="Terms" />
                                <asp:BoundField DataField="Notes" HeaderText="Remarks" />
                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                <asp:BoundField DataField="ItemDeliveryDate" HeaderText="Delivery Date" />
                                <asp:BoundField DataField="ItemExpirationDate" HeaderText="Expiry Date" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("PurchaseID") %>' OnClick="lnk_Click" CausesValidation="false">View</asp:LinkButton>
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
            <p>&copy; 2019 Cafe Inventory System Purchasing Form. All Rights Reserved | Design by <a href="#" target="blank">TeamCafeByTheRuins</a></p>
        </div>
        <!-- footer -->

    </div>
</body>
</html>
