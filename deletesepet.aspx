<%@ Page Title="" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="deletesepet.aspx.cs" Inherits="website.deletesepet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inside" runat="server">

        <asp:Label ID="lbl_control" runat="server" Text=""></asp:Label>

    <table class="table">
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
                    <td><%# Eval("urun_ad") %></td>

                    <td><%# Eval("urun_fiyat", "{0:c}") %></td>

                </ItemTemplate>
            </asp:Repeater>
        </tr>
    </table>


</asp:Content>
