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
	/// sheibeiWeixiu_Edit ��ժҪ˵����
	/// </summary>
	public class sheibeiWeixiu_Edit : System.Web.UI.Page
	{
		private string strSQL = "";
		private DataTable tb = new DataTable();
		private CCUtility Utility;

		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.DropDownList list_Year;
		protected System.Web.UI.WebControls.DropDownList list_Month;
		protected System.Web.UI.WebControls.DropDownList list_Day;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Button btn_Save;
		protected System.Web.UI.WebControls.Button btn_Reset;
		protected System.Web.UI.WebControls.Label lblErrMsg;
		protected System.Web.UI.WebControls.DropDownList list_blPay;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.TextBox TextBox3;
		protected System.Web.UI.WebControls.TextBox TextBox4;
		protected System.Web.UI.WebControls.TextBox TextBox5;
		protected System.Web.UI.WebControls.DropDownList list_Name;
		protected System.Web.UI.WebControls.Button btn_Back;
		protected System.Web.UI.HtmlControls.HtmlInputHidden theID;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// �ڴ˴������û������Գ�ʼ��ҳ��
			Utility = new CCUtility(this);

			if(!IsPostBack)
			{
				theID.Value = Utility.GetParam("ID");
				InitDropDownList();

				if (theID.Value.Trim() != "")
				{
					strSQL = "select * from shebei_weixiu where id=' " + theID.Value.Trim() + " '";
					tb = Utility.ExecuteSql4Ds(strSQL).Tables[0];
					if (tb.Rows.Count > 0 )
						ControlDataBind();
				}
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
			this.list_Month.SelectedIndexChanged += new System.EventHandler(this.list_Month_SelectedIndexChanged);
			this.btn_Save.Click += new System.EventHandler(this.btn_Save_Click);
			this.btn_Reset.Click += new System.EventHandler(this.btn_Reset_Click);
			this.btn_Back.Click += new System.EventHandler(this.btn_Back_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void ControlDataBind()
		{
			this.TextBox2.Text = tb.Rows[0][2].ToString().Trim();
			this.TextBox3.Text = tb.Rows[0][4].ToString().Trim();
			this.TextBox4.Text = tb.Rows[0][3].ToString().Trim();
			this.TextBox5.Text = tb.Rows[0][7].ToString().Trim();

			string strName = tb.Rows[0][1].ToString().Trim();
			for (int i=0;i<list_Name.Items.Count-1;i++)
			{
				if (list_Name.Items[i].ToString().Trim() == strName)					
				{
					list_Name.SelectedIndex = i;
					break;
				}
			}

			if (tb.Rows[0][6].ToString().Trim() == "δ֪")
                this.list_blPay.SelectedIndex = 0;
			else if (tb.Rows[0][6].ToString().Trim() == "��")
				this.list_blPay.SelectedIndex = 1;
			else if (tb.Rows[0][6].ToString().Trim() == "��")
				this.list_blPay.SelectedIndex = 2;
		}

		private void InitDropDownList()
		{
			//������ƿ�,�����ƿ��е��豸���ƴ���ϸ����ȡ��
			if (this.list_Name.Items.Count > 0)
			{
				this.list_Name.Items.Clear();
			}
			//���е����ƿ����ظ�,����ʹ��DISTINCT�޶�����
			strSQL = "select distinct mingcheng from shebei_mingxi"; 
			SqlCommand cmd = new SqlCommand(strSQL,Utility.Connection);
			SqlDataReader rdr = cmd.ExecuteReader();
			while (rdr.Read())
			{
				this.list_Name.Items.Add(rdr[0].ToString().Trim());
			}
			rdr.Close();

			//���������������
			if (this.list_Year.Items.Count>0)
				this.list_Year.Items.Clear();
			if (this.list_Month.Items.Count>0)
				this.list_Month.Items.Clear();
			if (this.list_Day.Items.Count>0)
				this.list_Day.Items.Clear();

			int intEndYear = System.DateTime.Today.Year;

			for (int i=1949;i<=intEndYear;i++)
				this.list_Year.Items.Add(i.ToString());
			for (int i=1;i<=12;i++)
				if (i<10)
					this.list_Month.Items.Add("0"+i.ToString());
				else
					this.list_Month.Items.Add(i.ToString());
			for (int i=1;i<=31;i++)
				if (i<10)
					this.list_Day.Items.Add("0"+i.ToString());
				else
					this.list_Day.Items.Add(i.ToString());
			int intMonth = System.DateTime.Today.Month;
			int intDay = System.DateTime.Today.Day;

			this.list_Year.SelectedIndex = this.list_Year.Items.Count-1;  //��ǰ���һ�������һ��ѡ��
			this.list_Month.SelectedIndex = intMonth - 1;
			this.list_Day.SelectedIndex = intDay - 1;
		}

		private void btn_Save_Click(object sender, System.EventArgs e)
		{
			string strMingCheng = "'" + this.list_Name.SelectedItem.Text.Trim() + "',";
			string strYuanyin = "'" + this.TextBox2.Text.Trim() + "',";
			string strDanwei = "'" + this.TextBox4.Text.Trim() + "',";
			string strFuzeren = "'" + this.TextBox3.Text.Trim() + "',";
			string strBeiZhu = "'" + this.TextBox5.Text.Trim() + "'";
			string strFukuanfou = "'" + this.list_blPay.SelectedItem.Text.Trim() + "',";
			string strRiqi = "'" +
				this.list_Year.SelectedItem.Text + "/" +
				this.list_Month.SelectedItem.Text + "/" +
				this.list_Day.SelectedItem.Text +"',";

			try
			{
				if (theID.Value.Length > 0) //�޸�
				{
					strSQL = "update shebei_weixiu set"+
						" mingcheng=" + strMingCheng +
						"yuanyin=" + strYuanyin + 
						"danwei=" + strDanwei + 
						"fuzeren=" + strFuzeren +
						"riqi=" + strRiqi +
						"fukuanfou=" + strFukuanfou +
						"beizhu=" + strBeiZhu +
						" where id='" + theID.Value.Trim() + "'";
					Utility.Execute(strSQL);
				}
				else                     //����¼�¼
				{
					strSQL = "insert into shebei_weixiu values ("+strMingCheng+strYuanyin+strDanwei+strFuzeren+strRiqi+strFukuanfou+strBeiZhu+")";
					Utility.Execute(strSQL);
					this.TextBox2.Text = "";
					this.TextBox3.Text = "";
					this.TextBox4.Text = "";
					this.TextBox5.Text = "";
				}
				this.lblErrMsg.Text = "���ݱ���ɹ�!";
				this.lblErrMsg.Visible = true;
			}
			catch
			{
				this.lblErrMsg.Text = "����ʱ����,����������!";
				this.lblErrMsg.Visible = true;
			}
	}

		private void btn_Reset_Click(object sender, System.EventArgs e)
		{
			this.TextBox2.Text = "";
			this.TextBox3.Text = "";
			this.TextBox4.Text = "";
			this.TextBox5.Text = "";
			this.lblErrMsg.Visible = false;		
		}

		private void list_Month_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			if (list_Day.Items.Count > 0)
				list_Day.Items.Clear();
			for (int i=1;i<=31;i++)
				if (i<10)
					this.list_Day.Items.Add("0"+i.ToString());
				else
					this.list_Day.Items.Add(i.ToString());

			if ( (this.list_Month.SelectedIndex+1) < 8 ) //ǰ7����
			{
				if ( (this.list_Month.SelectedIndex+1)%2 == 0 )  //��ѡ����·�Ϊż���·�ʱ(��С)
				{
					this.list_Day.Items.Remove("31");
					if (this.list_Month.SelectedIndex+1 == 2)
						this.list_Day.Items.Remove("30");
				}
			}
			else
			{
				if ( (this.list_Month.SelectedIndex+1)%2 != 0 )  //��ѡ����·�Ϊ�����·�ʱ(�´�)
				{
					this.list_Day.Items.Remove("31");
				}
			}
		}

		private void btn_Back_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("shebei_weixiu.aspx?");
		}
	}
}
