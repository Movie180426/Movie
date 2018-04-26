using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
namespace Movie.Web.users
{
    public partial class Show : Page
    {        
        		public string strid=""; 
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
				{
					strid = Request.Params["id"];
					int id=(Convert.ToInt32(strid));
					ShowInfo(id);
				}
			}
		}
		
	private void ShowInfo(int id)
	{
		Movie.BLL.users bll=new Movie.BLL.users();
		Movie.Model.users model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.lbluname.Text=model.uname;
		this.lblpwd.Text=model.pwd;
		this.lblrealname.Text=model.realname;
		this.lblsex.Text=model.sex;
		this.lblbirthday.Text=model.birthday;
		this.lblcontact.Text=model.contact;
		this.lblemail.Text=model.email;

	}


    }
}
