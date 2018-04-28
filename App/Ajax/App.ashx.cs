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
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            switch (context.Request.QueryString["type"])
            {
                case "login":
                    GetUerInfo(context);
                    break;
                default:
                    //base.ProcessRequest(context);
                    break;
            }
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
                //result.Data = dt;
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