using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Drawing;

namespace website
{
    public partial class kayit_giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            div_kayit.Visible = false;
            div_giris.Visible = true;

            // user check
            object user = Session["userMail"];
            object adm = Session["adminlogin"];
            object comp = Session["compMail"];

            if (user != null)
            {
                Response.Redirect("index.aspx");
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


            warning_message.Visible = false;
            warning_message_kayit.Visible = false;
        }

        protected void btn_giris_Click(object sender, EventArgs e)
        {
            if (txb_mail.Text == "" || txb_pass.Text == "")
            {
                warning_message.Visible = true;
                lbl_warning.Text = "Lütfen gerekli alanları doldurunuz.";
            }
            else
            {
                try
                {
                    string veriyolu = new dbpath().yol();

                    OleDbConnection conn = new OleDbConnection(veriyolu);
                    conn.Open();

                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM users WHERE email = @email AND password = @password";

                    cmd.Parameters.AddWithValue("@email", txb_mail.Text);
                    cmd.Parameters.AddWithValue("@password", txb_pass.Text);

                    OleDbDataReader dr;

                    dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        if (Convert.ToInt32(dr["level"]) == 0)
                        {
                            Session.Timeout = 60;
                            Session.Add("userMail", txb_mail.Text);
                            Session.Add("k_id", dr["userid"].ToString());
                            Response.Redirect("index.aspx");
                            conn.Close();
                        }
                    }
                    else
                    {
                        warning_message.Visible = true;
                        lbl_warning.Text = "Şifre veya E-Posta uyuşmuyor.";
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    warning_message.Visible = true;
                    lbl_warning.Text = "Tekniksel Hata: " + ex.Message.ToString() + " > Lütfen admine bildiriniz veya bir süre sonra tekrar deneyiniz.";
                }
            }
        }

        protected void kayit_panel_toggle_Click(object sender, EventArgs e)
        {
            div_giris.Visible = false;
            div_kayit.Visible = true;
        }

        protected void giris_panel_toggle_Click(object sender, EventArgs e)
        {
            div_giris.Visible = true;
            div_kayit.Visible = false;
        }

