<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Inventory_System.Contact" %>


<asp:Content ID="MenuHeaderContent" ContentPlaceHolderID="HeaderContent" runat="server" >
    <link href="css/contacts.css" rel="stylesheet" />
    <link href="css/animate.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="ContactBodyContent" ContentPlaceHolderID="BodyContent" runat="server">
        <section>  
            <img src="Images/vectorcloud.png" alt="cloud" class="animated fadeInLeftBig"/>
        </section>
        <div class="container">
            <div class="inner animated fadeInLeftBig">
                <asp:Label class="Label1" runat="server" Text="How's your day?" />
                <br />
                <asp:Label class="Label1" runat="server" Text=" Tell us." />
            </div>
        </div>

        <div ID="firstDiv" style="width:33%;position:relative;float:left">
            <asp:Label runat="server" Text="try" />
        </div>
        <div ID="secondDiv" style="width:33%;position:relative;float:left;top:0px;left:0px;height:21px;">
            <asp:Label runat="server" Text="try" />
        </div>
        <div ID="thirdDiv" style="width:33%;position:relative;float:right;"">
            <asp:Label runat="server" Text="try" />
        </div>

</asp:Content>

