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

                <!--ItemName-->
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <label for="ddlItem" runat="server" class="control-label">Item Name:</label>
                    <asp:DropDownList ID="ddlItem" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </div>


                <div class="col-lg-4 col-md-4 col-sm-4">
                    <label for="ddlMonth" runat="server" class="control-label">Range:</label>
                    <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control">
                         <asp:ListItem Text="Daily" Value="Daily" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Weekly" Value="Weekly"></asp:ListItem>
                        <asp:ListItem Text="Monthly" Value="Monthly" ></asp:ListItem>
                       
                    </asp:DropDownList>
                </div>
                <%-- <div class="col-lg-4">
                    <label runat="server" class="control-label">Percentage:</label>
                    <asp:TextBox ID="txtPercentage" runat="server" CssClass="form-control" max="3" placeholder="Enter percentage in decimal(e.g.  .1)"></asp:TextBox>
                </div>--%>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Button runat="server" ID="btnSavePercentage" CssClass="btn btn-primary" Text="Generate Forecast" Style="margin-top:25px;  width: 100%;" OnClick="btnSavePercentage_Click" />
                </div>

            </div>


            <div class="spacer"></div>


            <div class="row">
                
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <asp:Literal ID="ltChart" runat="server"></asp:Literal>
                </div>

            </div>


        </div>
    </div>
</asp:Content>
