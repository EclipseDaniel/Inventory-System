<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Inventory_System.Contact" %>


<asp:Content ID="MenuHeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <link href="css/contacts.css" rel="stylesheet" />
    <link href="css/animate.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="ContactBodyContent" ContentPlaceHolderID="BodyContent" runat="server">

    <!-- Background Image -->
    <div class="row">
        <div class="imgBackground">

            <!-- Animated Cloud -->
                <div class="container-fluid">
                    <img src="Images/vectorcloud.png" alt="Cloud" class="animated fadeInLeftBig imgCloud"/>
                    <div class="innerContainer" data-target="#feedback" data-toggle="modal">
                        <div class="animated fadeInUpBig containerHover">
                            <asp:Label class="Label1" runat="server" Text="How's your day?" />
                            <br />
                            <asp:Label class="Label1" runat="server" Text=" Tell us." />
                            </div>
                        </div>
                    </div>
            <!-- Modal MOdal -->
            <div class="modal" id="feedback" tabindex="-1">
                <div class="modal-dialog animated fadeInDown">
                    <div class="modal-content">
                        <div class="modal-header modalHeader">
                            <label>Reach us</label>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label> 25 Shuntug St, 2600</label>
                                <br />
                                <label>Baguio City, Benguet</label>
                                <br />
                                <label>Landline: (074) 442 4010</label>
                                <br />
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2614.078311069201!2d120.59211085423773!3d16.412918715379465!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3391a168a932c641%3A0x7fed6b7d653057f!2sCaf%C3%A9%20by%20the%20Ruins!5e0!3m2!1sen!2sph!4v1568630943280!5m2!1sen!2sph" width="400" height="300" 
                                    ></iframe>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button Text="Close" runat="server" CssClass="btn btn-danger" data-dismiss="modal" />
                        </div>
                    </div>
                </div>
            </div>

            <%--         <div class="container-fluid">
             <img src="Images/vectorcloud.png" alt="cloud" class="animated fadeInLeftBig imgCloud" />
        
                <div class="container">
                    <div class="inner animated fadeInLeftBig">
                        <asp:Label class="Label1" runat="server" Text="How's your day?" />
                        <br />
                        <asp:Label class="Label1" runat="server" Text=" Tell us." />
                </div>
        </div>
        </div>--%>
                </div>
    </div>




    <%--        <div ID="firstDiv" style="width:33%;position:relative;float:left">
            <asp:Label runat="server" Text="try" />
        </div>
        <div ID="secondDiv" style="width:33%;position:relative;float:left;top:0px;left:0px;height:21px;">
            <asp:Label runat="server" Text="try" />
        </div>
        <div ID="thirdDiv" style="width:33%;position:relative;float:right;"">
            <asp:Label runat="server" Text="try" />
        </div>--%>
</asp:Content>

