<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forecasting.aspx.cs" Inherits="Inventory_System.Forecasting" %>

<asp:Content ID="ForecastingHeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <link href="css/newStyle.css" rel="stylesheet" />
    <script src="Scripts/Chart.js"></script>
</asp:Content>
<asp:Content ID="ForecastingBodyContent" ContentPlaceHolderID="BodyContent" runat="server">

    <div class="spacer"></div>

    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">Forecasting</h3>
        </div>

        <div class="panel-body">
            <div class="row">
                <div class="col-centered">
                    <asp:Literal ID="ltChart" runat="server"></asp:Literal>
                </div>
                <div class="col-lg-1"></div>
                <div class="col-lg-4">
                    <label for="ddlMonth" runat="server" class="control-label">Month:</label>
                    <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control">
                        <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="January" Value="January"></asp:ListItem>
                        <asp:ListItem Text="February" Value="February"></asp:ListItem>
                        <asp:ListItem Text="March" Value="March"></asp:ListItem>
                        <asp:ListItem Text="April" Value="April"></asp:ListItem>
                        <asp:ListItem Text="May" Value="May"></asp:ListItem>
                        <asp:ListItem Text="June" Value="June"></asp:ListItem>
                        <asp:ListItem Text="July" Value="July"></asp:ListItem>
                        <asp:ListItem Text="August" Value="August"></asp:ListItem>
                        <asp:ListItem Text="September" Value="September"></asp:ListItem>
                        <asp:ListItem Text="October" Value="October"></asp:ListItem>
                        <asp:ListItem Text="November" Value="November"></asp:ListItem>
                        <asp:ListItem Text="December" Value="December"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-4">
                    <label runat="server" class="control-label">Percentage:</label>
                    <asp:TextBox ID="txtPercentage" runat="server" CssClass="form-control" max="3" placeholder="Enter percentage in decimal(e.g.  .1)"></asp:TextBox>
                </div>
                <div class="col-lg-1">
                    <asp:Button runat="server" ID="btnSavePercentage" CssClass="btn btn-success" Text="Save" Style="margin-top:20px" OnClick="btnSavePercentage_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
