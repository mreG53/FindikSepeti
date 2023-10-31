using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Threading;
using System.Runtime.Remoting.Messaging;
using System.Data.SqlClient;
using System.Runtime.ConstrainedExecution;

namespace website.user
{
    class siparis
    {
        public int uyeID { get; set; }
        public int urunID { get; set; }
        public string urunAD { get; set; }
        public int urunADET { get; set; }
        public int urunFIYAT { get; set; }
        public string urunURETICI { get; set; }
        public string urunPAKET { get; set; }
        public string urunRESIM { get; set; } 
    }


    public partial class profile1 : System.Web.UI.Page
    {

        int uye_id = 0;
        double fiyat = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_sip_durum.Visible = false;
            pnl_card.Visible = false;

            lbl_durum.Text = "";

            //user check
            object user = Session["userMail"];
            object adm = Session["adminlogin"];
            object comp = Session["compMail"];

            if (user == null)
            {
                Response.Redirect("~/giris.aspx");
            }

            if (adm != null)
            {
                Response.Write("<script>alert('Admin buraya girmek için tasarlanmadı.');</script>");
                Response.Redirect("index.aspx");
            }
            if (comp != null)
            {
                Response.Write("<script>alert('Giriş yaptığınız için bu sayfası görüntüleyemiyorsunuz.');</script>");
                Response.Redirect("index.aspx");
            }

            for (int i = 1; i <= 12; i++)
            {
                if (i > 9)
                    dd_list.Items.Add(new ListItem(i.ToString(), i.ToString()));
                else
                    dd_list.Items.Add(new ListItem("0" + i.ToString(), i.ToString()));
            }
                

            for (int j = 23; j <= 35; j++)
            {
                dd_list_second.Items.Add(new ListItem(j.ToString()));
            }
                

            string veriyolu2 = new dbpath().yol();

            OleDbConnection conn2 = new OleDbConnection(veriyolu2);
            conn2.Open();

            uye_id = Convert.ToInt16(Session["k_id"].ToString());

            OleDbDataAdapter da = new OleDbDataAdapter("SELECT * FROM [sepet] where [uye_id] = " + uye_id + " AND [siparis_durum] = false", conn2);
            OleDbDataAdapter da2 = new OleDbDataAdapter("SELECT * FROM [orders] where [uye_id] = " + uye_id + " ORDER BY [date] DESC", conn2);

            // money data to string
            OleDbCommand command = new OleDbCommand("SELECT * FROM [sepet] where [uye_id] = " + uye_id + " AND [siparis_durum] = false", conn2);
            OleDbDataReader dataReader;

            dataReader = command.ExecuteReader();



            while (dataReader.Read())
            {
                fiyat = fiyat + (Convert.ToDouble(dataReader["urun_fiyat"]) * Convert.ToDouble(dataReader["urun_adet"]));
                string toMoney = String.Format("{0:C}", fiyat);
                lbl_a.Text = toMoney;
                lbl_a2.Text = toMoney;
                lbl_a3.Text = toMoney;
            }
            // money data to string end

            DataTable dt = new DataTable();
            DataTable dt2 = new DataTable();


            da.Fill(dt);
            repeater.DataSource = dt;
            repeater.DataBind();

            da2.Fill(dt2);
            repeater2.DataSource = dt2;
            repeater2.DataBind();

            conn2.Close();

            string req = Request.QueryString["menu"];

            if (req == "1")
            {
                Page.Title = "Profilim -> Bilgilerim";
                pnl_bilgilerim.Visible = true;
                pnl_siparislerim.Visible = false;
                pnl_satislarim.Visible = false;
                pnl_process.Visible = false;
                pnl_sepetim.Visible = false;
            }
            else if (req == "2")
            {
                Page.Title = "Profilim -> Siparişlerim";
                pnl_bilgilerim.Visible = false;
                pnl_siparislerim.Visible = true;
                pnl_satislarim.Visible = false;
                pnl_process.Visible = false;
                pnl_sepetim.Visible = false;
            }
            else if (req == "3")
            {
                Page.Title = "Profilim -> Satılan Ürünler";
                pnl_bilgilerim.Visible = false;
                pnl_siparislerim.Visible = false;
                pnl_satislarim.Visible = true;
                pnl_process.Visible = false;
                pnl_sepetim.Visible = false;
            }
            else if (req == "4")
            {
                Page.Title = "Profilim -> İşlemdeki Ürünler";
                pnl_bilgilerim.Visible = false;
                pnl_siparislerim.Visible = false;
                pnl_satislarim.Visible = false;
                pnl_process.Visible = true;
                pnl_sepetim.Visible = false;
            }
            else if (req == "5")
            {
                Page.Title = "Profilim -> Sepetim";
                pnl_bilgilerim.Visible = false;
                pnl_siparislerim.Visible = false;
                pnl_satislarim.Visible = false;
                pnl_process.Visible = false;
                pnl_sepetim.Visible = true;
            }

