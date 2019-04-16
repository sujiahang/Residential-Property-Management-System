using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using System.Data.SqlClient;

namespace SmallHouse
{
	/// <summary>
	/// ruzhu ��ժҪ˵����
	/// </summary>
	public class ruzhu : System.Web.UI.Page
	{
		private string strSelectSQL = "select [h].[hoID] as ID," + 	"[h].*,"+				  
			"[I].[Name] as IndoorName," +
			"[c].[Name] as CellName," +
			"[s].[Name] as sunnyName " +
			" from ((([House] h inner join [bm_Indoor] I on [h].[indoorID]=[I].[ID]) "+
			" inner join [bm_cell] c on [h].[cellID]=[c].[ID])" +
			" inner join [bm_Sunny] s on [h].[sunnyID]=[s].[ID]) WHERE ([h].[CLIENT_NAME] <> '��')";
		private DataTable tb = new DataTable();
		protected System.Web.UI.WebControls.DropDownList DropDownList1;
		protected System.Web.UI.WebControls.DropDownList DropDownList2;
		protected System.Web.UI.WebControls.DropDownList DropDownList3;
		protected System.Web.UI.WebControls.DropDownList DropDownList4;
		protected System.Web.UI.WebControls.DropDownList DropDownList5;
		protected System.Web.UI.WebControls.DropDownList DropDownList6;
		protected System.Web.UI.WebControls.Button btSearch;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Web.UI.WebControls.Literal ErrorMsg;
		private CCUtility Utility;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// �ڴ˴������û������Գ�ʼ��ҳ��
			Utility = new CCUtility(this);

			if(!IsPostBack)
			{
				BindDataGrid();
				BindDropDownList();
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
			this.DataGrid1.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(this.DataGrid1_SortCommand);
			this.DataGrid1.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid1_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void BindDataGrid()
		{
			tb = Utility.ExecuteSql4Ds(strSelectSQL).Tables[0];
			DataView dv = tb.DefaultView;

			//����ͼӦ�ù�����Ϣ���ȹ��ˣ�
			if (ViewState["strFilter"] != null)
			{
				dv.RowFilter = ViewState["strFilter"].ToString().Trim();
			}

			//����ͼӦ��������Ϣ��������
			if (ViewState["SortExpression"] != null)
				dv.Sort = ViewState["SortExpression"].ToString().Trim();

			//���°�����
			DataGrid1.DataSource=dv;

			//�ڵ�ǰҳ����,�������Ȼ�ڵ�ǰҳ�����ȷ����ʾ��һҳ��
			if (ViewState["NowPage"] != null)
				DataGrid1.CurrentPageIndex = int.Parse(ViewState["NowPage"].ToString().Trim());
			try
			{
				DataGrid1.DataBind();
			}
			catch  //�����ѯʱ���˵��˺ܶ�,ViewState["NowPage"]�б����ҳ���Ѿ�ƫ��
			{
				DataGrid1.CurrentPageIndex = DataGrid1.PageCount-1;
				DataGrid1.DataBind();
			}
		}

		private void BindDropDownList()
		{
			string strSQL = "";
			if (DropDownList1.Items.Count > 0)
				DropDownList1.Items.Clear();
			DropDownList1.Items.Add("");
			strSQL = "select distinct hoRoom from House WHERE (CLIENT_NAME <> '��')";
			SqlCommand cmd = new SqlCommand(strSQL,Utility.Connection);
            SqlDataReader rdr = cmd.ExecuteReader();
			while (rdr.Read())
			{
				DropDownList1.Items.Add(rdr[0].ToString().Trim());
			}
			rdr.Close();

			if (DropDownList2.Items.Count > 0)
				DropDownList2.Items.Clear();
			DropDownList2.Items.Add("");
			strSQL = "select distinct client_name from House WHERE (CLIENT_NAME <> '��')";
			cmd = new SqlCommand(strSQL,Utility.Connection);
			rdr = cmd.ExecuteReader();
			while (rdr.Read())
			{
				DropDownList2.Items.Add(rdr[0].ToString().Trim());
			}
			rdr.Close();

			if (DropDownList3.Items.Count > 0)
				DropDownList3.Items.Clear();
			DropDownList3.Items.Add("");
			strSQL = "select distinct [c].[Name] as CellName " +
				" from ([House] h inner join [bm_cell] c on [h].[cellID]=[c].[ID]) WHERE ([h].[CLIENT_NAME] <> '��')";
			cmd = new SqlCommand(strSQL,Utility.Connection);
			rdr = cmd.ExecuteReader();
			while (rdr.Read())
			{
				DropDownList3.Items.Add(rdr[0].ToString().Trim());
			}
			rdr.Close();

			if (DropDownList4.Items.Count > 0)
				DropDownList4.Items.Clear();
			DropDownList4.Items.Add("");
			strSQL = "select distinct [I].[Name] as IndoorName " +
				" from ([House] h inner join [bm_Indoor] I on [h].[indoorID]=[I].[ID]) WHERE ([h].[CLIENT_NAME] <> '��')";
		    cmd = new SqlCommand(strSQL,Utility.Connection);
			rdr = cmd.ExecuteReader();
			while (rdr.Read())
			{
				DropDownList4.Items.Add(rdr[0].ToString().Trim());
			}
			rdr.Close();

			if (DropDownList5.Items.Count > 0)
				DropDownList5.Items.Clear();
			DropDownList5.Items.Add("");
			strSQL = "select distinct hoUseArce from House WHERE (CLIENT_NAME <> '��')";
			cmd = new SqlCommand(strSQL,Utility.Connection);
			rdr = cmd.ExecuteReader();
			while (rdr.Read())
			{
				DropDownList5.Items.Add(rdr[0].ToString().Trim());
			}
			rdr.Close();

			if (DropDownList6.Items.Count > 0)
				DropDownList6.Items.Clear();
			DropDownList6.Items.Add("");
			strSQL = "select distinct [s].[Name] as sunnyName " +
				" from ([House] h inner join [bm_Sunny] s on [h].[sunnyID]=[s].[ID]) WHERE ([h].[CLIENT_NAME] <> '��')";
			cmd = new SqlCommand(strSQL,Utility.Connection);
			rdr = cmd.ExecuteReader();
			while (rdr.Read())
			{
				DropDownList6.Items.Add(rdr[0].ToString().Trim());
			}
			rdr.Close();
		}

		private void DataGrid1_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			ListItemType elemType = e.Item.ItemType;

			if (elemType == ListItemType.Header)
			{
				string strSortBy = "";
				string strSortAscending = "";
				if (ViewState["SortExpression"] != null)
					strSortBy = ViewState["SortExpression"].ToString().Trim();
				if (ViewState["SortAscending"] != null)
					strSortAscending = ViewState["SortAscending"].ToString().Trim();
				string strOrder = (strSortAscending=="yes"?"5 ":"6 ");
				for (int i=0;i<DataGrid1.Columns.Count;i++)
				{
					string colSortExpression = DataGrid1.Columns[i].SortExpression.Trim();
					if (strSortBy == colSortExpression || strSortBy == colSortExpression + " desc")
					{
						TableCell cell = e.Item.Cells[i];
						Label lblSorted = new Label();
						lblSorted.Font.Name = "webdings";
						lblSorted.Font.Size = FontUnit.XSmall;
						lblSorted.Text = strOrder;
						cell.Controls.Add(lblSorted);
						if (strSortBy == colSortExpression)
							cell.ToolTip = "��������";
						else
							cell.ToolTip = "��������";
					}
				}
			}

			if (elemType == ListItemType.Pager)
			{
				TableCell pager = (TableCell)e.Item.Controls[0];
				for (int i=0;i<pager.Controls.Count;i+=2)
				{
					object o=pager.Controls[i];
					if (o is LinkButton)
					{
						LinkButton h = (LinkButton)o;
						h.Text = "[" + h.Text + "]";
					}
					else  //ֻ����һ����ǩ
					{
						Label l = (Label)o;
						l.Text = "Page " + l.Text;
					}
				}
			}		
		}

