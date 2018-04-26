using System;
namespace Movie.Model
{
	/// <summary>
	/// cate:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class cate
	{
		public cate()
		{}
		#region Model
		private int _id;
		private string _catename= "NULL";
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
		public string catename
		{
			set{ _catename=value;}
			get{return _catename;}
		}
		#endregion Model

	}
}

