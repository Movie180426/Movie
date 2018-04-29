using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie.Web.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void ShowMessage(string msg)
        {
            lblStatus.Text = msg;
        }

        protected void btnLogin1_Click(object sender, EventArgs e)
        {
            DAL.admins dal = new DAL.admins();
            Model.admins model=dal.AdminLogin(txtName.Text, txtPassWord.Text);
            if (model==null)
                ShowMessage("用户名或密码错误，请重新登录");
            else
            {  
                HttpContext.Current.Session["User"] = model;
                Page.Response.Redirect(@"Index.aspx", true);

            }
        }

    }
}