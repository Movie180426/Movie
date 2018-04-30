using Movie.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie.Web
{
    public partial class context : System.Web.UI.Page
    {
        public Model.users user = null;
        public DataTable dtCate = null;
        public Movie.DAL.article dalArticle = new Movie.DAL.article();
        public topic dalTopic = new topic();
        public cate dalCate = new cate();
        protected void Page_Load(object sender, EventArgs e)
        {
            dtCate = dalCate.GetList("").Tables[0];
            if (HttpContext.Current.Session["User"] != null)
                user = (Model.users)(HttpContext.Current.Session["User"]);
        }
    }
}