<%@ Page Language="C#" Title="Supplier" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Supplier.aspx.cs" Inherits="Inventory_System.Supplier" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>



        <table class="nav-justified" style="margin-top: 50px ; margin-left: 50px">
            <tr>
                <td class="modal-sm" style="width: 733px">
                    <asp:Label ID="Label1" runat="server" Text="Supplier Name"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Supplier Contact Person"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 733px">
                    <asp:TextBox ID="txtSupplierName" runat="server" Height="22px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="SupplierNameRequiredFieldValidator" runat="server" ControlToValidate="txtSupplierName" ErrorMessage="Enter Supplier Name" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txtSupplierContactPerson" runat="server" Height="22px" Width="145px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="SupplierNameRequiredFieldValidator1" runat="server" ControlToValidate="txtSupplierContactPerson" ErrorMessage="Enter Supplier Contact Person" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 733px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 733px">
                    <asp:Label ID="Label2" runat="server" Text="Supplier Contact No."></asp:Label>
                </td>
                <td>Supplier Address</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 733px; ">
                    <asp:TextBox ID="txtContactNo" runat="server" Height="22px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="SupplierNameRequiredFieldValidator0" runat="server" ControlToValidate="txtContactNo" ErrorMessage="Enter Email Address" Font-Bold="True" ForeColor="Red" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtContactNo" Display="Dynamic" ErrorMessage="Please enter a valid email address" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
&nbsp;</td>
                <td>
                    <asp:TextBox ID="txtSupplierAddress" runat="server" Height="22px" TextMode="MultiLine" Width="404px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="SupplierNameRequiredFieldValidator2" runat="server" ControlToValidate="txtSupplierAddress" ErrorMessage="Enter Supplier Address" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 733px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="height: 20px; width: 733px"></td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 733px; height: 20px;">
                    </td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 733px"><input id="Reset1" type="reset" value="reset" /><input id="Submit1" type="submit" value="submit" /></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 733px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>




        <div style="margin-left: 50px">
            <asp:GridView ID="GridView1"  runat="server" ></asp:GridView>
        </div>
    </div>
</asp:Content>
