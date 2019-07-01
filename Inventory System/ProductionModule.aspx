<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="ProductionModule.aspx.cs" Inherits="Inventory_System.ProductionModule1" %>

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
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}
</style>
</head>
<body>

<ul>
  <li><a class="active" href="About.aspx">Home</a></li>
  <li><a href="MenuModule.aspx">Menu</a></li>
  <li><a href="ProductionModule.aspx">Production</a></li>
  <li><a href="InventoryModule.aspx">Inventory</a></li>
  <li><a href="PurchasingModule.aspx">Purchasing</a></li>
</ul>

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
                            <asp:Button ID="btn_Proceed" style="margin-top:30px" class="btn btn-dark" runat="server" Text="Proceed" OnClick="btn_Proceed_Click" />
                            <asp:Button ID="btn_Validate" Style="margin-left: 10px;" class="btn btn-dark" runat="server" Text="Check"  OnClick="btn_Validate_Click" />
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
                            <asp:Button ID="btn_ProceedProcess" class="btn btn-dark" runat="server" Text="Proceed" OnClick="btn_ProceedProcess_Click" style="margin-left:10px" />
                            <asp:Button ID="btn_PurchaseGood" class="btn btn-dark" runat="server" Text="Purchase Goods" OnClick="btn_PurchaseGood_Click" style="margin-left:10px"/>
                            <asp:Button ID="btn_ProcessOrder" class="btn btn-dark" runat="server" Text="Process Order" OnClick="btn_ProcessOrder_Click" style="margin-left:10px"/>
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
