using Movie.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie.Web
{
    public partial class Cate : System.Web.UI.Page
    {
        public Model.users user = null;
        public cate dalCate = new cate();
        public Movie.DAL.article dalArticle = new Movie.DAL.article();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["User"] != null)
                user = (Model.users)(HttpContext.Current.Session["User"]);
        }
    }
}