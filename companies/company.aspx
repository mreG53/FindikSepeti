<%@ Page Title="İşletme Ana Sayfası" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="company.aspx.cs" Inherits="website.companies.company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="inside" runat="server">

    <style>
        .kalin {
            font-weight: bold;
            font-size: 32px;
            color: blue;
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        }
    </style>



    <asp:Label Visible="false" ID="hid_field_query_for_sql" runat="server" Text=""></asp:Label>

    <div class="row mr" style="background-color: white; z-index: 0; display: flex;">
        <div class="col-md-2">
            <div class="sidebar bg-dark">

                <asp:LinkButton CssClass="sidenav" ID="btn_companyinfo" runat="server" OnClick="btn_companyinfo_Click"><i class="bi bi-building"></i> &nbsp;Şirket Bilgileri</asp:LinkButton>
                <asp:LinkButton CssClass="sidenav" ID="btn_progress" runat="server" OnClick="btn_progress_Click"><i class="bi bi-archive-fill"></i> &nbsp;İşlemdeki Ürünler</asp:LinkButton>
                <asp:LinkButton CssClass="sidenav" ID="btn_alinanurunler" runat="server" OnClick="btn_alinanurunler_Click"><i class="bi bi-calendar-check-fill"></i> &nbsp;Alınan Ürünler</asp:LinkButton>

            </div>
        </div>
        <asp:Panel ID="pnl_right_side" runat="server" CssClass="col-md-10">
            <!--COMPANY INFO-->
            <div style="background-color: white; z-index: 0;">



                <asp:Panel ID="pnl_companyinfo" runat="server" CssClass="container mt-5">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="container col-md-12">
                                <asp:Label ID="lbl_header" CssClass="kalin" runat="server" Text="Şirket Bilgileri"></asp:Label>

                                <div class="col-md-12 mt-3">
                                    <asp:Label ID="lbl_companyname" CssClass="fw-bold" runat="server" Text="Şirket İsmi:"></asp:Label>
                                    <asp:TextBox ID="txb_companyname" runat="server" CssClass="form-control form-control-lg fw-bold" MaxLength="50" placeholder="Şirket İsmi"></asp:TextBox>
                                </div>

                                <div class="col-md-12 mt-3">
                                    <asp:Label ID="lbl_metin" CssClass="fw-bold" runat="server" Text="Bilgi Kutusu"></asp:Label>
                                    <asp:TextBox ID="txb_metin" runat="server" CssClass="form-control" Height="170" TextMode="MultiLine" placeholder="Bilgi Kutusu"></asp:TextBox>
                                </div>

                                <div class="col-md-2 mt-3">
                                    <asp:Label ID="lbl_priceinfo" CssClass="fw-bold" runat="server" Text="Fiyat Bilgisi (&#8378;)"></asp:Label>
                                    <asp:TextBox ID="txb_priceinfo" runat="server" CssClass="form-control fw-bold" onkeypress="return functionx(event)" MaxLength="4" placeholder="Fiyat Bilgisi"></asp:TextBox>
                                </div>

                                <asp:Button ID="btn_save" CssClass="mt-1 btn btn-primary w-100" runat="server" Text="Kaydet" OnClick="btn_save_Click" />
                            </div>
                        </div>

                        <div class="col-md-5 mx-5">

                            <asp:Image ID="img_company" CssClass="img-fluid" Width="500" Height="500" runat="server" />


                        </div>
                    </div>
                </asp:Panel>
                <!--COMPANY INFO END-->

                <!--PROGRESS-->
                <asp:Panel ID="pnl_progress" CssClass="mt-2" runat="server">

                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="t_id" AllowPaging="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True">
                        <Columns>
                            <asp:CommandField ControlStyle-CssClass="px-3 mt-1 btn btn-sm btn-success text-white" ShowSelectButton="True" />
                            <asp:BoundField ItemStyle-CssClass="px-2 fw-bold text-center" HeaderStyle-CssClass="px-2 bg-primary fw-bold text-white" DataField="t_id" HeaderText="Ticaret ID" SortExpression="t_id" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField ItemStyle-CssClass="px-2 fw-bold" HeaderStyle-CssClass="px-2" DataField="satici_adi" HeaderText="Satıcı Adı" SortExpression="satici_adi" />
                            <asp:BoundField ItemStyle-CssClass="px-2 fw-bold" HeaderStyle-CssClass="px-2" DataField="satici_soyadi" HeaderText="Satıcı Soyadı" SortExpression="satici_soyadi" />
                            <asp:BoundField HeaderStyle-CssClass="px-3" ItemStyle-CssClass="px-3" DataField="alici_adi" HeaderText="Şirket" SortExpression="alici_adi" />
                            <asp:BoundField ItemStyle-CssClass="fw-bold" HeaderStyle-CssClass="px-3" DataField="satici_eposta" HeaderText="Satıcı E-Posta" SortExpression="satici_eposta" />
                            <asp:BoundField HeaderStyle-CssClass="px-2" ItemStyle-CssClass="px-3" DataField="satici_numara" HeaderText="Satıcı Numara" SortExpression="satici_numara" />
                            <asp:BoundField ItemStyle-CssClass="fw-bold bg-gradient bg-primary text-white text-center" HeaderStyle-CssClass="px-2" DataField="satici_kilo" HeaderText="Satıcı Kilo" SortExpression="satici_kilo" />
                            <asp:BoundField HeaderStyle-CssClass="px-3" ItemStyle-CssClass="px-3" DataField="satici_id" HeaderText="Satıcı ID" SortExpression="satici_id" />
                            <asp:BoundField HeaderStyle-CssClass="px-3" ItemStyle-CssClass="px-3 fw-bold" DataField="satici_adres" HeaderText="Satıcı Adres" SortExpression="satici_adres" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="SELECT [t_id], [satici_adi], [satici_soyadi], [alici_adi], [satici_eposta], [satici_numara], [satici_kilo], [satici_id], [satici_adres] FROM [process] WHERE (([alici_adi] = ?) AND ([as_ticaret] = ?)) ORDER BY [t_id]" OldValuesParameterFormatString="original_{0}">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hid_field_query_for_sql" Name="alici_adi" PropertyName="Text" Type="String" />
                            <asp:Parameter DefaultValue="false" Name="as_ticaret" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:Panel ID="pnl_checkrows" runat="server">
                        <div class="bg-light container-sm px-5 py-5 my-5 rounded-5 shadow">
                            <p class="text-black fw-bold">İŞLEMDE HERHANGİ BİR ÜRÜNÜNÜZ BULUNMUYOR.</p>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnl_islembuttons" runat="server">
                        <div class="mt-3">
                            <asp:Label ID="lbl_alisveris" runat="server" CssClass="fw-bold text-dark" Text="Seçilen ID = "></asp:Label>
                            <asp:Label ID="lbl_num" runat="server" CssClass="fw-bold text-dark" Text="Yok"></asp:Label>
                            <br />
                            <asp:Button ID="btn_alisveris" runat="server" Text="İşlemi Bitir" CssClass="btn btn-outline-success mt-2" OnClick="btn_alisveris_Click" />
                        </div>
                    </asp:Panel>

                </asp:Panel>
                <!--PROGRESS END-->

                <!--ALINAN ÜRÜNLER-->
                <asp:Panel ID="pnl_alinanurunler" CssClass="mt-2" runat="server">
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="t_id" DataSourceID="SqlDataSource2" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ControlStyle-CssClass="px-3 mt-1 btn btn-sm btn-danger text-white" ShowSelectButton="True" />
                            <asp:BoundField ItemStyle-CssClass="px-3 fw-bold text-center" DataField="t_id" HeaderText="Ticaret ID" InsertVisible="False" ReadOnly="True" SortExpression="t_id">
                                <HeaderStyle CssClass="px-3 bg-primary fw-bold text-white" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="px-3 fw-bold" DataField="satici_adi" HeaderText="Satıcı Adı" SortExpression="satici_adi">
                                <HeaderStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="px-3 fw-bold" DataField="satici_soyadi" HeaderText="Satıcı Soyadı" SortExpression="satici_soyadi">
                                <HeaderStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="px-3" DataField="satici_eposta" HeaderText="Satıcı E-Posta" SortExpression="satici_eposta">
                                <HeaderStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="fw-bold px-2" DataField="satici_numara" HeaderText="Satıcı Numara" SortExpression="satici_numara">
                                <HeaderStyle CssClass="px-2" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="px-3 fw-bold bg-gradient bg-primary text-white text-center" DataField="satici_kilo" HeaderText="Satıcı Kilo" SortExpression="satici_kilo">
                                <HeaderStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="fw-bold px-5" DataField="satici_adres" HeaderText="Satıcı Adres" SortExpression="satici_adres">
                                <HeaderStyle CssClass="px-5" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="as_ticaret" HeaderStyle-CssClass="px-3" ItemStyle-CssClass="px-4" HeaderText="Durum" SortExpression="as_ticaret" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [process] WHERE [t_id] = ?" InsertCommand="INSERT INTO [process] ([t_id], [satici_adi], [satici_soyadi], [satici_eposta], [satici_numara], [satici_kilo], [satici_adres], [as_ticaret]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [t_id], [satici_adi], [satici_soyadi], [satici_eposta], [satici_numara], [satici_kilo], [satici_adres], [as_ticaret] FROM [process] WHERE (([alici_adi] = ?) AND ([as_ticaret] = ?)) ORDER BY [t_id]" UpdateCommand="UPDATE [process] SET [satici_adi] = ?, [satici_soyadi] = ?, [satici_eposta] = ?, [satici_numara] = ?, [satici_kilo] = ?, [satici_adres] = ?, [as_ticaret] = ? WHERE [t_id] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="t_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="t_id" Type="Int32" />
                            <asp:Parameter Name="satici_adi" Type="String" />
                            <asp:Parameter Name="satici_soyadi" Type="String" />
                            <asp:Parameter Name="satici_eposta" Type="String" />
                            <asp:Parameter Name="satici_numara" Type="String" />
                            <asp:Parameter Name="satici_kilo" Type="Int32" />
                            <asp:Parameter Name="satici_adres" Type="String" />
                            <asp:Parameter Name="as_ticaret" Type="Boolean" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hid_field_query_for_sql" Name="alici_adi" PropertyName="Text" Type="String" />
                            <asp:Parameter DefaultValue="true" Name="as_ticaret" Type="Boolean" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="satici_adi" Type="String" />
                            <asp:Parameter Name="satici_soyadi" Type="String" />
                            <asp:Parameter Name="satici_eposta" Type="String" />
                            <asp:Parameter Name="satici_numara" Type="String" />
                            <asp:Parameter Name="satici_kilo" Type="Int32" />
                            <asp:Parameter Name="satici_adres" Type="String" />
                            <asp:Parameter Name="as_ticaret" Type="Boolean" />
                            <asp:Parameter Name="t_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <asp:Panel ID="pnl_checkrows_for_get" runat="server">
                        <div class="bg-light container-sm px-5 py-5 my-5 rounded-5 shadow">
                            <p class="text-black fw-bold">ALDIĞINIZ HERHANGİ BİR ÜRÜNÜNÜZ BULUNMUYOR.</p>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnl_islembuttons_for_get" runat="server">
                        <div class="mt-3">
                            <asp:Label ID="lbl_alisveris_for_get" runat="server" CssClass="fw-bold text-dark" Text="Seçilen ID = "></asp:Label>
                            <asp:Label ID="lbl_num_for_get" runat="server" CssClass="fw-bold text-dark" Text="Yok"></asp:Label>
                            <br />
                            <asp:Button ID="btn_alisveris_for_get" runat="server" Text="Yanlış işlem Bildir" CssClass="btn btn-outline-success mt-2" OnClick="btn_alisveris_for_get_Click" />
                        </div>
                    </asp:Panel>

                </asp:Panel>
                <!--ALINAN ÜRÜNLER END-->
            </div>
        </asp:Panel>
    </div>

    <script src="../js/custom.js"></script>

</asp:Content>
