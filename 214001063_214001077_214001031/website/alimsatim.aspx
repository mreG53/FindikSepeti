<%@ Page Title="Fındık Sepeti - Alım Satım" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="alimsatim.aspx.cs" Inherits="website.alimsatim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inside" runat="server">
    <div>
        <asp:Image ID="imgback" runat="server" ImageUrl="~/images/alimsatimbck.jpeg" Width="100%" Height="100%" CssClass="bgalimsatim" />
    </div>

    <style>
        .baslik {
            font-family: Dosis;
            font-weight: bold;
            font-size: 24px;
            color: orangered;
            user-select: none;
        }

        .fiyat {
            font-family: Dosis;
            font-size: 24px;
            color: aqua;
            user-select: none;
            transition: all 0.2s;
        }

            .fiyat:hover {
                font-weight: bold;
                font-size: 35px;
                color: red;
            }

        .yukardanver {
            margin-top: 100px;
        }


        .hov {
            transition: all 0.7s;
            user-select:none;
        }

            .hov:hover {
                font-size:18px;
            }


        .ayar {
            height: 175px;
            min-height: 175px;
        }
    </style>

    <div>

        <div class="container">

            <div class="card col-md-12 mt-5" style="background-color: rgba(41, 43, 44, 0.9)">
                <div class="row g-0">
                    <div class="col-md-3">
                        <asp:Image ID="img_company1" AlternateText="Kümbetli Tarım Ürünleri Sanayi ve Ticaret A.Ş" CssClass="img-fluid" ImageUrl="~/images/kumbetli.png" runat="server" />
                    </div>
                    <div class="col-md-9">
                        <div class="card-body ">
                            <div>
                                <asp:Label ID="lbl_company_name1" CssClass="card-title baslik" runat="server" Text="company_name_1"></asp:Label>
                            </div>

                            <br />
                            <div class="ayar">
                                <asp:Label ID="lbl_text1" CssClass=" card-text text-white " runat="server" Text="TEXT"></asp:Label>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="lbl_price_company1" CssClass="fiyat" runat="server" Text="00 TL"></asp:Label>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button ID="btn_sell_company1" data-bs-toggle="modal" data-bs-target="#forms" CssClass="btn btn-success float-end text-white" runat="server" Text="ÜRÜNÜ SAT" OnClick="btn_sell_company1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mt-5 col-md-12" style="background-color: rgba(41, 43, 44, 0.9)">
                <div class="row g-0">
                    <div class="col-md-3">
                        <asp:Image ID="img_company2" AlternateText="Fiskobirlik" CssClass="img-fluid" ImageUrl="~/images/fiskobirlik.png" runat="server" />
                    </div>
                    <div class="col-md-9">
                        <div class="card-body">
                            <div>
                                <asp:Label ID="lbl_company_name2" CssClass="card-title baslik" runat="server" Text="company_name_2"></asp:Label>
                            </div>

                            <br />
                            <div class="ayar">
                                <asp:Label ID="lbl_text2" CssClass="card-text text-white " runat="server" Text="TEXT"></asp:Label>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="lbl_price_company2" CssClass="fiyat" runat="server" Text="00 TL"></asp:Label>
                                </div>
                                <div class="col-md-6">

                                    <asp:Button ID="btn_sell_company2" CssClass="btn btn-success float-end text-white" runat="server" Text="ÜRÜNÜ SAT" OnClick="btn_sell_company2_Click" />

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mt-5 mb-5 col-md-12" style="background-color: rgba(41, 43, 44, 0.9)">
                <div class="row g-0">
                    <div class="col-md-3">
                        <asp:Image ID="img_company3" AlternateText="ADA Fındık" CssClass="img-fluid" ImageUrl="~/images/adafindik.png" runat="server" />
                    </div>
                    <div class="col-md-9">
                        <div class="card-body">
                            <div>
                                <asp:Label ID="lbl_company_name3" CssClass="card-title baslik" runat="server" Text="company_name_3"></asp:Label>
                            </div>

                            <br />
                            <div class="ayar">
                                <asp:Label ID="lbl_text3" CssClass="card-text text-white" runat="server" Text="TEXT"></asp:Label>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="lbl_price_company3" CssClass="fiyat" runat="server" Text="00 TL"></asp:Label>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button ID="btn_sell_company3" CssClass="btn btn-success float-end text-white" runat="server" Text="ÜRÜNÜ SAT" OnClick="btn_sell_company3_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
