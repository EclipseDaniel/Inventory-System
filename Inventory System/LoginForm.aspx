<%@ Page Language="C#" Title="LoginForm" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Inventory_System.LoginForm" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid" style="margin-top: 50px">
        <table class="nav-justified" style="margin:auto">
            <tr>
                <td style="width: 775px">
                    <div class="Login_Form">
                        <div class="left_grid_info" style="width: 700px">
                            <h1 style="text-align: center"><b>Manage Your Account</b></h1>
                            <img src="images/cafe2.png" alt="" style="height: 500px" />
                        </div>
                    </div>
                </td>

                <td >
                    <div style="align-items:flex-start" >
                        <table style="margin:auto">
                        <tr>
                            <td >
                                <div>
                                    <h1 ><b>Login to your Account</b></h1>
                                    <p >Enter your details to login.</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 70px">
                                <label>User Name</label>
                                <div class="input-group" style="left: 0px; top: 0px; height: 33px">
                                    <asp:TextBox ID="tbox_UserName" runat="server" />
                                </div>
                                 <label>Password</label>
                                <div class="input-group" style="left: 0px; top: 0px; height: 33px">
                                    <asp:TextBox ID="tbox_Password" runat="server" TextMode="Password" />
                                </div>
                                <div style="height: 31px">
                                    <asp:Button ID="btn_login" runat="server" Text="Log In" BorderStyle="Solid" OnClick="btn_login_Click" />
                                    <asp:Button Style="margin-left:20px" ID="btn_Clear" runat="server" Text="Clear" BorderStyle ="Solid" OnClick="btn_Clear_Click"/>
                                
                                    
                                </div>
                                <asp:Label ID="lblError" runat="server" ForeColor="Red" Text="Incorrect User Credential"></asp:Label>
                               
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div>
                                    <p class="account">By clicking login, you agree to our <a href="#">Terms & Conditions!</a></p>
                                    <p class="account1">Dont have an account? <a href="#">Register here</a></p>
                                </div>
                                 
                            </td>
                        </tr>
                    </table>
                    </div>
                    
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
