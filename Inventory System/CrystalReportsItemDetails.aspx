<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrystalReportsItemDetails.aspx.cs" Inherits="Inventory_System.CrystalReportsItemDetails" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  font-size: 16px;
  float: left;
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

<body>
    <form id="form1" runat="server">
        <div>
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" DisplayToolbar="False" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" GroupTreeImagesFolderUrl="" Height="1202px" ReportSourceID="CrystalReportItemDetails" ReuseParameterValuesOnRefresh="True" ToolbarImagesFolderUrl="" ToolPanelView="None" ToolPanelWidth="200px" Width="1104px" />
            <CR:CrystalReportSource ID="CrystalReportItemDetails" runat="server">
                <Report FileName="CrystalReportsItemDetails.rpt">
                </Report>
            </CR:CrystalReportSource>
        </div>
    </form>
</body>
</html>
