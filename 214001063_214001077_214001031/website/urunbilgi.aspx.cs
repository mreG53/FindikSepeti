using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace website
{
    public partial class urunbilgi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {        
            string urunid = Request.QueryString["urun"];

            Page.Title = "Fındık Sepeti - Ürün Bilgisi = " + urunid;

            if (urunid == null)
            {
                Response.Redirect("magaza.aspx");
            }         

            string yol = new dbpath().yol();
            OleDbConnection conn = new OleDbConnection(yol);
            conn.Open();
            OleDbDataAdapter da = new OleDbDataAdapter("SELECT * FROM shop where urun_id = " + urunid, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            repeater.DataSource = dt;
            repeater.DataBind();
            conn.Close();
        }
    }
}