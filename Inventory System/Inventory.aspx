<%@ Page Title="Inventory" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="Inventory_System.Inventory" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>
        <table class="nav-justified">
            <tr>
                <td class="modal-sm" style="width: 284px">
                    <asp:Label ID="Label1" runat="server" Text="Item No."></asp:Label>
                    <asp:TextBox ID="txtItemNo" runat="server"></asp:TextBox>
                </td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">&nbsp;</td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px; height: 74px;">
                    <asp:Label ID="Label2" runat="server" Text="Item Name"></asp:Label>
                    <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
                </td>
                <td style="width: 284px; height: 74px;"></td>
                <td style="width: 285px; height: 74px;"></td>
                <td style="height: 74px"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">&nbsp;</td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">
                    <asp:Label ID="Label3" runat="server" Text="Item Type"></asp:Label>
                    <asp:TextBox ID="txtItemType" runat="server"></asp:TextBox>
                </td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">&nbsp;</td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">
                    <asp:Label ID="Label4" runat="server" Text="Item Quantity"></asp:Label>
                    <asp:TextBox ID="txtItemQuantity" runat="server"></asp:TextBox>
                </td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">&nbsp;</td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">
                    <asp:Label ID="Label5" runat="server" Text="Item Status"></asp:Label>
                    <asp:TextBox ID="txtItemStatus" runat="server"></asp:TextBox>
                </td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">&nbsp;</td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">
                    <asp:Label ID="Label6" runat="server" Text="Item Supplier"></asp:Label>
                    <asp:TextBox ID="txtItemSupplier" runat="server"></asp:TextBox>
                </td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">&nbsp;</td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">
                    <asp:Label ID="Label7" runat="server" Text="Item Delivery Date"></asp:Label>
                    <asp:TextBox ID="txtItemDeliveryDate" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">&nbsp;</td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">
                    <asp:Label ID="Label8" runat="server" Text="Item Expiration Date"></asp:Label>
                    <asp:TextBox ID="txtItemExpirationDate" runat="server"></asp:TextBox>
                </td>
                <td style="width: 284px">&nbsp;</td>
                <td style="width: 285px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

        </table>
    </h2>

</asp:Content>