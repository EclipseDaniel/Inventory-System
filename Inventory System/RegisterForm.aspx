<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterForm.aspx.cs" Inherits="Inventory_System.RegisterForm" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cafe by the Ruins</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta-Tags -->

    <!-- css files -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/LoginStyle.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/newStyle.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //css files -->

    <!-- google fonts -->
    <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- //google fonts -->

    <asp:PlaceHolder runat="server">
        <%: Styles.Render("~/Content/css") %>
        <%: Scripts.Render("~/bundles/modernizr") %>
        <%: Scripts.Render("~/bundles/bootstrap") %>
    </asp:PlaceHolder>

    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>
    <div class="container">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Register an Account</h3>
            </div>
            <div class="panel-body">
                <div class="col-md-6 col-sm-6">
                    <!-- spacing sa taas -->
                    <div class="spacer"></div>

                    <form action="#" method="post" runat="server">

                        <div class="row">
                            <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                <asp:TextBox ID="txt_AccountID" Visible="false" runat="server"></asp:TextBox>
                                <label>Email Address</label>
                                <asp:TextBox ID="txt_Email" runat="server" placeholder="Enter Your  Email Address" required="" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                <label>User Name</label>
                                <asp:TextBox ID="txt_UserName" runat="server" placeholder="Enter Your User Name" required="" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                <label>First Name</label>
                                <asp:TextBox ID="txt_FirstName" runat="server" placeholder="Enter Your First Name" required="" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                <label>Last Name</label>
                                <asp:TextBox ID="txt_LastName" runat="server" placeholder="Enter Your Last Name" required="" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">

                            <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                <label>Contact Number</label>
                                <asp:TextBox ID="txt_ContactNum" runat="server" placeholder="09123456789" required="" MaxLength="11" CssClass="form-control"></asp:TextBox>
                            </div>


                            <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                <label for="cboUserRole" class="control-label">User Role</label>
                                <asp:DropDownList  ID="cboUserRole" runat="server" CssClass="form-control"  >
                                    <asp:ListItem Text="User" Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                </asp:DropDownList>
                               <%-- <asp:TextBox ID="txt_UserRole" runat="server" placeholder="Enter Your User Role" required="" CssClass="form-control"></asp:TextBox>--%>
                            </div>


                        </div>

                        <div class="row ">

                            <div class="form-group col-lg-6 col-md-6 col-sm-6 ">
                                <label>Password</label>
                                <asp:TextBox ID="txt_Password" runat="server" placeholder="Enter Password" required="" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                <%--<input type="Password" placeholder="Enter Password" required="">--%>
                            </div>


                            <div class="form-group col-lg-6 col-md-6 col-sm-6 ">
                                <label>Confirm Password</label>
                                <asp:TextBox ID="txt_ConformPass" runat="server" placeholder="Confirm Password" required="" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                <%--<input type="Password" placeholder="Enter Password" required="">--%>
                            </div>
                        </div>

                        <!-- spacing sa taas -->
                        <div class="spacer"></div>

                        <asp:Button ID="btn_Register" runat="server" class="btn btn-danger" OnClick="btn_Register_Click" Text="Register" />

                    </form>  

                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>

                </div>

                <div class="col-md-6 col-sm-6">
                
                        <img src ="Images/Register-Vector2.png" class="img-responsive fit-image">
                </div>
            </div>
        </div>

    </div>

</body>
</html>
