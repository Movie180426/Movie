using Movie.DAL;
using Movie.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


namespace App.Ajax
{
    /// <summary>
    /// App 的摘要说明
    /// </summary>
    public class App : IHttpHandler
    {
        public usersdal _users = new usersdal();

        public articledal _articledal = new articledal();

        public catedal _catedal = new catedal();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            switch (context.Request.QueryString["type"])
            {
                case "login":
                    GetUerInfo(context);
                    break;
                case "reg":
                    GetUerReg(context);
                    break;
                case "top":
                    GetTopInfo(context);
                    break;
                case "cate":
                    GetCateInfo(context);
                    break;
                case "movielist":
                    GetMovieList(context);
                    break;
                case "movieinfo":
                    GetMovieInfo(context);
                    break;

                case "commentlist":
                    GetCommentList(context);
                    break;

                case "addscore":
                    AddScore(context);
                    break;


                default:
                    //base.ProcessRequest(context);
                    break;
            }
        }

        private void GetUerReg(HttpContext context)
        {
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            var username = context.Request["username"] ?? "";
            var pwd = context.Request["password"] ?? "";
            string where1 = string.Format("  uname ='{0}' ", username);
            DataTable dt1 = _users.GetList(where1).Tables[0];
            if (dt1 != null)
            {
                if (dt1.Rows.Count > 0)
                {
                    result.Code = Movie.Common.Enums.ResultStatus.Error;
                    result.Message = "用户名称已经注册！";
                    context.Response.Write(JsonConvert.SerializeObject(result));
                    context.Response.End();
                    return;
                }
            }

            Movie.Model.users user = new users();
            user.id = new Movie.DAL.usersdal().GetMaxId();
            user.uname = username;
            user.realname = username;
            user.pwd = pwd;
            bool bb=_users.Add(user);

            result = new JsonResponse<dynamic>();
            if(bb)
            {
                string where = string.Format("  uname ='{0}' and pwd = '{1}'", username, pwd);
                DataTable dt  = _users.GetList(where).Tables[0];

                result.Code = Movie.Common.Enums.ResultStatus.Success;
                result.Data = dt;
            }
            else
            {
                result.Code = Movie.Common.Enums.ResultStatus.Error;
                result.Message = "用户注册失败！";
            }
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();
        }

        private void AddScore(HttpContext context)
        {
            var article = new Movie.Model.article();
            article.id = int.Parse(context.Request["id"] ?? "0");
            article.score = int.Parse(context.Request["score"] ?? "0");
            article.scorenum = int.Parse(context.Request["scorenum"] ?? "0");

            var id = _articledal.GettopicMaxId();
            var topic = new Movie.Model.topic();
            topic.id = id + 1;
            topic.articleid = context.Request["id"];
            topic.usersid = context.Request["userid"];
            topic.contents = context.Request["contents"];
            topic.addtime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            _articledal.UpdateScore(article);

            _articledal.Addtopic(topic);
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            result.Code = Movie.Common.Enums.ResultStatus.Success;
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();
        }

        private void GetCommentList(HttpContext context)
        {

            var entity = _articledal.GetCommentList(" articleid = " + context.Request["id"] ?? "0");
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            result.Data = entity;
            result.Code = Movie.Common.Enums.ResultStatus.Success;
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();
        }

        private void GetMovieInfo(HttpContext context)
        {
            var id = int.Parse(context.Request["id"] ?? "0");
            var entity = _articledal.GetModel(id);
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            result.Data = entity;
            result.Code = Movie.Common.Enums.ResultStatus.Success;
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();
        }

        private void GetMovieList(HttpContext context)
        {
            DataTable dt = _articledal.GetList(" cateid = '" + context.Request["cateid"] + "'").Tables[0];
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            result.Data = dt;
            result.Code = Movie.Common.Enums.ResultStatus.Success;
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();
        }
        private void GetCateInfo(HttpContext context)
        {
            DataTable dt = _catedal.GetList("").Tables[0];
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            result.Data = dt;
            result.Code = Movie.Common.Enums.ResultStatus.Success;
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();
        }

        private void GetTopInfo(HttpContext context)
        {
            DataTable dt = _articledal.GetList(" istop = '是'").Tables[0];
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            result.Data = dt;
            result.Code = Movie.Common.Enums.ResultStatus.Success;
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();

        }

        private void GetUerInfo(HttpContext context)
        {
            var username = context.Request["username"] ?? "";
            var pwd = context.Request["password"] ?? "";

            string where = string.Format("  uname ='{0}' and pwd = '{1}'", username, pwd);
            DataTable dt = _users.GetList(where).Tables[0];
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            if (dt.Rows.Count > 0)
            {
                result.Code = Movie.Common.Enums.ResultStatus.Success;
                result.Data = dt;
            }
            else
            {
                result.Code = Movie.Common.Enums.ResultStatus.Error;
                result.Message = "用户名或密码不存在~";
            }
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();

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