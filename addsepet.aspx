<%@ Page Title="" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="addsepet.aspx.cs" Inherits="website.addsepet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inside" runat="server">

    <style>
        .sepetdurum {
            font-size: 35px;
            color: white;
        }
    </style>

    <div class="container mt-5">

        <asp:Label ID="lbl_control" runat="server" CssClass="bg-success sepetdurum rounded-3" Text=""></asp:Label>

        <asp:Panel ID="pnl_urun" runat="server">
            <table class="table mt-2">
                <tr>
                    <th>Ürün Resim
                    </th>
                    <th>Ürün İsim
                    </th>
                    <th>Ürün Fiyat
                    </th>
                </tr>

                <tr>
                    <asp:Repeater ID="repeater" runat="server">
                        <ItemTemplate>

                            <td style="width: 300px; height: 300px;">
                                <img src="urun/<%# Eval("urun_resim") %>" class="img-fluid img-rounded" /></td>
                            <td class="fw-bold"><%# Eval("urun_ad") %></td>


                            <td class="fw-bold"><%# Eval("urun_fiyat", "{0:c}") %></td>

                        </ItemTemplate>
                    </asp:Repeater>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
