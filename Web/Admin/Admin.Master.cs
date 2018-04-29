using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie.Web.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
       public  Movie.Model.admins model = (Movie.Model.admins)HttpContext.Current.Session["User"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (model == null)
                HttpContext.Current.Response.Redirect("/Admin/Login.aspx", true);
        }
    }
}