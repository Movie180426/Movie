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
namespace Movie.Web.vote
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        		protected void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(!PageValidate.IsNumber(txtid.Text))
			{
				strErr+="id格式错误！\\n";	
			}
			if(this.txttitle.Text.Trim().Length==0)
			{
				strErr+="title不能为空！\\n";	
			}
			if(this.txtnum.Text.Trim().Length==0)
			{
				strErr+="num不能为空！\\n";	
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
			int id=int.Parse(this.txtid.Text);
			string title=this.txttitle.Text;
			string num=this.txtnum.Text;
			string addtime=this.txtaddtime.Text;

			Movie.Model.vote model=new Movie.Model.vote();
			model.id=id;
			model.title=title;
			model.num=num;
			model.addtime=addtime;

			Movie.BLL.vote bll=new Movie.BLL.vote();
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
