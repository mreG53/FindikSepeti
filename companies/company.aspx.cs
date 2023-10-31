using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Threading;
using System.Web.UI.HtmlControls;

namespace website.companies
{
    public partial class company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //user check
            object user = Session["userMail"];
            object adm = Session["adminlogin"];
            object comp = Session["compMail"];

            string req = Request.QueryString["menu"];

            if (req == "1")
            {
                Page.Title = "İşletme-> Bilgiler";

                pnl_companyinfo.Visible = true;
                pnl_progress.Visible = false;
                pnl_alinanurunler.Visible = false;
            }
            if (req == "2")
            {
                Page.Title = "İşletme-> İşlemdeki Ürünler";

                pnl_companyinfo.Visible = false;
                pnl_progress.Visible = true;
                pnl_alinanurunler.Visible = false;
            }
            if (req == "3")
            {
                Page.Title = "İşletme-> Alınan Ürünler";

                pnl_companyinfo.Visible = false;
                pnl_progress.Visible = false;
                pnl_alinanurunler.Visible = true;
            }

            if (user != null)
            {
                Session.Abandon();
                Response.Redirect("~/giris.aspx");
            }

            if (adm != null)
            {
                Response.Write("<script>alert('Admin buraya girmek için tasarlanmadı.');</script>");
                Response.Redirect("~/index.aspx");
            }
            if (comp == null)
            {
                Response.Write("<script>alert('Giriş yaptığınız için bu sayfası görüntüleyemiyorsunuz.');</script>");
                Response.Redirect("~/index.aspx");
            }
            else
            {
                string a = comp.ToString();
                string veriyolu = new dbpath().yol();

                OleDbConnection conn = new OleDbConnection(veriyolu);
                conn.Open();

                OleDbCommand cmd2 = new OleDbCommand();

                cmd2.Connection = conn;
                cmd2.CommandText = "SELECT * FROM [companies] WHERE [c_mail] = @ccmail";
                cmd2.Parameters.AddWithValue("@ccmail", a);

                OleDbDataReader dr2;
                dr2 = cmd2.ExecuteReader();

                if (dr2.Read())
                {
                    if (a == dr2["c_mail"].ToString())
                    {
                        hid_field_query_for_sql.Text = dr2["c_name"].ToString();
                        img_company.ImageUrl = "~/images/" + dr2["image_path"].ToString();
                    }
                }

                //check rows
                OleDbCommand cmd3 = new OleDbCommand();
                cmd3.Connection = conn;

                cmd3.CommandText = "SELECT * FROM process WHERE alici_adi = @sirketadi AND as_ticaret = false";
                cmd3.Parameters.AddWithValue("@sirketadi", hid_field_query_for_sql.Text);

                OleDbDataReader dr3 = cmd3.ExecuteReader();
                if(dr3.HasRows)
                {
                    pnl_checkrows.Visible = false;
                    pnl_islembuttons.Visible = true;
                }                 
                else
                {
                    pnl_checkrows.Visible = true;
                    pnl_islembuttons.Visible = false;
                }
                //check rows end

                //check rows for get
                OleDbCommand cmd4 = new OleDbCommand();
                cmd4.Connection = conn;

                cmd4.CommandText = "SELECT * FROM process WHERE alici_adi = @sirketadi AND as_ticaret = true";
                cmd4.Parameters.AddWithValue("@sirketadi", hid_field_query_for_sql.Text);

                OleDbDataReader dr4 = cmd4.ExecuteReader();
                if (dr4.HasRows)
                {
                    pnl_checkrows_for_get.Visible = false;
                    pnl_islembuttons_for_get.Visible = true;
                }
                else
                {
                    pnl_checkrows_for_get.Visible = true;
                    pnl_islembuttons_for_get.Visible = false;
                }
                //check rows for get end


                conn.Close();
            }

            string getstr = comp.ToString();

