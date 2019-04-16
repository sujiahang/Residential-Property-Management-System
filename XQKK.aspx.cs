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
    /// XQKK ��ժҪ˵����
    /// </summary>
    public class XQKK : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button bt_Update;
        protected System.Web.UI.WebControls.DropDownList ddl_Area;
        protected System.Web.UI.WebControls.Label Label15;
        protected System.Web.UI.WebControls.Label Label12;
        protected System.Web.UI.WebControls.Label Label9;
        protected System.Web.UI.WebControls.Label Label6;
        protected System.Web.UI.WebControls.Label Label3;
        protected System.Web.UI.WebControls.Label Label2;
        protected System.Web.UI.WebControls.Label Label5;
        protected System.Web.UI.WebControls.Label Label8;
        protected System.Web.UI.WebControls.Label Label11;
        protected System.Web.UI.WebControls.Label Label14;
        protected System.Web.UI.WebControls.Label Label18;
        protected System.Web.UI.WebControls.Label Label17;
        protected System.Web.UI.WebControls.Label Label16;
        protected System.Web.UI.WebControls.Label Label13;
        protected System.Web.UI.WebControls.Label Label10;
        protected System.Web.UI.WebControls.Label Label7;
        protected System.Web.UI.WebControls.Label Label4;
        protected CCUtility Utility;
        protected System.Web.UI.WebControls.Button btn_Add;

        private void Page_Load(object sender, System.EventArgs e)
        {
            // �ڴ˴������û������Գ�ʼ��ҳ��
            Utility = new CCUtility(this);
            //===============================			
            Utility.CheckSecurity(1);
            // EditHouse PageSecurity end
            //===============================
            if (!IsPostBack)
            {
                Page_Show(sender, e);
            }
        }
        protected void Page_Show(object sender, EventArgs e)
        {
            //string sWhere = "";

            Utility.buildListBox(ddl_Area.Items, "select ID,Name from Area", "ID", "Name", "��ѡ��", "");

            // EditHouse Open Event begin
            // EditHouse Open Event end



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
            this.ddl_Area.SelectedIndexChanged += new System.EventHandler(this.ddl_Area_SelectedIndexChanged);
            this.bt_Update.Click += new System.EventHandler(this.bt_Update_Click);
            this.Load += new System.EventHandler(this.Page_Load);
            this.btn_Add.Click += new EventHandler(this.btn_Add_Click);


        }
        #endregion

        private void bt_Update_Click(object sender, System.EventArgs e)
        {
            int iSel = 0;
            int.TryParse(ddl_Area.SelectedValue, out iSel);
            if (iSel != 0)
            {
                Response.Redirect("XQkk_edit.aspx?id=" + iSel);
            }
        }

        private void btn_Add_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("XQkk_edit.aspx?");
        }

        private void ddl_Area_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            int iSel = 0;
            int.TryParse(ddl_Area.SelectedValue, out iSel);
            System.Web.UI.WebControls.Label[] tempLabel ={Label2,Label3,Label4,Label5,Label6,Label7,
                    Label8,Label9,Label10,Label11,Label12,Label13,Label14,Label15,Label16,Label17,Label18,};

            if (iSel != 0)
            {
                bt_Update.Enabled = true;
                string sSQL = "select * from Area where id=" + iSel;
                SqlDataAdapter dsCommand = new SqlDataAdapter(sSQL, Utility.Connection);
                DataSet ds = new DataSet();
                DataRow row;
                if (dsCommand.Fill(ds, 0, 1, "theSQL") > 0)
                {
                    row = ds.Tables[0].Rows[0];
                    for (int i = 2; i <= 18; i++)
                    {
                        tempLabel[i - 2].Text = row[i].ToString();
                    }
                }

            }
            else
            {
                bt_Update.Enabled = false;
                for (int i = 2; i <= 18; i++)
                {
                    tempLabel[i - 2].Text = "";
                }
            }
        }
    }
}
