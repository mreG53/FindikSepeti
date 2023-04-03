<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="company_login.aspx.cs" Inherits="website.companies.company_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Giriş - İşletme</title>
    <link rel="shortcut icon" href="../images/logo_test.png" type="image/x-icon"/>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/custom.css" rel="stylesheet" />

</head>
<body style="background-color: white; background-image:url(../images/alimsatimbck.jpeg); position: fixed; background-size: 100%; width:100%; min-height:100%; height:100%; background-repeat: no-repeat;">
    <form id="form_login_comp" runat="server">

        <div class="row">
            <div class="col-md-3">
            </div>
            <div class="col-md-6 shadow table-hover">
                <div id="form-div-comp" style="border-radius:100px;">
                    <h3 style="color:white; font-weight:bold; text-align:center;">İşletme Giriş Sayfası</h3>
                    <asp:Label ID="lbl_mail" CssClass="text-white fw-bolder" runat="server" Text="E-Posta:"></asp:Label>
                    <asp:TextBox ID="txb_mail" CssClass="feedback-input" placeholder="E-Posta adresiniz" TextMode="Email" runat="server"></asp:TextBox>
                    <asp:Label ID="lbl_name" CssClass="text-white fw-bolder"  runat="server" Text="Kullanıcı Adı:"></asp:Label>
                    <asp:TextBox ID="txb_name" CssClass="feedback-input" placeholder="Kullanıcı Adı" runat="server"></asp:TextBox>
                    <asp:Label ID="lbl_pass" CssClass="text-white fw-bolder"  runat="server" Text="Şifre:"></asp:Label>
                    <asp:TextBox ID="txb_pass" CssClass="feedback-input" placeholder="Şifreniz" TextMode="Password" runat="server"></asp:TextBox>
                    <div class=" col-md-12 mt-3">
                        <asp:Button ID="btn_giris" CssClass="btn btn-lg sendbutton col-md-12 " runat="server" Text="Giriş" OnClick="btn_giris_Click"/>
                    </div>
                    <asp:Panel CssClass="alert alert-danger alert-dismissible mt-4 fade show" role="alert" ID="warning_message" runat="server">
                        <h4 class="alert-heading">Hata!</h4>
                        <asp:Label ID="lbl_warning" runat="server" Text="*"></asp:Label>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </asp:Panel>
                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>

    </form>


    <!--SCRIPT-->
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="../js/custom.js"></script>

</body>
</html>
