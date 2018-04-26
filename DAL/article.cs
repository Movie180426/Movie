using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace Movie.DAL
{
	/// <summary>
	/// 数据访问类:article
	/// </summary>
	public partial class article
	{
		public article()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("id", "article"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from article");
			strSql.Append(" where id=SQL2012id ");
			SqlParameter[] parameters = {
					new SqlParameter("SQL2012id", SqlDbType.Int,4)			};
			parameters[0].Value = id;

			return DbHelperSQL.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(Movie.Model.article model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into article(");
			strSql.Append("id,title,cateid,image,contents,istop,isimage,addtime)");
			strSql.Append(" values (");
			strSql.Append("SQL2012id,SQL2012title,SQL2012cateid,SQL2012image,SQL2012contents,SQL2012istop,SQL2012isimage,SQL2012addtime)");
			SqlParameter[] parameters = {
					new SqlParameter("SQL2012id", SqlDbType.Int,4),
					new SqlParameter("SQL2012title", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012cateid", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012image", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012contents", SqlDbType.Text),
					new SqlParameter("SQL2012istop", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012isimage", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012addtime", SqlDbType.VarChar,255)};
			parameters[0].Value = model.id;
			parameters[1].Value = model.title;
			parameters[2].Value = model.cateid;
			parameters[3].Value = model.image;
			parameters[4].Value = model.contents;
			parameters[5].Value = model.istop;
			parameters[6].Value = model.isimage;
			parameters[7].Value = model.addtime;

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
		public bool Update(Movie.Model.article model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update article set ");
			strSql.Append("title=SQL2012title,");
			strSql.Append("cateid=SQL2012cateid,");
			strSql.Append("image=SQL2012image,");
			strSql.Append("contents=SQL2012contents,");
			strSql.Append("istop=SQL2012istop,");
			strSql.Append("isimage=SQL2012isimage,");
			strSql.Append("addtime=SQL2012addtime");
			strSql.Append(" where id=SQL2012id ");
			SqlParameter[] parameters = {
					new SqlParameter("SQL2012title", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012cateid", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012image", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012contents", SqlDbType.Text),
					new SqlParameter("SQL2012istop", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012isimage", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012addtime", SqlDbType.VarChar,255),
					new SqlParameter("SQL2012id", SqlDbType.Int,4)};
			parameters[0].Value = model.title;
			parameters[1].Value = model.cateid;
			parameters[2].Value = model.image;
			parameters[3].Value = model.contents;
			parameters[4].Value = model.istop;
			parameters[5].Value = model.isimage;
			parameters[6].Value = model.addtime;
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
			strSql.Append("delete from article ");
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
			strSql.Append("delete from article ");
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
		public Movie.Model.article GetModel(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 id,title,cateid,image,contents,istop,isimage,addtime from article ");
			strSql.Append(" where id=SQL2012id ");
			SqlParameter[] parameters = {
					new SqlParameter("SQL2012id", SqlDbType.Int,4)			};
			parameters[0].Value = id;

			Movie.Model.article model=new Movie.Model.article();
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
		public Movie.Model.article DataRowToModel(DataRow row)
		{
			Movie.Model.article model=new Movie.Model.article();
			if (row != null)
			{
				if(row["id"]!=null && row["id"].ToString()!="")
				{
					model.id=int.Parse(row["id"].ToString());
				}
				if(row["title"]!=null)
				{
					model.title=row["title"].ToString();
				}
				if(row["cateid"]!=null)
				{
					model.cateid=row["cateid"].ToString();
				}
				if(row["image"]!=null)
				{
					model.image=row["image"].ToString();
				}
				if(row["contents"]!=null)
				{
					model.contents=row["contents"].ToString();
				}
				if(row["istop"]!=null)
				{
					model.istop=row["istop"].ToString();
				}
				if(row["isimage"]!=null)
				{
					model.isimage=row["isimage"].ToString();
				}
				if(row["addtime"]!=null)
				{
					model.addtime=row["addtime"].ToString();
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
			strSql.Append("select id,title,cateid,image,contents,istop,isimage,addtime ");
			strSql.Append(" FROM article ");
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
			strSql.Append(" id,title,cateid,image,contents,istop,isimage,addtime ");
			strSql.Append(" FROM article ");
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
			strSql.Append("select count(1) FROM article ");
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
			strSql.Append(")AS Row, T.*  from article T ");
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
			parameters[0].Value = "article";
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

