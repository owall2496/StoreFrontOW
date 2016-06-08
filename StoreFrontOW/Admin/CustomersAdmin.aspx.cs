using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StoreFrontOW
{
    public partial class CustomersAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SwitchToUserDetails(object sender, GridViewEditEventArgs e)
        {
            string uid = UserGridView.Rows[e.NewEditIndex].Cells[1].Text;
            e.Cancel = true;
            UserGridView.DataBind();
            Response.Redirect("CustomerAdminDetails.aspx?UserID=" + uid);
        }

        protected void RefresherMethod(object sender, EventArgs e)
        {
            UserGridView.DataBind();
        }


    }
}