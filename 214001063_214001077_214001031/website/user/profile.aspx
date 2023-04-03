<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="website.user.profile1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inside" runat="server">

    <style>
        .kalin {
            font-weight: bold;
            font-size: 24px;
            color: darkgreen;
        }

        .bolder {
            font-weight: bold;
            font-size: 40px;
            color: dimgrey;
        }

        .bolder2 {
            font-weight: bold;
            font-size: 24px;
            font-family: Dosis;
        }
    </style>

    <div class="row mr" style="background-color: white; z-index: 0; display: flex;">
        <div class="col-md-2">
            <div class="sidebar bg-white">
                <asp:LinkButton CssClass="sidenav2 mt-1" ID="btn_bilgilerim" runat="server" OnClick="btn_bilgilerim_Click"><i class="bi bi-file-person-fill"></i> &nbsp;Bilgilerim</asp:LinkButton>
                <asp:LinkButton CssClass="sidenav2 mt-1" ID="btn_process" runat="server" OnClick="btn_process_Click"><i class="bi bi-archive-fill"></i> &nbsp;İşlemdeki Ürünler</asp:LinkButton>
                <asp:LinkButton CssClass="sidenav2 mt-1" ID="btn_satilanurunler" runat="server" OnClick="btn_satilanurunler_Click"><i class="bi bi-cash-stack"></i> &nbsp;Satılan Ürünler</asp:LinkButton>
                <asp:LinkButton CssClass="sidenav2 mt-1" ID="btn_sepet" runat="server" OnClick="btn_sepet_Click">
                    <i class="bi bi-basket2"></i>&nbsp;Sepetim
                    <asp:Label ID="lbl_a3" Font-Bold="true" runat="server" Text="0 TL"></asp:Label>
                </asp:LinkButton>
                <asp:LinkButton CssClass="sidenav2 mt-1" ID="btn_siparislerim" runat="server" OnClick="btn_siparislerim_Click"><i class="bi bi-bag-check"></i> &nbsp;Siparişlerim</asp:LinkButton>
            </div>
        </div>

        <asp:HiddenField ID="hid_field_for_query_sql" runat="server" Value="" />
        <asp:HiddenField ID="hid_field_id" runat="server" Value="" />

        <asp:Panel ID="pnl_right_side" runat="server" CssClass="col-md-10">
            <!--BİLGİLERİM-->
            <div style="background-color: white; z-index: 0;">

                <asp:Panel ID="pnl_bilgilerim" runat="server" CssClass="container row mt-5">
                    <!--uyelik bilgileri -->
                    <div class="col-md-6">
                        <h1 class="text-dark fw-bold h3">Üyelik Bilgilerim</h1>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_ad" runat="server" Text="Ad" CssClass="h6"></asp:Label>
                                <asp:TextBox ID="txb_ad" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <asp:Label ID="lbl_soyad" runat="server" Text="Soyad" CssClass="h6"></asp:Label>
                                <asp:TextBox ID="txb_soyad" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row my-4">
                            <div class="col-md-6">
                                <asp:Label ID="lbl_eposta" runat="server" Text="E-posta" CssClass="h6"></asp:Label>
                                <asp:TextBox ID="txb_eposta" runat="server" TextMode="Email" Text="" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row my-4">
                            <div class="col-md-6">
                                <asp:Label ID="lbl_tel" runat="server" Text="Telefon" CssClass="h6"></asp:Label>
                                <asp:TextBox ID="txb_tel" runat="server" CssClass="form-control" TextMode="Phone" onkeypress="return functionx(event)" MaxLength="11" Text=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="row my-3">
                            <div>
                                <asp:Label ID="lbl_dogumtarihi" runat="server" Text="Doğum Tarihi" CssClass="h6"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txb_btday" runat="server" TextMode="DateTime" placeholder="Gün" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row my-4">
                            <div class="col-md-6">
                                <asp:TextBox ID="txb_adress" CssClass="form-control" placeholder="Adres" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row my-4">
                            <div class="col-md-6 d-grid gap-2">
                                <asp:Button ID="btn_guncelle_sol" runat="server" Text="Güncelle" CssClass="btn btn-success" OnClick="btn_guncelle_sol_Click" />
                            </div>
                        </div>
                    </div>
                    <!--uyelik bilgileri end-->

                    <div class="col-md-4">
                        <h1 class="text-dark fw-bold h3">Şifre Yenile</h1>
                        <div class="row my-3">
                            <div class="col-md-12">
                                <asp:Label ID="lbl_currentpass" runat="server" Text="Şu Anki Şifre" CssClass="h6"></asp:Label>
                                <asp:TextBox ID="txb_currentpass" type="password" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row my-4">
                            <div class="col-md-12">
                                <asp:Label ID="lbl_newpassword" runat="server" Text="Yeni Şifre" CssClass="h6"></asp:Label>
                                <asp:TextBox ID="txb_newpassword" type="password" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row my-4">
                            <div class="col-md-12">
                                <asp:Label ID="lbl_newpassword_again" runat="server" Text="Yeni Şifre(Tekrar)" CssClass="h6"></asp:Label>
                                <asp:TextBox ID="txb_newpassword_again" type="password" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row my-4">
                            <div class="col-md-12 d-grid gap-2">
                                <asp:Button ID="btn_guncelle_sag" runat="server" Text="Güncelle" OnClick="btn_guncelle_sag_Click" CssClass="btn btn-success" />
                            </div>
                        </div>
                    </div>

                    <asp:Label ID="lbl_durum" runat="server" CssClass="text-dark fw-bold" Text="Label"></asp:Label>

                </asp:Panel>
                <!--BİLGİLERİM END-->

                <!--İŞLEMDEKİ ÜRÜNLER-->
                <asp:Panel ID="pnl_process" runat="server" CssClass="mt-3">
                    <h3>İŞLEMDEKİ ÜRÜNLER</h3>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="t_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="satici_adi" ItemStyle-CssClass="px-2" HeaderText="Adınız" SortExpression="satici_adi">
                                <HeaderStyle CssClass="px-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="satici_soyadi" ItemStyle-CssClass="px-2" HeaderText="Soyadınız" SortExpression="satici_soyadi">
                                <HeaderStyle CssClass="px-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="alici_adi" ItemStyle-CssClass="px-2 fw-bold" HeaderText="Alıcı Şirket" SortExpression="alici_adi">
                                <HeaderStyle CssClass="px-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="satici_eposta" ItemStyle-CssClass="px-2" HeaderText="E-Postanız" SortExpression="satici_eposta">
                                <HeaderStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField DataField="satici_numara" ItemStyle-CssClass="px-2 text-primary fw-bold" HeaderText="Numaranız" SortExpression="satici_numara">
                                <HeaderStyle CssClass="px-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="satici_kilo" ItemStyle-CssClass="px-4 fw-bold bg-gradient bg-primary text-white text-center" HeaderText="Satılacak Kilo" SortExpression="satici_kilo">
                                <HeaderStyle CssClass="px-4" />
                            </asp:BoundField>
                            <asp:BoundField DataField="t_id" ItemStyle-CssClass="px-3 fw-bold text-primary text-center" HeaderText="Ticaret ID" InsertVisible="False" ReadOnly="True" SortExpression="t_id">
                                <HeaderStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField DataField="satici_adres" ItemStyle-CssClass="px-4 fw-bold text-dark text-center" HeaderText="Adresiniz" SortExpression="satici_adres">
                                <HeaderStyle CssClass="px-2" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [t_id], [satici_adi], [satici_soyadi], [alici_adi], [satici_eposta], [satici_numara], [satici_kilo], [satici_adres], [as_ticaret] FROM [process] WHERE (([satici_adi] = ?) AND ([as_ticaret] = ?)) ORDER BY [t_id]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hid_field_for_query_sql" Name="satici_adi" PropertyName="Value" Type="String" />
                            <asp:Parameter DefaultValue="false" Name="as_ticaret" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:Panel ID="pnl_checkrows_islemdeki_urunler" runat="server">
                        <div class="bg-light ms-1 px-5 py-5 my-5 rounded-5 shadow col-md-3">
                            <p class="text-black fw-bold">İşlemleriniz devam ediyor...</p>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="panel_checkrows_norows" runat="server">
                        <div class="bg-light container-sm px-5 py-5 my-5 rounded-5 shadow">
                            <p class="text-black fw-bold">İŞLEMDE HERHANGİ BİR ÜRÜNÜNÜZ BULUNMUYOR.</p>
                        </div>
                    </asp:Panel>

                </asp:Panel>
                <!--İŞLEMDEKİ ÜRÜNLER END-->

                <!--SATIŞLARIM-->
                <asp:Panel ID="pnl_satislarim" runat="server" CssClass="mt-3">
                    <h3>SATIŞLARIM</h3>
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="t_id" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="t_id" ItemStyle-CssClass="px-3 fw-bold text-center" HeaderText="Ticaret ID" InsertVisible="False" ReadOnly="True" SortExpression="t_id">
                                <HeaderStyle CssClass="px-1 bg-primary bg-gradient fw-bold text-white" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="px-4" DataField="satici_adi" HeaderText="Adınız" SortExpression="satici_adi">
                                <HeaderStyle CssClass="px-4" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="px-3" DataField="satici_soyadi" HeaderText="Soyadınız" SortExpression="satici_soyadi">
                                <HeaderStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="px-3 fw-bold" DataField="alici_adi" HeaderText="Şirket" SortExpression="alici_adi">
                                <HeaderStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="px-3" DataField="satici_eposta" HeaderText="E-Postanız" SortExpression="satici_eposta">
                                <HeaderStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="px-3" DataField="satici_numara" HeaderText="Numaranız" SortExpression="satici_numara">
                                <HeaderStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="px-3 fw-bold bg-gradient bg-primary text-white text-center" DataField="satici_kilo" HeaderText="Satılan Kilo" SortExpression="satici_kilo">
                                <HeaderStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="px-2 fw-bold" DataField="satici_adres" HeaderText="Adresiniz" SortExpression="satici_adres">
                                <HeaderStyle CssClass="px-2" />
                            </asp:BoundField>
                            <asp:CheckBoxField HeaderStyle-CssClass="px-3" ItemStyle-CssClass="px-3" DataField="as_ticaret" HeaderText="Durum" SortExpression="as_ticaret" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [t_id], [satici_adi], [satici_soyadi], [alici_adi], [satici_eposta], [satici_numara], [satici_kilo], [satici_adres], [as_ticaret] FROM [process] WHERE (([satici_adi] = ?) AND ([as_ticaret] = ?)) ORDER BY [t_id]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hid_field_for_query_sql" Name="satici_adi" PropertyName="Value" Type="String" />
                            <asp:Parameter DefaultValue="true" Name="as_ticaret" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                    <asp:Panel ID="panel_checkrows_norows_selled" runat="server">
                        <div class="bg-light container-sm px-5 py-5 my-5 rounded-5 shadow">
                            <p class="text-black fw-bold">SATILMIŞ HERHANGİ BİR ÜRÜNÜNÜZ BULUNMUYOR.</p>
                        </div>
                    </asp:Panel>

                </asp:Panel>

                <!--SATIŞLARIM END-->
                <style>
                    .sepetdurum{
                        font-size:35px;
                        color:white;
                    }
                </style>

                <!--SEPETİM-->
                <asp:Panel ID="pnl_sepetim" runat="server">
                    <asp:Label ID="lbl_sip_durum" runat="server" CssClass="bg-success fw-bold sepetdurum" Text="durum"></asp:Label>
                    <asp:Panel ID="pnl_sepet_urunler" runat="server">
                        <hr />
                        <table class="table table-bordered table-hover table-striped col-md-12">
                            <tr class="bg-info text-white">

                                <th>Ürün Resim
                                </th>
                                <th>Ürün Ad
                                </th>
                                <th>Ürün Fiyat
                                </th>
                                <th>Ürün Adet
                                </th>
                                <th>Ürün Üretici
                                </th>
                                <th>Ürün Paket
                                </th>
                                <th>Ürün Kategori
                                </th>
                                <th>
                                    <asp:Label ID="lbl_a2" CssClass="text-white bolder2" runat="server" Text="fiyat"></asp:Label></th>
                                <th></th>
                                <th></th>
                            </tr>

                            <asp:Repeater ID="repeater" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td style="width: 100px; height: 100px;">
                                            <a href="../urunbilgi.aspx?urun=<%# Eval("urun_id") %>">
                                                <img src="../urun/<%# Eval("urun_resim") %>" class="img-fluid img-rounded" />
                                            </a></td>

                                        <td><%# Eval("urun_ad") %></td>

                                        <td><%# Eval("urun_fiyat","{0:c}") %></td>

                                        <td><%# Eval("urun_adet") %></td>

                                        <td><%# Eval("urun_uretici") %></td>

                                        <td><%# Eval("urun_paket") %></td>

                                        <td><%# Eval("urun_kategori") %></td>

                                        <td><a style="margin-top: 10px;" href="../add_sepet_for_profile_page.aspx?urun=<%# Eval("urun_id") %>" class="btn btn-success"><i class="bi bi-cart-plus"></i>&nbsp;Adet Arttır</a></td>
                                        <td><a style="margin-top: 10px;" href="../deletesepet.aspx?urunsil=<%# Eval("urun_id") %>" class="btn btn-dark"><i class="bi bi-cart-dash"></i>&nbsp;Adet Azalt</a></td>
                                        <td><a style="margin-top: 10px;" href="../sepettenkaldir.aspx?urunkaldir=<%# Eval("urun_id") %>" class="btn btn-danger"><i class="bi bi-trash"></i>&nbsp;Sepetten Kaldır</a></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>

                    </asp:Panel>

                    <asp:Panel ID="pnl_check_rows_sepet" runat="server">
                        <div class="bg-light container-sm px-5 py-5 my-5 rounded-5 shadow">
                            <p class="text-black fw-bold">SEPETİNİZDE ÜRÜN YOK.</p>
                        </div>
                    </asp:Panel>

                    <br />

                    <asp:Panel ID="pnl_satinal_screen" runat="server">
                        <asp:Label ID="lbl_a" CssClass="bolder" runat="server" Text="fiyat"></asp:Label><br />

                        <asp:Button ID="btn_satinal" runat="server" Text="Satın Al" CssClass="btn btn-success mt-2 mb-5" OnClick="btn_satinal_Click" />

                        <asp:Panel ID="pnl_card" runat="server">
                            <div class="container mt-5 mb-5">
                                <div style="display: inline-block" class="form-control">
                                    <asp:Button ID="btn_x" runat="server" Text="X" CssClass="btn btn-dark float-end" OnClick="btn_x_Click" />
                                    <div class="row mt-2">
                                        <div style="padding: 0;" class="col-md-4">
                                            <asp:TextBox ID="txb_card" runat="server" CssClass="form-control form-control-lg" onkeypress="return functionx(event)" MaxLength="16" placeholder="Kart No"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-1">
                                            <asp:DropDownList CssClass="form-control" ID="dd_list" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:DropDownList CssClass="form-control" ID="dd_list_second" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:TextBox ID="txb_cvv" runat="server" CssClass="form-control form-control" onkeypress="return functionx(event)" MaxLength="3" placeholder="CVV"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row mt-2">
                                        <div class="col-md-3">
                                            <asp:Button ID="btn_siparisver" runat="server" Text="Sipariş Ver" CssClass="btn btn-success w-100" MaintainScrollPositionOnPostback="true" OnClick="btn_siparisver_Click" />
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </asp:Panel>

                    </asp:Panel>

                </asp:Panel>
                <!--SEPETİM END-->

                <!--SİPARİŞLERİM-->
                <asp:Panel ID="pnl_siparislerim" runat="server">
                    <asp:Panel ID="pnl_sip_urunler" runat="server">
                        <hr />
                        <table class="table table-bordered table-hover table-striped col-md-12 ">
                            <tr class="bg-danger">

                                <th class="text-white">Ürün Resim
                                </th>
                                <th class="text-white">Ürün Ad
                                </th>
                                <th class="text-white">Ürün Fiyat
                                </th>
                                <th class="text-white">Ürün Adet
                                </th>
                                <th class="text-white">Ürün Üretici
                                </th>
                                <th class="text-white">Ürün Paket
                                </th>
                                <th class="text-white">Sipariş Tarihi
                                </th>

                                <th class="text-white">Durum</th>
                            </tr>

                            <asp:Repeater ID="repeater2" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td style="width: 100px; height: 100px;">
                                            <a href="../urunbilgi.aspx?urun=<%# Eval("urun_id") %>">
                                                <img src="../urun/<%# Eval("urun_resim") %>" class="img-fluid img-rounded" />
                                            </a></td>


                                        <td><%# Eval("urun_ad") %></td>

                                        <td><%# Eval("urun_fiyat","{0:c}") %></td>

                                        <td><%# Eval("urun_adet") %></td>

                                        <td><%# Eval("urun_uretici") %></td>

                                        <td><%# Eval("urun_paket") %></td>

                                        <td class="fw-bold text-success"><%# Eval("date") %></td>

                                        <td class="fw-bold"><%# Eval("siparis_durum") %></td>

                                    </tr>

                                </ItemTemplate>

                            </asp:Repeater>
                        </table>


                    </asp:Panel>

                    <asp:Panel ID="pnl_check_rows_siparis" runat="server">
                        <div class="bg-light container-sm px-5 py-5 my-5 rounded-5 shadow">
                            <p class="text-black fw-bold">HERHANGİ BİR ÜRÜN SİPARİŞ ETMEDİNİZ.</p>
                        </div>
                    </asp:Panel>
                </asp:Panel>

                <!--SİPARİŞLERİM END-->

            </div>
        </asp:Panel>

    </div>
    <script src="../js/custom.js"></script>

</asp:Content>
