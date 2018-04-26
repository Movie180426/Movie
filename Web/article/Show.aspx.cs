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
namespace Movie.Web.article
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
		Movie.BLL.article bll=new Movie.BLL.article();
		Movie.Model.article model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.lbltitle.Text=model.title;
		this.lblcateid.Text=model.cateid;
		this.lblimage.Text=model.image;
		this.lblcontents.Text=model.contents;
		this.lblistop.Text=model.istop;
		this.lblisimage.Text=model.isimage;
		this.lbladdtime.Text=model.addtime;

	}


    }
}
