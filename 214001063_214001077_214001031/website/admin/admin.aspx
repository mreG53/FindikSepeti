<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="admin.aspx.cs" Inherits="website.admin.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Panel</title>

    <!-- CSS only -->
    <link rel="shortcut icon" href="../images/avatar.png" type="image/x-icon" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-icons/7.16.0/simpleicons.svg" />
    <link href="../css/custom.css" rel="stylesheet" type="text/css" />

</head>
<body style="background-color: white">
    <form id="adminform" runat="server">

        <div style="margin-top: 50px;" class="row mr">
            <div class="col-md-2">
                <div class="sidebar bg-white bg-gradient">
                    <asp:LinkButton CssClass="sidenav2" ID="btn_isletmeler" runat="server" OnClick="btn_isletmeler_Click"><i class="bi bi-person-bounding-box"></i>  &nbsp;İşletmeler</asp:LinkButton>
                    <asp:LinkButton CssClass="sidenav2" ID="btn_kullanicilist" runat="server" OnClick="btn_kullanicilist_Click"><i class="bi bi-person-bounding-box"></i>  &nbsp;Kullanıcı Listesi</asp:LinkButton>
                    <asp:LinkButton CssClass="sidenav2" ID="btn_gonderilenformlar" runat="server" OnClick="btn_gonderilenformlar_Click"><i class="bi bi-person-bounding-box"></i>  &nbsp;İstek / Şikayet / Sipariş</asp:LinkButton>
                    <asp:LinkButton CssClass="sidenav2" ID="btn_islemdekiurunler" runat="server" OnClick="btn_islemdekiurunler_Click"><i class="bi bi-person-bounding-box"></i> &nbsp;İşlemdeki ürünler</asp:LinkButton>
                    <asp:LinkButton CssClass="sidenav2" ID="btn_yeniurun" runat="server" OnClick="btn_yeniurun_Click"><i class="bi bi-plus-circle"></i> &nbsp;Yeni Ürün Ekle</asp:LinkButton><br />

                    <asp:Label ID="lbl_welcome_admin" CssClass="text-dark fw-bold" runat="server" Text="Hg"></asp:Label><br />
                    <br />
                    <asp:Button ID="btn_signout" CssClass="btn btn-primary btn-lg" runat="server" Text="ÇIKIŞ" OnClick="btn_signout_Click" />
                </div>
            </div>

            <asp:Panel ID="pnl_right_side" runat="server" CssClass="col-md-10">

                <!--İşletmeler-->
                <asp:Panel ID="pnl_isletmeler" CssClass="mb-5" runat="server" BorderStyle="Solid" Direction="LeftToRight" HorizontalAlign="Center">
                    <h3>ŞİRKETLER</h3>
                    <style>
                        .zorla {
                            min-height: 30vh;
                            height: 30vh;
                            min-width: 25vh;
                            width: 25vh;
                            padding: 0 0;
                            margin: 0 0;
                            text-decoration: none;
                            resize: none;
                        }
                    </style>

                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellPadding="10" CellSpacing="5" DataKeyNames="c_id" DataSourceID="SqlDataSource1" GridLines="None" HorizontalAlign="Center">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True">
                                <ControlStyle CssClass="btn btn-sm btn-primary text-white fw-bold mt-2" />
                            </asp:CommandField>
                            <asp:BoundField HeaderStyle-CssClass="px-2 bg-primary bg-gradient fw-bold text-white" DataField="c_id" HeaderText="İşletme ID" InsertVisible="False" ReadOnly="True" SortExpression="c_id">
                                <HeaderStyle CssClass="px-2 bg-primary bg-gradient fw-bold text-white" />
                                <ItemStyle CssClass="px-2 text-center fw-bold" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderStyle-CssClass="px-3" DataField="c_headername" HeaderText="Şirket Adı" SortExpression="c_headername">
                                <HeaderStyle CssClass="px-3" />
                                <ItemStyle CssClass="px-3 fw-bold" />
                            </asp:BoundField>
                            <asp:BoundField HeaderStyle-CssClass="px-3" DataField="c_name" HeaderText="Kullanıcı Adı" SortExpression="c_name">
                                <HeaderStyle CssClass="px-3" />
                                <ItemStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField HeaderStyle-CssClass="px-3" DataField="c_pass" HeaderText="Şifre" SortExpression="c_pass">
                                <HeaderStyle CssClass="px-3" />
                                <ItemStyle CssClass="px-3" />
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-CssClass="fw-bold" DataField="c_mail" HeaderText="Mail" SortExpression="c_mail">
                                <ItemStyle CssClass="fw-bold" />
                            </asp:BoundField>
                            <asp:BoundField ControlStyle-CssClass="form-control zorla" ControlStyle-Font-Overline="true" HeaderStyle-CssClass="px-3" DataField="as_text" HeaderText="Açıklama" SortExpression="as_text">
                                <ControlStyle CssClass="form-control zorla" />
                                <HeaderStyle CssClass="px-3" />
                                <ItemStyle CssClass="px-3 py-3" />
                            </asp:BoundField>
                            <asp:BoundField HeaderStyle-CssClass="fw-bold px-4" DataField="as_price" HeaderText="Fiyat" SortExpression="as_price">
                                <HeaderStyle CssClass="fw-bold px-4" />
                                <ItemStyle CssClass="fw-bold px-4" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" BorderWidth="0px" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [companies] WHERE [c_id] = ?" InsertCommand="INSERT INTO [companies] ([c_id], [c_headername], [c_name], [c_pass], [c_mail], [as_text], [as_price]) VALUES (?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [c_id], [c_headername], [c_name], [c_pass], [c_mail], [as_text], [as_price] FROM [companies] ORDER BY [c_id]" UpdateCommand="UPDATE [companies] SET [c_headername] = ?, [c_name] = ?, [c_pass] = ?, [c_mail] = ?, [as_text] = ?, [as_price] = ? WHERE [c_id] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="c_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="c_id" Type="Int32" />
                            <asp:Parameter Name="c_headername" Type="String" />
                            <asp:Parameter Name="c_name" Type="String" />
                            <asp:Parameter Name="c_pass" Type="String" />
                            <asp:Parameter Name="c_mail" Type="String" />
                            <asp:Parameter Name="as_text" Type="String" />
                            <asp:Parameter Name="as_price" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="c_headername" Type="String" />
                            <asp:Parameter Name="c_name" Type="String" />
                            <asp:Parameter Name="c_pass" Type="String" />
                            <asp:Parameter Name="c_mail" Type="String" />
                            <asp:Parameter Name="as_text" Type="String" />
                            <asp:Parameter Name="as_price" Type="String" />
                            <asp:Parameter Name="c_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </asp:Panel>
                <!--İşletmeler end-->

                <!--Kullanıcılar-->
                <asp:Panel ID="pnl_uyeler" CssClass="mb-5" runat="server">
                    <h3>KULLANICI LİSTESİ</h3>
                    <asp:GridView ID="GridView2" runat="server" PageSize="50" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="15" CellSpacing="15" DataKeyNames="userid" DataSourceID="SqlDataSource2" ForeColor="Black">
                        <Columns>
                            <asp:CommandField ControlStyle-CssClass="btn btn-sm btn-primary text-white fw-bold" ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 bg-primary bg-gradient fw-bold text-white" ItemStyle-CssClass="px-3 text-center fw-bold" DataField="userid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="userid" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="name" HeaderText="İsim" SortExpression="name" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="surname" HeaderText="Soyisim" SortExpression="surname" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 text-white" ItemStyle-CssClass="px-3" DataField="password" HeaderText="Şifre" SortExpression="password" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 text-white" ItemStyle-CssClass="px-3" DataField="email" HeaderText="E-Posta" SortExpression="email" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="phonenumber" HeaderText="Telefon" SortExpression="phonenumber" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 text-white" ItemStyle-CssClass="px-3" DataField="adress" HeaderText="Adres" SortExpression="adress" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 text-white" ItemStyle-CssClass="px-3" DataField="level" HeaderText="level" SortExpression="level" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 text-white" ItemStyle-CssClass="px-3" DataField="byear" HeaderText="Doğum Yılı" SortExpression="byear" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [users] WHERE [userid] = ?" InsertCommand="INSERT INTO [users] ([userid], [name], [surname], [password], [email], [phonenumber], [adress], [level], [byear]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [users] ORDER BY [userid]" UpdateCommand="UPDATE [users] SET [name] = ?, [surname] = ?, [password] = ?, [email] = ?, [phonenumber] = ?, [adress] = ?, [level] = ?, [byear] = ? WHERE [userid] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="userid" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="userid" Type="Int32" />
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="surname" Type="String" />
                            <asp:Parameter Name="password" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="phonenumber" Type="String" />
                            <asp:Parameter Name="adress" Type="String" />
                            <asp:Parameter Name="level" Type="Int32" />
                            <asp:Parameter Name="byear" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="surname" Type="String" />
                            <asp:Parameter Name="password" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="phonenumber" Type="String" />
                            <asp:Parameter Name="adress" Type="String" />
                            <asp:Parameter Name="level" Type="Int32" />
                            <asp:Parameter Name="byear" Type="DateTime" />
                            <asp:Parameter Name="userid" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </asp:Panel>
                <!--Kullanıcılar end-->

                <!--İstek / Şikayet-->
                <asp:Panel ID="pnl_iletisim" CssClass="mb-5" runat="server">


                    <h3>İSTEK / ŞİKAYET</h3>
                    <asp:Panel ID="pnl_istek_sikayet" runat="server">
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="f_id" DataSourceID="SqlDataSource7" GridLines="Horizontal" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ControlStyle-CssClass="btn btn-sm btn-primary text-white fw-bold" ShowSelectButton="True" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 bg-primary bg-gradient fw-bold text-white" ItemStyle-CssClass="px-3 text-center fw-bold" DataField="f_id" HeaderText="Form ID" InsertVisible="False" ReadOnly="True" SortExpression="f_id" >
                                <HeaderStyle CssClass="px-3 bg-primary bg-gradient fw-bold text-white" />
                                <ItemStyle CssClass="px-3 text-center fw-bold" />
                                </asp:BoundField>
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="f_adsoyad" HeaderText="Ad Soyad" SortExpression="f_adsoyad" >
                                <HeaderStyle CssClass="px-3 fw-bold text-white" />
                                <ItemStyle CssClass="px-3 fw-bold" />
                                </asp:BoundField>
                                <asp:BoundField HeaderStyle-CssClass="px-3 text-white" ItemStyle-CssClass="px-3" DataField="f_mail" HeaderText="E-mail" SortExpression="f_mail" >
                                <HeaderStyle CssClass="px-3 text-white" />
                                <ItemStyle CssClass="px-3" />
                                </asp:BoundField>
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="f_konu" HeaderText="Konu" SortExpression="f_konu" >
                                <HeaderStyle CssClass="px-3 fw-bold text-white" />
                                <ItemStyle CssClass="px-3 fw-bold" />
                                </asp:BoundField>
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="f_msj" HeaderText="Mesaj" SortExpression="f_msj" >
                                <HeaderStyle CssClass="px-3 fw-bold text-white" />
                                <ItemStyle CssClass="px-3 fw-bold" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle CssClass="fw-bold" BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#487575" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#275353" />

                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString11 %>" DeleteCommand="DELETE FROM [contact] WHERE [f_id] = ? AND (([f_adsoyad] = ?) OR ([f_adsoyad] IS NULL AND ? IS NULL)) AND (([f_mail] = ?) OR ([f_mail] IS NULL AND ? IS NULL)) AND (([f_konu] = ?) OR ([f_konu] IS NULL AND ? IS NULL)) AND (([f_msj] = ?) OR ([f_msj] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [contact] ([f_id], [f_adsoyad], [f_mail], [f_konu], [f_msj]) VALUES (?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString11.ProviderName %>" SelectCommand="SELECT * FROM [contact] ORDER BY [f_id] DESC" UpdateCommand="UPDATE [contact] SET [f_adsoyad] = ?, [f_mail] = ?, [f_konu] = ?, [f_msj] = ? WHERE [f_id] = ? AND (([f_adsoyad] = ?) OR ([f_adsoyad] IS NULL AND ? IS NULL)) AND (([f_mail] = ?) OR ([f_mail] IS NULL AND ? IS NULL)) AND (([f_konu] = ?) OR ([f_konu] IS NULL AND ? IS NULL)) AND (([f_msj] = ?) OR ([f_msj] IS NULL AND ? IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_f_id" Type="Int32" />
                                <asp:Parameter Name="original_f_adsoyad" Type="String" />
                                <asp:Parameter Name="original_f_adsoyad" Type="String" />
                                <asp:Parameter Name="original_f_mail" Type="String" />
                                <asp:Parameter Name="original_f_mail" Type="String" />
                                <asp:Parameter Name="original_f_konu" Type="String" />
                                <asp:Parameter Name="original_f_konu" Type="String" />
                                <asp:Parameter Name="original_f_msj" Type="String" />
                                <asp:Parameter Name="original_f_msj" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="f_id" Type="Int32" />
                                <asp:Parameter Name="f_adsoyad" Type="String" />
                                <asp:Parameter Name="f_mail" Type="String" />
                                <asp:Parameter Name="f_konu" Type="String" />
                                <asp:Parameter Name="f_msj" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="f_adsoyad" Type="String" />
                                <asp:Parameter Name="f_mail" Type="String" />
                                <asp:Parameter Name="f_konu" Type="String" />
                                <asp:Parameter Name="f_msj" Type="String" />
                                <asp:Parameter Name="original_f_id" Type="Int32" />
                                <asp:Parameter Name="original_f_adsoyad" Type="String" />
                                <asp:Parameter Name="original_f_adsoyad" Type="String" />
                                <asp:Parameter Name="original_f_mail" Type="String" />
                                <asp:Parameter Name="original_f_mail" Type="String" />
                                <asp:Parameter Name="original_f_konu" Type="String" />
                                <asp:Parameter Name="original_f_konu" Type="String" />
                                <asp:Parameter Name="original_f_msj" Type="String" />
                                <asp:Parameter Name="original_f_msj" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" DeleteCommand="DELETE FROM [contact] WHERE [f_id] = ? AND (([f_adsoyad] = ?) OR ([f_adsoyad] IS NULL AND ? IS NULL)) AND (([f_mail] = ?) OR ([f_mail] IS NULL AND ? IS NULL)) AND (([f_konu] = ?) OR ([f_konu] IS NULL AND ? IS NULL)) AND (([f_msj] = ?) OR ([f_msj] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [contact] ([f_id], [f_adsoyad], [f_mail], [f_konu], [f_msj]) VALUES (?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT * FROM [contact] ORDER BY [f_id] DESC" UpdateCommand="UPDATE [contact] SET [f_adsoyad] = ?, [f_mail] = ?, [f_konu] = ?, [f_msj] = ? WHERE [f_id] = ? AND (([f_adsoyad] = ?) OR ([f_adsoyad] IS NULL AND ? IS NULL)) AND (([f_mail] = ?) OR ([f_mail] IS NULL AND ? IS NULL)) AND (([f_konu] = ?) OR ([f_konu] IS NULL AND ? IS NULL)) AND (([f_msj] = ?) OR ([f_msj] IS NULL AND ? IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_f_id" Type="Int32" />
                                <asp:Parameter Name="original_f_adsoyad" Type="String" />
                                <asp:Parameter Name="original_f_adsoyad" Type="String" />
                                <asp:Parameter Name="original_f_mail" Type="String" />
                                <asp:Parameter Name="original_f_mail" Type="String" />
                                <asp:Parameter Name="original_f_konu" Type="String" />
                                <asp:Parameter Name="original_f_konu" Type="String" />
                                <asp:Parameter Name="original_f_msj" Type="String" />
                                <asp:Parameter Name="original_f_msj" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="f_id" Type="Int32" />
                                <asp:Parameter Name="f_adsoyad" Type="String" />
                                <asp:Parameter Name="f_mail" Type="String" />
                                <asp:Parameter Name="f_konu" Type="String" />
                                <asp:Parameter Name="f_msj" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="f_adsoyad" Type="String" />
                                <asp:Parameter Name="f_mail" Type="String" />
                                <asp:Parameter Name="f_konu" Type="String" />
                                <asp:Parameter Name="f_msj" Type="String" />
                                <asp:Parameter Name="original_f_id" Type="Int32" />
                                <asp:Parameter Name="original_f_adsoyad" Type="String" />
                                <asp:Parameter Name="original_f_adsoyad" Type="String" />
                                <asp:Parameter Name="original_f_mail" Type="String" />
                                <asp:Parameter Name="original_f_mail" Type="String" />
                                <asp:Parameter Name="original_f_konu" Type="String" />
                                <asp:Parameter Name="original_f_konu" Type="String" />
                                <asp:Parameter Name="original_f_msj" Type="String" />
                                <asp:Parameter Name="original_f_msj" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                        <asp:Label ID="lbl_text" runat="server" CssClass="fw-bold" Text="Seçilen ID = ">

                        </asp:Label> <asp:Label ID="lbl_secilenid" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Button ID="btn_sil" runat="server" CssClass="btn btn-outline-dark" OnClick="btn_sil_Click" Text="Sil" />

                    </asp:Panel>
                  
                    <asp:Panel ID="pnl_yanlis_islem" CssClass="mt-5" runat="server">
                        <h3>YANLIŞ İŞLEMLER</h3>
                        <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="t_id" DataSourceID="SqlDataSource5" GridLines="None">

                            <Columns>
                                <asp:CommandField  ControlStyle-CssClass="btn btn-sm btn-primary text-white fw-bold" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 bg-primary bg-gradient fw-bold text-white" ItemStyle-CssClass="px-3 text-center fw-bold" DataField="t_id" HeaderText="Tic. ID." InsertVisible="False" ReadOnly="True" SortExpression="t_id" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 text-success fw-bold" DataField="satici_id" HeaderText="Sat. ID" SortExpression="satici_id" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="satici_adi" HeaderText="Sat. Adı" SortExpression="satici_adi" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="satici_soyadi" HeaderText="Sat. Soyadı" SortExpression="satici_soyadi" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="alici_id" HeaderText="Al. ID" SortExpression="alici_id" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="alici_adi" HeaderText="alici_adi" SortExpression="alici_adi" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="satici_eposta" HeaderText="Sat. E-Posta" SortExpression="satici_eposta" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="satici_numara" HeaderText="Sat. Numara" SortExpression="satici_numara" />
                                <asp:BoundField HeaderStyle-CssClass="px-1 fw-bold text-white" ItemStyle-CssClass="px-1 fw-bold text-center text-primary bg-gradient text-white bg-primary" DataField="satici_kilo" HeaderText="Sat. Kilo" SortExpression="satici_kilo" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="satici_adres" HeaderText="Sat. Adres" SortExpression="satici_adres" />
                                <asp:CheckBoxField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="as_ticaret" HeaderText="Durum" SortExpression="as_ticaret" />
                                <asp:CheckBoxField DataField="yanlis_satis" HeaderText="Yanlış Satış" SortExpression="yanlis_satis" />
                            </Columns>
                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#594B9C" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#33276A" />

                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString9 %>" DeleteCommand="DELETE FROM [process] WHERE [t_id] = ? AND (([satici_id] = ?) OR ([satici_id] IS NULL AND ? IS NULL)) AND (([satici_adi] = ?) OR ([satici_adi] IS NULL AND ? IS NULL)) AND (([satici_soyadi] = ?) OR ([satici_soyadi] IS NULL AND ? IS NULL)) AND (([alici_id] = ?) OR ([alici_id] IS NULL AND ? IS NULL)) AND (([alici_adi] = ?) OR ([alici_adi] IS NULL AND ? IS NULL)) AND (([satici_eposta] = ?) OR ([satici_eposta] IS NULL AND ? IS NULL)) AND (([satici_numara] = ?) OR ([satici_numara] IS NULL AND ? IS NULL)) AND (([satici_kilo] = ?) OR ([satici_kilo] IS NULL AND ? IS NULL)) AND (([satici_adres] = ?) OR ([satici_adres] IS NULL AND ? IS NULL)) AND [as_ticaret] = ? AND [yanlis_satis] = ?" InsertCommand="INSERT INTO [process] ([t_id], [satici_id], [satici_adi], [satici_soyadi], [alici_id], [alici_adi], [satici_eposta], [satici_numara], [satici_kilo], [satici_adres], [as_ticaret], [yanlis_satis]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString9.ProviderName %>" SelectCommand="SELECT * FROM [process] WHERE ([yanlis_satis] = ?) ORDER BY [t_id]" UpdateCommand="UPDATE [process] SET [satici_id] = ?, [satici_adi] = ?, [satici_soyadi] = ?, [alici_id] = ?, [alici_adi] = ?, [satici_eposta] = ?, [satici_numara] = ?, [satici_kilo] = ?, [satici_adres] = ?, [as_ticaret] = ?, [yanlis_satis] = ? WHERE [t_id] = ? AND (([satici_id] = ?) OR ([satici_id] IS NULL AND ? IS NULL)) AND (([satici_adi] = ?) OR ([satici_adi] IS NULL AND ? IS NULL)) AND (([satici_soyadi] = ?) OR ([satici_soyadi] IS NULL AND ? IS NULL)) AND (([alici_id] = ?) OR ([alici_id] IS NULL AND ? IS NULL)) AND (([alici_adi] = ?) OR ([alici_adi] IS NULL AND ? IS NULL)) AND (([satici_eposta] = ?) OR ([satici_eposta] IS NULL AND ? IS NULL)) AND (([satici_numara] = ?) OR ([satici_numara] IS NULL AND ? IS NULL)) AND (([satici_kilo] = ?) OR ([satici_kilo] IS NULL AND ? IS NULL)) AND (([satici_adres] = ?) OR ([satici_adres] IS NULL AND ? IS NULL)) AND [as_ticaret] = ? AND [yanlis_satis] = ?">
                            <DeleteParameters>
                                <asp:Parameter Name="original_t_id" Type="Int32" />
                                <asp:Parameter Name="original_satici_id" Type="String" />
                                <asp:Parameter Name="original_satici_id" Type="String" />
                                <asp:Parameter Name="original_satici_adi" Type="String" />
                                <asp:Parameter Name="original_satici_adi" Type="String" />
                                <asp:Parameter Name="original_satici_soyadi" Type="String" />
                                <asp:Parameter Name="original_satici_soyadi" Type="String" />
                                <asp:Parameter Name="original_alici_id" Type="String" />
                                <asp:Parameter Name="original_alici_id" Type="String" />
                                <asp:Parameter Name="original_alici_adi" Type="String" />
                                <asp:Parameter Name="original_alici_adi" Type="String" />
                                <asp:Parameter Name="original_satici_eposta" Type="String" />
                                <asp:Parameter Name="original_satici_eposta" Type="String" />
                                <asp:Parameter Name="original_satici_numara" Type="String" />
                                <asp:Parameter Name="original_satici_numara" Type="String" />
                                <asp:Parameter Name="original_satici_kilo" Type="Int32" />
                                <asp:Parameter Name="original_satici_kilo" Type="Int32" />
                                <asp:Parameter Name="original_satici_adres" Type="String" />
                                <asp:Parameter Name="original_satici_adres" Type="String" />
                                <asp:Parameter Name="original_as_ticaret" Type="Boolean" />
                                <asp:Parameter Name="original_yanlis_satis" Type="Boolean" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="t_id" Type="Int32" />
                                <asp:Parameter Name="satici_id" Type="String" />
                                <asp:Parameter Name="satici_adi" Type="String" />
                                <asp:Parameter Name="satici_soyadi" Type="String" />
                                <asp:Parameter Name="alici_id" Type="String" />
                                <asp:Parameter Name="alici_adi" Type="String" />
                                <asp:Parameter Name="satici_eposta" Type="String" />
                                <asp:Parameter Name="satici_numara" Type="String" />
                                <asp:Parameter Name="satici_kilo" Type="Int32" />
                                <asp:Parameter Name="satici_adres" Type="String" />
                                <asp:Parameter Name="as_ticaret" Type="Boolean" />
                                <asp:Parameter Name="yanlis_satis" Type="Boolean" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="yanlis_satis" Type="Boolean" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="satici_id" Type="String" />
                                <asp:Parameter Name="satici_adi" Type="String" />
                                <asp:Parameter Name="satici_soyadi" Type="String" />
                                <asp:Parameter Name="alici_id" Type="String" />
                                <asp:Parameter Name="alici_adi" Type="String" />
                                <asp:Parameter Name="satici_eposta" Type="String" />
                                <asp:Parameter Name="satici_numara" Type="String" />
                                <asp:Parameter Name="satici_kilo" Type="Int32" />
                                <asp:Parameter Name="satici_adres" Type="String" />
                                <asp:Parameter Name="as_ticaret" Type="Boolean" />
                                <asp:Parameter Name="yanlis_satis" Type="Boolean" />
                                <asp:Parameter Name="original_t_id" Type="Int32" />
                                <asp:Parameter Name="original_satici_id" Type="String" />
                                <asp:Parameter Name="original_satici_id" Type="String" />
                                <asp:Parameter Name="original_satici_adi" Type="String" />
                                <asp:Parameter Name="original_satici_adi" Type="String" />
                                <asp:Parameter Name="original_satici_soyadi" Type="String" />
                                <asp:Parameter Name="original_satici_soyadi" Type="String" />
                                <asp:Parameter Name="original_alici_id" Type="String" />
                                <asp:Parameter Name="original_alici_id" Type="String" />
                                <asp:Parameter Name="original_alici_adi" Type="String" />
                                <asp:Parameter Name="original_alici_adi" Type="String" />
                                <asp:Parameter Name="original_satici_eposta" Type="String" />
                                <asp:Parameter Name="original_satici_eposta" Type="String" />
                                <asp:Parameter Name="original_satici_numara" Type="String" />
                                <asp:Parameter Name="original_satici_numara" Type="String" />
                                <asp:Parameter Name="original_satici_kilo" Type="Int32" />
                                <asp:Parameter Name="original_satici_kilo" Type="Int32" />
                                <asp:Parameter Name="original_satici_adres" Type="String" />
                                <asp:Parameter Name="original_satici_adres" Type="String" />
                                <asp:Parameter Name="original_as_ticaret" Type="Boolean" />
                                <asp:Parameter Name="original_yanlis_satis" Type="Boolean" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </asp:Panel>

                    <asp:Panel ID="pnl_siparisler" CssClass="mt-5 mb-5" runat="server">
                        <h3>SİPARİŞLER</h3>
                        <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="sip_id" DataSourceID="SqlDataSource6" ForeColor="Black" GridLines="Vertical">

                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ControlStyle-CssClass="btn btn-sm btn-primary text-white fw-bold" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 bg-primary bg-gradient fw-bold text-white" ItemStyle-CssClass="px-3 text-center fw-bold" DataField="sip_id" HeaderText="Sip. ID" InsertVisible="False" ReadOnly="True" SortExpression="sip_id" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 bg-dark bg-gradient fw-bold text-white" ItemStyle-CssClass="px-3 text-center fw-bold" DataField="uye_id" HeaderText="Üye ID" SortExpression="uye_id" />
                                <asp:BoundField HeaderStyle-CssClass="px-1 fw-bold text-white" ItemStyle-CssClass="px-1 fw-bold" DataField="urun_id" HeaderText="Ürün ID" SortExpression="urun_id" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="urun_ad" HeaderText="Ürün Ad" SortExpression="urun_ad" />
                                <asp:BoundField HeaderStyle-CssClass="px-2 fw-bold text-white" ItemStyle-CssClass="px-2 fw-bold" DataField="urun_adet" HeaderText="Ürün Adet" SortExpression="urun_adet" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="urun_fiyat" HeaderText="Ürün Fiyat" SortExpression="urun_fiyat" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="aratoplam" HeaderText="Ara Toplam" SortExpression="aratoplam" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3" DataField="urun_uretici" HeaderText="Ürün Üretici" SortExpression="urun_uretici" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="urun_paket" HeaderText="Paketlenme" SortExpression="urun_paket" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="urun_resim" HeaderText="Resim Yol" SortExpression="urun_resim" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="date" HeaderText="Sipariş Tarihi" SortExpression="date" />
                                <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold" DataField="siparis_durum" HeaderText="Sipariş Durumu" SortExpression="siparis_durum" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />

                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString10 %>" DeleteCommand="DELETE FROM [orders] WHERE [sip_id] = ? AND (([uye_id] = ?) OR ([uye_id] IS NULL AND ? IS NULL)) AND (([urun_id] = ?) OR ([urun_id] IS NULL AND ? IS NULL)) AND (([urun_ad] = ?) OR ([urun_ad] IS NULL AND ? IS NULL)) AND (([urun_adet] = ?) OR ([urun_adet] IS NULL AND ? IS NULL)) AND (([urun_fiyat] = ?) OR ([urun_fiyat] IS NULL AND ? IS NULL)) AND (([aratoplam] = ?) OR ([aratoplam] IS NULL AND ? IS NULL)) AND (([urun_uretici] = ?) OR ([urun_uretici] IS NULL AND ? IS NULL)) AND (([urun_paket] = ?) OR ([urun_paket] IS NULL AND ? IS NULL)) AND (([urun_resim] = ?) OR ([urun_resim] IS NULL AND ? IS NULL)) AND (([date] = ?) OR ([date] IS NULL AND ? IS NULL)) AND (([siparis_durum] = ?) OR ([siparis_durum] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [orders] ([sip_id], [uye_id], [urun_id], [urun_ad], [urun_adet], [urun_fiyat], [aratoplam], [urun_uretici], [urun_paket], [urun_resim], [date], [siparis_durum]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString10.ProviderName %>" SelectCommand="SELECT * FROM [orders] ORDER BY [date] DESC" UpdateCommand="UPDATE [orders] SET [uye_id] = ?, [urun_id] = ?, [urun_ad] = ?, [urun_adet] = ?, [urun_fiyat] = ?, [aratoplam] = ?, [urun_uretici] = ?, [urun_paket] = ?, [urun_resim] = ?, [date] = ?, [siparis_durum] = ? WHERE [sip_id] = ? AND (([uye_id] = ?) OR ([uye_id] IS NULL AND ? IS NULL)) AND (([urun_id] = ?) OR ([urun_id] IS NULL AND ? IS NULL)) AND (([urun_ad] = ?) OR ([urun_ad] IS NULL AND ? IS NULL)) AND (([urun_adet] = ?) OR ([urun_adet] IS NULL AND ? IS NULL)) AND (([urun_fiyat] = ?) OR ([urun_fiyat] IS NULL AND ? IS NULL)) AND (([aratoplam] = ?) OR ([aratoplam] IS NULL AND ? IS NULL)) AND (([urun_uretici] = ?) OR ([urun_uretici] IS NULL AND ? IS NULL)) AND (([urun_paket] = ?) OR ([urun_paket] IS NULL AND ? IS NULL)) AND (([urun_resim] = ?) OR ([urun_resim] IS NULL AND ? IS NULL)) AND (([date] = ?) OR ([date] IS NULL AND ? IS NULL)) AND (([siparis_durum] = ?) OR ([siparis_durum] IS NULL AND ? IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_sip_id" Type="Int32" />
                                <asp:Parameter Name="original_uye_id" Type="Int32" />
                                <asp:Parameter Name="original_uye_id" Type="Int32" />
                                <asp:Parameter Name="original_urun_id" Type="Int32" />
                                <asp:Parameter Name="original_urun_id" Type="Int32" />
                                <asp:Parameter Name="original_urun_ad" Type="String" />
                                <asp:Parameter Name="original_urun_ad" Type="String" />
                                <asp:Parameter Name="original_urun_adet" Type="Int32" />
                                <asp:Parameter Name="original_urun_adet" Type="Int32" />
                                <asp:Parameter Name="original_urun_fiyat" Type="Int32" />
                                <asp:Parameter Name="original_urun_fiyat" Type="Int32" />
                                <asp:Parameter Name="original_aratoplam" Type="Int32" />
                                <asp:Parameter Name="original_aratoplam" Type="Int32" />
                                <asp:Parameter Name="original_urun_uretici" Type="String" />
                                <asp:Parameter Name="original_urun_uretici" Type="String" />
                                <asp:Parameter Name="original_urun_paket" Type="String" />
                                <asp:Parameter Name="original_urun_paket" Type="String" />
                                <asp:Parameter Name="original_urun_resim" Type="String" />
                                <asp:Parameter Name="original_urun_resim" Type="String" />
                                <asp:Parameter Name="original_date" Type="DateTime" />
                                <asp:Parameter Name="original_date" Type="DateTime" />
                                <asp:Parameter Name="original_siparis_durum" Type="String" />
                                <asp:Parameter Name="original_siparis_durum" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="sip_id" Type="Int32" />
                                <asp:Parameter Name="uye_id" Type="Int32" />
                                <asp:Parameter Name="urun_id" Type="Int32" />
                                <asp:Parameter Name="urun_ad" Type="String" />
                                <asp:Parameter Name="urun_adet" Type="Int32" />
                                <asp:Parameter Name="urun_fiyat" Type="Int32" />
                                <asp:Parameter Name="aratoplam" Type="Int32" />
                                <asp:Parameter Name="urun_uretici" Type="String" />
                                <asp:Parameter Name="urun_paket" Type="String" />
                                <asp:Parameter Name="urun_resim" Type="String" />
                                <asp:Parameter Name="date" Type="DateTime" />
                                <asp:Parameter Name="siparis_durum" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="uye_id" Type="Int32" />
                                <asp:Parameter Name="urun_id" Type="Int32" />
                                <asp:Parameter Name="urun_ad" Type="String" />
                                <asp:Parameter Name="urun_adet" Type="Int32" />
                                <asp:Parameter Name="urun_fiyat" Type="Int32" />
                                <asp:Parameter Name="aratoplam" Type="Int32" />
                                <asp:Parameter Name="urun_uretici" Type="String" />
                                <asp:Parameter Name="urun_paket" Type="String" />
                                <asp:Parameter Name="urun_resim" Type="String" />
                                <asp:Parameter Name="date" Type="DateTime" />
                                <asp:Parameter Name="siparis_durum" Type="String" />
                                <asp:Parameter Name="original_sip_id" Type="Int32" />
                                <asp:Parameter Name="original_uye_id" Type="Int32" />
                                <asp:Parameter Name="original_uye_id" Type="Int32" />
                                <asp:Parameter Name="original_urun_id" Type="Int32" />
                                <asp:Parameter Name="original_urun_id" Type="Int32" />
                                <asp:Parameter Name="original_urun_ad" Type="String" />
                                <asp:Parameter Name="original_urun_ad" Type="String" />
                                <asp:Parameter Name="original_urun_adet" Type="Int32" />
                                <asp:Parameter Name="original_urun_adet" Type="Int32" />
                                <asp:Parameter Name="original_urun_fiyat" Type="Int32" />
                                <asp:Parameter Name="original_urun_fiyat" Type="Int32" />
                                <asp:Parameter Name="original_aratoplam" Type="Int32" />
                                <asp:Parameter Name="original_aratoplam" Type="Int32" />
                                <asp:Parameter Name="original_urun_uretici" Type="String" />
                                <asp:Parameter Name="original_urun_uretici" Type="String" />
                                <asp:Parameter Name="original_urun_paket" Type="String" />
                                <asp:Parameter Name="original_urun_paket" Type="String" />
                                <asp:Parameter Name="original_urun_resim" Type="String" />
                                <asp:Parameter Name="original_urun_resim" Type="String" />
                                <asp:Parameter Name="original_date" Type="DateTime" />
                                <asp:Parameter Name="original_date" Type="DateTime" />
                                <asp:Parameter Name="original_siparis_durum" Type="String" />
                                <asp:Parameter Name="original_siparis_durum" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>




                </asp:Panel>

                <asp:Panel ID="pnl_process" CssClass="mb-5" runat="server">
                    <h3>İŞLEMDEKİ ÜRÜNLER</h3>
                    <asp:GridView ID="GridView4" runat="server" PageSize="50" AutoGenerateColumns="False" DataKeyNames="t_id" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ControlStyle-CssClass="btn btn-sm btn-danger text-white fw-bold mt-2" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 bg-primary bg-gradient fw-bold text-white" ItemStyle-CssClass="px-3 text-center fw-bold text-primary" DataField="t_id" HeaderText="Tic. ID" InsertVisible="False" ReadOnly="True" SortExpression="t_id" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold bg-gradient text-success bg-dark" DataField="satici_id" HeaderText="Sat. ID" SortExpression="satici_id" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold text-dark" DataField="satici_adi" HeaderText="Sat. Adı" SortExpression="satici_adi" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold text-dark" DataField="satici_soyadi" HeaderText="Sat. Soyad" SortExpression="satici_soyadi" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold text-center text-primary bg-gradient text-danger bg-dark" DataField="alici_id" HeaderText="Al. ID" SortExpression="alici_id" />
                            <asp:BoundField HeaderStyle-CssClass="px-1 fw-bold text-white" ItemStyle-CssClass="px-1 text-dark" DataField="alici_adi" HeaderText="Al. Adı" SortExpression="alici_adi" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bold text-dark" DataField="satici_eposta" HeaderText="Sat. E-Mail" SortExpression="satici_eposta" />
                            <asp:BoundField HeaderStyle-CssClass="px-2 fw-bold text-white" ItemStyle-CssClass="px-2 fw-bold text-dark" DataField="satici_numara" HeaderText="Sat. Numara" SortExpression="satici_numara" />
                            <asp:BoundField HeaderStyle-CssClass="px-1 fw-bold text-white" ItemStyle-CssClass="px-1 fw-bold text-center text-primary bg-gradient text-white bg-primary" DataField="satici_kilo" HeaderText="Sat. KG" SortExpression="satici_kilo" />
                            <asp:BoundField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bolder text-dark" DataField="satici_adres" HeaderText="Sat. ADres" SortExpression="satici_adres" />
                            <asp:CheckBoxField HeaderStyle-CssClass="px-3 fw-bold text-white" ItemStyle-CssClass="px-3 fw-bolder text-dark" DataField="as_ticaret" HeaderText="Durum" SortExpression="as_ticaret" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" DeleteCommand="DELETE FROM [process] WHERE [t_id] = ? AND (([satici_id] = ?) OR ([satici_id] IS NULL AND ? IS NULL)) AND (([satici_adi] = ?) OR ([satici_adi] IS NULL AND ? IS NULL)) AND (([satici_soyadi] = ?) OR ([satici_soyadi] IS NULL AND ? IS NULL)) AND (([alici_id] = ?) OR ([alici_id] IS NULL AND ? IS NULL)) AND (([alici_adi] = ?) OR ([alici_adi] IS NULL AND ? IS NULL)) AND (([satici_eposta] = ?) OR ([satici_eposta] IS NULL AND ? IS NULL)) AND (([satici_numara] = ?) OR ([satici_numara] IS NULL AND ? IS NULL)) AND (([satici_kilo] = ?) OR ([satici_kilo] IS NULL AND ? IS NULL)) AND (([satici_adres] = ?) OR ([satici_adres] IS NULL AND ? IS NULL)) AND [as_ticaret] = ?" InsertCommand="INSERT INTO [process] ([t_id], [satici_id], [satici_adi], [satici_soyadi], [alici_id], [alici_adi], [satici_eposta], [satici_numara], [satici_kilo], [satici_adres], [as_ticaret]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [process] ORDER BY [t_id]" UpdateCommand="UPDATE [process] SET [satici_id] = ?, [satici_adi] = ?, [satici_soyadi] = ?, [alici_id] = ?, [alici_adi] = ?, [satici_eposta] = ?, [satici_numara] = ?, [satici_kilo] = ?, [satici_adres] = ?, [as_ticaret] = ? WHERE [t_id] = ? AND (([satici_id] = ?) OR ([satici_id] IS NULL AND ? IS NULL)) AND (([satici_adi] = ?) OR ([satici_adi] IS NULL AND ? IS NULL)) AND (([satici_soyadi] = ?) OR ([satici_soyadi] IS NULL AND ? IS NULL)) AND (([alici_id] = ?) OR ([alici_id] IS NULL AND ? IS NULL)) AND (([alici_adi] = ?) OR ([alici_adi] IS NULL AND ? IS NULL)) AND (([satici_eposta] = ?) OR ([satici_eposta] IS NULL AND ? IS NULL)) AND (([satici_numara] = ?) OR ([satici_numara] IS NULL AND ? IS NULL)) AND (([satici_kilo] = ?) OR ([satici_kilo] IS NULL AND ? IS NULL)) AND (([satici_adres] = ?) OR ([satici_adres] IS NULL AND ? IS NULL)) AND [as_ticaret] = ?" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
                        <DeleteParameters>
                            <asp:Parameter Name="original_t_id" Type="Int32" />
                            <asp:Parameter Name="original_satici_id" Type="String" />
                            <asp:Parameter Name="original_satici_id" Type="String" />
                            <asp:Parameter Name="original_satici_adi" Type="String" />
                            <asp:Parameter Name="original_satici_adi" Type="String" />
                            <asp:Parameter Name="original_satici_soyadi" Type="String" />
                            <asp:Parameter Name="original_satici_soyadi" Type="String" />
                            <asp:Parameter Name="original_alici_id" Type="String" />
                            <asp:Parameter Name="original_alici_id" Type="String" />
                            <asp:Parameter Name="original_alici_adi" Type="String" />
                            <asp:Parameter Name="original_alici_adi" Type="String" />
                            <asp:Parameter Name="original_satici_eposta" Type="String" />
                            <asp:Parameter Name="original_satici_eposta" Type="String" />
                            <asp:Parameter Name="original_satici_numara" Type="String" />
                            <asp:Parameter Name="original_satici_numara" Type="String" />
                            <asp:Parameter Name="original_satici_kilo" Type="Int32" />
                            <asp:Parameter Name="original_satici_kilo" Type="Int32" />
                            <asp:Parameter Name="original_satici_adres" Type="String" />
                            <asp:Parameter Name="original_satici_adres" Type="String" />
                            <asp:Parameter Name="original_as_ticaret" Type="Boolean" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="t_id" Type="Int32" />
                            <asp:Parameter Name="satici_id" Type="String" />
                            <asp:Parameter Name="satici_adi" Type="String" />
                            <asp:Parameter Name="satici_soyadi" Type="String" />
                            <asp:Parameter Name="alici_id" Type="String" />
                            <asp:Parameter Name="alici_adi" Type="String" />
                            <asp:Parameter Name="satici_eposta" Type="String" />
                            <asp:Parameter Name="satici_numara" Type="String" />
                            <asp:Parameter Name="satici_kilo" Type="Int32" />
                            <asp:Parameter Name="satici_adres" Type="String" />
                            <asp:Parameter Name="as_ticaret" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="satici_id" Type="String" />
                            <asp:Parameter Name="satici_adi" Type="String" />
                            <asp:Parameter Name="satici_soyadi" Type="String" />
                            <asp:Parameter Name="alici_id" Type="String" />
                            <asp:Parameter Name="alici_adi" Type="String" />
                            <asp:Parameter Name="satici_eposta" Type="String" />
                            <asp:Parameter Name="satici_numara" Type="String" />
                            <asp:Parameter Name="satici_kilo" Type="Int32" />
                            <asp:Parameter Name="satici_adres" Type="String" />
                            <asp:Parameter Name="as_ticaret" Type="Boolean" />
                            <asp:Parameter Name="original_t_id" Type="Int32" />
                            <asp:Parameter Name="original_satici_id" Type="String" />
                            <asp:Parameter Name="original_satici_id" Type="String" />
                            <asp:Parameter Name="original_satici_adi" Type="String" />
                            <asp:Parameter Name="original_satici_adi" Type="String" />
                            <asp:Parameter Name="original_satici_soyadi" Type="String" />
                            <asp:Parameter Name="original_satici_soyadi" Type="String" />
                            <asp:Parameter Name="original_alici_id" Type="String" />
                            <asp:Parameter Name="original_alici_id" Type="String" />
                            <asp:Parameter Name="original_alici_adi" Type="String" />
                            <asp:Parameter Name="original_alici_adi" Type="String" />
                            <asp:Parameter Name="original_satici_eposta" Type="String" />
                            <asp:Parameter Name="original_satici_eposta" Type="String" />
                            <asp:Parameter Name="original_satici_numara" Type="String" />
                            <asp:Parameter Name="original_satici_numara" Type="String" />
                            <asp:Parameter Name="original_satici_kilo" Type="Int32" />
                            <asp:Parameter Name="original_satici_kilo" Type="Int32" />
                            <asp:Parameter Name="original_satici_adres" Type="String" />
                            <asp:Parameter Name="original_satici_adres" Type="String" />
                            <asp:Parameter Name="original_as_ticaret" Type="Boolean" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </asp:Panel>
                <!--ÜRÜN EKLE-->
                <asp:Panel CssClass="form-control" ID="pnl_urunekle" runat="server">
                    <h3>ÜRÜN EKLE</h3>
                    <div class="col-md-3 mt-2">
                        Ürün Ad:
                        <asp:TextBox CssClass="form-control" ID="txb_urun_ad" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mt-2">
                        Ürün Açıklama:
                        <asp:TextBox CssClass="form-control" ID="txb_urun_aciklama" TextMode="MultiLine" Height="70" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mt-2">
                        Ürün Önceki Fiyat:
                        <asp:TextBox CssClass="form-control" ID="txb_urun_onceki_fiyat" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mt-2">
                        Ürün Fiyat:
                    <asp:TextBox CssClass="form-control" ID="txb_urun_fiyat" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mt-2">
                        Ürün Üretici:
                    <asp:TextBox CssClass="form-control" ID="txb_urun_uretici" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mt-2">
                        <div class="dropdown">
                            Paketlenme:<br />
                            <asp:DropDownList CssClass="btn btn-dark text-white dropdown-toggle" ID="dd_paket_list" runat="server">
                                <asp:ListItem Text="Paket" Value="Paket"></asp:ListItem>
                                <asp:ListItem Text="Kavanoz" Value="Kavanoz"></asp:ListItem>
                                <asp:ListItem Text="Vakumlu Paket" Value="Vakumlu Paket"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-md-3 mt-2">
                        Ürün Stok:
                    <asp:TextBox CssClass="form-control" ID="txb_stok" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-3 mt-2">
                        <div class="dropdown">
                            Kategori:<br />
                            <asp:DropDownList CssClass="btn btn-dark text-white dropdown-toggle" ID="dd_kategori_list" runat="server">
                                <asp:ListItem Text="Fındık" Value="Fındık"></asp:ListItem>
                                <asp:ListItem Text="Çay" Value="Çay"></asp:ListItem>
                                <asp:ListItem Text="Diğer" Value="Diğer"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-md-3 mt-2">
                        Ürün Resim:
                    <asp:FileUpload ID="upload_image" CssClass="btn btn-dark" runat="server" />
                    </div>

                    <div class="col-md-3 mt-2">
                        <asp:Button ID="btn_ekle" CssClass="btn btn-success d-flex" runat="server" Text="ÜRÜN EKLE" OnClick="btn_ekle_Click" />

                        <div class="mt-5">
                            <asp:Label ID="lbl_hata" runat="server" CssClass="fw-bold text-bg-danger px-4" Text="Durum"></asp:Label>
                        </div>

                    </div>

                </asp:Panel>
                <!--ÜRÜN EKLE END-->
            </asp:Panel>
        </div>
    </form>

    <!--SCRIPT-->
    <script src="js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/custom.js"></script>

</body>
</html>
