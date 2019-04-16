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
	/// Phone_List ��ժҪ˵����
	/// </summary>
	public class Phone_List : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DropDownList ddlPavilion;
		protected System.Web.UI.WebControls.TextBox tbRoom;
		protected System.Web.UI.WebControls.Button btSearch;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Web.UI.WebControls.Literal ErrorMsg;
		protected System.Web.UI.WebControls.Button bt_Add;	
		protected CCUtility Utility;
		protected string sFormAction="Phone_edit.aspx?";
		protected string Search_FormAction="Phone_List.aspx?";
	
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
	
			Utility.buildListBox(ddlPavilion.Items,"select paID,Name from Pavilion ","paID","Name","��ѡ��","");

			string s;	
			s=Utility.GetParam("search");
			tbRoom.Text = s;

			s=Utility.GetParam("paID");	
			try 
			{
				ddlPavilion.SelectedIndex=ddlPavilion.Items.IndexOf(ddlPavilion.Items.FindByValue(s));
			}
			catch{}
		}
		private void GridBind()
		{
			string sWhere = "";	
			bool HasParam = false;		
			//-------------------------------
			// Build WHERE statement
			//-------------------------------
			System.Collections.Specialized.StringDictionary Params =new System.Collections.Specialized.StringDictionary();	

			if(!Params.ContainsKey("paID"))
			{
				string temp=Utility.GetParam("paID");
				if (Utility.IsNumeric(null,temp) && temp.Length>0) { temp = CCUtility.ToSQL(temp, FieldTypes.Number);} 
				else {temp = "";}
				Params.Add("paID",temp);}
	
			if(!Params.ContainsKey("search"))
			{
				string temp=Utility.GetParam("search");
				Params.Add("search",temp);}	
	
			if (Params["paID"].Length>0) 
			{
				HasParam = true;
				sWhere +="p.paID=" + Params["paID"];
			}
 		
			if (Params["search"].Length>0) 
			{
				if (sWhere.Length >0) sWhere +=" and ";
				HasParam = true;
				sWhere += "H.[hoRoom] like '%" + Params["search"].Replace( "'", "''") +  "%'" ;							
			}	

			if(HasParam)
				sWhere = " WHERE (" + sWhere + ")";

			DataView MyDv;			
			 
			String strsql;
			DataSet myDs;

			strsql = "select " +    				
				"[h].[hoRoom], " +
				"[p].* " +  				
				" from ([Phone] p inner join [House] h on  [p].[hoID]=[h].[hoID])";
				 			
			//strsql="select top 10 meterReading.mrID,meterReading.mrYear from MeterReading order by sales DESC";
			if (!HasParam)
			{
				sWhere=" where ID=-1";
			}
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
			string sSQL = "delete from Phone where " + sWhere;	 			 
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
			int iSel=ddlPavilion.SelectedIndex;
			if(iSel!=0)
			{
				string sURL = sFormAction + "search="+tbRoom.Text+"&"
					+ "paID="+ddlPavilion.SelectedItem.Value+"&";
				//string sURL = Search_FormAction + "search="+Search_search.Text+"&";
				// Transit
				sURL += "";
				Response.Redirect(sURL);
			}
			else
			{
				ShowErrMsg("��ѡ��¥�");
			}			
		}

		private void btSearch_Click(object sender, System.EventArgs e)
		{
			int iSel=ddlPavilion.SelectedIndex;
			if(iSel!=0)
			{
				string sURL = Search_FormAction + "search="+tbRoom.Text+"&"
					+ "paID="+ddlPavilion.SelectedItem.Value+"&";
				//string sURL = Search_FormAction + "search="+Search_search.Text+"&";
				// Transit
				sURL += "";
				Response.Redirect(sURL);
			}
			else
			{
				ShowErrMsg("��ѡ��¥�");
			}
		}
	}
}