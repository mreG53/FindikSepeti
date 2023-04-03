<%@ Page Title="" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="magaza.aspx.cs" Inherits="website.magaza" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inside" runat="server">

    <style>

        .yazi {
            font-family: 'Source Sans Pro';
            font-weight: bold;
            font-size: 35px;
            user-select: none;
            color: #4cff00;
            text-align: center;
            text-shadow: 2px 0 #000000, -2px 0 #000000, 0 2px #000000, 0 -2px #000000, 1px 1px #000000, -1px -1px #000000, 1px -1px #000000, -1px 1px #000000;
        }
    </style>
        <div class="container shadow mt-2 mb-5 rounded-4">
            <div class="row">
                <h3 class="text-center yazi">MAĞAZAMIZ</h3>
                <asp:Repeater ID="repeater" runat="server">
                    <ItemTemplate>
                        <div class="col-md-3 mt-4 mb-2 shadow mx-5 rounded-5" style="border: 1px solid #ccc">
                            <div style="margin: 12px 8px;">
                                <a href="urunbilgi.aspx?urun=<%# Eval("urun_id") %>">
                                    <img style=" height:360px; width:300px;" src="urun/<%# Eval("urun_resim") %>" class="img-fluid img-rounded rounded-5" />
                                </a>

                                <div style="height: 48px;">
                                    <h4 class="text-center"><%# Eval("urun_ad") %></h4>
                                </div>
                                <h3 style="color: red;" class="text-center"><%# Eval("urun_fiyat","{0:c}").ToString() %></h3>
                                <div class="text-center">
                                    <a href="addsepet.aspx?urun=<%# Eval("urun_id") %>" class="btn btn-success"><i class="bi bi-cart-plus"></i>&nbsp;Sepete Ekle</a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
</asp:Content>
