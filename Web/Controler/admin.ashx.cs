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
    public class admin : BaseHandler
    {
        public void AddAdmin(string uname, string pwd, string realname, string contact)
        {

            string sql = string.Format("select count(1) from admins where uname='{0}'", uname);
            int count = (int)DbHelperSQL.GetSingle(sql);
            if (count > 0)
            {
                HttpContext.Current.Response.Write(@"{""result"":""fail"",""message"":""用户已存在，请修改用户名""}");
                return;
            }
            sql = string.Format("insert into admins (id,uname,pwd,realname,contact)values((select max(id)+1 from admins),'{0}','{1}','{2}','{3}');",
            uname, pwd, realname, contact);
            DbHelperSQL.ExecuteSql(sql);
            HttpContext.Current.Response.Write(@"{""result"":""success"",""message"":""用户添加成功""}");
        }
        public void EditAdmin(string id, string uname, string pwd, string realname, string contact)
        {

            string sql = string.Format("update admins set uname='{0}',pwd='{1}',realname='{2}',contact='{3}' where id={4};",
            uname, pwd, realname, contact, id);
            if (DbHelperSQL.ExecuteSql(sql) > 0)
                HttpContext.Current.Response.Write(@"{""result"":""success"",""message"":""用户修改成功""}");
            else
                HttpContext.Current.Response.Write(@"{""result"":""fail"",""message"":""用户修改失败""}");
        }

        public void ChangePwd(string id, string oldpwd, string pwd)
        {
            string sql = string.Format("select pwd from admins where id={0}", id);
            object obj=DbHelperSQL.GetSingle(sql);
            if (obj == null || obj.ToString() != oldpwd)
            {
                HttpContext.Current.Response.Write(@"{""result"":""fail"",""message"":""原始密码错误  ""}");
            }
            else
            {
                sql = string.Format("update admins set pwd='{0}' where id={1}", pwd, id);
                DbHelperSQL.ExecuteSql(sql);
                HttpContext.Current.Response.Write(@"{""result"":""success"",""message"":""密码修改成功  ""}");
            }
        }
    }
}