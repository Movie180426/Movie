using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Movie.Web
{
    /// <summary>
    /// TopicHandler 的摘要说明
    /// </summary>
    public class TopicHandler : IHttpHandler
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
            }

            //$str ="insert into topic(usersid,articleid,contents,addtime) values('$usersid','$articleid','$contents','$dates')";

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