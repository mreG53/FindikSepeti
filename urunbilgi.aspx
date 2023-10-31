<%@ Page Title="" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="urunbilgi.aspx.cs" Inherits="website.urunbilgi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inside" runat="server">

    <style>
        .yazidurum {
            font-family: 'Source Sans Pro';
            font-weight: bold;
            font-size: 35px;
            user-select: none;
            color: #4cff00;
            text-align: center;
            text-shadow: 2px 0 #000000, -2px 0 #000000, 0 2px #000000, 0 -2px #000000, 1px 1px #000000, -1px -1px #000000, 1px -1px #000000, -1px 1px #000000;
        }
    </style>



    <div class="container mt-5">
        <h3 style="text-align: center" class="yazidurum">ÜRÜN BİLGİSİ</h3>
        <asp:Repeater ID="repeater" runat="server">
            <ItemTemplate>

                <div class="col-md-12 shadow">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="urun/<%# Eval("urun_resim") %>" class="img-fluid img-rounded" />
                        </div>
                        <div class="col-md-8">
                            <h1><%# Eval("urun_ad") %></h1>
                            <hr />
                            <p class="mt-4">
                                <b>Üretici Firma :</b>
                                <span><%# Eval("urun_uretici") %></span>
                                <br />
                                <b>Paketlenme Biçimi :</b>
                                <span><%# Eval("urun_paket") %></span>
                                <br />
                                <b>Stok:</b>
                                <span><%# Eval("urun_stok").ToString() %></span>
                                <br />
                                <b>Kategoriler :</b>
                                <span><%# Eval("urun_kategori") %></span>
                                <br />
                                <b>Açıklama :</b>
                                <span><%# Eval("urun_aciklama") %></span>
                                <br />
                            </p>
                            <p class="mt-5">
                                <h5><del class="mt-5"><%# Eval("urun_oncekifiyat","{0:c}") %>&#8378;</del><b class="mx-3"><span class="mt-5"><%# Eval("urun_fiyat","{0:c}").ToString() %></span></b></h5>
                            </p>
                            <div class="float-end me-5">
                                <a href="addsepet.aspx?urun=<%# Eval("urun_id") %>" class="btn btn-success"><i class="bi bi-cart-plus"></i>&nbsp;Sepete Ekle</a>
                            </div>
                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
