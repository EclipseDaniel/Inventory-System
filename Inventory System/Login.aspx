<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Inventory_System.Login" %>

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
        <!-- spacing sa taas -->
        <div class="spacer"></div>
        <div class="card">
            <form action="#" method="post" runat="server" class="form-vertical">
                <fieldset>
                    <!-- spacing sa taas -->
                    <div class="spacer"></div>

                    <div class="col-md-6 col-sm-6">
                        <!-- spacing sa taas -->
                        <div class="spacer"></div>
                        <img src ="Images/Login-Vector2.png" class="img-responsive fit-image">
                    </div>


                    <div class="col-md-6 col-sm-6">
                        <!-- spacing sa taas -->
                        <div class="spacer"></div>


                        <div class="text-center">
                            <h1>Login to your Account</h1>
                            <p>Enter your details to login.</p>
                        </div>


                        <div class="form-group center-col-align pad-top">
                            <label class="control-label" for="txt_UserName">Username</label>
                            <asp:TextBox ID="txt_UserName" runat="server" placeholder="Enter Your User Name" required="" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group center-col-align">
                            <label class="control-label" for="txt_Password">Password</label>
                            <asp:TextBox ID="txt_Password" runat="server" placeholder="Enter Password" required="" TextMode="Password" CssClass=" form-control"></asp:TextBox>
                            <%--<input type="Password" placeholder="Enter Password" required="">--%>
                        </div>

                        <div class="form-group center-col-align">
                            <input type="checkbox" name="checkbox" checked=""><i> </i>
                            <label>Remember me</label>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-10 col-md-10 col-sm-10 col-md-offset-2 col-lg-offset-2 col-sm-offset-2">
                                <asp:Button ID="btn_Login" runat="server" class="btn btn-primary" OnClick="btn_Login_Click" Text="Login" />
                                <asp:Button ID="btn_Clear" class="btn btn-danger" runat="server" Style="margin-left: 20px" Text="Cancel" OnClick="btn_Clear_Click" />
                            </div>
                        </div>

                        <div class="text-center align-reg">
                            <asp:Label ID="lblError" runat="server" Text="Incorrect User Credential" ForeColor="Red"></asp:Label>
                            <p>Dont have an account? <a href="RegisterForm">Register here</a></p>
                        </div>
                    </div>


                </fieldset>
            </form>

            <!-- spacing sa baba -->
            <div class="spacer-bottom"></div>
        </div>
    </div>

</body>
</html>