        protected void btn_kaydet_Click(object sender, EventArgs e)
        {
            bool check_adsoyad;
            bool check_mail;
            bool check_sifre;
            bool check_number;
            bool check_adress;

            if (txb_ad.Text.Trim().Length < 2 || txb_soyad.Text.Trim().Length < 2)
            {
                warning_message_kayit.Visible = true;
                lbl_alert_header.Text = "Hata!";
                warning_message_kayit.CssClass = "alert alert-danger alert-dismissible mt-4 fade show";
                lbl_warning_kayit.Text = "Lütfen boş bırakmayınız. <br />";
                check_adsoyad = false;
                if (Page.IsPostBack)
                {
                    div_kayit.Visible = true;
                    div_giris.Visible = false;
                }
            }
            else
                check_adsoyad = true;

            if (txb_mail_kayit.Text.Trim() == "")
            {
                warning_message_kayit.Visible = true;
                lbl_alert_header.Text = "Hata!";
                warning_message_kayit.CssClass = "alert alert-danger alert-dismissible mt-4 fade show";
                lbl_warning_kayit.Text = "Lütfen mail adresini boş bırakmayınız. <br />";
                check_mail = false;
                if (Page.IsPostBack)
                {
                    div_kayit.Visible = true;
                    div_giris.Visible = false;
                }
            }
            else
                check_mail = true;

            if (txb_sifre_kayit.Text == "" || txb_sifreonay.Text == "")
            {
                warning_message_kayit.Visible = true;
                lbl_alert_header.Text = "Hata!";
                warning_message_kayit.CssClass = "alert alert-danger alert-dismissible mt-4 fade show";
                lbl_warning_kayit.Text = "Lütfen boş şifre yazmayınız. <br />";
                check_sifre = false;
                if (Page.IsPostBack)
                {
                    div_kayit.Visible = true;
                    div_giris.Visible = false;
                }
            }
            else if (txb_sifre_kayit.Text.Trim().Length < 5)
            {
                warning_message_kayit.Visible = true;
                lbl_alert_header.Text = "Hata!";
                warning_message_kayit.CssClass = "alert alert-danger alert-dismissible mt-4 fade show";
                lbl_warning_kayit.Text = "Şifre 5 karakterden küçük olamaz. <br />";
                check_sifre = false;
                if (Page.IsPostBack)
                {
                    div_kayit.Visible = true;
                    div_giris.Visible = false;
                }
            }

            else if (txb_sifre_kayit.Text != txb_sifreonay.Text)
            {
                warning_message_kayit.Visible = true;
                lbl_alert_header.Text = "Hata!";
                warning_message_kayit.CssClass = "alert alert-danger alert-dismissible mt-4 fade show";
                lbl_warning_kayit.Text = "Şifreler aynı değil. <br />";
                check_sifre = false;
                if (Page.IsPostBack)
                {
                    div_kayit.Visible = true;
                    div_giris.Visible = false;
                }
            }
            else
                check_sifre = true;

            if (txb_tel.Text.Length < 11)
            {
                warning_message_kayit.Visible = true;
                lbl_alert_header.Text = "Hata!";
                warning_message_kayit.CssClass = "alert alert-danger alert-dismissible mt-4 fade show";
                lbl_warning_kayit.Text = "Telefon numarası 11 karakterden küçük olamaz. <br />";
                check_number = false;
                if (Page.IsPostBack)
                {
                    div_kayit.Visible = true;
                    div_giris.Visible = false;
                }
            }
            else
                check_number = true;

            if (txb_adress.Text.Length < 15)
            {
                warning_message_kayit.Visible = true;
                lbl_alert_header.Text = "Hata!";
                warning_message_kayit.CssClass = "alert alert-danger alert-dismissible mt-4 fade show";
                lbl_warning_kayit.Text = "Adres 15 karakterden kısa olamaz. <br />";
                check_adress = false;
                if (Page.IsPostBack)
                {
                    div_kayit.Visible = true;
                    div_giris.Visible = false;
                }
            }
            else
                check_adress = true;

            if (check_adsoyad == true && check_mail == true && check_sifre == true && check_number == true && check_adress == true)
            {

                bool signup = true;

                try
                {
                    string veriyolu = new dbpath().yol();

                    OleDbConnection conn = new OleDbConnection(veriyolu);

                    OleDbCommand cmd_dr = new OleDbCommand();
                    OleDbCommand cmd_query = new OleDbCommand();

                    conn.Open();
                    cmd_dr.Connection = conn;

                    cmd_dr.CommandText = "SELECT * FROM users";

                    OleDbDataReader dr;
                    dr = cmd_dr.ExecuteReader();

                    while (dr.Read())
                    {
                        if (dr["email"].ToString() == txb_mail_kayit.Text)
                        {
                            div_kayit.Visible = true;
                            div_giris.Visible = false;

                            if (Page.IsPostBack)
                            {
                                warning_message_kayit.Visible = true;
                                lbl_alert_header.Text = "Hata!";
                                warning_message_kayit.CssClass = "alert alert-danger alert-dismissible mt-4 fade show";
                                lbl_warning_kayit.Text = "Bu mail ile daha önce kayıt olunmuş.<br />";
                                signup = false;
                                conn.Close();
                                break;
                            }
                        }
                    }

                    if (signup == true)
                    {
                        cmd_query.Connection = conn;

                        cmd_query.CommandText = "INSERT INTO users ([name], [surname], [password], [email], [phonenumber], [adress], [level]) VALUES (@ad, @soyad, @sifre, @mail, @telefon, @adres, 0)";

                        cmd_query.Parameters.AddWithValue("@ad", txb_ad.Text);
                        cmd_query.Parameters.AddWithValue("@soyad", txb_soyad.Text);
                        cmd_query.Parameters.AddWithValue("@sifre", txb_sifre_kayit.Text);
                        cmd_query.Parameters.AddWithValue("@mail", txb_mail_kayit.Text);
                        cmd_query.Parameters.AddWithValue("@telefon", txb_tel.Text);
                        cmd_query.Parameters.AddWithValue("@adres", txb_adress.Text);

                        cmd_query.ExecuteNonQuery();

                        if (Page.IsPostBack)
                        {
                            div_kayit.Visible = false;
                            div_giris.Visible = true;
                        }

                        warning_message.Visible = true;
                        lbl_alert_header.Text = "Kayıt başarılı!";
                        lbl_alert_header_giris.Text = "Kayıt başarılı";
                        warning_message.CssClass = "alert alert-success alert-dismissible mt-4 fade show";
                        lbl_warning.Text = "Başarıyla kayıt oldunuz.<br />";

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    warning_message.Visible = true;
                    lbl_warning.Text = "Tekniksel Hata: " + ex.Message.ToString() + " > Lütfen admine bildiriniz veya bir süre sonra tekrar deneyiniz.";
                }
            }
        }

        protected void company_panel_toggle_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/companies/company_login.aspx");
        }

        protected void link_to_admin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/systemlogin.aspx");
        }
    }
}