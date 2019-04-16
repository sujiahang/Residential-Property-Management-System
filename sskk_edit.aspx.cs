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
    /// sskk_edit 的摘要说明。
    /// </summary>
    public class sskk_edit : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.TextBox btName;
        protected System.Web.UI.WebControls.TextBox btNote;
        protected System.Web.UI.WebControls.TextBox btP1;
        protected System.Web.UI.WebControls.TextBox btP2;
        protected System.Web.UI.WebControls.TextBox btPhone;
        protected System.Web.UI.WebControls.TextBox btMemo;
        protected System.Web.UI.WebControls.DropDownList ddl_Type;
        protected System.Web.UI.WebControls.Button btCancel;
        protected System.Web.UI.WebControls.Button btSave;
        protected CCUtility Utility;
        protected System.Web.UI.HtmlControls.HtmlInputHidden p_theID;
        protected System.Web.UI.HtmlControls.HtmlInputHidden theID;
        protected System.Web.UI.WebControls.Literal ErrorMsg;
        protected System.Web.UI.WebControls.TextBox btAllName;
        protected string sFormAction = "sskk.aspx?";

        private void Page_Load(object sender, System.EventArgs e)
        {
            // 在此处放置用户代码以初始化页面
            Utility = new CCUtility(this);
            Utility.CheckSecurity(2);
            if (!IsPostBack)
            {
                p_theID.Value = Utility.GetParam("ID");
                Page_Show(sender, e);
            }
        }
        private void ShowErrMsg(string err)
        {
            string str;
            str = "<script language='javascript'>";
            str += " alert('" + err + "')";
            str += "</script>";
            ErrorMsg.Visible = true;
            ErrorMsg.Text = str;

        }

        protected void Page_Show(object sender, EventArgs e)
        {
            Utility.buildListBox(ddl_Type.Items, "select typeID,Name from bm_PlaceType order by 1", "typeID", "Name", null, "");

            if (p_theID.Value.Length > 0)
            {
                string sWhere = "";

                sWhere += "ID=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);

                string sSQL = "select * from AreaKK where " + sWhere;
                SqlDataAdapter dsCommand = new SqlDataAdapter(sSQL, Utility.Connection);
                DataSet ds = new DataSet();
                DataRow row;

                if (dsCommand.Fill(ds, 0, 1, "Table") > 0)
                {
                    row = ds.Tables[0].Rows[0];
                    theID.Value = CCUtility.GetValue(row, "ID");
                    System.Web.UI.WebControls.TextBox[] tempBox = { btName, btAllName, btNote, btP1, btP2, btPhone, btMemo };
                    for (int i = 0; i < 7; i++)
                    {
                        tempBox[i].Text = row[i + 1].ToString();
                    }
                    //类型
                    string s = CCUtility.GetValue(row, "typeID");
                    try
                    {
                        ddl_Type.SelectedIndex = ddl_Type.Items.IndexOf(ddl_Type.Items.FindByValue(s));
                    }
                    catch { }
                }

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
            this.btSave.Click += new System.EventHandler(this.btSave_Click);
            this.btCancel.Click += new System.EventHandler(this.btCancel_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void btSave_Click(object sender, System.EventArgs e)
        {
            string sSQL = "";
            string sWhere = "";
            string p2_Name = CCUtility.ToSQL(Utility.GetParam("btName"), FieldTypes.Text);
            string p2_AllName = CCUtility.ToSQL(Utility.GetParam("btAllName"), FieldTypes.Text);
            string p2_Note = CCUtility.ToSQL(Utility.GetParam("btNote"), FieldTypes.Text);
            string p2_P1 = CCUtility.ToSQL(Utility.GetParam("btP1"), FieldTypes.Text);
            string p2_P2 = CCUtility.ToSQL(Utility.GetParam("btP2"), FieldTypes.Text);
            string p2_Phone = CCUtility.ToSQL(Utility.GetParam("btPhone"), FieldTypes.Text);
            string p2_Memo = CCUtility.ToSQL(Utility.GetParam("btMemo"), FieldTypes.Text);
            string p2_Type = CCUtility.ToSQL(Utility.GetParam("ddl_Type"), FieldTypes.Number);
            if (p_theID.Value.Length == 0)
            {
                sSQL = "insert into AreaKK ( " +
                    "name," +
                    "allName," +
                    "Note," +
                    "MainPerson," +
                    "ContactPerson," +
                    "Phone," +
                    "Memo," +
                    "typeID) " +
                    " values(" +
                    p2_Name + "," +
                    p2_AllName + "," +
                    p2_Note + "," +
                    p2_P1 + "," +
                    p2_P2 + "," +
                    p2_Phone + "," +
                    p2_Memo + "," +
                    p2_Type + ")";
            }
            else
            {
                sWhere = " where ID=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);

                sSQL = " update AreaKK set " +
                    "[Name]=" + p2_Name +
                    ",[AllName]=" + p2_AllName +
                    ",[Note]=" + p2_Note +
                    ",[MainPerson]=" + p2_P1 +
                    ",[ContactPerson]=" + p2_P2 +
                    ",[Phone]=" + p2_Phone +
                    ",[Memo]=" + p2_Memo +
                    ",[typeID]=" + p2_Type;

                sSQL += sWhere;
            }
            SqlCommand cmd = new SqlCommand(sSQL, Utility.Connection);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception E)
            {
                ShowErrMsg(E.Message);
            }

            Response.Redirect(sFormAction);

        }

        private void btCancel_Click(object sender, System.EventArgs e)
        {
            Response.Redirect(sFormAction);
        }
    }
}
