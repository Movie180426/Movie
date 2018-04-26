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
namespace Movie.Web.users
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
		Movie.BLL.users bll=new Movie.BLL.users();
		Movie.Model.users model=bll.GetModel(id);
		this.lblid.Text=model.id.ToString();
		this.txtuname.Text=model.uname;
		this.txtpwd.Text=model.pwd;
		this.txtrealname.Text=model.realname;
		this.txtsex.Text=model.sex;
		this.txtbirthday.Text=model.birthday;
		this.txtcontact.Text=model.contact;
		this.txtemail.Text=model.email;

	}

		public void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txtuname.Text.Trim().Length==0)
			{
				strErr+="uname不能为空！\\n";	
			}
			if(this.txtpwd.Text.Trim().Length==0)
			{
				strErr+="pwd不能为空！\\n";	
			}
			if(this.txtrealname.Text.Trim().Length==0)
			{
				strErr+="realname不能为空！\\n";	
			}
			if(this.txtsex.Text.Trim().Length==0)
			{
				strErr+="sex不能为空！\\n";	
			}
			if(this.txtbirthday.Text.Trim().Length==0)
			{
				strErr+="birthday不能为空！\\n";	
			}
			if(this.txtcontact.Text.Trim().Length==0)
			{
				strErr+="contact不能为空！\\n";	
			}
			if(this.txtemail.Text.Trim().Length==0)
			{
				strErr+="email不能为空！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			int id=int.Parse(this.lblid.Text);
			string uname=this.txtuname.Text;
			string pwd=this.txtpwd.Text;
			string realname=this.txtrealname.Text;
			string sex=this.txtsex.Text;
			string birthday=this.txtbirthday.Text;
			string contact=this.txtcontact.Text;
			string email=this.txtemail.Text;


			Movie.Model.users model=new Movie.Model.users();
			model.id=id;
			model.uname=uname;
			model.pwd=pwd;
			model.realname=realname;
			model.sex=sex;
			model.birthday=birthday;
			model.contact=contact;
			model.email=email;

			Movie.BLL.users bll=new Movie.BLL.users();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
