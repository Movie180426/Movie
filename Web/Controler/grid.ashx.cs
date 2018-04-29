using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Movie.Web.Controler
{
    /// <summary>
    /// grid 的摘要说明
    /// </summary>
    public class grid : IHttpHandler
    {

        private string connstring = "";

        public void ProcessRequest(HttpContext context)
        {
            string title = context.Request["title"];
            string action = context.Request["action"];
            switch (action)
            {
                case "delete":
                    delete(context);
                    break;
                case "query":
                default: query(context);
                    break;

            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        //分页查询
        private void query(HttpContext context)
        {
            string tableName=context.Request["tableName"];
            string rows = context.Request["rows"];
            string page = context.Request["page"];
            string where = context.Request["where"];
            int intRowCount = 10;
            int intPageIndex = 1;
            if (rows != null && rows != "0")
            {
                intRowCount = Convert.ToInt32(rows);
            }
            if (page != null && page != "0")
            {
                intPageIndex = Convert.ToInt32(page);
            }

            context.Response.ContentType = "text/plain";
            context.Response.Write(DAL.grid.MyQuery(intPageIndex, intRowCount,tableName,where));

        }
        private void delete(HttpContext context)
        {
            string tableName = context.Request["tableName"];
            string _id = context.Request["id"];
            int id;
            string json;
            if (!int.TryParse(_id, out id))
                json = @"{""result"":""error"",""message"":""id错误""}";
            else {
                DAL.grid.Delete(id, tableName);
                json = @"{""result"":""success"",""message"":""""}";
            }

            context.Response.ContentType = "text/plain";
            context.Response.Write(json);
        }
    }
}