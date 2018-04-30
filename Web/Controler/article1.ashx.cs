using Maticsoft.DBUtility;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Movie.Web.Controler
{
    /// <summary>
    /// article1 的摘要说明
    /// </summary>
    public class article1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string methodStr = context.Request["action"] == null ? context.Request.QueryString["action"] : context.Request["action"];
            switch (methodStr)
            {
                case "AddArticle":
                    AddArticle(context);
                    break;
                case "EditArticle":
                    EditArticle(context);
                    break;
            }
        }

        private void EditArticle(HttpContext context)
        {
            var id = context.Request.Form["id"] ?? "";
            var title = context.Request.Form["title"] ?? "";
            var cateid = context.Request.Form["cateid"] ?? "";
            var image = context.Request.Form["image"] ?? "";
            if (context.Request.Files.Count > 0)
                image = YingPinFileSave("2018", context.Request.Files[0]);
            var contents = context.Request.Form["contents"] ?? "";
            var istop = context.Request.Form["istop"] ?? "";
            var isimage = context.Request.Form["isimage"] ?? "";

            EditArticle(id, title, cateid, image, contents, istop, isimage);
        }
        public void EditArticle(string id, string title, string cateid, string image, string contents, string istop, string isimage)
        {

            string sql = string.Format("update article set title='{0}',cateid='{1}',image='{2}',contents='{3}',istop='{4}',isimage='{5}' where id={6};",
           title, cateid, image, contents, istop, isimage, id);
            if (DbHelperSQL.ExecuteSql(sql) > 0)
                HttpContext.Current.Response.Write(@"{""result"":""success"",""message"":""电影内容修改成功""}");
            else
                HttpContext.Current.Response.Write(@"{""result"":""fail"",""message"":""修改失败""}");
        }

        private void AddArticle(HttpContext context)
        {
            var title = context.Request["title"] ?? "";
            var cateid = context.Request["cateid"] ?? "";
            var image = context.Request["image"] ?? "";
            if (context.Request.Files.Count > 0)
                image = YingPinFileSave("2018", context.Request.Files[0]);
            var contents = context.Request["contents"] ?? "";
            var istop = context.Request["istop"] ?? "";
            var isimage = context.Request["isimage"] ?? "";
            AddArticle(title, cateid, image, contents, istop, isimage);
        }
        public void AddArticle(string title, string cateid, string image, string contents, string istop, string isimage)
        {
            string sql = string.Format("insert into article (id, title, cateid, image, contents, istop, isimage,addtime,score,scorenum) values ((select max(id)+1 from article),'{0}','{1}','{2}','{3}','{4}','{5}','{6}',0,0);",
            title, cateid, image, contents, istop, isimage, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            DbHelperSQL.ExecuteSql(sql);
            HttpContext.Current.Response.Write(@"{""result"":""success"",""message"":""""}");
        }
        private string YingPinFileSave(string sID, HttpPostedFile file)
        {
            string sUrl = "../upfile/";
            string sDir = HttpContext.Current.Request.PhysicalApplicationPath+"/upfile";
            if (!Directory.Exists(sDir)) Directory.CreateDirectory(sDir);
            string sFileName = sID + "-" + Path.GetFileName(file.FileName);
            string sPath = Path.Combine(sDir, sFileName);
            file.SaveAs(sPath);
            return sUrl + sFileName;
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