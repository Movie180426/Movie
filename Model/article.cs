using System;
namespace Movie.Model
{
	/// <summary>
	/// article:实体类(属性说明自动提取数据库字段的描述信息)按时
	/// </summary>
	[Serializable]
	public partial class article
	{
		public article()
		{}
		#region Model
		private int _id;
		private string _title= "NULL";
		private string _cateid= "NULL";
		private string _image= "NULL";
		private string _contents;
		private string _istop= "NULL";
		private string _isimage= "NULL";
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
		public string title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string cateid
		{
			set{ _cateid=value;}
			get{return _cateid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string image
		{
			set{ _image=value;}
			get{return _image;}
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
		public string istop
		{
			set{ _istop=value;}
			get{return _istop;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string isimage
		{
			set{ _isimage=value;}
			get{return _isimage;}
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