		private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			ViewState["NowPage"] = e.NewPageIndex;
			BindDataGrid();	
		}

		private void DataGrid1_SortCommand(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
		{
			string strSortBy = "";
			string strSortAscending = "";
			//���浱ǰ��Ϣ
			if (ViewState["SortExpression"] != null)
				strSortBy = ViewState["SortExpression"].ToString().Trim();
			if (ViewState["SortAscending"] != null)
				strSortAscending = ViewState["SortAscending"].ToString().Trim();
			//�����µ�������ʽ
			ViewState["SortExpression"] = e.SortExpression;
			//������������У�����˳��ߵ�!
			if (e.SortExpression == strSortBy)
			{
				ViewState["SortExpression"]=e.SortExpression + " desc";
				ViewState["SortAscending"]="no";
			}
			else
			{
				ViewState["SortExpression"] = e.SortExpression;
				ViewState["SortAscending"]="yes";
			}
			BindDataGrid();			
		}

		private void btSearch_Click(object sender, System.EventArgs e)
		{
			string strFilter = "";
			string strTempFilter = "";

			if (DropDownList1.SelectedIndex == 0)   //ȫ��
			{/*ʲôҲ����*/}
			else
			{
				strTempFilter += "hoRoom = '" + DropDownList1.SelectedItem.Text.Trim() + "' and ";
			}
			if (DropDownList2.SelectedIndex == 0)   //ȫ��
			{/*ʲôҲ����*/}
			else
			{
				strTempFilter += "Client_Name = '" + DropDownList2.SelectedItem.Text.Trim() + "' and ";
			}
			if (DropDownList3.SelectedIndex == 0)   //ȫ��
			{/*ʲôҲ����*/}
			else
			{
				strTempFilter += "cellName = '" + DropDownList3.SelectedItem.Text.Trim() + "' and ";
			}
			if (DropDownList4.SelectedIndex == 0)   //ȫ��
			{/*ʲôҲ����*/}
			else
			{
				strTempFilter += "IndoorName = '" + DropDownList4.SelectedItem.Text.Trim() + "' and ";
			}
			if (DropDownList5.SelectedIndex == 0)   //ȫ��
			{/*ʲôҲ����*/}
			else
			{
				strTempFilter += "hoUseArce = '" + DropDownList5.SelectedItem.Text.Trim() + "' and ";
			}
			if (DropDownList6.SelectedIndex == 0)   //ȫ��
			{/*ʲôҲ����*/}
			else
			{
				strTempFilter += "SunnyName = '" + DropDownList6.SelectedItem.Text.Trim() + "' and ";
			}

			int strLength = strTempFilter.Length;
			if (strLength > 4)
				strFilter = strTempFilter.Remove(strLength-5,4);
			ViewState["strFilter"] = strFilter;
			BindDataGrid();	
		}

		private void DataGrid1_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemIndex >= 0)
			{
				e.Item.Attributes.Add("onMouseOver","currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCCCDD'");
				e.Item.Attributes.Add("onMouseOut","this.style.backgroundColor=currentcolor");
			}	
		}
	}
}
