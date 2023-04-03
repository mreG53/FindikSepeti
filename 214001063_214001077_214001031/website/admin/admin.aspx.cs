using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace website.admin
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pnl_isletmeler.Visible = true;
            pnl_uyeler.Visible = false;
            pnl_iletisim.Visible = false;
            pnl_process.Visible = false;
            pnl_urunekle.Visible = false;

            string getQueryString = Request.QueryString["menu"];

            if (getQueryString == "isletmeler")
            {
                pnl_isletmeler.Visible = true;
                pnl_uyeler.Visible = false;
                pnl_iletisim.Visible = false;
                pnl_process.Visible = false;
                pnl_urunekle.Visible = false;
            }

            else if (getQueryString == "kullanicilar")
            {
                pnl_isletmeler.Visible = false;
                pnl_uyeler.Visible = true;
                pnl_iletisim.Visible = false;
                pnl_process.Visible = false;
                pnl_urunekle.Visible = false;
            }

            else if (getQueryString == "iletisim")
            {
                pnl_isletmeler.Visible = false;
                pnl_uyeler.Visible = false;
                pnl_iletisim.Visible = true;
                pnl_process.Visible = false;
                pnl_urunekle.Visible = false;
            }
            else if (getQueryString == "islemdekiurunler")
            {
                pnl_isletmeler.Visible = false;
                pnl_uyeler.Visible = false;
                pnl_iletisim.Visible = false;
                pnl_process.Visible = true;
                pnl_urunekle.Visible = false;
            }
            else if (getQueryString == "urunekle")
            {
                pnl_isletmeler.Visible = false;
                pnl_uyeler.Visible = false;
                pnl_iletisim.Visible = false;
                pnl_process.Visible = false;
                pnl_urunekle.Visible = true;
            }

            object user = Session["userMail"];
            if (user != null)
            {
                Session.Abandon();
                Response.Redirect("~/index.aspx");
            }
            object adm = Session["adminlogin"];

            if (adm != null)
            {
                lbl_welcome_admin.Text = "Hoşgeldiniz admin " + adm.ToString();
            }
            else
            {
                Session.Abandon();
                Response.Redirect("~/index.aspx");
            }
        }

        protected void btn_signout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }

        protected void btn_isletmeler_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx?menu=isletmeler");
        }

        protected void btn_kullanicilist_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx?menu=kullanicilar");
        }

        protected void btn_gonderilenformlar_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx?menu=iletisim");
        }

        protected void btn_islemdekiurunler_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx?menu=islemdekiurunler");
        }

        protected void btn_yeniurun_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx?menu=urunekle");
        }

        protected void btn_ekle_Click(object sender, EventArgs e)
        {
            bool urun_ad_hata = false;
            bool urun_aciklama_hata = false;
            bool urun_oncekifiyat_hata = false;
            bool urun_fiyat_hata = false;
            bool urun_uretici_hata = false;
            bool urun_stok_hata = false;


            if (txb_urun_ad.Text.Trim().Length < 3)
            {
                urun_ad_hata = true;
                lbl_hata.Text = "Lütfen ürün adını 3 karakterden fazla yazınız.";
            }
            else
                urun_ad_hata = false;

            if (txb_urun_aciklama.Text.Length < 4)
            {
                urun_ad_hata = true;
                lbl_hata.Text = "Lütfen açıklamayı 4 karakterden fazla yazınız.";
            }
            else
                urun_aciklama_hata = false;

            if (txb_urun_onceki_fiyat.Text == "")
            {
                urun_oncekifiyat_hata = true;
                lbl_hata.Text = "Lütfen önceki fiyat giriniz.";
            }
            else
                urun_oncekifiyat_hata = false;

            if (txb_urun_fiyat.Text == "")
            {
                urun_fiyat_hata = true;
                lbl_hata.Text = "Lütfen fiyat giriniz.";
            }
            else
                urun_fiyat_hata = false;

            if (txb_urun_uretici.Text.Trim().Length < 3)
            {
                urun_uretici_hata = true;
                lbl_hata.Text = "Lütfen ürün üretici Giriniz";
            }
            else
                urun_uretici_hata = false;

            if (txb_stok.Text.Trim() == "")
            {
                urun_stok_hata = true;
                lbl_hata.Text = "Lütfen ürün stok giriniz.";
            }
            else
                urun_stok_hata = false;

            if (urun_ad_hata == false && urun_aciklama_hata == false && urun_oncekifiyat_hata == false && urun_fiyat_hata == false &&
            urun_uretici_hata == false && urun_stok_hata == false)
            {
                if (upload_image.HasFile)
                {
                    if (upload_image.PostedFile.ContentType == "image/png" || upload_image.PostedFile.ContentType == "image/jpg" || upload_image.PostedFile.ContentType == "image/jpeg")
                    {
                        if (upload_image.PostedFile.ContentLength < 4194304)
                        {
                            string file = upload_image.FileName.ToString();

                            if (file != null)
                            {
                                try
                                {
                                    upload_image.SaveAs(Server.MapPath("~/urun/") + file);

                                    string yol = new dbpath().yol();
                                    OleDbConnection conn = new OleDbConnection(yol);
                                    conn.Open();
                                    OleDbCommand cmd = new OleDbCommand();
                                    cmd.Connection = conn;
                                    cmd.CommandText = "INSERT INTO [shop] ([urun_ad], [urun_aciklama], [urun_oncekifiyat], [urun_fiyat], [urun_uretici], " +
                                        "[urun_paket], [urun_stok], [urun_kategori], [urun_resim]) " +
                                        "VALUES (@urunad, @urunaciklama, @urunoncekifiyat, @urunfiyat, @urunuretici, @urunpaket, @urunstok, " +
                                        "@urunkategori, @urunresim)";

                                    cmd.Parameters.AddWithValue("@urunad", txb_urun_ad.Text);
                                    cmd.Parameters.AddWithValue("@urunaciklama", txb_urun_aciklama.Text);
                                    cmd.Parameters.AddWithValue("@urunoncekifiyat", txb_urun_onceki_fiyat.Text);
                                    cmd.Parameters.AddWithValue("@urunfiyat", Convert.ToInt32(txb_urun_fiyat.Text));
                                    cmd.Parameters.AddWithValue("@urunuretici", txb_urun_uretici.Text);
                                    cmd.Parameters.AddWithValue("@urunpaket", dd_paket_list.SelectedValue.ToString());
                                    cmd.Parameters.AddWithValue("@urunstok", Convert.ToInt16(txb_stok.Text));
                                    cmd.Parameters.AddWithValue("@urunkategori", dd_kategori_list.SelectedValue.ToString());
                                    cmd.Parameters.AddWithValue("@urunresim", file);

                                    cmd.ExecuteNonQuery();

                                    lbl_hata.CssClass = "mt-2 fw-bold text-bg-success";
                                    lbl_hata.Text = "Ürün Başarıyla Eklendi.";

                                    txb_stok.Text = null;
                                    txb_urun_aciklama.Text = null;
                                    txb_urun_ad.Text = null;
                                    txb_urun_fiyat.Text = null;
                                    txb_urun_onceki_fiyat.Text = null;
                                    txb_urun_uretici.Text = null;

                                    conn.Close();

                                }
                                catch (Exception ex)
                                {
                                    Response.Write(ex.ToString());
                                }
                            }
                        }
                        else
                            lbl_hata.Text = "4 MB üstünde resimler kabul edilmiyor. Lütfen daha düşük boyutlu resim seçiniz veya renderlayınız.";
                    }
                    else
                        lbl_hata.Text = "PNG, JPG ve JPEG dışındaki resim formatları kabul edilmemektedir.";
                }
            }
        }

        protected void btn_sil_Click(object sender, EventArgs e)
        {
            if (GridView3.SelectedIndex == -1)
            {
                Response.Write("<script>alert('Lütfen bir işlem seçiniz.');</script>");
            }
            else
            {
                string veriyolu = new dbpath().yol();
                OleDbConnection conn = new OleDbConnection(veriyolu);
                conn.Open();

                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = conn;

                int a = Convert.ToInt16(lbl_secilenid.Text);
                cmd.CommandText = "DELETE FROM contact where f_id = @fid";
                cmd.Parameters.AddWithValue("@fid", a);

                cmd.ExecuteNonQuery();

                lbl_text.Text = "Silindi. ID = ";

                HtmlMeta meta = new HtmlMeta();
                meta.HttpEquiv = "Refresh";
                meta.Content = "2;url=" + Request.UrlReferrer.ToString();
                this.Page.Controls.Add(meta);

            }
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbl_secilenid.Text = GridView3.SelectedValue.ToString();
        }
    }
}