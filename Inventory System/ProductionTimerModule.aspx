<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductionTimerModule.aspx.cs" Inherits="Inventory_System.ProductionTimerModule" %>

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
                    <div class="prodTable_Info">

                        <%-- Production Time Data--%>
                        <%--Datagrid and Header for checking production stock levels--%>
                        <div class="prod_info">
                            <h1>Production Data</h1>
                            <div class="text-center" style="margin: 10px,10px,10px,10px; align-content: center flex-start;">
                                <asp:GridView ID="gridOrderedDish" runat="server" AutoGenerateColumns="false" CssClass="Grid" HorizontalAlign="Center">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <AlternatingRowStyle CssClass="GridAltItem" />


                                    <Columns>
                                        <asp:BoundField DataField="Dish" HeaderText="Dish" />
                                        <asp:BoundField DataField="Order" HeaderText="Order" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                        <asp:BoundField DataField="Order" HeaderText="Expected Time" />
                                        <asp:BoundField DataField="Dish" HeaderText="Time Started" />
                                        <asp:BoundField DataField="Order" HeaderText="Time Ended" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <%--Datagrid and Header for checking production stock levels--%>
                        </div>
                    </div>
                    <%-- Production Form--%>
                    <div class="prod_form">
                    </div>
                    <%--Datagrid and Header for checking production stock levels--%>
                </div>

                <!-- //main content -->
            </form>
            <%--form--%>
        </div>
        <!-- footer -->
        <div class="footer">
            <p>&copy; 2019 Cafe Inventory System Production Timer form. All Rights Reserved | Design by <a href="#" target="blank">TeamCafeByTheRuins</a></p>
        </div>
        <!-- footer -->
    </div>
</body>
</html>
