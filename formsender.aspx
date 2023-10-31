<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formsender.aspx.cs" Inherits="website.formsender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fındık Sepeti - Fındık Sat</title>

    <!-- CSS only -->
    <link rel="shortcut icon" href="../images/logo_test.png" type="image/x-icon"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-icons/7.16.0/simpleicons.svg" />
    <link href="css/custom.css" rel="stylesheet" type="text/css" />

</head>
<body class="bg-white text-dark">
    <form id="formsender" runat="server">
        <div class="container col-md-12 mt-5">
            <div class="row">
                <div class="col-md-6">
                    <asp:Image ID="img_banner" runat="server" ImageUrl="~/images/kumbetli.png" />
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label ID="lbl_ad" runat="server" CssClass="fw-bolder" Text="Ad"></asp:Label>
                            <asp:TextBox ID="txb_ad" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lbl_soyad" runat="server" CssClass="fw-bolder" Text="Soyad"></asp:Label>
                            <asp:TextBox ID="txb_soyad" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                    </div>

                    <%-- <div class="row mt-3">--%>
                    <div class="col-md-12">
                        <asp:Label ID="lbl_eposta" runat="server" CssClass="fw-bolder" Text="E-posta"></asp:Label>
                        <asp:TextBox ID="txb_eposta" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                    </div>
                    <%-- </div>--%>

                    <div class="row mt-3">
                        <div class="col-md-10">
                            <asp:Label ID="lbl_numara" runat="server" CssClass="fw-bolder" Text="Numara"></asp:Label>
                            <asp:TextBox ID="txb_numara" runat="server" onkeypress="return functionx(event)" MaxLength="11" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:Panel ID="kilo" runat="server" class="col-md-2">
                            <asp:Label ID="lbl_kilo" runat="server" CssClass="fw-bolder" Text="Kilo"></asp:Label>
                            <asp:TextBox ID="txb_kilo" runat="server" TextMode="Number" Text="1" CssClass="form-control"></asp:TextBox>
                        </asp:Panel>
                    </div>

                    <div class="row mt-3">
                        <asp:Label ID="lbl_adres" runat="server" CssClass="fw-bolder" Text="Adres (Maksimum 255 Karakter)"></asp:Label>
                        <asp:TextBox ID="txb_adres" runat="server" TextMode="MultiLine" Height="140" MaxLength="255" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="row mt-3">
                        <asp:Button ID="btn_sender" OnClick="btn_sender_Click" runat="server" Text="Gönder" CssClass="btn btn-success" />
                        <asp:Label ID="lbl_hata" runat="server" Visible="false" CssClass="mt-2 fw-bold text-bg-danger" Text="hata"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg-light container-sm px-5 py-5 my-5 text-white rounded-5 shadow">
            <p class="text-black fw-bold">Satacağınız ürünün bilgilerini ve kendi ulaşım bilgilerinizi verirken size ulaşım sağlanması için yanlış bilgi vermemeye önem gösteriniz.</p>
            <br />
            <p style="color:blue;" class="fw-bold">NOT: Eğer giriş yaptıysanız kayıt bilgileriniz zaten alınacaktır tekrar yazmanıza gerek yoktur..</p>
        </div>


        <asp:HiddenField ID="hidden_router" runat="server" Value="" />

    </form>

    <!--SCRIPT-->
    <script src="js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/custom.js"></script>

</body>
</html>