            //veri çek
            if (!Page.IsPostBack)
            {
                try
                {
                    string veriyolu = new dbpath().yol();
                    OleDbConnection conn = new OleDbConnection(veriyolu);

                    conn.Open();

                    OleDbCommand cmd = new OleDbCommand();

                    cmd.Connection = conn;

                    cmd.CommandText = "SELECT c_headername, as_text, as_price FROM companies where c_mail = @cmail";

                    cmd.Parameters.AddWithValue("@cmail", getstr);

                    OleDbDataReader dr;
                    dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        txb_companyname.Text = dr["c_headername"].ToString();
                        txb_metin.Text = dr["as_text"].ToString();
                        txb_priceinfo.Text = dr["as_price"].ToString();
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    lbl_header.Text = ex.ToString();
                }
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {

            object comp = Session["compMail"];
            string getstr = comp.ToString();

            // update
            try
            {
                string veriyolu = new dbpath().yol();

                OleDbConnection conn = new OleDbConnection(veriyolu);

                conn.Open();

                OleDbCommand cmd = new OleDbCommand();

                cmd.Connection = conn;

                cmd.CommandText = "UPDATE [companies] SET c_headername = @chname, " +
                "as_text = @astext, " +
                "as_price = @asprice " +
                "WHERE c_mail = @cmail";

                cmd.Parameters.AddWithValue("@chname", txb_companyname.Text);
                cmd.Parameters.AddWithValue("@astext", txb_metin.Text);
                cmd.Parameters.AddWithValue("@asprice", txb_priceinfo.Text);
                cmd.Parameters.AddWithValue("@cmail", getstr);

                cmd.ExecuteNonQuery();

                lbl_header.Text = "Şirket Bilgileri, Başarıyla kaydedildi.";

                conn.Close();

                HtmlMeta meta = new HtmlMeta();
                meta.HttpEquiv = "Refresh";
                meta.Content = "3;url=" + Request.UrlReferrer.ToString();
                this.Page.Controls.Add(meta);

            }
            catch (Exception ex)
            {
                lbl_header.Text = ex.ToString();
            }
        }

        protected void btn_companyinfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/companies/company.aspx?menu=1");
        }

        protected void btn_progress_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/companies/company.aspx?menu=2");
        }

        protected void btn_alinanurunler_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/companies/company.aspx?menu=3");
        }

        protected void btn_alisveris_Click(object sender, EventArgs e)
        {

            if(GridView1.SelectedIndex == -1)
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

                int a = Convert.ToInt16(lbl_num.Text);
                cmd.CommandText = "UPDATE [process] SET as_ticaret = true WHERE t_id = @tid";
                cmd.Parameters.AddWithValue("@tid", a);

                cmd.ExecuteNonQuery();

                lbl_alisveris.Text = "Alış işlemi başarıyla tamamlandı. ID = ";

                HtmlMeta meta = new HtmlMeta();
                meta.HttpEquiv = "Refresh";
                meta.Content = "3;url=" + Request.UrlReferrer.ToString();
                this.Page.Controls.Add(meta);
            }       
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbl_num.Text = GridView1.SelectedValue.ToString();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbl_num_for_get.Text = GridView2.SelectedValue.ToString();
        }

        protected void btn_alisveris_for_get_Click(object sender, EventArgs e)
        {
            if (GridView2.SelectedIndex == -1)
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

                int a = Convert.ToInt16(lbl_num_for_get.Text);
                cmd.CommandText = "UPDATE [process] SET yanlis_satis = true WHERE t_id = @ticaretid";
                cmd.Parameters.AddWithValue("@ticaretid", a);

                cmd.ExecuteNonQuery();

                lbl_alisveris_for_get.Text = "İşlem bildirildi. ID = ";

                HtmlMeta meta = new HtmlMeta();
                meta.HttpEquiv = "Refresh";
                meta.Content = "3;url=" + Request.UrlReferrer.ToString();
                this.Page.Controls.Add(meta);

            }
        }
    }
}