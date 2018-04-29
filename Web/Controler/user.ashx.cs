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
    public class user : BaseHandler
    {
        public void AddUser(string uname, string pwd, string realname, string sex,string birthday,string contact,string email)
        {

            string sql = string.Format("select count(1) from users where uname='{0}'", uname);
            int count = (int)DbHelperSQL.GetSingle(sql);
            if (count > 0)
            {
                HttpContext.Current.Response.Write(@"{""result"":""fail"",""message"":""用户已存在，请修改用户名""}");
                return;
            }
            sql = string.Format("insert into users (id,uname,pwd,realname,sex,birthday,contact,email)values((select max(id)+1 from users),'{0}','{1}','{2}','{3}','{4}','{5}','{6}');",
            uname, pwd, realname,sex,birthday,contact,email);
            DbHelperSQL.ExecuteSql(sql);
            HttpContext.Current.Response.Write(@"{""result"":""success"",""message"":""用户添加成功""}");
        }
        public void EditUser(string id, string uname, string pwd, string realname, string sex, string birthday, string contact, string email)
        {

            string sql = string.Format("update users set uname='{0}',pwd='{1}',realname='{2}',sex='{3}',birthday='{4}',contact='{5}',email='{6}' where id={7};",
            uname, pwd, realname,sex,birthday, contact,email, id);
            if (DbHelperSQL.ExecuteSql(sql) > 0)
                HttpContext.Current.Response.Write(@"{""result"":""success"",""message"":""用户修改成功""}");
            else
                HttpContext.Current.Response.Write(@"{""result"":""fail"",""message"":""用户修改失败""}");
        }
    }
}