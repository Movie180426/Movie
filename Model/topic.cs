using System;
namespace Movie.Model
{
	/// <summary>
	/// topic:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class topic
	{
		public topic()
		{}
		#region Model
		private int _id;
		private string _usersid= "NULL";
		private string _articleid= "NULL";
		private string _contents;
		private string _addtime= "NULL";
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
		public string usersid
		{
			set{ _usersid=value;}
			get{return _usersid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string articleid
		{
			set{ _articleid=value;}
			get{return _articleid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string contents
		{
			set{ _contents=value;}
			get{return _contents;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string addtime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		#endregion Model

	}
}

