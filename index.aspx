<%@ Page Title="Fındık Sepeti - Ana Sayfa" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="website.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inside" runat="server">

    <style>
        .byt {
            height: 300px;
        }
    </style>

    <div>
        <asp:Image ID="imgback" runat="server" ImageUrl="~/images/bckfindik2.jpg" Width="100%"  CssClass="bganasayfa" />
    </div>

    <div class="container mt-3">
        <div class="row">
            <div class="col-md-12 mt-2 rounded-5" style="background-color: rgba(41, 43, 44, 0.75);">
                <div class="row" id="eren">
                    <div class="col-md-4">
                        <asp:Image ID="img_alimsatim" runat="server" ImageUrl="~/images/a1.png" CssClass="img-flsuid byt rounded-5 " />
                    </div>
                    <div class="col-md-8 text-center">
                        <h2 style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif" class="text-center text-white mt-5">ALIM - SATIM</h2>
                        <p style="font-family:'Arial','sans-serif'; font-weight:100" class="text-center text-white h6 my-5">
                            Elde ettiğiniz mahsulleri güvenli ve hızlı bir şekilde nakite çevirmek için
                            ve tüccarların hizmetlerine daha detaylı bakmak için aşağıdaki Buton'a tıklayabilirsiniz.
                        </p>
                        <asp:Button ID="btn_alimsatim" runat="server" Text="Alım-Satım İşlemleri" CssClass="btn btn-success mt-1" OnClick="btn_alimsatim_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 mt-3 rounded-5" style="background-color: rgba(41, 43, 44, 0.75);">
                <div class="row">
                    <div class="col-md-8 text-center">
                        <h2 style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif" class="text-center text-white mt-5">MAĞAZAMIZ</h2>
                        <p style="font-family:'Arial','sans-serif'" class="text-center text-white h6 my-5">
                            Kavurulmuş, paketlenmiş vb. ürünleri buradan satın alabilirsiniz.
                        </p>
                        <asp:Button ID="btn_magazamiz" runat="server" Text="Mağazamız Ve Ürünlerimiz" CssClass="btn btn-success my-3" OnClick="btn_magazamiz_Click" />
                    </div>
                    <div class="col-md-4">
                        <asp:Image ID="img_magazamiz" runat="server" ImageUrl="~/images/a3.png" CssClass="img-fluid byt rounded-5 mx-5" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
