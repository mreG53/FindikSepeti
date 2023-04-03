using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace website
{
    public partial class systemlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object user = Session["userMail"];

            if(user != null)
            {
                Session.Abandon();
                Response.Redirect("~/index.aspx");
            }

        }

        protected void giris_Click(object sender, EventArgs e)
        {
            if (name.Text == "" || pass.Text == "")
                Response.Write("<script>alert('Lütfen boş textboxları doldurunuz.');</script>");
            else
            {
                try
                {
                    string veriyolu = new dbpath().yol();

                    OleDbConnection conn = new OleDbConnection(veriyolu);
                    conn.Open();

                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;

                    cmd.CommandText = "SELECT * FROM admins where a_name = @name AND a_pass = @pass";
                    cmd.Parameters.AddWithValue("@name", name.Text);
                    cmd.Parameters.AddWithValue("@pass", pass.Text);

                    OleDbDataReader dr;

                    dr = cmd.ExecuteReader();

                    if(dr.Read())
                    {
                        Session.Timeout = 300;
                        Session.Add("adminlogin", name.Text);
                        Response.Redirect("admin.aspx?menu=isletmeler");
                    }
                    else
                    {
                        Response.Write("<script>alert('bilgiler uyuşmuyor');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message.ToString() + "');</script>");
                }
            }
        }
    }
}