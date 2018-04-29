using Movie.DAL;
using Movie.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using static Movie.Common.Enums;

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
                    
                default:
                    //base.ProcessRequest(context);
                    break;
            }
        }

        private void GetCommentList(HttpContext context)
        {

            var entity = _articledal.GetCommentList(" articleid = " + context.Request["id"] ?? "0");
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            result.Data = entity;
            result.Code = ResultStatus.Success;
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();
        }

        private void GetMovieInfo(HttpContext context)
        {
            var id = int.Parse(context.Request["id"] ?? "0");
            var entity = _articledal.GetModel(id);
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            result.Data = entity;
            result.Code = ResultStatus.Success;
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();
        }

        private void GetMovieList(HttpContext context)
        {
            DataTable dt = _articledal.GetList(" cateid = '" + context.Request["cateid"] + "'").Tables[0];
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            result.Data = dt;
            result.Code = ResultStatus.Success;
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();
        }
        private void GetCateInfo(HttpContext context)
        {
            DataTable dt = _catedal.GetList("").Tables[0];
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            result.Data = dt;
            result.Code = ResultStatus.Success;
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();
        }

        private void GetTopInfo(HttpContext context)
        {
            DataTable dt = _articledal.GetList(" istop = '是'").Tables[0];
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            result.Data = dt;
            result.Code = ResultStatus.Success;
            context.Response.Write(JsonConvert.SerializeObject(result));
            context.Response.End();

        }

        private void GetUerInfo(HttpContext context)
        {
            var username = context.Request["username"] ?? "";
            var pwd = context.Request["password"] ?? "";

            string where = string.Format("  uname ='{0}' and pwd = '{0}'", username, pwd);
            DataTable dt = _users.GetList(where).Tables[0];
            JsonResponse<dynamic> result = new JsonResponse<dynamic>();
            if (dt.Rows.Count > 0)
            {
                result.Code = ResultStatus.Success;
                result.Data = dt;
            }
            else
            {
                result.Code = ResultStatus.Error;
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