            string getstr = user.ToString();
            // lbl_check.Text = "Bilgilerim";
            if (!Page.IsPostBack)
            {
                try
                {
                    string veriyolu = new dbpath().yol();
                    OleDbConnection conn = new OleDbConnection(veriyolu);
                    OleDbCommand cmd = new OleDbCommand();

                    conn.Open();

                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM users where email = @mail";
                    cmd.Parameters.AddWithValue("@mail", getstr);

                    OleDbDataReader dr;
                    dr = cmd.ExecuteReader();


                    while (dr.Read())
                    {
                        if (dr["email"].ToString() == getstr)
                        {
                            txb_eposta.Text = dr["email"].ToString();
                            txb_ad.Text = dr["name"].ToString();
                            hid_field_for_query_sql.Value = dr["name"].ToString();
                            hid_field_id.Value = dr["userid"].ToString();
                            txb_soyad.Text = dr["surname"].ToString();
                            txb_tel.Text = dr["phonenumber"].ToString();
                            txb_adress.Text = dr["adress"].ToString();
                            txb_btday.Text = (Convert.ToDateTime(dr["byear"]).ToString("dd.MM.yyyy"));
                        }
                        else
                        {
                            lbl_durum.Text = "bir sıkıntı var";
                        }
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    lbl_durum.Text = ex.Message.ToString() + ex.ToString();
                }
            }


            //check rows for process

            string veriyolu53 = new dbpath().yol();

            OleDbConnection baglanti = new OleDbConnection(veriyolu53);
            OleDbCommand cmd4 = new OleDbCommand();
            baglanti.Open();

            cmd4.Connection = baglanti;

            cmd4.CommandText = "SELECT * FROM process WHERE satici_adi = @saticiadi AND as_ticaret = false";
            cmd4.Parameters.AddWithValue("@saticiadi", hid_field_for_query_sql.Value.ToString());

            OleDbDataReader dr4 = cmd4.ExecuteReader();

            if (dr4.HasRows)
            {
                panel_checkrows_norows.Visible = false;
                pnl_checkrows_islemdeki_urunler.Visible = true;
            }
            else
            {
                panel_checkrows_norows.Visible = true;
                pnl_checkrows_islemdeki_urunler.Visible = false;
            }

            baglanti.Close();
            //check rows for process end

            //check rows for selled

            OleDbCommand cmd5 = new OleDbCommand();
            baglanti.Open();

            cmd5.Connection = baglanti;

            cmd5.CommandText = "SELECT * FROM process WHERE satici_adi = @saticiadi2 AND as_ticaret = true";
            cmd5.Parameters.AddWithValue("@saticiadi2", hid_field_for_query_sql.Value.ToString());

            OleDbDataReader dr5 = cmd5.ExecuteReader();

            if (dr5.HasRows)
                panel_checkrows_norows_selled.Visible = false;
            else
                panel_checkrows_norows_selled.Visible = true;

            baglanti.Close();
            //check rows for selled end

            //check rows sepet

            OleDbCommand cmd6 = new OleDbCommand();
            baglanti.Open();

            cmd6.Connection = baglanti;

            cmd6.CommandText = "SELECT * FROM sepet WHERE uye_id = @uyeid AND siparis_durum = false";
            cmd6.Parameters.AddWithValue("@uyeid", uye_id);

            OleDbDataReader dr6 = cmd6.ExecuteReader();

            if (dr6.HasRows)
            {
                pnl_sepet_urunler.Visible = true;
                pnl_satinal_screen.Visible = true;
                pnl_check_rows_sepet.Visible = false;
            }
            else
            {
                pnl_sepet_urunler.Visible = false;
                pnl_satinal_screen.Visible = false;
                pnl_check_rows_sepet.Visible = true;
            }

            baglanti.Close();
            //check rows sepet end

            //check rows siparis

            OleDbCommand cmd7 = new OleDbCommand();
            baglanti.Open();

            cmd7.Connection = baglanti;

            cmd7.CommandText = "SELECT * FROM orders WHERE uye_id = @uyeid";
            cmd7.Parameters.AddWithValue("@uyeid", uye_id);

            OleDbDataReader dr7 = cmd7.ExecuteReader();

            if (dr7.HasRows)
            {
                pnl_sip_urunler.Visible = true;
                pnl_check_rows_siparis.Visible = false;
            }
                
            else
            {
                pnl_sip_urunler.Visible = false;
                pnl_check_rows_siparis.Visible = true;
            }
                

            baglanti.Close();
            //check rows siparis end

        }

        protected void btn_bilgilerim_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/user/profile.aspx?menu=1");
        }

