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
    public partial class Index : System.Web.UI.Page
    {
       public Movie.Model.users user = null;
        public DataTable dtCate = null;
        public DataTable dtTop = null;
        public DataTable dtImg = null;
        public cate dalCate = new cate();
        public Movie.DAL.article dalArticle = new Movie.DAL.article();
        protected void Page_Load(object sender, EventArgs e)
        {
            dtCate = dalCate.GetList("").Tables[0];
           
            dtTop = dalArticle.GetList("").Tables[0];
            dtImg = dalArticle.GetList("").Tables[0];
            if (HttpContext.Current.Session["User"] != null)
            {
                try
                {
                    user = (Model.users)(HttpContext.Current.Session["User"]);
                }
                catch { }
                finally { }
            }
        }
    }
}