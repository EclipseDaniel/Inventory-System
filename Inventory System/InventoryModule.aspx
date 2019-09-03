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
    <button class="dropbtnReport">Reports 
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

                            <asp:Button Text="Check Inventory" ID="checkInventory" runat="server" onclick="checkInventory_Click" />
                            <p></p>

                            <asp:TextBox Visible="false" ID="txtItemID" runat="server"></asp:TextBox>

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
                            <div>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidatorQuantityNumeric"
                                        ControlToValidate="txtItemQuantity" runat="server"
                                        ErrorMessage="Only Numbers allowed" ForeColor="Red"
                                        ValidationExpression="\d+">
                                </asp:RegularExpressionValidator>
                            </div>

                            <label>Unit</label>
                            <div class="input-group">
                                <span class="fa fa-plus-circle" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemUnit" runat="server" placeholder="Enter Unit"></asp:TextBox>
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
                                <asp:TextBox ID="txtItemDeliveryDate" runat="server" placeholder="Enter Delivery Date" ReadOnly="true" BackColor="WhiteSmoke"></asp:TextBox>
                                <br />
                                <asp:Calendar ID="calendarItemDeliveryDate" runat="server" style="margin-top: 8px" OnSelectionChanged="calendarItemDeliveryDate_SelectionChanged"  OnDayRender="calendarItemDeliveryDate_DayRender" ></asp:Calendar>
                            </div>

                            <label>Expiration Date</label>
                            <div class="input-group">
                                <span class="fa fa-calendar" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemExpirationDate" runat="server" placeholder="Enter Expiration Date" ReadOnly="true" BackColor="WhiteSmoke"></asp:TextBox>
                                <br />
                                <asp:Calendar ID="calendarItemExpirationDate" runat="server" style="margin-top: 8px" OnSelectionChanged="calendarItemExpirationDate_SelectionChanged" OnDayRender="calendarItemExpirationDate_DayRender"></asp:Calendar>
                            </div>

                            <label>Critical Level</label>
                            <div class="input-group">
                                <span class="fa fa-circle" aria-hidden="true"></span>
                                <asp:TextBox ID="txtCriticalLevel" runat="server" placeholder="Enter Critical Level"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtCriticalLevel" ErrorMessage="This field is required" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            </div>

                            <label>Optimal Level</label>
                            <div class="input-group">
                                <span class="fa fa-circle" aria-hidden="true"></span>
                                <asp:TextBox ID="txtOptimalLevel" runat="server" placeholder="Enter Optimal Level"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtOptimalLevel" ErrorMessage="This field is required" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            </div>

                            <div class="text-center">
                                <asp:Button ID="btnSave" class="btn btn-dark" runat="server" Text="Save" OnClick="btnSave_Click" />
                                <asp:Button ID="btn_Delete" class="btn btn-dark" Style="margin-left: 20px;" runat="server" Text="Delete" OnClick="btn_Delete_Click" />
                                <asp:Button ID="btn_Clear" class="btn btn-dark" Style="margin-left: 20px;" runat="server" Text="Clear" OnClick="btn_Clear_Click"  />
                            </div>

                            <br />
                            <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
                            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                            <asp:TextBox ID="txtItemNo" runat="server" Visible="false"></asp:TextBox>

                        </div>

                    <div class="prodTable_Info">
                        <h1>Critical Level</h1>
                        <asp:GridView ID="gridViewCritical" runat="server" AutoGenerateColumns="false" CssClass="Grid" HorizontalAlign="Center">
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
                                <asp:BoundField DataField="ItemUnit" HeaderText="Item Unit" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("ItemID") %>' OnClick="lnk_Click" CausesValidation="false">Create P.O.</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

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
                                <asp:BoundField DataField="ItemUnit" HeaderText="Item Unit" />
                                <asp:BoundField DataField="CriticalLevel" HeaderText="Critical Level" />
                                <asp:BoundField DataField="OptimalLevel" HeaderText="Optimal Level" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("ItemID") %>' OnClick="lnk2_Click" CausesValidation="false">View</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <h1>Expired</h1>
                        <asp:GridView ID="gridViewItemExpiration" runat="server" AutoGenerateColumns="false" CssClass="Grid" HorizontalAlign="Center">
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
                                <asp:BoundField DataField="ItemUnit" HeaderText="Item Unit" />
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
