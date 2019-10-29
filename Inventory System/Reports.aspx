<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Inventory_System.Reports" %>

<asp:Content ID="ReportsHeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <link href="css/newStyle.css" rel="stylesheet" />
    <link href="css/Pagination.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="ReportsBodyContent" ContentPlaceHolderID="BodyContent" runat="server">

    <div class="spacer"></div>

    <div class="panel panel-primary">
        <div class="panel panel-heading">
            <h3>Reporting</h3>
        </div>
    </div>


    <div class="panel panel-body">
        <div class="row">
            <%--<div class="col-centered">--%>
                <div class="col-lg-8">
                    <label for="ddlReports" class="control-label">Select Report:</label>
                    <asp:DropDownList ID="ddlReports" runat="server" CssClass="form-control" Style="margin-bottom: 10px" OnSelectedIndexChanged="ddlReports_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Text="FD" Value="FD" Selected="true">Forecast Demand</asp:ListItem>
                        <%--<asp:ListItem Text="FPS" Value="FPS">Forecast Production Schedule</asp:ListItem>
                        <asp:ListItem Text="ISR" Value="ISR">Inventory Summary Report</asp:ListItem>--%>
                        <asp:ListItem Text="IL" Value="IL">Inventory Logs</asp:ListItem>
                        <asp:ListItem Text="FLO" Value="FLO">Frequence of Late Orders</asp:ListItem>
                        <%--<asp:ListItem Text="FRAVA" Value="FRAVA">Forcasted Reports Actual vs Forecasted</asp:ListItem>--%>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-4">
                    <asp:Button ID="btnExportToExcel" runat="server" Text="Export to Excel" class="btn btn-primary" Style="margin-top: 20px; margin-bottom: 2px" OnClick="btnExportToExcel_Click" />
                </div>
                <asp:GridView ID="gridViewInventoryLogs" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" HorizontalAlign="Center">
                    <HeaderStyle CssClass="GridHeader" />
                    <AlternatingRowStyle CssClass="GridAltItem" />
                    <Columns>
                        <asp:BoundField DataField="ItemID" HeaderText="Item ID" />
                        <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                        <asp:BoundField DataField="ItemType" HeaderText="Item Type" />
                        <asp:BoundField DataField="ItemQuantity" HeaderText="Item Quantity" />
                        <asp:BoundField DataField="ItemUnit" HeaderText="Item Unit" />
                        <asp:BoundField DataField="DateModified" HeaderText="Date Modified" />
                        <asp:BoundField DataField="TimeModified" HeaderText="Time Modified" />
                    </Columns>
                </asp:GridView>

                <asp:GridView ID="gridViewForecastDemand" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" HorizontalAlign="Center">
                    <HeaderStyle CssClass="GridHeader" />
                    <AlternatingRowStyle CssClass="GridAltItem" />
                    <Columns>
                        <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                        <asp:BoundField DataField="DemandRate" HeaderText="Demand Rate" />
                        <asp:BoundField DataField="Months" HeaderText="Months" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                    </Columns>
                </asp:GridView>

                <%--                <asp:GridView ID="gridViewForecastProductionPlanning" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" HorizontalAlign="Center">
                    <HeaderStyle CssClass="GridHeader" />
                    <AlternatingRowStyle CssClass="GridAltItem" />
                    <Columns>
                        <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                        <asp:BoundField DataField="DemandRate" HeaderText="Demand Rate" />
                        <asp:BoundField DataField="Months" HeaderText="Months" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                    </Columns>
                </asp:GridView>--%>

<%--                <asp:GridView ID="gridViewFastMovingMaterials" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" HorizontalAlign="Center">
                    <HeaderStyle CssClass="GridHeader" />
                    <AlternatingRowStyle CssClass="GridAltItem" />
                    <Columns>
                        <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                        <asp:BoundField DataField="ItemQuantity" HeaderText="Item Quantity" />
                        <asp:BoundField DataField="StartTime" HeaderText="Usage" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                    </Columns>
                </asp:GridView> --%>

                <asp:GridView ID="gridViewFrequencyOfLateOrders" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" HorizontalAlign="Center">
                    <HeaderStyle CssClass="GridHeader" />
                    <AlternatingRowStyle CssClass="GridAltItem" />
                    <Columns>
                        <asp:BoundField DataField="Dish" HeaderText="Dish" />
                        <asp:BoundField DataField="Order" HeaderText="# of Orders" />
                        <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                        <asp:BoundField DataField="EndTime" HeaderText="EndTime" />
                        <asp:BoundField DataField="Duration" HeaderText="Duration" />
                        <asp:BoundField DataField="LeadTime" HeaderText="Lead Time" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
