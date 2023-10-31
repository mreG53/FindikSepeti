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
    public partial class magaza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Fındık Sepeti - Mağaza";

            string yol = new dbpath().yol();
            OleDbConnection conn = new OleDbConnection(yol);
            conn.Open();
            OleDbDataAdapter da = new OleDbDataAdapter("SELECT * FROM shop ORDER BY urun_id ASC", conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            repeater.DataSource = dt;
            repeater.DataBind();
            conn.Close();
        }
    }
}