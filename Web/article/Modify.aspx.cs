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
using Maticsoft.Common;
using LTP.Accounts.Bus;
namespace Movie.Web.article
{
    public partial class Modify : Page
    {       

        		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
				{
					int id=(Convert.ToInt32(Request.Params["id"]));
					ShowInfo(id);
				}
			}
		}
			
	private void ShowInfo(int id)
	{
		Movie.BLL.article bll=new Movie.BLL.article();
		Movie.Model.article model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.txttitle.Text=model.title;
		this.txtcateid.Text=model.cateid;
		this.txtimage.Text=model.image;
		this.txtcontents.Text=model.contents;
		this.txtistop.Text=model.istop;
		this.txtisimage.Text=model.isimage;
		this.txtaddtime.Text=model.addtime;

	}

		public void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txttitle.Text.Trim().Length==0)
			{
				strErr+="title不能为空！\\n";	
			}
			if(this.txtcateid.Text.Trim().Length==0)
			{
				strErr+="cateid不能为空！\\n";	
			}
			if(this.txtimage.Text.Trim().Length==0)
			{
				strErr+="image不能为空！\\n";	
			}
			if(this.txtcontents.Text.Trim().Length==0)
			{
				strErr+="contents不能为空！\\n";	
			}
			if(this.txtistop.Text.Trim().Length==0)
			{
				strErr+="istop不能为空！\\n";	
			}
			if(this.txtisimage.Text.Trim().Length==0)
			{
				strErr+="isimage不能为空！\\n";	
			}
			if(this.txtaddtime.Text.Trim().Length==0)
			{
				strErr+="addtime不能为空！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			int id=int.Parse(this.lblid.Text);
			string title=this.txttitle.Text;
			string cateid=this.txtcateid.Text;
			string image=this.txtimage.Text;
			string contents=this.txtcontents.Text;
			string istop=this.txtistop.Text;
			string isimage=this.txtisimage.Text;
			string addtime=this.txtaddtime.Text;


			Movie.Model.article model=new Movie.Model.article();
			model.id=id;
			model.title=title;
			model.cateid=cateid;
			model.image=image;
			model.contents=contents;
			model.istop=istop;
			model.isimage=isimage;
			model.addtime=addtime;

			Movie.BLL.article bll=new Movie.BLL.article();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
