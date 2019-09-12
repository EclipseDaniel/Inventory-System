<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Inventory_System.Contact" %>


<asp:Content ID="MenuHeaderContent" ContentPlaceHolderID="HeaderContent" runat="server" >
    <link href="css/contacts.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="ContactBodyContent" ContentPlaceHolderID="BodyContent" runat="server">
    <h1 class="Intro">Reach us</h1>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
</asp:Content>
