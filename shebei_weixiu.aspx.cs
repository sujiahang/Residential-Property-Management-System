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
	/// shebei_weixiu ��ժҪ˵����
	/// </summary>
	public class shebei_weixiu : System.Web.UI.Page
	{
		private string strSelectSQL = "";
		private DataTable tb = new DataTable();
		private CCUtility Utility;

		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Button btn_Search;
		protected System.Web.UI.WebControls.Button btn_Add;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.DropDownList DropDownList2;
		protected System.Web.UI.WebControls.TextBox txt_Mingcheng;
		protected System.Web.UI.WebControls.TextBox txt_Danwei;
		protected System.Web.UI.WebControls.DropDownList list_blPay;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// �ڴ˴������û������Գ�ʼ��ҳ��
			Utility = new CCUtility(this);

			if(!IsPostBack)
			{
				BindDataGrid();
				BindDropDownList2();
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
		/// 
		private void InitializeComponent()
		{    
			this.btn_Search.Click += new System.EventHandler(this.btn_Search_Click);
			this.btn_Add.Click += new System.EventHandler(this.btn_Add_Click);
			this.DataGrid1.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid1_ItemCreated);
			this.DataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGrid1_PageIndexChanged);
			this.DataGrid1.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_EditCommand);
			this.DataGrid1.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(this.DataGrid1_SortCommand);
			this.DataGrid1.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_DeleteCommand);
			this.DataGrid1.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid1_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void BindDataGrid()
		{
			strSelectSQL = "select * from shebei_weixiu";
			tb = Utility.ExecuteSql4Ds(strSelectSQL).Tables[0];
			DataView dv = tb.DefaultView;

			//����ͼӦ�ù�����Ϣ���ȹ��ˣ�
			if (ViewState["strFilter"] != null)
			{
				dv.RowFilter = ViewState["strFilter"].ToString().Trim();
			}

			//����ͼӦ��������Ϣ
			if (ViewState["SortExpression"] != null)
				dv.Sort = ViewState["SortExpression"].ToString().Trim();

			//���°�����
			DataGrid1.DataSource=dv;

			//�ڵ�ǰҳ����,�������Ȼ�ڵ�ǰҳ
			if (ViewState["NowPage"] != null)
				DataGrid1.CurrentPageIndex = int.Parse(ViewState["NowPage"].ToString().Trim());
			try
			{
				DataGrid1.DataBind();
			}
			catch  //����ɾ��ʱɾ���˺ܶ�,ViewState["NowPage"]�б����ҳ���Ѿ�ƫ��
			{
				DataGrid1.CurrentPageIndex = DataGrid1.PageCount-1;
				DataGrid1.DataBind();
			}
		}

		private void BindDropDownList2()
		{
			if (DropDownList2.Items.Count > 0)
				DropDownList2.Items.Clear();
			DropDownList2.Items.Add("");
			strSelectSQL = "select distinct riqi from shebei_weixiu";
			SqlCommand cmd = new SqlCommand(strSelectSQL,Utility.Connection);
            SqlDataReader rdr = cmd.ExecuteReader();
			while (rdr.Read())
			{
				DropDownList2.Items.Add(rdr[0].ToString().Trim());
			}
			rdr.Close();
		}

		private void DataGrid1_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			int idNum = (int)DataGrid1.DataKeys[e.Item.ItemIndex];
			Response.Redirect("shebeiWeixiu_Edit.aspx?ID=" + idNum);

		}

		private void DataGrid1_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			DataGrid1.EditItemIndex = -1;
			int idNum = (int)DataGrid1.DataKeys[e.Item.ItemIndex];
			string strDelSQL = "delete from shebei_weixiu where id=" + idNum;
			Utility.Execute(strDelSQL);
			BindDataGrid();	
		}

		private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			ViewState["NowPage"] = e.NewPageIndex;
			BindDataGrid();		
		}

		private void DataGrid1_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			ListItemType elemType = e.Item.ItemType;

			if (elemType == ListItemType.AlternatingItem|| elemType == ListItemType.Item)
			{
				System.Web.UI.WebControls.ImageButton btnDel = (System.Web.UI.WebControls.ImageButton)e.Item.FindControl("Imbtn_del");
				btnDel.Attributes["onclick"] = "javascript:return confirm('��ȷ��ɾ������������?');";
			}

			if (elemType == ListItemType.Header)
			{
				string strSortBy = "";
				string strSortAscending = "";
				if (ViewState["SortExpression"] != null)
					strSortBy = ViewState["SortExpression"].ToString().Trim();
				if (ViewState["SortAscending"] != null)
					strSortAscending = ViewState["SortAscending"].ToString().Trim();
				string strOrder = (strSortAscending=="yes"?"5 ":"6 ");
				for (int i=0;i<DataGrid1.Columns.Count-2;i++)
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
		private void DataGrid1_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemIndex >= 0)
			{
				e.Item.Attributes.Add("onMouseOver","currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCCCDD'");
				e.Item.Attributes.Add("onMouseOut","this.style.backgroundColor=currentcolor");
				e.Item.Attributes["title"] = GetTitle(DataGrid1.DataKeys[e.Item.ItemIndex].ToString().Trim());
			}
		}

		private string GetTitle(string id)
		{
			string title = "";
			if (id == "")
			{
				return title;
			}
			string strSQL = "select id,mingcheng,danwei,fukuanfou from shebei_weixiu where id=" + id;
			SqlCommand cmd = new SqlCommand(strSQL,Utility.Connection);
			SqlDataReader rdr = cmd.ExecuteReader();
			while (rdr.Read())
			{
				string strName = rdr["mingcheng"].ToString().Trim();
				string strDanwei = rdr["danwei"].ToString().Trim();
				string strCondition = rdr["fukuanfou"].ToString().Trim();
				if (strCondition == "��")
				{
					title += "��δ��ά��[" + strName + "]��[" + strDanwei +"]���㸶��";
				}
			}
			rdr.Close();
			return title;
		}

		private void btn_Search_Click(object sender, System.EventArgs e)
		{
			string strFilter = "";
			string strTempFilter = "";

			if (this.txt_Mingcheng.Text.Trim() != "")
				strTempFilter += "mingcheng like'" + txt_Mingcheng.Text.Trim() + "%' and ";
			if (this.txt_Danwei.Text.Trim() != "")
				strTempFilter += "danwei like'" + txt_Danwei.Text.Trim() + "%' and ";

			//�Ƿ񸶿�
			if (this.list_blPay.SelectedIndex == 0)   //ȫ��
			{/*ʲôҲ����*/}
			else if (this.list_blPay.SelectedIndex == 1)   //δ֪
				strTempFilter += "fukuanfou = 'δ֪' and ";
			else if (this.list_blPay.SelectedIndex == 2)   //��
				strTempFilter += "fukuanfou = '��' and ";
			else if (this.list_blPay.SelectedIndex == 3)   //��
				strTempFilter += "fukuanfou = '��' and ";

			if (DropDownList2.SelectedIndex != 0)
				strTempFilter += "riqi='" + this.DropDownList2.SelectedItem.Text.Trim() + "' and ";

			int strLength = strTempFilter.Length;
			if (strLength > 4)
				strFilter = strTempFilter.Remove(strLength-5,4);
			ViewState["strFilter"] = strFilter;
			BindDataGrid();
		}

		private void btn_Add_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("shebeiWeixiu_Edit.aspx?");		
		}

	}
}
