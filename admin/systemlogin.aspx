<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="systemlogin.aspx.cs" Inherits="website.systemlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>admin giriş</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-icons/7.16.0/simpleicons.svg" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="css/custom.css" rel="stylesheet" type="text/css" />



    <style>
        .login-container {
            margin-top: 5%;
            margin-bottom: 5%;
        }

        .login-form-1 {
            padding: 5%;
            box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
        }

            .login-form-1 h3 {
                text-align: center;
                color: #333;
            }

        .login-container form {
            padding: 10%;
        }

        .btnSubmit {
            width: 100%;
            border-radius: 1rem;
            padding: 1.5%;
            border: none;
            cursor: pointer;
        }

        .login-form-1 .btnSubmit {
            border-color:#0062cc;
            border-width:1px;
            border-style:solid;
            font-weight: 600;
            color: #fff;
            background-color: #0062cc;
            transition: all 0.7s ease;
        }

        .btnSubmit:hover{
            border-color:aqua;
            border-width:1px;
            border-style:solid;
            font-weight: 600;
            color: #ff0000;
            background-color: #fff;
        }

        .login-form-1 .ForgetPwd {
            color: #0062cc;
            font-weight: 600;
            text-decoration: none;
        }
    </style>

</head>
<body>
    <form id="form_admin" runat="server">
        <div>
            <div class="container login-container">
                <div class="row">
                    <div class="col-md-3"></div>

                    <div class="col-md-6 login-form-1">
                        <h3>Admin</h3>
                        <div class="form-group">
                            <asp:TextBox ID="name" CssClass="form-control" runat="server" placeholder="N"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="pass" TextMode="Password" CssClass="form-control" runat="server" placeholder="P"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="giris" CssClass=" btn-lg btnSubmit" runat="server" Text="Giriş" OnClick="giris_Click" />
                        </div>
                    </div>

                    <div class="col-md-3"></div>

                </div>

            </div>
        </div>
    </form>

    <!--SCRIPT-->
    <script src="js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/custom.js"></script>


</body>
</html>
