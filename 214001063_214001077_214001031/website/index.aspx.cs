using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_magazamiz_Click(object sender, EventArgs e)
        {
            Response.Redirect("magaza.aspx");
        }

        protected void btn_alimsatim_Click(object sender, EventArgs e)
        {
            Response.Redirect("alimsatim.aspx");
        }
    }
}