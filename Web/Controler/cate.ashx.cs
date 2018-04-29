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
    public class cate : BaseHandler
    {
        public void AddCate(string catename)
        {

            string sql = string.Format("select count(1) from cate where catename='{0}'", catename);
            int count = (int)DbHelperSQL.GetSingle(sql);
            if (count > 0)
            {
                HttpContext.Current.Response.Write(@"{""result"":""fail"",""message"":""电影类别已存在，请修改类别名称""}");
                return;
            }
            sql = string.Format("insert into cate (id,catename)values((select max(id)+1 from cate),'{0}');",
            catename);
            DbHelperSQL.ExecuteSql(sql);
            HttpContext.Current.Response.Write(@"{""result"":""success"",""message"":""类别添加成功""}");
        }
        public void EditCate(string id, string catename)
        {

            string sql = string.Format("update cate set catename='{0}' where id={1};",
            catename, id);
            if (DbHelperSQL.ExecuteSql(sql) > 0)
                HttpContext.Current.Response.Write(@"{""result"":""success"",""message"":""类别修改成功""}");
            else
                HttpContext.Current.Response.Write(@"{""result"":""fail"",""message"":""类别修改失败""}");
        }
    }
}