        protected void btn_siparislerim_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/user/profile.aspx?menu=2");
        }

        protected void btn_satilanurunler_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/user/profile.aspx?menu=3");
        }

        protected void btn_guncelle_sol_Click(object sender, EventArgs e)
        {
            if (txb_ad.Text == "" || txb_soyad.Text == "" || txb_eposta.Text.Trim() == "" || txb_tel.Text.Trim() == "")
            {
                lbl_durum.Text = "Lütfen gerekli alanları doldurunuz.";
            }
            else
            {
                try
                {

                    object user = Session["userMail"];
                    string getstr = user.ToString();

                    string veriyolu = new dbpath().yol();
                    OleDbConnection conn = new OleDbConnection(veriyolu);
                    conn.Open();

                    OleDbCommand cmd = new OleDbCommand();

                    cmd.Connection = conn;

                    cmd.CommandText = "UPDATE [users] SET name = @name, surname = @surname, email = @email, phonenumber = @phonumber," +
                        "adress = @adress, byear = @byear WHERE email = @sessionmail";

                    cmd.Parameters.AddWithValue("@name", txb_ad.Text);
                    cmd.Parameters.AddWithValue("@surname", txb_soyad.Text);
                    cmd.Parameters.AddWithValue("@email", txb_eposta.Text);
                    cmd.Parameters.AddWithValue("@phonumber", txb_tel.Text);
                    cmd.Parameters.AddWithValue("@adress", txb_adress.Text);
                    cmd.Parameters.AddWithValue("@byear", (Convert.ToDateTime(txb_btday.Text).ToString("dd.MM.yyyy")));
                    cmd.Parameters.AddWithValue("@sessionmail", getstr);

                    cmd.ExecuteNonQuery();

                    lbl_durum.Text = "Başarıyla kaydedildi.";
                    Response.Write("<script>alert('Başarıyla kaydedildi.');</script>");

                    HtmlMeta meta = new HtmlMeta();
                    meta.HttpEquiv = "Refresh";
                    meta.Content = "2;url=../user/profile.aspx?menu=1";
                    this.Page.Controls.Add(meta);

                    conn.Close();
                }
                catch (Exception ex)
                {
                    lbl_durum.Text = ex.Message.ToString();
                }
            }
        }

        protected void btn_guncelle_sag_Click(object sender, EventArgs e)
        {
            if (txb_currentpass.Text.Trim().Length < 4 || txb_newpassword.Text.Trim().Length < 4 || txb_newpassword_again.Text.Trim().Length < 4)
            {
                lbl_durum.Text = "Lütfen şifreleri en az 4 karakter şeklinde kaydediniz.";
            }
            else
            {
                try
                {
                    object user = Session["userMail"];
                    string getstr = user.ToString();

                    string veriyolu = new dbpath().yol();
                    OleDbConnection conn = new OleDbConnection(veriyolu);
                    conn.Open();

                    OleDbCommand cmd = new OleDbCommand();
                    OleDbCommand cmd2 = new OleDbCommand();

                    cmd.Connection = conn;
                    cmd2.Connection = conn;

                    cmd.CommandText = "SELECT * FROM users where email = @mail";
                    cmd.Parameters.AddWithValue("@mail", getstr);

                    OleDbDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        if (txb_currentpass.Text == txb_newpassword.Text)
                        {
                            lbl_durum.Text = "Yeni şifrenizle eski şifreniz aynı olamaz";
                        }
                        else
                        {
                            if (txb_currentpass.Text == dr["password"].ToString())
                            {
                                if (txb_newpassword.Text == txb_newpassword_again.Text)
                                {
                                    cmd2.CommandText = "UPDATE [users] SET [password] = @sifre where [email] = @eposta";
                                    cmd2.Parameters.AddWithValue("@sifre", txb_newpassword.Text);
                                    cmd2.Parameters.AddWithValue("@eposta", getstr);
                                    cmd2.ExecuteNonQuery();

                                    lbl_durum.Text = "Şifre başarıyla değiştirildi.";
                                    Response.Write("<script>alert('Şifre başarıyla değiştirildi.');</script>");

                                    txb_currentpass.Text = "";
                                    txb_newpassword.Text = "";
                                    txb_newpassword_again.Text = "";

                                    //Response.Redirect(Request.RawUrl);
                                }
                                else
                                {
                                    lbl_durum.Text = "Yeni şifreleriniz aynı değil.";
                                }
                            }
                            else
                            {
                                lbl_durum.Text = "Mevcut şifrenizi yanlış girdiniz.";
                            }
                        }
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    lbl_durum.Text = ex.ToString();
                }
            }
        }

        protected void btn_process_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/user/profile.aspx?menu=4");
        }

        protected void btn_sepet_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/user/profile.aspx?menu=5");
        }

        protected void btn_satinal_Click(object sender, EventArgs e)
        {
            pnl_card.Visible = true;
            btn_satinal.Visible = false;
        }

        protected void btn_x_Click(object sender, EventArgs e)
        {
            pnl_card.Visible = false;
            btn_satinal.Visible = true;
        }

        protected void btn_siparisver_Click(object sender, EventArgs e)
        {
            pnl_card.Visible = true;
            btn_satinal.Visible = false;

            if (txb_card.Text.Trim().Length < 16 || txb_cvv.Text.Trim().Length < 3)
            {
                Response.Write("<script>alert('Lütfen kart bilgilerinizi kontrol ediniz.');</script>");
            }
            else
            {
                string path = new dbpath().yol();
                OleDbConnection conn = new OleDbConnection(path);
                conn.Open();

                OleDbCommand cmd2 = new OleDbCommand();
                OleDbCommand cmd3 = new OleDbCommand();

                cmd2.Connection = conn;
                cmd3.Connection = conn;

                //cmd2.CommandText = "SELECT * FROM [sepet] where [uye_id] = " + uye_id + " AND [siparis_durum] = false";
                //OleDbDataReader dr = cmd2.ExecuteReader();

                string sql = "SELECT * FROM [sepet] where [uye_id] = " + uye_id + " AND [siparis_durum] = false";

                List<siparis> sips = new List<siparis>();

                using (OleDbConnection connection = new OleDbConnection(path))
                {
                    connection.Open();

                    OleDbCommand command = new OleDbCommand(sql, connection);
                    OleDbDataReader reader = command.ExecuteReader();          

                    while (reader.Read())
                    {
                        siparis sip = new siparis();
                        sip.uyeID = reader.GetInt32(1);
                        sip.urunID = reader.GetInt32(2);
                        sip.urunAD = reader.GetString(3);
                        sip.urunADET = reader.GetInt32(4);
                        sip.urunFIYAT = reader.GetInt32(5);
                        sip.urunURETICI = reader.GetString(7);
                        sip.urunPAKET = reader.GetString(8);
                        sip.urunRESIM = reader.GetString(10);

                        sips.Add(sip);
                    }
                    connection.Close();
                }

                DateTime myDateTime2 = DateTime.Now;
                string sqlFormattedDate2 = myDateTime2.ToString("dd.MM.yyyy HH:mm");

                using (OleDbConnection connection2 = new OleDbConnection(path))
                {
                    connection2.Open();

                    foreach (siparis sip in sips) 
                    {
                        string sql2 = "INSERT INTO [orders] ([uye_id], [urun_id], [urun_ad], [urun_adet], [urun_fiyat], " +
                            "[urun_uretici], [urun_paket], [urun_resim], [aratoplam], [date]) " +
                            "VALUES (@uyeid, @urunid, @urunad, @urunadet, @urunfiyat, @urunuretici, @urunpaket, " +
                            "@urunresim, @aratoplam, @date)";

                        OleDbCommand command = new OleDbCommand(sql2, connection2);
                        command.Parameters.AddWithValue("@uyeid", sip.uyeID);
                        command.Parameters.AddWithValue("@urunid", sip.urunID);
                        command.Parameters.AddWithValue("@urunad", sip.urunAD);
                        command.Parameters.AddWithValue("@urunadet", sip.urunADET);
                        command.Parameters.AddWithValue("@urunfiyat", sip.urunFIYAT);
                        command.Parameters.AddWithValue("@urunuretici", sip.urunURETICI);
                        command.Parameters.AddWithValue("@urunpaket", sip.urunPAKET);
                        command.Parameters.AddWithValue("@urunresim", sip.urunRESIM);
                        command.Parameters.AddWithValue("@aratoplam", fiyat);
                        command.Parameters.AddWithValue("@date", Convert.ToDateTime(sqlFormattedDate2));
                        command.ExecuteNonQuery();
                    }
                    connection2.Close();
                }

                cmd3.CommandText = "UPDATE sepet SET siparis_durum = true WHERE uye_id = @uyeid53";
                cmd3.Parameters.AddWithValue("@uyeid53", Convert.ToInt32(hid_field_id.Value.ToString()));
                cmd3.ExecuteNonQuery();

                cmd2.CommandText = "DELETE FROM sepet WHERE uye_id = @uyeid28 AND siparis_durum = true";
                cmd2.Parameters.AddWithValue("@uyeid28", Convert.ToInt32(hid_field_id.Value.ToString()));
                cmd2.ExecuteNonQuery();

                conn.Close();

                lbl_sip_durum.Visible = true;
                lbl_sip_durum.Text = "Siparişiniz başarıyla kaydedildi. Siparişlerim kısmında göz atabilirsiniz.";

                HtmlMeta meta = new HtmlMeta();
                meta.HttpEquiv = "Refresh";
                meta.Content = "3;url=../user/profile.aspx?menu=2";
                this.Page.Controls.Add(meta);
            }
        }
    }
}