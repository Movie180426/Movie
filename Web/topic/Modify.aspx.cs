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
namespace Movie.Web.topic
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
		Movie.BLL.topic bll=new Movie.BLL.topic();
		Movie.Model.topic model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.txtusersid.Text=model.usersid;
		this.txtarticleid.Text=model.articleid;
		this.txtcontents.Text=model.contents;
		this.txtaddtime.Text=model.addtime;

	}

		public void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txtusersid.Text.Trim().Length==0)
			{
				strErr+="usersid不能为空！\\n";	
			}
			if(this.txtarticleid.Text.Trim().Length==0)
			{
				strErr+="articleid不能为空！\\n";	
			}
			if(this.txtcontents.Text.Trim().Length==0)
			{
				strErr+="contents不能为空！\\n";	
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
			string usersid=this.txtusersid.Text;
			string articleid=this.txtarticleid.Text;
			string contents=this.txtcontents.Text;
			string addtime=this.txtaddtime.Text;


			Movie.Model.topic model=new Movie.Model.topic();
			model.id=id;
			model.usersid=usersid;
			model.articleid=articleid;
			model.contents=contents;
			model.addtime=addtime;

			Movie.BLL.topic bll=new Movie.BLL.topic();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
