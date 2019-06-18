<%@ Page Language="C#" Title="Supplier" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Supplier.aspx.cs" Inherits="Inventory_System.Supplier" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" style="margin-top:50px">


        <table class="nav-justified">
            <tr>
                <td style="height: 714px">
                    <table class="nav" style="margin-top: 50px; margin-left: 50px">
                        <tr>
                            <td style="width: 490px">
                            <asp:Label ID="Label1" runat="server" Text="Supplier ID"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 490px">              
                            <asp:TextBox ID="hfSupplierID" runat="server" Enabled="false" BackColor="WhiteSmoke"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 490px">
                                <asp:Label ID="Label8" runat="server" Text="Supplier Name"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 490px">
                                <asp:TextBox ID="txtSupplierName" runat="server" Height="22px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="SupplierNameRequiredFieldValidator" runat="server" ControlToValidate="txtSupplierName" ErrorMessage="Enter Supplier Name" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 490px">
                                <asp:Label ID="Label3" runat="server" Text="Supplier Contact Person"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 490px">
                                <asp:TextBox ID="txtSupplierContactPerson" runat="server" Height="22px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="SupplierNameRequiredFieldValidator1" runat="server" ControlToValidate="txtSupplierContactPerson" ErrorMessage="Enter Supplier Contact Person" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 490px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="height: 20px; width: 490px;">
                                <asp:Label ID="Label2" runat="server" Text="Supplier Contact No."></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="height: 20px; width: 490px;">
                                <asp:TextBox ID="txtContactNo" runat="server" Height="22px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="SupplierNameRequiredFieldValidator0" runat="server" ControlToValidate="txtContactNo" ErrorMessage="Enter Valid Contact Number" Font-Bold="True" ForeColor="Red" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 490px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 490px">
                                <asp:Label ID="Label4" runat="server" Text="Supplier Address"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 490px">
                                <asp:TextBox ID="txtSupplierAddress" runat="server" Height="60px" TextMode="MultiLine" Width="297px" Style="margin-right: 0"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="SupplierNameRequiredFieldValidator2" runat="server" ControlToValidate="txtSupplierAddress" ErrorMessage="Enter Supplier Address" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 490px">&nbsp;</td>

                        </tr>
                        <tr>
                            <td style="width: 490px">
                                <asp:Label ID="Label5" runat="server" Text="Supplier's Item"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 490px">
                                <asp:TextBox ID="txtSupplierItem" runat="server" Height="22px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="SupplierNameRequiredFieldValidator3" runat="server" ControlToValidate="txtSupplierItem" ErrorMessage="Enter Supplier's Item" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>


                        </tr>
                        <tr>
                            <td style="width: 490px">
                                <asp:Label ID="Label6" runat="server" Text="Price"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td style="width: 490px">
                                <asp:TextBox ID="txtItemPrice" runat="server" Height="22px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="SupplierNameRequiredFieldValidator4" runat="server" ControlToValidate="txtItemPrice" ErrorMessage="Enter Price" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td style="width: 490px">&nbsp;</td>

                        </tr>
                        <tr>
                            <td style="width: 490px">
                                <asp:Label ID="Label7" runat="server" Text="Category"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 490px">
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
                                <asp:RequiredFieldValidator ID="CategoryValidation" runat="server" ControlToValidate="txtItemCategory" ErrorMessage="Enter Item Category" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 130px; width: 490px;">
                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                                <asp:Button ID="btn_Delete" runat="server" Text="Delete" OnClick="btn_Delete_Click" />
                                <asp:Button ID="btn_Clear" runat="server" Text="Clear" OnClick="btn_Clear_Click" />
                                <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
                                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>

                </td>
                <td style="height: 714px; vertical-align:top; margin-top:50px">
                     <div class="container-fluid" style="margin-left: 50px; margin-top:70px">
                         <H1>Suppliers</H1>
                         `<asp:GridView ID="gridViewSupplier" runat="server" AutoGenerateColumns="false" BorderStyle="Solid" Width="887px">
                            <Columns>
                                <asp:BoundField DataField="SupplierID" HeaderText ="Supplier ID" />
                                <asp:BoundField DataField="SupplierName" HeaderText ="Supplier Name" />
                                <asp:BoundField DataField ="SupplierPerson" HeaderText ="Supplier Contact Person" />
                                <asp:BoundField DataField ="SupplierContact" HeaderText ="Supplier Contact Number" />
                                <asp:BoundField DataField="SupplierAddress" HeaderText ="Address" />
                                <asp:BoundField DataField="SupplierItem" HeaderText ="Supplier Item" />
                                <asp:BoundField DataField="ItemPrice" HeaderText="Price" />
                                <asp:BoundField DataField="ItemCategory" HeaderText="Category" />

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("SupplierID") %>' OnClick="lnk_OnClick" CausesValidation="false">View</asp:LinkButton>
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




