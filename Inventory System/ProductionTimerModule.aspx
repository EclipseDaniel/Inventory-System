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
            <form action="#" method="post" runat="server">
                <!-- main content -->
                <div class="divider_info">
                    <div class="prodTable_Info">

                        <%-- Production Time Data--%>
                        <label>Start Time</label>
                        <div class="input-group">
                        <span class="fa fa-bars" aria-hidden="true"></span>
                        <asp:Textbox runat="server" ID="txtStartTime" ReadOnly="true" BackColor="WhiteSmoke"></asp:Textbox>
                        </div>

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:Timer runat="server" ID="UpdateTimer" Interval="1000" OnTick="UpdateTimer_Tick" />
                        
                            

                        <label>End time</label>
                        <div class="input-group">
                        <span class="fa fa-bars" aria-hidden="true"></span>
                        <asp:Textbox runat="server" ID="txtEndTime" ReadOnly="true" BackColor="WhiteSmoke"></asp:Textbox>
                        </div>

                        <asp:Button runat="server" ID="btnEnd" Text="Done" Style="margin-left: 10px;" class="btn btn-dark" OnClick="btnEnd_Click"/>

                        <%--Datagrid and Header for checking production stock levels--%>
                        <div class="prod_info">
                            <h1>Production Data</h1>
                            <div class="text-center" style="margin: 10px,10px,10px,10px; align-content: center flex-start;">
                                <asp:UpdatePanel runat="server" ID="TimePanel" UpdateMode="Conditional">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="UpdateTimer" EventName="Tick" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:GridView ID="gridOrderedDish" runat="server" AutoGenerateColumns="false" CssClass="Grid" HorizontalAlign="Center">
                                            <HeaderStyle CssClass="GridHeader" />
                                            <AlternatingRowStyle CssClass="GridAltItem" />


                                            <Columns>
                                                <asp:BoundField DataField="MenuID" HeaderText="Menu ID" />
                                                <asp:BoundField DataField="Dish" HeaderText="Dish" />
                                                <asp:BoundField DataField="Order" HeaderText="Order" />
                                                <asp:BoundField DataField="OrderStatus" HeaderText="Status" />
                                                <asp:BoundField DataField="Duration" HeaderText="Duration" />
                                                <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                                                <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                        
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
