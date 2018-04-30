using Maticsoft.DBUtility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Movie.DAL
{
    public static class grid
    {
        public static string MyQuery(int PageIndex, int RowCount, string tableName, string where)
        {
            //获得总记录数 
            string sql = "select Count(*) total from " + tableName + " where 1=1 " + where;
            var obj= DbHelperSQL.GetSingle(sql);
            int total = Convert.ToInt32(obj);
            //sql = string.Format("select * FROM "+tableName+" where 1=1 "+where+" order by id desc  limit {0},{1} ", (PageIndex - 1) * RowCount, RowCount);
            sql = string.Format("select top {0} * from {2}  where id not in (  select top {1} id from {2} ) ", RowCount,(PageIndex - 1) * RowCount, tableName);
            DataSet ds= DbHelperSQL.Query(sql);
            string json = DataTable2Json(ds.Tables[0], total);
            return json;

        }
        public static bool Delete(int id, string tableName)
        {
            string sql = "delete from " + tableName + " where id=" + id;
            return DbHelperSQL.ExecuteSql(sql) > 0 ? true : false;
            
        }
        public static string DataTable2Json(DataTable dt, int total = -1)
        {
            StringBuilder jsonBuilder = new StringBuilder();
            jsonBuilder.Append("{\"total\":");
            if (total == -1)
            {
                jsonBuilder.Append(dt.Rows.Count);
            }
            else
            {
                jsonBuilder.Append(total);
            }
            jsonBuilder.Append(",\"rows\":[");

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                jsonBuilder.Append("{");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    jsonBuilder.Append("\"");
                    jsonBuilder.Append(dt.Columns[j].ColumnName);
                    jsonBuilder.Append("\":\"");
                    jsonBuilder.Append(dt.Rows[i][j].ToString().Replace("\"", "").Replace("'", ""));
                    jsonBuilder.Append("\",");
                }
                if (dt.Columns.Count > 0)
                {
                    jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
                }
                jsonBuilder.Append("},");
            }
            if (dt.Rows.Count > 0)
            {
                jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
            }
            jsonBuilder.Append("]}");
            return jsonBuilder.ToString();
        }
    }
}
