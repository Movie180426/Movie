using System;
namespace Movie.Model
{
	/// <summary>
	/// admins:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class admins
	{
		public admins()
		{}
		#region Model
		private int _id;
		private string _uname= "NULL";
		private string _pwd= "NULL";
		private string _realname= "NULL";
		private string _contact= "NULL";
		/// <summary>
		/// 
		/// </summary>
		public int id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string uname
		{
			set{ _uname=value;}
			get{return _uname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string pwd
		{
			set{ _pwd=value;}
			get{return _pwd;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string realname
		{
			set{ _realname=value;}
			get{return _realname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string contact
		{
			set{ _contact=value;}
			get{return _contact;}
		}
		#endregion Model

	}
}

