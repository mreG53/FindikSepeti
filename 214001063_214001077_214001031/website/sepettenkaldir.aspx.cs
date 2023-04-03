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
    public partial class sepettenkaldir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // urunu direkt kaldir
            object user = Session["userMail"];

            if (string.IsNullOrEmpty(Request.QueryString["urunkaldir"]))
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
                    string urunid = Request.QueryString["urunkaldir"];

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
                        OleDbCommand cmd3 = new OleDbCommand("DELETE FROM [sepet] WHERE islem_id = @islemid AND uye_id = @uyeid53 AND urun_id = @urunid53", conn);
                        cmd3.Parameters.AddWithValue("@islemid", islem_id);
                        cmd3.Parameters.AddWithValue("@uyeid53", uye_id);
                        cmd3.Parameters.AddWithValue("@urunid53", urun_id);
                        cmd3.ExecuteNonQuery();

                        OleDbDataAdapter da3 = new OleDbDataAdapter("SELECT * FROM shop where urun_id = " + urun_id, conn);
                        DataTable dt3 = new DataTable();
                        da3.Fill(dt3);
                        repeater.DataSource = dt3;
                        repeater.DataBind();

                        lbl_control.Text = "Bu ürün sepetinizden kaldırıldı.";

                        conn.Close();

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
            }
        }
    }
}