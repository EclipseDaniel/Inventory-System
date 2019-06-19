<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Inventory_System.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cafe by the Ruins</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Cafe Inventory System login form a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
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
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //css files -->

    <!-- google fonts -->
    <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- //google fonts -->

</head>
<body>

    <div class="signupform">
        <div class="container">
            <!-- main content -->

            <div class="divider_info">
                <div class="cafe_form">
                    <div class="account_Info">
                        <h1>Manage Your Account</h1>
                        <img src="images/cafe2.png" alt="" />
                    </div>
                </div>


                <div class="cafe_info">
                    <h2>Login to your Account</h2>
                    <p>Enter your details to login.</p>

                    <form action="#" method="post" runat="server">

                        <label>Email Address</label>
                        <div class="input-group">
                            <span class="fa fa-envelope" aria-hidden="true"></span>
                            <asp:TextBox ID="txt_UserName" runat="server" placeholder="Enter Your User Name" required=""></asp:TextBox>
                        </div>

                        <label>Password</label>
                        <div class="input-group">
                            <span class="fa fa-lock" aria-hidden="true"></span>
                            <asp:TextBox ID="txt_Password" runat="server" placeholder="Enter Password" required="" TextMode="Password"></asp:TextBox>
                            <%--<input type="Password" placeholder="Enter Password" required="">--%>
                        </div>

                        <div class="login-check">
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox" checked=""><i> </i>Remember me</label>
                        </div>

                        <asp:Button ID="btn_Login" runat="server" class="btn btn-danger btn-block" onClick="btn_Login_Click" Text="Login" />
                        <asp:Button ID="btn_Clear" class="btn btn-danger btn-block" runat="server" Style="margin-left: 20px" Text="Clear"  OnClick="btn_Clear_Click"/>

                    </form>

                    <asp:Label ID="lblError" runat="server" Text="Incorrect User Credential" ForeColor="Red"></asp:Label>
                    <p class="reg_Form">Dont have an account? <a href="#">Register here</a></p>

                </div>
            </div>
            <!-- //main content -->
        </div>
        <!-- footer -->
        <div class="footer">
            <p>&copy; 2019 Cafe Inventory System login form. All Rights Reserved | Design by <a href="#" target="blank">TeamCafeByTheRuins</a></p>
        </div>
        <!-- footer -->
    </div>

</body>
</html>
