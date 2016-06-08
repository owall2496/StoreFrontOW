using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StoreFrontOW.Admin
{
    public partial class ProductsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SwitchToProductDetails(object sender, GridViewEditEventArgs e)
        {
            string uid = AllProducts_GridView.Rows[e.NewEditIndex].Cells[1].Text;
            e.Cancel = true;
            AllProducts_GridView.DataBind();
            Response.Redirect("ProductAdminDetails.aspx?ProductID=" + uid);
        }

        protected void RefresherMethod(object sender, EventArgs e)
        {
            AllProducts_GridView.DataBind();
        }
    }
}