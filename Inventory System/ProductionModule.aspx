<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductionModule.aspx.cs" Inherits="Inventory_System.ProductionModule" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Cafe by the Ruins</title>

    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>


    <!-- css files -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/prodStyle.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //css files -->
</head>

<body>
    <div class="production_form">
        <div class="container">
            <!-- main content -->
            <div class="left_div">
                <div class="cafe_details">
                    <form action="#" method="post" runat="server">
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="Button" />
                    </form>
                </div>
            </div>

            <div class="stock_info">
                <div>
                     
                        <asp:CheckBoxList ID="CheckBoxList2" runat="server"></asp:CheckBoxList>
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        
                        
               
                </div>
            </div>
            <!-- main content -->
        </div>
        <!-- footer -->
        <div class="footer">
            <p>&copy; 2019 Cafe Inventory System Production Module. All Rights Reserved | Design by <a href="#" target="blank">TeamCafeByTheRuins</a></p>
        </div>
        <!-- footer -->
    </div>

</body>
</html>
