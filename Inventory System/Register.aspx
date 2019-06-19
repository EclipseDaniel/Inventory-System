<%@ Page Title="Register" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Inventory_System.WebForm1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div class="container-fluid" style="margin-top: 50px;">
        <table class="nav-justified">
            <tr>
                <td>
                    <table class="nav" style="margin-top: 50px; margin-left: 50px;">
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Register ID" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="txtRegisterID" Enabled="false" BackColor="Gray" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="First Name" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="txtFirstName" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Middle Name" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="txtMiddleName" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Last Name" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="txtLastName" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Address" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="txtAddress" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Contact No." />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="txtContactNo" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Username" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="txtUsername" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Password"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="UserLevel" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="txtUserLevel" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
                            </td>
                            <td>
                                <asp:Button runat="server" ID="btnClear" Text="Clear" OnClick="btnClear_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>



</asp:Content>
