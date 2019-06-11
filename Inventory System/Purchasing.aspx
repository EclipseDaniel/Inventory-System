<%@ Page Language="C#" Title="Purchasing" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Purchasing.aspx.cs" Inherits="Inventory_System.Purchasing" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Purchase Order</h2>


    <div class="container-fluid" style="margin-top: 50px;">
        <table class="nav-justified">

            <tr>
                <td>
                    <table class="nav" style="margin-top: 50px; margin-left: 50px">
                        <tr>
                            <td class="modal-sm" style="width: 490px">
                                <asp:Label ID="Label1" runat="server" Text="Purchase ID"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="modal-sm" style="width: 490px">
                                <asp:TextBox ID="txtPurchaseID" runat="server" Enabled="false" BackColor="WhiteSmoke"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 490px">
                                <asp:Label ID="Label2" runat="server" Text="Item Name"></asp:Label>
                            </td>
                            <td style="height: 20px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 490px">
                                <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
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
                            </td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 490px">
                                <asp:Label ID="Label5" runat="server" Text="Supplier Name"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 490px">
                                <asp:TextBox ID="txtSupplierName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Shipped-By"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtShippedBy" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="Terms"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtTerms" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <asp:Label ID="Label8" runat="server" Text="Address"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td>

                                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td>

                                <asp:Label ID="Label9" runat="server" Text="Notes"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td>

                                <asp:TextBox ID="txtNotes" runat="server" Height="60px" TextMode="MultiLine" Width="265px"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td>

                                <asp:Label ID="Label10" runat="server" Text="Date"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td>

                                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="height: 130px; width: 490px;">

                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                                <asp:Button ID="btnClear" runat="server" Text="Clear" />
                                <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
                                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>

                            </td>
                        </tr>
                    </table>
                </td>






                <td style="height: 714px; vertical-align: top; margin-top: 50px">

                    <div class="container-fluid" style="margin-left: 50px; margin-top: 70px">

                        <h1>Purchase Order Data</h1>
                        2<asp:GridView ID="gridViewPurchase" runat="server" AutoGenerateColumns="false" BorderStyle="Solid" Width="887px">
                            <Columns>
                                <asp:BoundField DataField="PurchaseID" HeaderText="Purchase ID" />
                                <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                                <asp:BoundField DataField="ItemType" HeaderText="Item Type" />
                                <asp:BoundField DataField="ItemQuantity" HeaderText="Item Quantity" />
                                <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" />
                                <asp:BoundField DataField="ShippedBy" HeaderText="Shipped-By" />
                                <asp:BoundField DataField="Terms" HeaderText="Terms" />
                                <asp:BoundField DataField="Notes" HeaderText="Remarks" />
                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("PurchaseID") %>' OnClick="lnk_OnClick" CausesValidation="false">View</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                </td>

            </tr>




        </table>




    </div>

</asp:Content>
