using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.OleDb;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace SmallHouse
{
	/// <summary>
	/// Member_List 的摘要说明。
	/// </summary>
	public class Member_List : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox Search_search;
		protected System.Web.UI.WebControls.Button btSearch;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Web.UI.WebControls.Literal ErrorMsg;
		protected System.Web.UI.WebControls.Button bt_Add;
		protected CCUtility Utility;
		protected string sFormAction="Member_edit.aspx?";
		protected string Search_FormAction="Member_List.aspx?";
		//protected String[] members_security_level_id_lov = "0;New;1;Member;3;Admin".Split(new Char[] {';'});
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			Utility=new CCUtility(this);			
			// PageSecurity begin
			Utility.CheckSecurity(2);
			// PageSecurity end
			if (!(this.IsPostBack))
			{
				try
				{
					ViewState["Sort"]="";
					ViewState["Page"]="0";
					Page_Show(sender,e);
				}
				catch (Exception er)
				{
					ShowErrMsg(er.Message);
				}
				ErrorMsg.Visible =false;
			}	
		}
		protected void Page_Show(object sender, EventArgs e)
		{
			Search_Show();
			GridBind();		
		}
		void Search_Show() 
		{			
			string s;	
			s=Utility.GetParam("search");
			Search_search.Text = s;				
		}

		private void GridBind()
		{
			string sWhere = "";	
			bool HasParam = false;		
			//-------------------------------
			// Build WHERE statement
			//-------------------------------
			System.Collections.Specialized.StringDictionary Params =new System.Collections.Specialized.StringDictionary();				
	
			if(!Params.ContainsKey("search"))
			{
				string temp=Utility.GetParam("search");
				Params.Add("search",temp);}												
 		
			if (Params["search"].Length>0) 
			{				
				HasParam = true;
				sWhere = "[m].[name] like '%" + Params["search"].Replace( "'", "''") +  "%'" ;									
			}	

			if(HasParam)
				sWhere = " WHERE (" + sWhere + ")";


			DataView MyDv;			
			 
			String strsql;
			DataSet myDs;
			strsql = "select   " +
				"[m].[name], " +
				"[m].[memo], " +
				"[m].[member_id] as ID, " +
				"[m].[member_login] as m_member_login, " +
				"[s].[Name] as m_security_level_id " +
				" from ([members] m inner join [bm_sLevel] s on [m].[security_level_id]=[s].[id])";			 				
			//strsql="select top 10 meterReading.mrID,meterReading.mrYear from MeterReading order by sales DESC";
			
			strsql+=sWhere;

			myDs=Utility.ExecuteSql4Ds(strsql);
			MyDv=myDs.Tables[0].DefaultView ;
			 
			if(!object.Equals(ViewState["Sort"],null))
				MyDv.Sort =ViewState["Sort"].ToString() ;
			DataGrid1.DataSource =MyDv;
			if(!object.Equals(ViewState["Page"],null))
				DataGrid1.CurrentPageIndex  =int.Parse(ViewState["Page"].ToString()) ;
			try
			{
				DataGrid1.DataBind();
			}
			catch
			{
				DataGrid1.CurrentPageIndex =DataGrid1.PageCount -1;
				DataGrid1.DataBind ();
			}

		}
		#region Web 窗体设计器生成的代码
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{
			this.btSearch.Click += new System.EventHandler(this.btSearch_Click);
			this.DataGrid1.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid1_ItemCreated);
			this.DataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGrid1_PageIndexChanged);
			this.DataGrid1.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_EditCommand);
			this.DataGrid1.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(this.DataGrid1_SortCommand);
			this.DataGrid1.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_DeleteCommand);
			this.bt_Add.Click += new System.EventHandler(this.bt_Add_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
		private void DataGrid1_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			System.Web.UI.WebControls.Image    TempImg;
			TempImg=(System.Web.UI.WebControls.Image)e.Item.FindControl("ib_delete") ;
			
			if(object.Equals(TempImg,null)==false)
			{				
				TempImg.Attributes.Add("onClick","javascript:return confirm('你能确定要删除此记录吗？')"); 
			}
		}

		private void DataGrid1_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{			
			int mrId;
			try
			{
				mrId=int.Parse(e.Item.Cells[0].Text.Trim());
				Response.Redirect(sFormAction+"ID="+mrId+"&");
			}
			catch(Exception er)
			{
				ShowErrMsg(er.Message)   ;
			}
			
		}

		private void DataGrid1_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			int mrId;
			try
			{
				mrId=int.Parse(e.Item.Cells[0].Text.Trim());
				if(Session["UserID"].ToString()==mrId.ToString())
				{
					ShowErrMsg("自己不能删除自己");
				}
				else
				{
					Delete(mrId);
					GridBind();
				}

			}	 
			catch(Exception er)
			{
				ShowErrMsg(er.Message)   ;
			}

		}
		private void Delete(int mrID)
		{
			string sWhere = "member_id=" + mrID;           	
			string sSQL = "delete from members where " + sWhere;	 			 
			SqlCommand cmd = new SqlCommand(sSQL, Utility.Connection);	      
			try 
			{
				cmd.ExecuteNonQuery();
			}         
			catch(Exception e) 
			{
				throw new Exception(e.Message);				 
			}	
		}
		private void ShowErrMsg(string err)
		{
			string str;
			str="<script language='javascript'>";
			str+=" alert('" +err + "')";
			str+="</script>";
			ErrorMsg.Visible=true;
			ErrorMsg.Text=str;
				
		}

		private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			ViewState["Page"]=e.NewPageIndex.ToString();
			GridBind();
		}

		private void DataGrid1_SortCommand(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
		{
			if (ViewState["Sort"].ToString()==e.SortExpression)
				ViewState["Sort"]=e.SortExpression + " desc";
			else
				ViewState["Sort"]=e.SortExpression ;
			GridBind();
		}

		private void bt_Add_Click(object sender, System.EventArgs e)
		{
			Response.Redirect(sFormAction);
		}

		private void btSearch_Click(object sender, System.EventArgs e)
		{
			string sURL = Search_FormAction +  "search="+Search_search.Text+"&";
			//string sURL = Search_FormAction + "search="+Search_search.Text+"&";
			// Transit
			sURL += "";
			Response.Redirect(sURL);
		}
	}
}