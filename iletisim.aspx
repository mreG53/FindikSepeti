<%@ Page Title="" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="iletisim.aspx.cs" Inherits="website.iletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inside" runat="server">

    <style>
        .renq {
            background-color: rgba(41, 43, 44, 0.9);
        }

        .yazi {
            font-family: 'Source Sans Pro';
            font-weight: bold;
            font-size: 24px;
            user-select: none;
            color: crimson;
            text-align: center;
            text-shadow: 2px 0 #fff, -2px 0 #fff, 0 2px #fff, 0 -2px #fff, 1px 1px #fff, -1px -1px #fff, 1px -1px #fff, -1px 1px #fff;
        }

        .yazidurum {
            font-family: 'Source Sans Pro';
            font-weight: bold;
            font-size: 25px;
            user-select: none;
            text-align: center;
            text-shadow: 2px 0 #000000, -2px 0 #000000, 0 2px #000000, 0 -2px #000000, 1px 1px #000000, -1px -1px #000000, 1px -1px #000000, -1px 1px #000000;
        }


        .yazifooter {
            font-family: 'Source Sans Pro';
            font-weight: bold;
            font-size: 24px;
            user-select: none;
            color: crimson;
            text-align: center;
            text-shadow: 2px 0 #fff, -2px 0 #fff, 0 2px #fff, 0 -2px #fff, 1px 1px #fff, -1px -1px #fff, 1px -1px #fff, -1px 1px #fff;
        }

        .yazitxb {
            font-family: Dosis;
            font-weight: bold;
            font-size: 24px;
            color: black;
            user-select: none;
        }
    </style>

<%--    <div>
        <asp:Image ID="imgback" runat="server" ImageUrl="~/images/bckfindik4.jpg" Width="100%" CssClass="bgiletisim" />
    </div>--%>

    <div class="container">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-8 container mt-5">
                    <asp:Label ID="lbl_ad_soyad" runat="server" Text="Ad Soyad:" CssClass="h5 yazi text-center"></asp:Label>
                    <asp:TextBox ID="txt_form_ad_soyad" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="lbl_ad_soyad_hata" runat="server" CssClass="text-danger fw-bold yazidurum" Text="Lütfen Bu Alanı Boş Bırakmayınız !" Visible="false"></asp:Label>
                </div>
                <div class="col-md-8 container mt-5">
                    <asp:Label ID="lbl_eposta" runat="server" Text="E-posta:" CssClass="h5 yazi"></asp:Label>
                    <asp:TextBox ID="txt_form_eposta" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="lbl_esposta_hata" runat="server" CssClass="text-danger fw-bold yazidurum" Text="Lütfen Bu Alanı Boş Bırakmayınız !" Visible="false"></asp:Label>

                </div>
                <div class="col-md-8 container mt-5">
                    <asp:Label ID="lbl_msjkonu" runat="server" Text="Mesajınızın Konusu:" CssClass="h5 yazi"></asp:Label>
                    <asp:TextBox ID="txt_form_msjkonu" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="lbl_msjkonu_hata" runat="server" CssClass="text-danger fw-bold yazidurum" Text="Lütfen Bu Alanı Boş Bırakmayınız !" Visible="false"></asp:Label>
                </div>
                <div class="col-md-8 container mt-5">
                    <asp:TextBox ID="txb_msg" Columns="100" Rows="10" placeholder="Mesajınızı Yazınız" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="lbl_msg_hata" runat="server" CssClass="text-danger fw-bold yazidurum" Text="Lütfen Bu Alanı Boş Bırakmayınız !" Visible="false"></asp:Label>
                </div>
                <div class="col-md-8 container mt-2">
                    <asp:Button ID="btn_temizle" runat="server" Text="Temizle" CssClass="btn btn-danger" OnClick="btn_temizle_Click" />
                    <asp:Button ID="btn_gönder" runat="server" Text="Gönder" CssClass="btn btn-success" OnClick="btn_gönder_Click" />
                </div>
                <div class="col-md-8 container mt-5">
                    <h1 class="text-center yazifooter mt-2">Bize Ulaşmak İsterseniz Konumumuz</h1>
                    <iframe class="rounded-5" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1507.504625018515!2d38.390188462813995!3d40.91554306493686!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40636c4e50eb785d%3A0x6e1812ce59e50222!2sTeknik%20Bilimler%20Meslek%20Y%C3%BCksekokulu%20Ek%20Bina!5e0!3m2!1str!2str!4v1669222139988!5m2!1str!2str" width="875" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="hid_field_name" Value="" runat="server" />
    <asp:HiddenField ID="hid_field_mail" Value="" runat="server" />



</asp:Content>
