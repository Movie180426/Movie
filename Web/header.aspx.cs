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
    public partial class header : System.Web.UI.Page
    {
        public string userName = "";
        public DataTable dtCate = null;
       
        public cate dalCate = new cate();
        protected void Page_Load(object sender, EventArgs e)
        {
            dtCate = dalCate.GetList("").Tables[0];
            userName = "David";

        }
    }
}