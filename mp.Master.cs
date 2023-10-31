using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website
{
    public partial class mp : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string pagename = new FileInfo(this.Request.Url.LocalPath).Name;

            if(pagename == "index.aspx")
                btn_anasayfa.CssClass = "pad navfont btn btn-success nav-link text-white ms-3";
            else if(pagename == "hakkimizda.aspx")
                btn_hakkimizda.CssClass = "pad navfont btn btn-success nav-link text-white ms-3";
            else if (pagename == "iletisim.aspx")
                btn_iletisim.CssClass = "pad navfont btn btn-success nav-link text-white ms-3";
            else if (pagename == "giris.aspx")
                btn_giris_kayit.CssClass = "pad navfont btn btn-success nav-link text-white";
            else if(pagename == "alimsatim.aspx")
                btn_alimsatim.CssClass = "pad navfont btn btn-success nav-link text-white ms-3";
            else if(pagename == "magaza.aspx")
                btn_magaza.CssClass = "pad navfont btn btn-success nav-link text-white ms-3";

            // user check
            object user = Session["userMail"];
            object adm = Session["adminlogin"];
            object comp = Session["compMail"];

            if (user == null)
            {
                btn_giris_kayit.Visible = true;
                sepetico.Visible = false;
                avatarico.Visible = false;
                btn_menu2.Visible = false;
            }
            else
            {
                btn_giris_kayit.Visible = false;
                sepetico.Visible = true;
                avatarico.Visible = true;
                btn_menu2.Visible = true;
            }

            if (adm != null)
            {
                btn_giris_kayit.Visible = false;
                avatarico.Visible = true;
                btn_menu1.Text = "Admin Paneli";
            }

            if (comp != null)
            {
                btn_giris_kayit.Visible = false;
                avatarico.Visible = true;
                btn_menu1.Text = "Satış Ayarları";
                btn_menu2.Visible = true;
            }

        }

        protected void btn_giris_kayit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/giris.aspx");
        }

        protected void btn_menu2_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }

        protected void btn_anasayfa_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }

        protected void btn_hakkimizda_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hakkimizda.aspx");
        }

        protected void btn_iletisim_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/iletisim.aspx");
        }

        protected void btn_menu1_Click(object sender, EventArgs e)
        {
            if (btn_menu1.Text == "Satış Ayarları")
                Response.Redirect("~/companies/company.aspx?menu=1");
            if (btn_menu1.Text == "Admin Paneli")
                Response.Redirect("~/admin/admin.aspx");
            if (btn_menu1.Text == "Profilim")
                Response.Redirect("~/user/profile.aspx?menu=1");
        }

        protected void sepetico_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/user/profile.aspx?menu=5");
        }

        protected void favicon_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script>");
            Response.Write("window.open('../index.aspx', '_self')");
            Response.Write("</script>");
        }

        protected void avatarico_Click(object sender, ImageClickEventArgs e)
        {
            if (btn_menu1.Text == "Satış Ayarları")
                Response.Redirect("~/companies/company.aspx?menu=1");
            if (btn_menu1.Text == "Admin Paneli")
                Response.Redirect("~/admin/admin.aspx");
            if (btn_menu1.Text == "Profilim")
                Response.Redirect("~/user/profile.aspx?menu=1");
        }

        protected void btn_alimsatim_Click(object sender, EventArgs e)
        {
            Response.Write("<script>");
            Response.Write("window.open('../alimsatim.aspx', '_self')");
            Response.Write("</script>");
        }

        protected void btn_magaza_Click(object sender, EventArgs e)
        {
            Response.Write("<script>");
            Response.Write("window.open('../magaza.aspx', '_self')");
            Response.Write("</script>");
        }
    }
}