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
	/// sskk ��ժҪ˵����
	/// </summary>
	public class sskk : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Web.UI.WebControls.Literal ErrorMsg;
		protected System.Web.UI.WebControls.Button bt_Add;
		protected CCUtility Utility;
		protected string sFormAction="sskk_edit.aspx?";
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// �ڴ˴������û������Գ�ʼ��ҳ��
			Utility=new CCUtility(this);			
			// PageSecurity begin
			Utility.CheckSecurity(1);
			// PageSecurity end
			if (!(this.IsPostBack))
			{
				try
				{
					ViewState["Sort"]="";
					ViewState["Page"]="0";
					GridBind();
				}
				catch (Exception er)
				{
					ShowErrMsg(er.Message);
				}
				ErrorMsg.Visible =false;
			}	
		}
		private void GridBind()
		{
			DataView MyDv;			
			 
			String strsql;
			DataSet myDs;
			strsql = "select [a].*," +    								  
				"[p].[Name] as typeName" +
				" from ([AreaKK] a inner join [bm_PlaceType] p on [a].[typeID]=[p].[typeID]) ";				
			//strsql="select top 10 meterReading.mrID,meterReading.mrYear from MeterReading order by sales DESC";
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
		#region Web ������������ɵĴ���
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: �õ����� ASP.NET Web ���������������ġ�
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
		/// �˷��������ݡ�
		/// </summary>
		private void InitializeComponent()
		{
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
				TempImg.Attributes.Add("onClick","javascript:return confirm('����ȷ��Ҫɾ���˼�¼��')"); 
			}
		}

		private void DataGrid1_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{	
Utility.CheckSecurity(2);		
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
Utility.CheckSecurity(2);
			int mrId;
			try
			{
				mrId=int.Parse(e.Item.Cells[0].Text.Trim());
				Delete(mrId);
				GridBind();

			}	 
			catch(Exception er)
			{
				ShowErrMsg(er.Message)   ;
			}

		}
		private void Delete(int mrID)
		{
			string sWhere = "ID=" + mrID;           	
			string sSQL = "delete from AreaKK where " + sWhere;
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
	}
}
