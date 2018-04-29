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
    public class vote : BaseHandler
    {
        public void AddVote(string title)
        {

            string sql = string.Format("select count(1) from vote where title='{0}'", title);
            int count = (int)DbHelperSQL.GetSingle(sql);
            if (count > 0)
            {
                HttpContext.Current.Response.Write(@"{""result"":""fail"",""message"":""投票调查已存在，请修改后添加""}");
                return;
            }
            sql = string.Format("insert into vote (id,title,num,addtime) values ((select max(id)+1 from vote),'{0}',0,'{1}');",
            title,DateTime.Now.ToString("yyyy-MM-dd"));
            DbHelperSQL.ExecuteSql(sql);
            HttpContext.Current.Response.Write(@"{""result"":""success"",""message"":""添加成功""}");
        }
        public void EditVote(string id, string title)
        {

            string sql = string.Format("update vote set title='{0}' where id={1};",
            title, id);
            if (DbHelperSQL.ExecuteSql(sql) > 0)
                HttpContext.Current.Response.Write(@"{""result"":""success"",""message"":""修改成功""}");
            else
                HttpContext.Current.Response.Write(@"{""result"":""fail"",""message"":""修改失败""}");
        }
    }
}