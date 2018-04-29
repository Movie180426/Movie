using Maticsoft.DBUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace Movie.Web.Controler
{
    /// <summary>
    /// admin 的摘要说明
    /// </summary>
    public class article : BaseHandler
    {
        public void AddArticle(string title,string cateid,string image,string contents,string istop,string isimage)
        {
            string sql = string.Format("insert into article (id, title, cateid, image, contents, istop, isimage,addtime,score,scorenum) values ((select max(id)+1 from article),'{0}','{1}','{2}','{3}','{4}','{5}','{6}',0,0);",
            title, cateid, image, contents, istop, isimage, DateTime.Now.ToString("yyyy-MM-dd"));
            DbHelperSQL.ExecuteSql(sql);
            HttpContext.Current.Response.Write(@"{""result"":""success"",""message"":""""}");
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
    }
}