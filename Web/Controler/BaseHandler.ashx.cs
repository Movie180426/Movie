using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Reflection;
using System.Web.SessionState;

namespace Movie.Web.Controler
{

    /// <summary>
    /// BaseHandler 摘要说明
    /// 利用反射技术通过参数action传递方法名动态调用方法
    /// 继承类创建ajax方法时方法签名应为public void Method(HttpContext context);
    /// 方法中调用context.Response.write输出流之后不应执行End方法
    /// </summary>
    public class BaseHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string methodStr = context.Request["action"] == null ? context.Request.QueryString["action"] : context.Request["action"];
            if (!string.IsNullOrEmpty(methodStr))
            {
                System.Type t = this.GetType();
                try
                {
                    MethodInfo method = t.GetMethod(methodStr.Trim());

                    ParameterInfo[] paramsInfo = method.GetParameters();//得到指定方法的参数列表   
                    object[] parameters = new object[paramsInfo.Length];
                    for (int i = 0; i < paramsInfo.Length; i++)
                    {
                        Type tType = paramsInfo[i].ParameterType;
                        //如果它是值类型,或者String   
                        if (tType.Equals(typeof(string)) || (!tType.IsInterface && !tType.IsClass))
                        {
                            //改变参数类型   
                            parameters[i] = Convert.ChangeType(context.Request[paramsInfo[i].Name], tType);
                        }
                    }
                    object obj = Activator.CreateInstance(t);

                    method.Invoke(obj, parameters);
                }
                catch (Exception ex)
                {
                    //throw (ex);
                    HttpContext.Current.Response.Write(@"{""result"":""fail"",""Message"":""方法调用失败，方法不存在或参数异常。""}");
                }
                finally
                {
                    context.Response.End();
                }
            }
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