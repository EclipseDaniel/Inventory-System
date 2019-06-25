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

</head>
<body>

     <div class="navbar navbar-inverse navbar-fixed-top">
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
                        <li><a runat="server" href="~/Contact">Production</a></li>
                         <li><a runat="server" href="~/MenuModule">Menu Setting</a></li>
                        <li><a runat="server" href="~/InventoryModule">Inventory</a></li>
                        <li><a runat="server" href="~/SupplierModule">Supplier</a></li>
                                               
                    </ul>
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
                            <asp:Button ID="btn_Proceed" style="margin-top:30px" class="btn btn-dark" runat="server" Text="Proceed" OnClick="btn_Proceed_Click" />
                            
                        </div>

                        <div class="text-center" style="margin-top:200px;align-content:center flex-start;">
                            <asp:GridView ID="gridProdMod" runat="server" AutoGenerateColumns="false" BorderStyle="Solid">
                                <Columns>
                                    <asp:BoundField DataField="Dish" HeaderText="Dish" />
                                    <asp:BoundField DataField="Ingredients" HeaderText="Ingredients" />
                                    <asp:BoundField DataField="TotalQty" HeaderText="Quantity" />
                                    <asp:BoundField DataField="ItemQuantity" HeaderText="Stock Level" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="text-center">
                            <asp:Button ID="btn_ProceedProcess" class="btn btn-dark" runat="server" Text="Proceed" OnClick="btn_ProceedProcess_Click" />
                            <asp:Button ID="btn_SendEmail" Style="margin-left: 10px;" class="btn btn-dark" runat="server" Text="Send Email" OnClick="btn_SendEmail_Click" />
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
