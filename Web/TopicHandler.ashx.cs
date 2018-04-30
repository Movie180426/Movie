using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Movie.Web
{
    /// <summary>
    /// TopicHandler 的摘要说明
    /// </summary>
    public class TopicHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string method = context.Request["Mth"].ToString();
            string res = "";
            switch (method)
            {
                case "InsertTopic":           //查询清单数据
                    res = InsertTopic(context);
                    break;
                case "save":           //查询清单数据
                    res = saveUser(context);
                    break;
                case "login":
                    res = loginUser(context);
                    break;
            }

            //$str ="insert into topic(usersid,articleid,contents,addtime) values('$usersid','$articleid','$contents','$dates')";

        }

        private string loginUser(HttpContext context)
        {
            string uname = context.Request.Form["uname"].ToString();
            string pwd = context.Request.Form["pwd"].ToString();
            DataTable dt = new DAL.usersdal().GetList(" uname='" + uname + "' and pwd='" + uname + "' ").Tables[0];
             Model.users user=null;
             if (dt.Rows.Count > 0)
             {
                 user = new DAL.usersdal().DataRowToModel(dt.Rows[0]);
                 if (HttpContext.Current.Session != null)
                     if (HttpContext.Current.Session["User"] != null)
                         HttpContext.Current.Session.Remove("User");
                 HttpContext.Current.Session.Add("User", user);
                 context.Response.Redirect("index.aspx");
             }
             else {
                 context.Response.Redirect("login.aspx?log=false");
             }
            return "";
        }

        private string saveUser(HttpContext context)
        {
            string uname = context.Request.Form["uname"].ToString();
            string pwd = context.Request.Form["pwd"].ToString();
            string realname = context.Request.Form["realname"].ToString();
            string sex = context.Request.Form["sex"].ToString();
            string birthday = context.Request.Form["birthday"].ToString();
            string contact = context.Request.Form["contact"].ToString();
            string email = context.Request.Form["email"].ToString();
            Model.users top = new Model.users();
            int id = new DAL.usersdal().GetMaxId();
            top.id = id;
            top.uname = uname;
            top.pwd = pwd;
            top.realname = realname;
            top.sex = sex;
            top.birthday = birthday;
            top.contact = contact;
            top.email = email;

            bool res = new DAL.usersdal().Add(top);
            if (res == true)
                context.Response.Redirect("index.aspx");
            return "";
        }

        private string InsertTopic(HttpContext context)
        {
            string usersid = context.Request.Form["usersid"].ToString();
            string articleid = context.Request.Form["articleid"].ToString();
            string contents = context.Request.Form["contents"].ToString();
            Model.topic top = new Model.topic();
            int id = new DAL.topic().GetMaxId();
            top.id = id;
            top.addtime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            top.articleid = articleid;
            top.contents = contents;
            top.usersid = usersid;
            bool res = new DAL.topic().Add(top);
            context.Response.Redirect("index.aspx");
            return "";
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}