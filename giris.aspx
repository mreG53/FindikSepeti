<%@ Page Title="Fındık Sepeti - Giriş" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="giris.aspx.cs" Inherits="website.kayit_giris" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inside" runat="server">

    <div>
        <asp:Image ID="imgback" runat="server" ImageUrl="~/images/bckfindik1.jpg" Width="100%" CssClass="bggiris" />
    </div>

    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6">
            <div id="form-div">
                <!-- GİRİŞ PANEL -->
                <asp:Panel ID="div_giris" runat="server">
                    <asp:Label ID="lbl_mail" runat="server" CssClass="fw-bold text-white" Text="E-Posta:"></asp:Label>
                    <asp:TextBox ID="txb_mail" CssClass="feedback-input" placeholder="E-Posta adresiniz" TextMode="Email" runat="server"></asp:TextBox>
                    <asp:Label ID="lbl_pass" runat="server" CssClass="fw-bold text-white" Text="Şifre:"></asp:Label>
                    <asp:TextBox ID="txb_pass" CssClass="feedback-input" placeholder="Şifreniz" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:LinkButton CssClass="nav-link link-info mb-2" ID="kayit_panel_toggle" runat="server" OnClick="kayit_panel_toggle_Click">Hesabınız yok mu? Buradan kayıt olun.</asp:LinkButton>
                    <asp:LinkButton CssClass="nav-link link-light mb-2" ID="company_panel_toggle" runat="server" OnClick="company_panel_toggle_Click">İşletme misiniz? Buradan giriş yapın.</asp:LinkButton>
                    <asp:LinkButton CssClass="nav-link link-danger mb-2" ID="link_to_admin" runat="server" OnClick="link_to_admin_Click">ADMIN</asp:LinkButton>
                    <div class=" col-md-12 mt-3">
                        <asp:Button ID="btn_giris" CssClass="btn btn-lg sendbutton col-md-12 " runat="server" Text="Giriş" OnClick="btn_giris_Click" />
                    </div>
                    <asp:Panel CssClass="alert alert-danger alert-dismissible mt-4 fade show" role="alert" ID="warning_message" runat="server">
                        <asp:Label ID="lbl_alert_header_giris" CssClass="alert-heading errheader" runat="server" Text="Hata!"></asp:Label>
                        <asp:Label ID="lbl_warning" runat="server" Text="*"></asp:Label>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </asp:Panel>
                </asp:Panel>
                <!-- GİRİŞ PANEL END -->

                <!-- KAYIT PANEL -->
                <asp:Panel ID="div_kayit" runat="server">

                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label ID="lbl_ad_kayit" runat="server" CssClass="fw-bold text-white" Text="Ad:"></asp:Label>
                            <asp:TextBox ID="txb_ad" CssClass="feedback-input" placeholder="Ad" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lbl_soyad_kayit" runat="server" CssClass="fw-bold text-white" Text="Soyad:"></asp:Label>
                            <asp:TextBox ID="txb_soyad" CssClass="feedback-input" placeholder="Soyad" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <asp:Label ID="lbl_mail_kayit" runat="server" CssClass="fw-bold text-white" Text="E-Posta:"></asp:Label>
                    <asp:TextBox ID="txb_mail_kayit" CssClass="feedback-input" placeholder="Mail" TextMode="Email" runat="server"></asp:TextBox>

                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label ID="lbl_sifre_kayit" runat="server" CssClass="fw-bold text-white" Text="Şifre:"></asp:Label>
                            <asp:TextBox ID="txb_sifre_kayit" CssClass="feedback-input" placeholder="Şifre" TextMode="Password" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lbl_sifre_tekrar_kayit" runat="server" CssClass="fw-bold text-white" Text="Şifre Tekrar:"></asp:Label>
                            <asp:TextBox ID="txb_sifreonay" CssClass="feedback-input" placeholder="Şifre" TextMode="Password" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Label ID="lbl_tel" runat="server" CssClass="fw-bold text-white" Text="Telefon:"></asp:Label>
                    <asp:TextBox ID="txb_tel" CssClass="feedback-input" placeholder="Telefon" TextMode="Phone" onkeypress="return functionx(event)" MaxLength="11" runat="server"></asp:TextBox>
                    <asp:Label ID="lbl_adress" runat="server" CssClass="fw-bold text-white" Text="Adres:"></asp:Label>
                    <asp:TextBox ID="txb_adress" CssClass="feedback-input" placeholder="Adres" TextMode="MultiLine" runat="server"></asp:TextBox>

                    <div class="col-md-12">
                        <asp:LinkButton CssClass="nav-link link-info mb-2" ID="giris_panel_toggle" runat="server" OnClick="giris_panel_toggle_Click">Hesabınız var mı? Giriş yapın?</asp:LinkButton>
                        <asp:Button ID="btn_kaydet" CssClass="btn btn-lg col-md-12 sendbutton" runat="server" Text="Kayıt Ol" OnClick="btn_kaydet_Click" />
                    </div>

                    <hr />

                    <asp:Panel CssClass="alert alert-danger alert-dismissible mt-4 fade show" role="alert" ID="warning_message_kayit" runat="server">
                        <asp:Label ID="lbl_alert_header" CssClass="alert-heading errheader" runat="server" Text="Hata!"></asp:Label>
                        <br />
                        <asp:Label ID="lbl_warning_kayit" runat="server" Text="*"></asp:Label>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </asp:Panel>
                </asp:Panel>
                <!-- KAYIT PANEL END -->

            </div>
        </div>

        <div class="col-md-3">
        </div>
    </div>

</asp:Content>
