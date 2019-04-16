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
    /// DM_List 的摘要说明。
    /// </summary>
    public class DM_List : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button btSearch;
        protected System.Web.UI.WebControls.DataGrid DataGrid1;
        protected System.Web.UI.WebControls.Literal ErrorMsg;
        protected System.Web.UI.WebControls.Button bt_Add;
        protected System.Web.UI.WebControls.DropDownList ddlDMList;
        protected CCUtility Utility;
        protected string sFormAction = "DM_List.aspx?";
        protected string sTable = "", f1 = "", f2 = "";
        protected System.Web.UI.WebControls.TextBox tbName;

        private void Page_Load(object sender, System.EventArgs e)
        {
            // 在此处放置用户代码以初始化页面
            Utility = new CCUtility(this);
            // PageSecurity begin
            Utility.CheckSecurity(2);
            // PageSecurity end
            if (!(this.IsPostBack))
            {
                try
                {
                    ViewState["Sort"] = "";
                    ViewState["Page"] = "0";
                    Search_Show();
                    BindGrid();
                }
                catch (Exception er)
                {
                    ShowErrMsg(er.Message);
                }
                ErrorMsg.Visible = false;
            }
        }

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN：该调用是 ASP.NET Web 窗体设计器所必需的。
            //
            InitializeComponent();
            //base.OnInit(e);
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
            this.DataGrid1.CancelCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_CancelCommand);
            this.DataGrid1.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_EditCommand);
            this.DataGrid1.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(this.DataGrid1_SortCommand);
            this.DataGrid1.UpdateCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_UpdateCommand);
            this.DataGrid1.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_DeleteCommand);
            this.bt_Add.Click += new System.EventHandler(this.bt_Add_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion
        /// <summary>
        /// Push Dialog,Show error message
        /// </summary>
        /// <param name="err">Error Message Detail</param>
        private void ShowErrMsg(string err)
        {
            string str;
            str = "<script language='javascript'>";
            str += " alert('" + err + "')";
            str += "</script>";
            ErrorMsg.Visible = true;
            ErrorMsg.Text = str;
        }

        private void Search_Show()
        {
            Utility.buildListBox(ddlDMList.Items, "select ID,Name from bm_bm", "ID", "Name", null, "");
            string s = Utility.GetParam("paID");
            try
            {
                ddlDMList.SelectedIndex = ddlDMList.Items.IndexOf(ddlDMList.Items.FindByValue(s));
            }
            catch { }

        }
        private void BindGrid()
        {
            DataView MyDv;
            string sWhere = "";

            string sSel = Utility.GetParam("paID");
            sTable = Utility.Dlookup("bm_bm", "tableName", "id=" + sSel);//("CarBarn", "count(*)", sExist);
            f1 = Utility.Dlookup("bm_bm", "f1", "id=" + sSel);
            f2 = Utility.Dlookup("bm_bm", "f2", "id=" + sSel);
            f1.Trim();
            f2.Trim();
            sTable.Trim();

            String strsql;
            DataSet myDs;
            strsql = "select "
                + f1 + " as id,"
                + f2 + " as Name " + " from  " + sTable;
            //strsql="select top 10 meterReading.mrID,meterReading.mrYear from MeterReading order by sales DESC";
            strsql += sWhere;
            myDs = Utility.ExecuteSql4Ds(strsql);
            MyDv = myDs.Tables[0].DefaultView;

            if (!object.Equals(ViewState["Sort"], null))
                MyDv.Sort = ViewState["Sort"].ToString();
            DataGrid1.DataSource = MyDv;
            if (!object.Equals(ViewState["Page"], null))
                DataGrid1.CurrentPageIndex = int.Parse(ViewState["Page"].ToString());
            try
            {
                DataGrid1.DataBind();
            }
            catch
            {
                DataGrid1.CurrentPageIndex = DataGrid1.PageCount - 1;
                DataGrid1.DataBind();
            }

        }

        private void DataGrid1_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            System.Web.UI.WebControls.Image TempImg;
            TempImg = (System.Web.UI.WebControls.Image)e.Item.FindControl("ib_delete");

            if (object.Equals(TempImg, null) == false)
            {
                TempImg.Attributes.Add("onClick", "javascript:return confirm('你能确定要删除此记录吗？')");
            }
        }
        private void DataGrid1_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {

            DataGrid1.EditItemIndex = e.Item.ItemIndex;
            BindGrid();

        }
        private void CancelCommand()
        {
            DataGrid1.EditItemIndex = -1;
            BindGrid();
        }
        private void DataGrid1_CancelCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            DataGrid1.EditItemIndex = -1;
            BindGrid();
        }
        private void getData()
        {
            string sSel = Utility.GetParam("paID");
            sTable = Utility.Dlookup("bm_bm", "tableName", "id=" + sSel);//("CarBarn", "count(*)", sExist);
            f1 = Utility.Dlookup("bm_bm", "f1", "id=" + sSel);
            f2 = Utility.Dlookup("bm_bm", "f2", "id=" + sSel);
            f1.Trim();
            f2.Trim();
            sTable.Trim();
        }
        private void DataGrid1_UpdateCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            string sSQL, sWhere;
            int index = e.Item.ItemIndex;
            string clID = DataGrid1.Items[index].Cells[1].Text;
            string sName = ((TextBox)e.Item.Cells[2].Controls[0]).Text;

            sName.Trim();
            getData();

            sSQL = "update " + sTable + " set " + f2 + "=" + CCUtility.ToSQL(sName);

            sWhere = " where  " + f1 + "=" + clID;
            sSQL += sWhere;

            SqlCommand cmd = new SqlCommand(sSQL, Utility.Connection);
            try { cmd.ExecuteNonQuery(); }
            catch (Exception E) { ShowErrMsg(E.Message); }
            DataGrid1.EditItemIndex = -1;
            BindGrid();

        }
        /// <summary>
        /// 删除记录
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        private void DataGrid1_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            int Id;
            try
            {
                Id = int.Parse(e.Item.Cells[1].Text.Trim());
                getData();
                DeleteRecord(Id);
                BindGrid();
            }
            catch (Exception er)
            {
                ShowErrMsg(er.Message);
            }

        }
        private void DeleteRecord(int ID)
        {
            string sWhere = f1 + "=" + ID;
            string sSQL = "delete from " + sTable + " where " + sWhere;
            SqlCommand cmd = new SqlCommand(sSQL, Utility.Connection);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            ViewState["Page"] = e.NewPageIndex.ToString();
            BindGrid();
        }

        private void DataGrid1_SortCommand(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
        {
            if (ViewState["Sort"].ToString() == e.SortExpression)
                ViewState["Sort"] = e.SortExpression + " desc";
            else
                ViewState["Sort"] = e.SortExpression;
            BindGrid();
        }
        private void ddlDMList_SelectedIndexChanged(object sender, System.EventArgs e)
        {
        }
        private void btSearch_Click(object sender, System.EventArgs e)
        {
            string sURL = sFormAction + "paID=" + ddlDMList.SelectedItem.Value + "&";
            //string sURL = Search_FormAction + "search="+Search_search.Text+"&";
            // Transit
            sURL += "";
            Response.Redirect(sURL);
        }

        private void bt_Add_Click(object sender, System.EventArgs e)
        {
            getData();
            string sSQL = "insert  into " + sTable + " (" + f2 + ")" +
                         " values(" + CCUtility.ToSQL(Utility.GetParam("tbName"), FieldTypes.Text) + ")";

            SqlCommand cmd = new SqlCommand(sSQL, Utility.Connection);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception E)
            {
                throw new Exception(E.Message);
            }

            BindGrid();
        }
    }
}
