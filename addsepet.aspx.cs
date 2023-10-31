using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Text;
using System.Threading;
using System.Web.UI.HtmlControls;

namespace website
{
    public partial class addsepet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            object user = Session["userMail"];

            // urun ekle
            if (string.IsNullOrEmpty(Request.QueryString["urun"]))
            {
                Response.Redirect("~/magaza.aspx");
            }
            else
            {
                if (user == null)
                {
                    lbl_control.Text = "Giriş yapmadan devam edemezsiniz. Giriş sayfasına yönlendiriliyorsunuz.";
                    pnl_urun.Visible = false;
                    HtmlMeta meta = new HtmlMeta();
                    meta.HttpEquiv = "Refresh";
                    meta.Content = "3;url=giris.aspx";
                    this.Page.Controls.Add(meta);
                }
                else
                {
                    string urunid = Request.QueryString["urun"];

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
                        int count = 0;
                        count = Convert.ToInt16(dr["urun_adet"]);
                        count++;
                        if (count <= 5)
                        {
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

                            lbl_control.Text = "Bu ürün sepetinizde " + dr["urun_adet"].ToString() + " adet var. 1 Adet daha eklendi.";
                            pnl_urun.Visible = true;
                            conn.Close();

                                HtmlMeta meta = new HtmlMeta();
                                meta.HttpEquiv = "Refresh";
                                meta.Content = "2;url=" + Request.UrlReferrer.ToString();
                                this.Page.Controls.Add(meta);

                    }
                        else
                        {
                            lbl_control.Text = "Bir üründen en fazla 5 adet ekleyebilirsiniz.";
                            pnl_urun.Visible = false;
                            HtmlMeta meta = new HtmlMeta();
                            meta.HttpEquiv = "Refresh";
                            meta.Content = "3;url=" + Request.UrlReferrer.ToString();
                            this.Page.Controls.Add(meta);
                        }
                    }
                    else
                    {
                        OleDbCommand cmd3 = new OleDbCommand();
                        cmd3.Connection = conn;

                        cmd3.CommandText = "SELECT * FROM shop where urun_id = @urunid3";
                        cmd3.Parameters.AddWithValue("@urunid3", urun_id);

                        OleDbDataReader dataRead = cmd3.ExecuteReader();

                        if (dataRead.Read())
                        {

                            OleDbCommand cmd2 = new OleDbCommand("INSERT INTO [sepet] ([uye_id], [urun_id], [urun_ad], [urun_fiyat], [urun_uretici], [urun_paket], " +
                             "[urun_kategori], [urun_resim]) VALUES (@uyeid2, @urunid2, @urun_ad2, @urun_fiyat2, @urun_uretici2, @urun_paket2, " +
                             "@urun_kategori2, @urun_resim2)", conn);
                            cmd2.Parameters.AddWithValue("@uyeid2", uye_id);
                            cmd2.Parameters.AddWithValue("@urunid2", urun_id);
                            cmd2.Parameters.AddWithValue("@urun_ad2", dataRead["urun_ad"].ToString());
                            cmd2.Parameters.AddWithValue("@urun_fiyat2", Convert.ToInt16(dataRead["urun_fiyat"]));
                            cmd2.Parameters.AddWithValue("@urun_uretici2", dataRead["urun_uretici"].ToString());
                            cmd2.Parameters.AddWithValue("@urun_paket2", dataRead["urun_paket"].ToString());
                            cmd2.Parameters.AddWithValue("@urun_kategori2", dataRead["urun_kategori"].ToString());
                            cmd2.Parameters.AddWithValue("@urun_resim2", dataRead["urun_resim"].ToString());
                            cmd2.ExecuteNonQuery();
                        }

                        lbl_control.Text = "Ürün sepetinize eklendi.";
                        pnl_urun.Visible = true;

                        OleDbDataAdapter da = new OleDbDataAdapter("SELECT * FROM shop where urun_id = " + urun_id, conn);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        repeater.DataSource = dt;
                        repeater.DataBind();

                        conn.Close();

                        HtmlMeta meta = new HtmlMeta();
                        meta.HttpEquiv = "Refresh";
                        meta.Content = "3;url=magaza.aspx";
                        this.Page.Controls.Add(meta);
                    }
                }
            }
        }
    }
}