<%@ Page Title="Inventory" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="Inventory_System.Inventory" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Item Form</h2>
    <div class="container-fluid" style="margin-top: 50px" ;>
        <table class="nav-justified">
            <tr>
                <td class="modal-sm" style="width: 490px; height: 20px;">
                    <asp:Label ID="Label1" runat="server" Text="Item No."></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:TextBox ID="txtItemNo" runat="server" Enabled="false" BackColor="WhiteSmoke"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px;">
                    <asp:Label ID="Label2" runat="server" Text="Item Name"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ItemNameRequiredFieldValidator" runat="server" ControlToValidate="txtItemName" ErrorMessage="Enter Item Name" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:Label ID="Label3" runat="server" Text="Item Type"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:DropDownList ID="ddlItemType" runat="server">
                        <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Condiments" Value="Condiments"></asp:ListItem>
                        <asp:ListItem Text="Seasonings" Value="Seasonings"></asp:ListItem>
                        <asp:ListItem Text="Meats" Value="Meats"></asp:ListItem>
                        <asp:ListItem Text="Vegetables" Value="Vegetables"></asp:ListItem>
                        <asp:ListItem Text="Fruits" Value="Fruits"></asp:ListItem>
                        <asp:ListItem Text="Pastry" Value="Pastry"></asp:ListItem>
                        <asp:ListItem Text="Grain" Value=""></asp:ListItem>
                        <asp:ListItem Text="Beverage" Value=""></asp:ListItem>
                        <asp:ListItem Text="Oil" Value=""></asp:ListItem>
                        <asp:ListItem Text="Kitchenware" Value=""></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="ItemTypeRequiredFieldValidator" runat="server" ControlToValidate="ddlItemType" ErrorMessage="Select Item Type" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:Label ID="Label4" runat="server" Text="Item Quantity"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:TextBox ID="txtItemQuantity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ItemQuantityRequiredFieldValidator" runat="server" ControlToValidate="txtItemQuantity" ErrorMessage="Enter Item Quantity" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 284px">
                    <asp:Label ID="Label5" runat="server" Text="Item Status"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:DropDownList ID="ddlItemStatus" runat="server">
                        <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                        <asp:ListItem Text="Critical" Value="Critical"></asp:ListItem>
                        <asp:ListItem Text="Spoiled" Value="Spoiled"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="ItemStatusRequiredFieldValidator" runat="server" ControlToValidate="ddlItemStatus" ErrorMessage="Select Item Status" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:Label ID="Label6" runat="server" Text="Item Supplier"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:TextBox ID="txtItemSupplier" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ItemSupplierRequiredFieldValidator" runat="server" ControlToValidate="txtItemSupplier" ErrorMessage="Enter Item Supplier" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:Label ID="Label7" runat="server" Text="Item Delivery Date"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:TextBox ID="txtItemDeliveryDate" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:Label ID="Label8" runat="server" Text="Item Expiration Date"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px">
                    <asp:TextBox ID="txtItemExpirationDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemExpirationDate" ErrorMessage="Enter Expiration Date" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>   
            </tr>
            <tr>
                <td class="modal-sm" style="width: 490px ; height: 130px ;">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                    <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <td style="height: 714px; vertical-align:top; margin-top:50px">
                     <div class="container-fluid" style="margin-left: 50px; margin-top:70px">
                         <H1>Items</H1>
                        <asp:GridView ID="gridViewItem" runat="server" AutoGenerateColumns="false" BorderStyle="Solid" Width="887px">
                            <Columns>
                                <asp:BoundField DataField="ItemID" HeaderText ="Item ID" />
                                <asp:BoundField DataField="ItemName" HeaderText ="Item Name" />
                                <asp:BoundField DataField ="ItemType" HeaderText ="Item Type" />
                                <asp:BoundField DataField="ItemQuantity" HeaderText ="Item Quantity" />
                                <asp:BoundField DataField="ItemStatus" HeaderText ="Item Status" />
                                <asp:BoundField DataField="ItemSupplier" HeaderText ="Item Supplier" />
                                <asp:BoundField DataField="ItemDeliveryDate" HeaderText="Item Delivery Date" />
                                <asp:BoundField DataField="ItemExpirationDate" HeaderText="Item Expiration Date" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("ItemID") %>' OnClick="lnk_OnClick"  CausesValidation="false">View</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
            </td>
        </table>
        </div>

</asp:Content>