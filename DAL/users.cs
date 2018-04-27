using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace Movie.DAL
{
	/// <summary>
	/// 数据访问类:users
	/// </summary>
	public partial class users
	{
		public users()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("id", "users"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from users");
			strSql.Append(" where id=SQL2012id ");
			SqlParameter[] parameters = {
					new SqlParameter("SQL2012id", SqlDbType.Int,4)			};
			parameters[0].Value = id;

			return DbHelperSQL.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(Movie.Model.users model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into users(");
			strSql.Append("id,uname,pwd,realname,sex,birthday,contact,email)");
			strSql.Append(" values (");
			strSql.Append("SQL2012id,SQL2012uname,SQL2012pwd,SQL2012realname,SQL2012sex,SQL2012birthday,SQL2012contact,SQL2012email)");
			SqlParameter[] parameters = {
					new SqlParameter("SQL2012id", SqlDbType.Int,4),
					new SqlParameter("SQL2012uname", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012pwd", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012realname", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012sex", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012birthday", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012contact", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012email", SqlDbType.VarChar,255)};
			parameters[0].Value = model.id;
			parameters[1].Value = model.uname;
			parameters[2].Value = model.pwd;
			parameters[3].Value = model.realname;
			parameters[4].Value = model.sex;
			parameters[5].Value = model.birthday;
			parameters[6].Value = model.contact;
			parameters[7].Value = model.email;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(Movie.Model.users model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update users set ");
			strSql.Append("uname=SQL2012uname,");
			strSql.Append("pwd=SQL2012pwd,");
			strSql.Append("realname=SQL2012realname,");
			strSql.Append("sex=SQL2012sex,");
			strSql.Append("birthday=SQL2012birthday,");
			strSql.Append("contact=SQL2012contact,");
			strSql.Append("email=SQL2012email");
			strSql.Append(" where id=SQL2012id ");
			SqlParameter[] parameters = {
					new SqlParameter("SQL2012uname", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012pwd", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012realname", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012sex", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012birthday", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012contact", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012email", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012id", SqlDbType.Int,4)};
			parameters[0].Value = model.uname;
			parameters[1].Value = model.pwd;
			parameters[2].Value = model.realname;
			parameters[3].Value = model.sex;
			parameters[4].Value = model.birthday;
			parameters[5].Value = model.contact;
			parameters[6].Value = model.email;
			parameters[7].Value = model.id;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from users ");
			strSql.Append(" where id=SQL2012id ");
			SqlParameter[] parameters = {
					new SqlParameter("SQL2012id", SqlDbType.Int,4)			};
			parameters[0].Value = id;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// 批量删除数据
		/// </summary>
		public bool DeleteList(string idlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from users ");
			strSql.Append(" where id in ("+idlist + ")  ");
			int rows=DbHelperSQL.ExecuteSql(strSql.ToString());
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public Movie.Model.users GetModel(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 id,uname,pwd,realname,sex,birthday,contact,email from users ");
			strSql.Append(" where id=SQL2012id ");
			SqlParameter[] parameters = {
					new SqlParameter("SQL2012id", SqlDbType.Int,4)			};
			parameters[0].Value = id;

			Movie.Model.users model=new Movie.Model.users();
			DataSet ds=DbHelperSQL.Query(strSql.ToString(),parameters);
			if(ds.Tables[0].Rows.Count>0)
			{
				return DataRowToModel(ds.Tables[0].Rows[0]);
			}
			else
			{
				return null;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public Movie.Model.users DataRowToModel(DataRow row)
		{
			Movie.Model.users model=new Movie.Model.users();
			if (row != null)
			{
				if(row["id"]!=null && row["id"].ToString()!="")
				{
					model.id=int.Parse(row["id"].ToString());
				}
				if(row["uname"]!=null)
				{
					model.uname=row["uname"].ToString();
				}
				if(row["pwd"]!=null)
				{
					model.pwd=row["pwd"].ToString();
				}
				if(row["realname"]!=null)
				{
					model.realname=row["realname"].ToString();
				}
				if(row["sex"]!=null)
				{
					model.sex=row["sex"].ToString();
				}
				if(row["birthday"]!=null)
				{
					model.birthday=row["birthday"].ToString();
				}
				if(row["contact"]!=null)
				{
					model.contact=row["contact"].ToString();
				}
				if(row["email"]!=null)
				{
					model.email=row["email"].ToString();
				}
			}
			return model;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select id,uname,pwd,realname,sex,birthday,contact,email ");
			strSql.Append(" FROM users ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ");
			if(Top>0)
			{
				strSql.Append(" top "+Top.ToString());
			}
			strSql.Append(" id,uname,pwd,realname,sex,birthday,contact,email ");
			strSql.Append(" FROM users ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			strSql.Append(" order by " + filedOrder);
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获取记录总数
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) FROM users ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			object obj = DbHelperSQL.GetSingle(strSql.ToString());
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("SELECT * FROM ( ");
			strSql.Append(" SELECT ROW_NUMBER() OVER (");
			if (!string.IsNullOrEmpty(orderby.Trim()))
			{
				strSql.Append("order by T." + orderby );
			}
			else
			{
				strSql.Append("order by T.id desc");
			}
			strSql.Append(")AS Row, T.*  from users T ");
			if (!string.IsNullOrEmpty(strWhere.Trim()))
			{
				strSql.Append(" WHERE " + strWhere);
			}
			strSql.Append(" ) TT");
			strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
			return DbHelperSQL.Query(strSql.ToString());
		}

		/*
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		{
			SqlParameter[] parameters = {
					new SqlParameter("SQL2012tblName", SqlDbType.VarChar, 255),
					new SqlParameter("SQL2012fldName", SqlDbType.VarChar, 255),
					new SqlParameter("SQL2012PageSize", SqlDbType.Int),
					new SqlParameter("SQL2012PageIndex", SqlDbType.Int),
					new SqlParameter("SQL2012IsReCount", SqlDbType.Bit),
					new SqlParameter("SQL2012OrderType", SqlDbType.Bit),
					new SqlParameter("SQL2012strWhere", SqlDbType.VarChar,1000),
					};
			parameters[0].Value = "users";
			parameters[1].Value = "id";
			parameters[2].Value = PageSize;
			parameters[3].Value = PageIndex;
			parameters[4].Value = 0;
			parameters[5].Value = 0;
			parameters[6].Value = strWhere;	
			return DbHelperSQL.RunProcedure("UP_GetRecordByPage",parameters,"ds");
		}*/

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

