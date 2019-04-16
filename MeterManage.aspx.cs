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

namespace SmallHouse
{
	/// <summary>
	/// BookManage 的摘要说明。
	/// </summary>
	public class MeterManage : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.HyperLink HyperLink1;
		protected System.Web.UI.WebControls.HyperLink HyperLink2;
		protected System.Web.UI.WebControls.DataGrid dg_Meter;
		protected System.Web.UI.WebControls.Literal ErrorMsg;
        protected CCUtility Utility;
		protected System.Web.UI.WebControls.HyperLink HyperLink3;  		 
		protected string MeterManage_FormAction="EditMeter.aspx?";
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			Utility=new CCUtility(this);
			// 在此处放置用户代码以初始化页面
			// PageSecurity begin
			Utility.CheckSecurity(2);
			// PageSecurity end
			if (!(this.IsPostBack))
			{
				try
				{
					ViewState["Sort"]="";
					ViewState["Page"]="1";
					GridBind();
				}
				catch (Exception er)
				{
					ShowErrMsg(er.Message);
				}
				ErrorMsg.Visible =false;
			}	

		}
		protected void Page_Unload(object sender, EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP+ Windows Form Designer.
			//
			if(Utility!=null) Utility.DBClose();
		}

		private void GridBind()
		{
			DataView MyDv;			
			 
			String strsql;
			DataSet myDs;
			strsql = "select [p].[paName]," +    				
				"[h].[hoRoom], " +
				"[t].[taName], " +   
				"[m].[mrID] as id, " +	
				"[m].[mrYear], " +   
				"[m].[mrMonth1], " +   
				"[m].[mrMonth2], " +   
				"[m].[mrPreceding], " +   
				"[m].[mrCurrent], " +   
				"[m].[mrNumber] " +
				" from (( ([MeterReading] m inner join [Pavilion] p on [m].[paID]=[p].[paID]) "+
				"  inner join [House] h on  [m].[hoID]=[h].[hoID]) "+
				"  inner join [Tariff]  t on  [m].[taID]=[t].[taID])";
			//strsql="select top 10 meterReading.mrID,meterReading.mrYear from MeterReading order by sales DESC";
			myDs=Utility.ExecuteSql4Ds(strsql);
			MyDv=myDs.Tables[0].DefaultView ;
			 
			if(!object.Equals(ViewState["Sort"],null))
				MyDv.Sort =ViewState["Sort"].ToString() ;
			dg_Meter.DataSource =MyDv;
			if(!object.Equals(ViewState["Page"],null))
				dg_Meter.CurrentPageIndex  =int.Parse(ViewState["Page"].ToString()) ;
			try
			{
				dg_Meter.DataBind();
			}
			catch
			{
				dg_Meter.CurrentPageIndex =dg_Meter.PageCount -1;
				dg_Meter.DataBind ();
			}

		}
		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN：该调用是 ASP.NET Web 窗体设计器所必需的。
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
			this.dg_Meter.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dg_Meter_ItemCreated);
			this.dg_Meter.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dg_Meter_PageIndexChanged);
			this.dg_Meter.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dg_MeterReading_EditCommand);
			this.dg_Meter.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(this.dg_Meter_SortCommand);
			this.dg_Meter.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dg_Meter_DeleteCommand);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void dg_Meter_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			System.Web.UI.WebControls.Image    TempImg;
			TempImg=(System.Web.UI.WebControls.Image)e.Item.FindControl("ib_delete") ;
			
			if(object.Equals(TempImg,null)==false)
			{				
				TempImg.Attributes.Add("onClick","javascript:return confirm('你能确定要删除此记录吗？')"); 
			}
		}

		private void dg_MeterReading_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{			
			int mrId;
			try
			{
				mrId=int.Parse(e.Item.Cells[0].Text.Trim());
				Response.Redirect(MeterManage_FormAction+"mrID="+mrId);
			}
			catch(Exception er)
			{
				ShowErrMsg(er.Message)   ;
			}
			
		}

		private void dg_Meter_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			int mrId;
			try
			{
				mrId=int.Parse(e.Item.Cells[0].Text.Trim());
				DeleteMeterReading(mrId);
				GridBind();

			}	 
			catch(Exception er)
			{
             ShowErrMsg(er.Message)   ;
			}

		}
		private void DeleteMeterReading(int mrID)
		{
			string sWhere = "mrID=" + mrID;           	
			string sSQL = "delete from MeterReading where " + sWhere;	 			 
			OleDbCommand cmd = new OleDbCommand(sSQL, Utility.Connection);	      
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

		private void dg_Meter_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			ViewState["Page"]=e.NewPageIndex.ToString();
			GridBind();
		}

		private void dg_Meter_SortCommand(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
		{
			if (ViewState["Sort"].ToString()==e.SortExpression)
				ViewState["Sort"]=e.SortExpression + " desc";
			else
			    ViewState["Sort"]=e.SortExpression ;
			GridBind();
		}
	}
}
