using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Drawing;
using System.Web.UI.HtmlControls;

namespace website
{
    public partial class formsender : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //user check
            object user = Session["userMail"];

            if (user != null)
            {
                lbl_ad.Visible = false;
                txb_ad.Visible = false;
                lbl_soyad.Visible = false;
                txb_soyad.Visible = false;
                lbl_eposta.Visible = false;
                txb_eposta.Visible = false;
                lbl_numara.Visible = false;
                txb_numara.Visible = false;

                kilo.CssClass = "col-md-12";

            }

            string queryString = Request.QueryString["companies"];

            if (queryString == null)
            {
                Response.Redirect("index.aspx");
            }

            if (queryString == "kumbetli")
            {
                img_banner.ImageUrl = "~/images/kumbetli.png";
                hidden_router.Value = "kumbetli";
            }
            else if (queryString == "fisko")
            {
                img_banner.ImageUrl = "~/images/fiskobirlik.png";
                hidden_router.Value = "fiskobirlik";
            }
            else if (queryString == "ada")
            {
                img_banner.ImageUrl = "~/images/adafindik.png";
                hidden_router.Value = "ada";
            }
        }

        protected void btn_sender_Click(object sender, EventArgs e)
        {
            bool[] wrongs = new bool[5];

            wrongs[0] = false; wrongs[1] = false; wrongs[2] = false;
            wrongs[3] = false; wrongs[4] = false;

            if (txb_ad.Text == "" || txb_soyad.Text == "")
            {
                wrongs[0] = true;
                lbl_hata.Visible = true;
                lbl_hata.Text = "Lütfen isim ve soyismi boş bırakmayınız.";
            }
            else
                wrongs[0] = false;


            if (txb_eposta.Text == "")
            {
                wrongs[1] = true;
                lbl_hata.Visible = true;
                lbl_hata.Text = "Lütfen E-Postayı boş bırakmayınız.";
            }
            else
                wrongs[1] = false;


            if (txb_numara.Text.Trim().Length < 11)
            {
                wrongs[2] = true;
                lbl_hata.Visible = true;
                lbl_hata.Text = "Lütfen numara kısmını boş bırakmayınız.";
            }
            else
                wrongs[2] = false;


            if (txb_adres.Text.Length < 15)
            {
                wrongs[3] = true;
                lbl_hata.Visible = true;
                lbl_hata.Text = "Lütfen adres kısmını en az 15 karakter olacak şekilde yazınız.";
            }
            else
                wrongs[3] = false;

            if (Convert.ToInt16(txb_kilo.Text) <= 0)
            {
                wrongs[4] = true;
                lbl_hata.Visible = true;
                lbl_hata.Text = "Lütfen doğru formatta kilo giriniz.";
            }
            else
                wrongs[4] = false;

            string yol = new dbpath().yol();

            OleDbConnection conn = new OleDbConnection(yol);
            conn.Open();
            object user = Session["userMail"];
            string alici_name = hidden_router.Value.ToString();
            string alici_id = "";

            OleDbCommand cmd = new OleDbCommand();
            OleDbCommand cmd2 = new OleDbCommand();
            OleDbCommand cmd3 = new OleDbCommand();
            cmd.Connection = conn;
            cmd2.Connection = conn;
            cmd3.Connection = conn;

            //giriş yapılmış
            if (lbl_ad.Visible == false && txb_ad.Visible == false && lbl_soyad.Visible == false && txb_soyad.Visible == false && lbl_eposta.Visible == false &&
            txb_eposta.Visible == false && lbl_numara.Visible == false && txb_numara.Visible == false)
            {
                if (wrongs[3] == false && wrongs[4] == false)
                {
                    if (user != null)
                    {
                        cmd2.CommandText = "SELECT * FROM [companies] WHERE c_name = @companyname";
                        cmd2.Parameters.AddWithValue("@companyname", alici_name);

                        OleDbDataReader dr = cmd2.ExecuteReader();

                        if (dr.Read())
                        {
                            if (alici_name == dr["c_name"].ToString())
                            {
                                alici_id = dr["c_id"].ToString();
                            }
                        }

                        cmd3.CommandText = "SELECT * FROM [users] WHERE email = @email";
                        cmd3.Parameters.AddWithValue("@email", user.ToString());

                        OleDbDataReader dr2 = cmd3.ExecuteReader();

                        string satici_id = "";
                        string satici_name = "";
                        string satici_surname = "";
                        string satici_phone = "";

                        if (dr2.Read())
                        {
                            if (user.ToString() == dr2["email"].ToString())
                            {
                                satici_id = dr2["userid"].ToString();
                                satici_name = dr2["name"].ToString();
                                satici_surname = dr2["surname"].ToString();
                                satici_phone = dr2["phonenumber"].ToString();
                            }
                        }

                        cmd.CommandText = "INSERT INTO [process] (satici_id, satici_adi, satici_soyadi, alici_id, alici_adi, " +
                                "satici_eposta, satici_numara, satici_kilo, satici_adres) " +
                                "VALUES (@sid, @adi, @soyadi, @aliciid, @aliciadi, @seposta, @snumara, @skilo, @sadres)";

                        cmd.Parameters.AddWithValue("@sid", satici_id);
                        cmd.Parameters.AddWithValue("@adi", satici_name);
                        cmd.Parameters.AddWithValue("@soyadi", satici_surname);
                        cmd.Parameters.AddWithValue("@aliciid", alici_id);
                        cmd.Parameters.AddWithValue("@aliciadi", alici_name);
                        cmd.Parameters.AddWithValue("@seposta", user.ToString());
                        cmd.Parameters.AddWithValue("@snumara", satici_phone);
                        cmd.Parameters.AddWithValue("@skilo", txb_kilo.Text);
                        cmd.Parameters.AddWithValue("@sadres", txb_adres.Text);

                        cmd.ExecuteNonQuery();

                        lbl_hata.Visible = true;
                        lbl_hata.CssClass = "mt-2 fw-bold text-bg-success";
                        lbl_hata.Text = "Başarıyla gönderildi. " + hidden_router.Value.ToString().ToUpper() + " A.Ş.'den  yanıt bekleyiniz.";

                        HtmlMeta meta = new HtmlMeta();
                        meta.HttpEquiv = "Refresh";
                        meta.Content = "3;url=alimsatim.aspx";
                        this.Page.Controls.Add(meta);

                        conn.Close();
                    }
                }
            }

            //giriş yapılmamış

            if (wrongs[0] == false && wrongs[1] == false && wrongs[2] == false && wrongs[3] == false && wrongs[4] == false)
            {
                if (user == null)
                {
                    cmd2.CommandText = "SELECT * FROM [companies] WHERE c_name = @companyname";
                    cmd2.Parameters.AddWithValue("@companyname", alici_name);

                    OleDbDataReader dr = cmd2.ExecuteReader();

                    if (dr.Read())
                    {
                        if (alici_name == dr["c_name"].ToString())
                        {
                            alici_id = dr["c_id"].ToString();
                        }
                    }

                    cmd.CommandText = "INSERT INTO [process] (satici_id, satici_adi, satici_soyadi, alici_id, alici_adi, " +
                        "satici_eposta, satici_numara, satici_kilo, satici_adres) " +
                        "VALUES ('kayitsiz', @adi, @soyadi, @aliciid, @aliciadi, @seposta, @snumara, @skilo, @sadres)";

                    cmd.Parameters.AddWithValue("@adi", txb_ad.Text);
                    cmd.Parameters.AddWithValue("@soyadi", txb_soyad.Text);
                    cmd.Parameters.AddWithValue("@aliciid", alici_id);
                    cmd.Parameters.AddWithValue("@aliciadi", alici_name);
                    cmd.Parameters.AddWithValue("@seposta", txb_eposta.Text);
                    cmd.Parameters.AddWithValue("@snumara", txb_numara.Text);
                    cmd.Parameters.AddWithValue("@skilo", txb_kilo.Text);
                    cmd.Parameters.AddWithValue("@sadres", txb_adres.Text);

                    cmd.ExecuteNonQuery();

                    lbl_hata.Visible = true;
                    lbl_hata.CssClass = "mt-2 fw-bold text-bg-success";
                    lbl_hata.Text = "Başarıyla gönderildi. " + hidden_router.Value.ToString().ToUpper() + " A.Ş.'den  yanıt bekleyiniz.";

                    HtmlMeta meta = new HtmlMeta();
                    meta.HttpEquiv = "Refresh";
                    meta.Content = "3;url=alimsatim.aspx";
                    this.Page.Controls.Add(meta);

                    conn.Close();
                }
            }
        }
    }
}