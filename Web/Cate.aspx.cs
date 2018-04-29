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
        public string userName = "";
        public cate dalCate = new cate();
        public article dalArticle = new article();
        protected void Page_Load(object sender, EventArgs e)
        {
            userName = "David";
        }
    }
}