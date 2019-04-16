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
    /// fjxx_edit ��ժҪ˵����
    /// </summary>
    public class fjxx_edit : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button btCancel;
        protected System.Web.UI.WebControls.TextBox tbPaName;
        protected System.Web.UI.WebControls.TextBox tbRoom;
        protected System.Web.UI.WebControls.TextBox tbArea;
        protected System.Web.UI.WebControls.DropDownList ddlCell;
        protected System.Web.UI.WebControls.TextBox tbLayer;
        protected System.Web.UI.WebControls.TextBox tbArea2;
        protected System.Web.UI.WebControls.DropDownList ddlType;
        protected System.Web.UI.WebControls.TextBox tbMemo;
        protected System.Web.UI.WebControls.TextBox tbClientName;
        protected System.Web.UI.WebControls.TextBox tbClientID;
        protected System.Web.UI.WebControls.TextBox tbPhone;
        protected System.Web.UI.WebControls.TextBox tbClientCard;
        protected System.Web.UI.WebControls.TextBox tbUseDate;
        protected System.Web.UI.WebControls.TextBox tbUnit;
        protected System.Web.UI.WebControls.Literal ErrorMsg;
        protected System.Web.UI.HtmlControls.HtmlInputHidden p_theID;
        protected System.Web.UI.HtmlControls.HtmlInputHidden theID;
        protected System.Web.UI.HtmlControls.HtmlInputHidden paID;
        protected System.Web.UI.WebControls.Button btSave;
        protected System.Web.UI.WebControls.DropDownList ddlSunny;

        protected CCUtility Utility;
        protected string sFormAction = "fjxx.aspx?";

        protected string sErrMsg = "�÷����Ѿ�����";


        private void Page_Load(object sender, System.EventArgs e)
        {
            // �ڴ˴������û������Գ�ʼ��ҳ��
            Utility = new CCUtility(this);
            Utility.CheckSecurity(2);
            if (!IsPostBack)
            {
                p_theID.Value = Utility.GetParam("ID");
                paID.Value = Utility.GetParam("paID");
                Page_Show(sender, e);
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
            this.btSave.Click += new System.EventHandler(this.btSave_Click);
            this.btCancel.Click += new System.EventHandler(this.btCancel_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion
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
            Utility.buildListBox(ddlCell.Items, "select ID,Name from bm_Cell", "ID", "Name", null, "");
            Utility.buildListBox(ddlSunny.Items, "select ID,Name from bm_Sunny", "ID", "Name", null, "");
            Utility.buildListBox(ddlType.Items, "select ID,Name from bm_Indoor", "ID", "Name", null, "");
            //¥����
            tbPaName.Text = Utility.Dlookup("pavilion", "Name", "paID=" + CCUtility.ToSQL(paID.Value, FieldTypes.Number));
            tbPaName.Enabled = false;

            if (p_theID.Value.Length > 0)
            {
                string sWhere = "";

                sWhere += "hoID=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);

                string sSQL = "select * from House where " + sWhere;
                SqlDataAdapter dsCommand = new SqlDataAdapter(sSQL, Utility.Connection);
                DataSet ds = new DataSet();
                DataRow row;

                if (dsCommand.Fill(ds, 0, 1, "Table") > 0)
                {
                    row = ds.Tables[0].Rows[0];
                    theID.Value = CCUtility.GetValue(row, "hoID");
                    paID.Value = CCUtility.GetValue(row, "paID");

                    tbRoom.Text = CCUtility.GetValue(row, "hoRoom");
                    tbLayer.Text = CCUtility.GetValue(row, "hoFloor");
                    tbArea.Text = CCUtility.GetValue(row, "hoArchArce");
                    tbArea2.Text = CCUtility.GetValue(row, "hoUseArce");

                    tbClientName.Text = CCUtility.GetValue(row, "Client_Name");
                    tbClientID.Text = CCUtility.GetValue(row, "CLIENT_CARD");
                    tbPhone.Text = CCUtility.GetValue(row, "CLIENT_PHONE");
                    tbClientCard.Text = CCUtility.GetValue(row, "CLIENT_ACCOUNT_NUMBER");
                    tbUseDate.Text = CCUtility.GetValue(row, "USE_DATE");
                    tbUnit.Text = CCUtility.GetValue(row, "COMPANY_NAME");

                    tbMemo.Text = CCUtility.GetValue(row, "Memo");
                    //����
                    string s = CCUtility.GetValue(row, "indoorID");
                    try
                    {
                        ddlType.SelectedIndex = ddlType.Items.IndexOf(ddlType.Items.FindByValue(s));
                    }
                    catch { }
                    //��Ԫ
                    s = CCUtility.GetValue(row, "cellID");
                    try
                    {
                        ddlCell.SelectedIndex = ddlCell.Items.IndexOf(ddlCell.Items.FindByValue(s));
                    }
                    catch { }
                    //����
                    s = CCUtility.GetValue(row, "sunnyID");
                    try
                    {
                        ddlSunny.SelectedIndex = ddlSunny.Items.IndexOf(ddlSunny.Items.FindByValue(s));
                    }
                    catch { }
                }
            }


        }
        private void btSave_Click(object sender, System.EventArgs e)
        {

            string sSQL = "";
            string sWhere = "", sExist;
            string p2_paID = CCUtility.ToSQL(paID.Value, FieldTypes.Number);
            string p2_Room = CCUtility.ToSQL(Utility.GetParam("tbRoom"), FieldTypes.Text);
            string p2_Area = CCUtility.ToSQL(Utility.GetParam("tbArea"), FieldTypes.Text);
            string p2_Area2 = CCUtility.ToSQL(Utility.GetParam("tbArea2"), FieldTypes.Text);
            string p2_Layer = CCUtility.ToSQL(Utility.GetParam("tbLayer"), FieldTypes.Text);
            string p2_Cell = CCUtility.ToSQL(Utility.GetParam("ddlCell"), FieldTypes.Number);
            string p2_Type = CCUtility.ToSQL(Utility.GetParam("ddlTYpe"), FieldTypes.Number);
            string p2_Sunny = CCUtility.ToSQL(Utility.GetParam("ddlSunny"), FieldTypes.Number);
            string p2_Memo = CCUtility.ToSQL(Utility.GetParam("tbMemo"), FieldTypes.Text);

            string p2_ClientName = CCUtility.ToSQL(Utility.GetParam("tbClientName"), FieldTypes.Text);
            string p2_ClientID = CCUtility.ToSQL(Utility.GetParam("tbClientID"), FieldTypes.Text);
            string p2_UseDate = CCUtility.ToSQL(Utility.GetParam("tbUseDate"), FieldTypes.Text);
            string p2_Phone = CCUtility.ToSQL(Utility.GetParam("tbPhone"), FieldTypes.Text);
            string p2_ClientCard = CCUtility.ToSQL(Utility.GetParam("tbClientCard"), FieldTypes.Text);
            string p2_Unit = CCUtility.ToSQL(Utility.GetParam("tbUnit"), FieldTypes.Text);



            if (tbRoom.Text.Trim() == "")
            {
                ShowErrMsg("�����뷿������");
                return;
            }

            if (tbPaName.Text.Trim() == "")
            {
                ShowErrMsg("������¥������");
                return;
            }

            if (p_theID.Value.Length == 0) //�����ѯ
            {
                sExist = "hoRoom=" + CCUtility.ToSQL(Utility.GetParam("tbRoom"), FieldTypes.Text) +
                       " and paID<>" + p2_paID;

                int iCount = Utility.DlookupInt("House", "count(*)", sExist);
                if (iCount != 0)
                {
                    ShowErrMsg(sErrMsg);
                    return;
                }

                sSQL = "insert into House ( " +
                    "paID," +
                    "hoRoom," +
                    "hoFloor," +
                    "hoArchArce," +
                    "hoUseArce," +
                    "cellID," +
                    "sunnyId," +
                    "indoorID," +
                    "Memo," +
                    "CLIENT_NAME," +
                    "CLIENT_CARD," +
                    "CLIENT_ACCOUNT_NUMBER," +
                    "COMPANY_NAME," +
                    "CLIENT_PHONE," +
                    "USE_DATE) " +
                    " values(" +
                    p2_paID + "," +
                    p2_Room + "," +
                    p2_Layer + "," +
                    p2_Area + "," +
                    p2_Area2 + "," +
                    p2_Cell + "," +
                    p2_Sunny + "," +
                    p2_Type + "," +
                    p2_Memo + "," +
                    p2_ClientName + "," +
                    p2_ClientID + "," +
                    p2_ClientCard + "," +
                    p2_Unit + "," +
                    p2_Phone + "," +
                    p2_UseDate + ")";

            }
            else
            {
                //�鿴�����Ƿ��Ѿ�����A
                sExist = "hoRoom=" + CCUtility.ToSQL(Utility.GetParam("tbRoom"), FieldTypes.Text) +
                    " and paID<>" + p2_paID +
                    " and hoID<>" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);
                int iCount = Utility.DlookupInt("House", "count(*)", sExist);
                if (iCount != 0)
                {
                    ShowErrMsg(sErrMsg);
                    return;
                }

                sWhere = " hoID=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);

                sSQL = " update House set " +
                    "[hoRoom]=" + p2_Room +
                    ",[hoFloor]=" + p2_Layer +
                    ",[hoArchArce]=" + p2_Area +
                    ",[hoUseArce]=" + p2_Area2 +
                    ",[cellID]=" + p2_Cell +
                    ",[sunnyId]=" + p2_Sunny +
                    ",[IndoorID]=" + p2_Type +
                    ",[Memo]=" + p2_Memo +
                    ",[Client_Name]=" + p2_ClientName +
                    ",[CLIENT_CARD]=" + p2_ClientID +
                    ",[CLIENT_ACCOUNT_NUMBER]=" + p2_ClientCard +
                    ",[COMPANY_NAME]=" + p2_Unit +
                    ",[CLIENT_PHONE]=" + p2_Phone +
                    ",[USE_DATE]=" + p2_UseDate;

                sSQL += " where " + sWhere;
            }
            SqlCommand cmd = new SqlCommand(sSQL, Utility.Connection);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception E)
            {
                ShowErrMsg(E.Message);
                return;
            }

            Back();//Response.Redirect(sFormAction);

        }

        private void btCancel_Click(object sender, System.EventArgs e)
        {
            Back();
        }
        private void Back()
        {
            string sURL = sFormAction +
                   "paID=" + CCUtility.ToSQL(paID.Value, FieldTypes.Number);

            Response.Redirect(sURL);
        }
    }
}

