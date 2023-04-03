using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website.companies
{
    public partial class company_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // user check
            object user = Session["userMail"];
            object adm = Session["adminlogin"];

            if (user != null)
            {
                Response.Redirect("~/index.aspx");
            }
            if (adm != null)
            {
                Response.Write("<script>alert('Admin buraya girmek için tasarlanmadı.');</script>");
                Response.Redirect("~/index.aspx");
            }


            warning_message.Visible = false;
        }

        protected void btn_giris_Click(object sender, EventArgs e)
        {
            if (txb_mail.Text == "" || txb_name.Text == "" || txb_pass.Text == "")
            {
                warning_message.Visible = true;
                lbl_warning.Text = "Lütfen gerekli alanları doldurunuz.";
            }
            else
            {
                try
                {
                    string veritabani = new dbpath().yol();

                    OleDbConnection conn = new OleDbConnection(veritabani);
                    conn.Open();

                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM companies WHERE c_name = @cname AND c_pass = @cpass  AND c_mail = @cmail";

                    cmd.Parameters.AddWithValue("@cname", txb_name.Text);
                    cmd.Parameters.AddWithValue("@cpass", txb_pass.Text);
                    cmd.Parameters.AddWithValue("@cmail", txb_mail.Text);

                    OleDbDataReader dr;

                    dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        Session.Timeout = 60;
                        Session.Add("compMail", txb_mail.Text);
                        Response.Redirect("~/companies/company.aspx?menu=1");
                        conn.Close();
                    }
                    else
                    {
                        warning_message.Visible = true;
                        lbl_warning.Text = "Bilgiler eşleşmiyor.";
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
    }
}