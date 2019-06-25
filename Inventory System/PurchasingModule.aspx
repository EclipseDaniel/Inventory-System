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

    <style type="text/css">
        .auto-style1 {
            margin-top: 10px;
            margin-bottom: 20px;
            padding: 3px 10px;
            border: 1px solid #ddd;
            background: #fff;
            height: 43px;
        }
    </style>

</head>
<body>



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
                                <span class="fa fa-cutlery" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemName" runat="server" placeholder="Enter Item Name"></asp:TextBox>
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

                            <label>Quantity</label>
                            <div class="input-group">
                                <span class="fa fa-plus-circle" aria-hidden="true"></span>
                                <asp:TextBox ID="txtItemQuantity" runat="server" placeholder="Enter Quantity"></asp:TextBox>
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

                            <div class="text-center">
                                <asp:Button ID="btnSave" class="btn btn-dark btn-danger" runat="server" Text="Save" OnClick="btnSave_Click" />
                                <asp:Button ID="btn_Delete" class="btn btn-dark " Style="margin-left: 20px;" runat="server" Text="Delete" OnClick="btn_Delete_Click" />
                                <asp:Button ID="btn_Clear" class="btn btn-dark" Style="margin-left: 20px;" runat="server" Text="Clear" OnClick="btn_Clear_Click" />
                            </div>

                            <br />
                            <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
                            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                            <asp:TextBox ID="txtPurchaseID" runat="server" Visible="false"></asp:TextBox>
                            
                        </div>
                    </div>

                    <div class="prodTable_Info">
                        <h1>Purchase Order Data</h1>
                        2<asp:GridView ID="gridViewPurchase" runat="server" AutoGenerateColumns="false" BorderStyle="Solid" Width="887px">
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
