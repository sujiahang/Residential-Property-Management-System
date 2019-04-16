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
	/// zhuhu 的摘要说明。
	/// </summary>
	public class zhuhu : System.Web.UI.Page
	{
		private string strSelectSQL = "select * from zhuhu";
		private DataTable tb = new DataTable();
		private CCUtility Utility;

		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Button btn_Add;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Button btn_Search;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.TextBox txt_Bianhao;
		protected System.Web.UI.WebControls.TextBox txt_Mingcheng;
		protected System.Web.UI.WebControls.TextBox txt_ID;
		protected System.Web.UI.WebControls.DropDownList DropDownList1;
		protected System.Web.UI.WebControls.DropDownList DropDownList2;
		protected System.Web.UI.WebControls.Literal ErrorMsg;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			Utility = new CCUtility(this);

			if(!IsPostBack)
			{
				BindDataGrid();
				BindDropDownList();
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
			this.btn_Search.Click += new System.EventHandler(this.btn_Search_Click);
			this.btn_Add.Click += new System.EventHandler(this.btn_Add_Click);
			this.DataGrid1.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid1_ItemCreated);
			this.DataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGrid1_PageIndexChanged);
			this.DataGrid1.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_EditCommand);
			this.DataGrid1.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(this.DataGrid1_SortCommand);
			this.DataGrid1.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_DeleteCommand);
			this.DataGrid1.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid1_ItemDataBound_1);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void BindDataGrid()
		{
			tb = Utility.ExecuteSql4Ds(strSelectSQL).Tables[0];
			DataView dv = tb.DefaultView;

			//向视图应用过滤信息（先过滤）
			if (ViewState["strFilter"] != null)
			{
				dv.RowFilter = ViewState["strFilter"].ToString().Trim();
			}

			//向视图应用排序信息（再排序）
			if (ViewState["SortExpression"] != null)
				dv.Sort = ViewState["SortExpression"].ToString().Trim();

			//重新绑定数据
			DataGrid1.DataSource=dv;

			//在当前页排序,排序后仍然在当前页（最后确定显示哪一页）
			if (ViewState["NowPage"] != null)
				DataGrid1.CurrentPageIndex = int.Parse(ViewState["NowPage"].ToString().Trim());
			try
			{
				DataGrid1.DataBind();
			}
			catch  //比如查询时过滤掉了很多,ViewState["NowPage"]中保存的页数已经偏大
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
			strSQL = "select distinct jianlizhe from zhuhu";
            SqlCommand cmd = new SqlCommand(strSQL,Utility.Connection);
            SqlDataReader rdr = cmd.ExecuteReader();
			while (rdr.Read())
			{
				DropDownList1.Items.Add(rdr[0].ToString().Trim());
			}
			rdr.Close();
		}

		private void DataGrid1_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			string idNum = DataGrid1.DataKeys[e.Item.ItemIndex].ToString().Trim();
			Response.Redirect("zhuhu_Edit.aspx?bianhao=" + idNum);

		}

		private void DataGrid1_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			DataGrid1.EditItemIndex = -1;
			string idNum = DataGrid1.DataKeys[e.Item.ItemIndex].ToString().Trim();
			string strDelSQL = "delete from zhuhu where bianhao='" + idNum + "'";
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
				btnDel.Attributes["onclick"] = "javascript:return confirm('你确认删除此项数据吗?');";
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
				for (int i=2;i<DataGrid1.Columns.Count;i++)
				{
					if (i==11)
					{
						continue;
					}
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
							cell.ToolTip = "升序排列";
						else
							cell.ToolTip = "降序排列";
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
					else  //只能有一个标签
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
			//缓存当前信息
			if (ViewState["SortExpression"] != null)
				strSortBy = ViewState["SortExpression"].ToString().Trim();
			if (ViewState["SortAscending"] != null)
				strSortAscending = ViewState["SortAscending"].ToString().Trim();
			//设置新的排序表达式
			ViewState["SortExpression"] = e.SortExpression;
			//如果单击排序列，排序顺序颠倒!
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

		private void DataGrid1_ItemDataBound_1(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemIndex >= 0)
			{
				e.Item.Attributes.Add("onMouseOver","currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCCCDD'");
				e.Item.Attributes.Add("onMouseOut","this.style.backgroundColor=currentcolor");
				e.Item.Attributes["title"] = GetTitle((DataGrid1.DataKeys[e.Item.ItemIndex]).ToString().Trim());
			}	
		}
		private string GetTitle(string id)
		{
			string title = "";
			if (id == "")
			{
				return title;
			}
			string strSQL = "select bianhao,xingming,xingbie,leixing from zhuhu where bianhao='" + id + "'";
			SqlCommand cmd = new SqlCommand(strSQL,Utility.Connection);
            SqlDataReader rdr = cmd.ExecuteReader();
			while (rdr.Read())
			{
				string strBianhao = rdr["bianhao"].ToString().Trim();
				string strName = rdr["xingming"].ToString().Trim();
				string strXingbie = rdr["xingbie"].ToString().Trim();
				string strLeixing = rdr["leixing"].ToString().Trim();
				title = "业主编号: " + strBianhao + "\n业主姓名: " + strName  + "\n业主性别: " + strXingbie + "\n租用类型: " + strLeixing;
			}
			rdr.Close();
			return title;
		}

		private void btn_Search_Click(object sender, System.EventArgs e)
		{
			string strFilter = "";
			string strTempFilter = "";

			if (this.txt_Bianhao.Text.Trim() != "")
				strTempFilter += "bianhao like'" + txt_Bianhao.Text.Trim() + "%' and ";
			if (this.txt_Mingcheng.Text.Trim() != "")
				strTempFilter += "xingming like'" + txt_Mingcheng.Text.Trim() + "%' and ";
			if (this.txt_ID.Text.Trim() != "")
				strTempFilter += "shenfenzhenghao like'" + txt_ID.Text.Trim() + "%' and ";

			if (DropDownList1.SelectedIndex == 0)   //全部
			{/*什么也不做*/}
			else
			{
				strTempFilter += "jianlizhe = '" + DropDownList1.SelectedItem.Text.Trim() + "' and ";
			}
			if (DropDownList2.SelectedIndex == 0)   //全部
			{/*什么也不做*/}
			else
			{
				strTempFilter += "shifouruzhu = '" + DropDownList2.SelectedItem.Text.Trim() + "' and ";
			}

			int strLength = strTempFilter.Length;
			if (strLength > 4)
				strFilter = strTempFilter.Remove(strLength-5,4);
			ViewState["strFilter"] = strFilter;
			BindDataGrid();
		}

		private void btn_Add_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("zhuhu_Edit.aspx?");		
		}

	}
}