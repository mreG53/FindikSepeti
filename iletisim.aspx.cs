using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website
{
    public partial class iletisim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Fındık Sepeti - İletişim";

            // user check
            object user = Session["userMail"];

            if (user != null)
            {

                string getstr = user.ToString();

                lbl_ad_soyad.Visible = false;
                txt_form_ad_soyad.Visible = false;
                lbl_eposta.Visible = false;
                txt_form_eposta.Visible = false;

                string veriyolu = new dbpath().yol();

                OleDbConnection conn = new OleDbConnection(veriyolu);
                conn.Open();

                OleDbCommand cmd = new OleDbCommand();

                cmd.Connection = conn;

                cmd.CommandText = "SELECT name,surname,email FROM users Where email = @ssmail";
                cmd.Parameters.AddWithValue("@ssmail", getstr);

                OleDbDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    hid_field_name.Value = dr["name"].ToString() + " " + dr["surname"].ToString();
                    hid_field_mail.Value = getstr;
                }
                else
                    Response.Write("<script>alert('Veriler okunurken hata oluştu.');</script>");

                conn.Close();
            }
            else
            {
                lbl_ad_soyad.Visible = true;
                txt_form_ad_soyad.Visible = true;
                lbl_eposta.Visible = true;
                txt_form_eposta.Visible = true;
            }
        }

        protected void btn_gönder_Click(object sender, EventArgs e)
        {
            if (txt_form_ad_soyad.Text.Trim().Length < 1)
                lbl_ad_soyad_hata.Visible = true;
            else
                lbl_ad_soyad_hata.Visible = false;

            if (txt_form_eposta.Text.Trim().Length < 1)
                lbl_esposta_hata.Visible = true;
            else
                lbl_esposta_hata.Visible = false;

            if (txt_form_msjkonu.Text.Trim().Length < 1)
                lbl_msjkonu_hata.Visible = true;
            else
                lbl_msjkonu_hata.Visible = false;

            if (txb_msg.Text.Trim().Length < 5)
                lbl_msg_hata.Visible = true;
            else
                lbl_msg_hata.Visible = false;

            object user = Session["userMail"];
            string veriyolu = new dbpath().yol();
            OleDbConnection conn = new OleDbConnection(veriyolu);
            OleDbCommand cmd = new OleDbCommand();

            // giriş yapılmış
            if (txt_form_ad_soyad.Visible == false && txt_form_eposta.Visible == false)
            {

                lbl_ad_soyad_hata.Visible = false;
                lbl_esposta_hata.Visible = false;

                try
                {
                    if (lbl_msjkonu_hata.Visible == false && lbl_msg_hata.Visible == false)
                    {
                        if (user != null)
                        {
                            conn.Open();

                            cmd.Connection = conn;
                            cmd.CommandText = "INSERT INTO contact (f_adsoyad, f_mail, f_konu, f_msj) VALUES (@adsoyad, @mail, @konu, @msj) ";

                            cmd.Parameters.AddWithValue("@adsoyad", hid_field_name.Value.ToString());
                            cmd.Parameters.AddWithValue("@mail", hid_field_mail.Value.ToString());
                            cmd.Parameters.AddWithValue("@konu", txt_form_msjkonu.Text);
                            cmd.Parameters.AddWithValue("@msj", txb_msg.Text);

                            cmd.ExecuteNonQuery();

                            lbl_msg_hata.Visible = true;
                            lbl_msg_hata.CssClass = "fw-bold text-success yazidurum";
                            lbl_msg_hata.Text = "Başarıyla mesajınız yollandı. Geri dönüş bekleyiniz.";

                            System.Threading.Thread.Sleep(500);

                            txt_form_ad_soyad.Text = "";
                            txt_form_eposta.Text = "";
                            txt_form_msjkonu.Text = "";
                            txb_msg.Text = "";
                        }

                    }

                }

                catch (Exception ex)
                {
                    lbl_msg_hata.Visible = true;
                    lbl_msg_hata.Text = ex.ToString();
                }
                finally
                {
                    conn.Close();
                }

            }

            // giriş yapılmamış
            if (txt_form_ad_soyad.Visible == true && txt_form_eposta.Visible == true)
            {
                if (lbl_ad_soyad_hata.Visible == false && lbl_esposta_hata.Visible == false && lbl_msjkonu_hata.Visible == false && lbl_msg_hata.Visible == false)
                {
                    if (user == null)
                    {
                        try
                        {
                            conn.Open();

                            cmd.Connection = conn;
                            cmd.CommandText = "INSERT INTO contact (f_adsoyad, f_mail, f_konu, f_msj) VALUES (@adsoyad, @mail, @konu, @msj) ";

                            cmd.Parameters.AddWithValue("@adsoyad", txt_form_ad_soyad.Text);
                            cmd.Parameters.AddWithValue("@mail", txt_form_eposta.Text);
                            cmd.Parameters.AddWithValue("@konu", txt_form_msjkonu.Text);
                            cmd.Parameters.AddWithValue("@msj", txb_msg.Text);

                            cmd.ExecuteNonQuery();

                            lbl_msg_hata.Visible = true;
                            lbl_msg_hata.CssClass = "fw-bold text-success yazidurum";
                            lbl_msg_hata.Text = "Başarıyla mesajınız yollandı. Geri dönüş bekleyiniz.";

                            System.Threading.Thread.Sleep(500);

                            txt_form_ad_soyad.Text = "";
                            txt_form_eposta.Text = "";
                            txt_form_msjkonu.Text = "";
                            txb_msg.Text = "";
                        }
                        catch (Exception ex)
                        {
                            lbl_msg_hata.Visible = true;
                            lbl_msg_hata.Text = ex.ToString();
                        }
                        finally
                        {
                            conn.Close();
                        }
                    }
                }
            }
        }
        protected void btn_temizle_Click(object sender, EventArgs e)
        {
            txb_msg.Text = null;
            txt_form_ad_soyad.Text = null;
            txt_form_eposta.Text = null;
            txt_form_msjkonu.Text = null;
        }
    }
}