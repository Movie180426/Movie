using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;

namespace Movie.Common
{
    public static class DataTableToList
    {
        public static List<T> TableToList<T>(DataTable dt, bool isStoreDB = true)
        {
            List<T> list = new List<T>();
            Type type = typeof(T);
            //List<string> listColums = new List<string>();  
            PropertyInfo[] pArray = type.GetProperties(); //集合属性数组  
            foreach (DataRow row in dt.Rows)
            {
                T entity = Activator.CreateInstance<T>(); //新建对象实例   
                foreach (PropertyInfo p in pArray)
                {
                    if (!dt.Columns.Contains(p.Name) || row[p.Name] == null || row[p.Name] == DBNull.Value)
                    {
                        continue;  //DataTable列中不存在集合属性或者字段内容为空则，跳出循环，进行下个循环     
                    }
                    if (isStoreDB && p.PropertyType == typeof(DateTime) && Convert.ToDateTime(row[p.Name]) < Convert.ToDateTime("1753-01-01"))
                    {
                        continue;
                    }
                    try
                    {
                        var obj = Convert.ChangeType(row[p.Name], p.PropertyType);//类型强转，将table字段类型转为集合字段类型    
                        p.SetValue(entity, obj, null);
                    }
                    catch (Exception)
                    {
                        // throw;  
                    }
                }
                list.Add(entity);
            }
            return list;
        }
    }
}
