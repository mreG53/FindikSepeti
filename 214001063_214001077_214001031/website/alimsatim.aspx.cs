using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website
{
    public partial class alimsatim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            object user = Session["userMail"];
            object adm = Session["adminlogin"];
            object comp = Session["compMail"];

            if (comp != null)
            {
                btn_sell_company1.Visible = false;
                btn_sell_company2.Visible = false;
                btn_sell_company3.Visible = false;
            }

            try
            {
                string veriyolu = new dbpath().yol();

                OleDbConnection conn = new OleDbConnection(veriyolu);
                conn.Open();

                OleDbCommand cmd = new OleDbCommand("SELECT c_headername, as_text, as_price FROM companies where c_id = 1", conn);
                OleDbCommand cmd2 = new OleDbCommand("SELECT c_headername, as_text, as_price FROM companies where c_id = 2", conn);
                OleDbCommand cmd3 = new OleDbCommand("SELECT c_headername, as_text, as_price FROM companies where c_id = 3", conn);

                OleDbDataReader[] dr_dizi = new OleDbDataReader[3];

                dr_dizi[0] = cmd.ExecuteReader();
                dr_dizi[1] = cmd2.ExecuteReader();
                dr_dizi[2] = cmd3.ExecuteReader();

                string[] header_names = new string[3];
                string[] as_text = new string[3];
                string[] as_price = new string[3];

                for (int i = 0; i < 3; i++)
                {
                    if (dr_dizi[i].Read())
                    {
                        header_names[i] = dr_dizi[i]["c_headername"].ToString();
                        as_text[i] = dr_dizi[i]["as_text"].ToString();
                        as_price[i] = dr_dizi[i]["as_price"].ToString();
                    }
                }

                lbl_company_name1.Text = header_names[0].ToString();
                lbl_company_name2.Text = header_names[1].ToString();
                lbl_company_name3.Text = header_names[2].ToString();

                lbl_text1.Text = as_text[0].ToString();
                lbl_text2.Text = as_text[1].ToString();
                lbl_text3.Text = as_text[2].ToString();

                lbl_price_company1.Text = as_price[0].ToString() + "&#8378;";
                lbl_price_company2.Text = as_price[1].ToString() + "&#8378;";
                lbl_price_company3.Text = as_price[2].ToString() + "&#8378;";

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert(" + ex.Message.ToString() + " Lütfen admine bildiriniz ya da bir süre sonra tekrar deneyiniz." + "); </script >");
            }
        }

        protected void btn_sell_company1_Click(object sender, EventArgs e)
        {
            Response.Redirect("formsender.aspx?companies=kumbetli");
        }

        protected void btn_sell_company2_Click(object sender, EventArgs e)
        {
            Response.Redirect("formsender.aspx?companies=fisko");
        }

        protected void btn_sell_company3_Click(object sender, EventArgs e)
        {
            Response.Redirect("formsender.aspx?companies=ada");
        }
    }
}