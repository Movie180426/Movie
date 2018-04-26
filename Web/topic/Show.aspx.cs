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
namespace Movie.Web.topic
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
		Movie.BLL.topic bll=new Movie.BLL.topic();
		Movie.Model.topic model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.lblusersid.Text=model.usersid;
		this.lblarticleid.Text=model.articleid;
		this.lblcontents.Text=model.contents;
		this.lbladdtime.Text=model.addtime;

	}


    }
}
