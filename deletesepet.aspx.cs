using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace website
{
    public partial class deletesepet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // urun sil
            object user = Session["userMail"];

            if (string.IsNullOrEmpty(Request.QueryString["urunsil"]))
            {
                Response.Redirect("~/user/profile.aspx?menu=5");
            }
            else
            {
                if (user == null)
                {
                    lbl_control.Text = "Giriş yapmadan devam edemezsiniz. Giriş sayfasına yönlendiriliyorsunuz.";
                    HtmlMeta meta = new HtmlMeta();
                    meta.HttpEquiv = "Refresh";
                    meta.Content = "3;url=giris.aspx";
                    this.Page.Controls.Add(meta);
                }
                else
                {
                    string urunid = Request.QueryString["urunsil"];

                    int urun_id = Convert.ToInt16(urunid);
                    int uye_id = Convert.ToInt16(Session["k_id"]);
                    string yol = new dbpath().yol();
                    OleDbConnection conn = new OleDbConnection(yol);
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand("SELECT * FROM sepet where uye_id = @uyeid AND urun_id = @urunid", conn);
                    cmd.Parameters.AddWithValue("@uyeid", uye_id);
                    cmd.Parameters.AddWithValue("@urunid", urun_id);
                    OleDbDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        int islem_id = Convert.ToInt16(dr["islem_id"]);

                        int count = 0;
                        count = Convert.ToInt16(dr["urun_adet"]);
                        if (count > 0)
                        {
                            count--;

                            OleDbCommand cmd2 = new OleDbCommand("UPDATE [sepet] SET [urun_adet] = @uruncount WHERE [uye_id] = @uyeidi AND [urun_id] = @urunidsi", conn);
                            cmd2.Parameters.AddWithValue("@uruncount", count);
                            cmd2.Parameters.AddWithValue("@uyeidi", uye_id);
                            cmd2.Parameters.AddWithValue("@urunidsi", urun_id);
                            cmd2.ExecuteNonQuery();

                            OleDbDataAdapter da = new OleDbDataAdapter("SELECT * FROM shop where urun_id = " + urun_id, conn);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            repeater.DataSource = dt;
                            repeater.DataBind();

                            lbl_control.Text = "Bu ürün sepetinizde " + dr["urun_adet"].ToString() + " adet vardı. 1 adet silindi.";

                            if (count == 0)
                            {
                                count = 0;

                                OleDbCommand cmd3 = new OleDbCommand("DELETE FROM [sepet] WHERE islem_id = @islemid AND uye_id = @uyeid53 AND urun_id = @urunid53", conn);
                                cmd3.Parameters.AddWithValue("@islemid", islem_id);
                                cmd3.Parameters.AddWithValue("@uyeid53", uye_id);
                                cmd3.Parameters.AddWithValue("@urunid53", urun_id);
                                cmd3.ExecuteNonQuery();

                                OleDbDataAdapter da2 = new OleDbDataAdapter("SELECT * FROM shop where urun_id = " + urun_id, conn);
                                DataTable dt2 = new DataTable();
                                da2.Fill(dt2);
                                repeater.DataSource = dt;
                                repeater.DataBind();

                                lbl_control.Text = "Bu ürün sepetinizde " + dr["urun_adet"].ToString() + " adet vardı. 1 adet silindi.";
                            }
                            conn.Close();

                            //HtmlMeta meta = new HtmlMeta();
                            //meta.HttpEquiv = "Refresh";
                            //meta.Content = "3;url=../user/profile.aspx?menu=5";
                            //this.Page.Controls.Add(meta);

                            Response.Redirect(Request.UrlReferrer.ToString());

                        }
                        else
                        {
                            lbl_control.Text = "Bu ürün zaten sepetinizde yok.";
                            HtmlMeta meta = new HtmlMeta();
                            meta.HttpEquiv = "Refresh";
                            meta.Content = "3;url=../user/profile.aspx?menu=5";
                            this.Page.Controls.Add(meta);
                        }
                    }
                    else
                    {
                        lbl_control.Text = "Veritabanı sorunu.";
                        HtmlMeta meta = new HtmlMeta();
                        meta.HttpEquiv = "Refresh";
                        meta.Content = "3;url=../user/profile.aspx?menu=5";
                        this.Page.Controls.Add(meta);
                    }
                }
            }
        }
    }
}