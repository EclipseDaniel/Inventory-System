<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Inventory_System.Reports" %>

<asp:Content ID="ReportsHeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <link href="css/newStyle.css" rel="stylesheet" />
    <link href="css/Pagination.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="ReportsBodyContent" ContentPlaceHolderID="BodyContent" runat="server">

    <div class="spacer"></div>

    <div class="panel panel-success">
        <div class="panel panel-heading">
            <h3>Reporting</h3>
        </div>
    </div>


    <div class="panel panel-body">
        <div class="row">
            <div class="col-centered">
                <label for="ddlReports" class="control-label">Select Report:</label>
                <asp:DropDownList ID="ddlReports" runat="server" CssClass="form-control">
                    <asp:ListItem Text="FD" Value="FD" Selected="true">Forecast Demand</asp:ListItem>
                    <asp:ListItem Text="FPS" Value="FPS">Forecast Production Schedule</asp:ListItem>
                    <asp:ListItem Text="ISR" Value="ISR">Inventory Summary Report</asp:ListItem>
                    <asp:ListItem Text="IL" Value="IL">Inventory Logs</asp:ListItem>
                    <asp:ListItem Text="FLO" Value="FLO">Frequence of Late Orders</asp:ListItem>
                    <asp:ListItem Text="FRAVA" Value="FRAVA">Forcasted Reports Actual vs Forecasted</asp:ListItem>
                </asp:DropDownList>
                <asp:GridView ID="gridViewDemandForecast" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" HorizontalAlign="Center">
                    <HeaderStyle CssClass="GridHeader" />
                    <AlternatingRowStyle CssClass="GridAltItem" />
                    <Columns>
<%--                        <asp:BoundField DataField="ItemID" HeaderText="Item ID" />
                        <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                        <asp:BoundField DataField="ItemType" HeaderText="Item Type" />
                        <asp:BoundField DataField="ItemQuantity" HeaderText="Item Quantity" />
                        <asp:BoundField DataField="ItemStatus" HeaderText="Item Status" />
                        <asp:BoundField DataField="ItemSupplier" HeaderText="Item Supplier" />
                        <asp:BoundField DataField="ItemDeliveryDate" HeaderText="Item Delivery Date" />
                        <asp:BoundField DataField="ItemExpirationDate" HeaderText="Item Expiration Date" />
                        <asp:BoundField DataField="ItemUnit" HeaderText="Item Unit" />--%>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
