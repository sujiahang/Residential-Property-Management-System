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

namespace SmallHouse
{
	/// <summary>
	/// sheibeiMingxi_Edit 的摘要说明。
	/// </summary>
	public class shebeiMingxi_Edit : System.Web.UI.Page
	{
		private string strSQL = "";
		private DataTable tb = new DataTable();
		private CCUtility Utility;

		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.TextBox TextBox3;
		protected System.Web.UI.WebControls.TextBox TextBox4;
		protected System.Web.UI.WebControls.TextBox TextBox5;
		protected System.Web.UI.WebControls.TextBox TextBox7;
		protected System.Web.UI.WebControls.Button btn_Save;
		protected System.Web.UI.WebControls.Button btn_Reset;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.WebControls.Label lblErrMsg;
		protected System.Web.UI.WebControls.Button btn_SelectCalendar;
		protected System.Web.UI.WebControls.DropDownList list_Year;
		protected System.Web.UI.WebControls.DropDownList list_Month;
		protected System.Web.UI.WebControls.DropDownList list_blPay;
		protected System.Web.UI.WebControls.Button btn_Back;
		protected System.Web.UI.HtmlControls.HtmlInputHidden theID;
		protected System.Web.UI.WebControls.DropDownList list_Day;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			Utility = new CCUtility(this);

			if(!IsPostBack)
			{
				theID.Value = Utility.GetParam("ID");
				InitDropDownList();

				if (theID.Value.Trim() != "")
				{
					strSQL = "select * from shebei_mingxi where id=' " + theID.Value.Trim() + " '";
					tb = Utility.ExecuteSql4Ds(strSQL).Tables[0];
					if (tb.Rows.Count > 0 )
						ControlDataBind();
				}
			}
		}

		private void Page_UnLoad(object sender,System.EventArgs e)
		{
			if (Session["strFilter"] != null)
				Session["strFilter"] =null;
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
			this.list_Month.SelectedIndexChanged += new System.EventHandler(this.list_Month_SelectedIndexChanged);
			this.btn_Save.Click += new System.EventHandler(this.btn_Save_Click);
			this.btn_Back.Click += new System.EventHandler(this.btn_Back_Click);
			this.btn_Reset.Click += new System.EventHandler(this.btn_Reset_Click);
			this.Unload += new System.EventHandler(this.Page_UnLoad);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void InitDropDownList()
		{
			if (this.list_Year.Items.Count>0)
				this.list_Year.Items.Clear();
			if (this.list_Month.Items.Count>0)
				this.list_Month.Items.Clear();
			if (this.list_Day.Items.Count>0)
				this.list_Day.Items.Clear();

			int intEndYear = System.DateTime.Today.Year;

			for (int i=1900;i<=intEndYear;i++)
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

			this.list_Year.SelectedIndex = this.list_Year.Items.Count-1;  //当前年份一定是最后一个选项
			this.list_Month.SelectedIndex = intMonth - 1;
			this.list_Day.SelectedIndex = intDay - 1;
		}

		private void ControlDataBind()
		{
			this.TextBox1.Text = tb.Rows[0][1].ToString().Trim();
			this.TextBox2.Text = tb.Rows[0][2].ToString().Trim();
			this.TextBox3.Text = tb.Rows[0][3].ToString().Trim();
			this.TextBox4.Text = tb.Rows[0][4].ToString().Trim();
			this.TextBox5.Text = tb.Rows[0][6].ToString().Trim();
			this.TextBox7.Text = tb.Rows[0][7].ToString().Trim();

			//绑定日期
			string strYMD = tb.Rows[0][5].ToString().Trim();
			char[] separator = {'/'};
			string[] arrayYMD = strYMD.Split(separator,3);


			for (int i=0;i<list_Year.Items.Count-1;i++)
			{
				if (list_Year.Items[i].ToString() == arrayYMD[0])
				{
					this.list_Year.SelectedIndex = i;
					break;
				}
			}
			for (int i=0;i<list_Month.Items.Count-1;i++)
			{
				if (list_Month.Items[i].ToString() == arrayYMD[1])
				{
					this.list_Month.SelectedIndex = i;
					break;
				}
			}
			for (int i=0;i<list_Day.Items.Count-1;i++)
			{
				if (list_Day.Items[i].ToString() == arrayYMD[2])
				{
					this.list_Day.SelectedIndex = i;
					break;
				}
			}
			
		}

		private void btn_Save_Click(object sender, System.EventArgs e)
		{
			string strMingCheng = "'" + this.TextBox1.Text.Trim() + "',";
			string strGuiGe = "'" + this.TextBox2.Text.Trim() + "',";
			string strChangShang = "'" + this.TextBox4.Text.Trim() + "',";
			string strZhouQi = "'" + this.TextBox5.Text.Trim() + "',";
			string strBeiZhu = "'" + this.TextBox7.Text.Trim() + "'";
			string strShuLiang = "";
			int intShuLiang = 0;
			try
			{
				this.lblErrMsg.Visible = false;
				strShuLiang = this.TextBox3.Text.Trim();
				intShuLiang = Convert.ToInt32(strShuLiang);

			}
			catch 
			{
				strShuLiang = intShuLiang.ToString();
				this.lblErrMsg.Text = "输入的数量值不是合法的数字,存入数据库时已忽略该值!";
				this.lblErrMsg.Visible = true;
			}
			strShuLiang = "'" + strShuLiang + "',";
			string strRiQi = "'" +
				this.list_Year.SelectedItem.Text + "/" +
				this.list_Month.SelectedItem.Text + "/" +
				this.list_Day.SelectedItem.Text +"',";
            
			try
			{
				if (theID.Value.Length > 0)
				{
					strSQL = "update shebei_mingxi set"+
						" mingcheng=" + strMingCheng +
						"guige=" + strGuiGe + 
						"shuliang=" + strShuLiang + 
						"changshang=" + strChangShang +
						"riqi=" + strRiQi +
						"zhouqi=" + strZhouQi +
						"beizhu=" + strBeiZhu +
						" where id='" + theID.Value.Trim() + "'";
					Utility.Execute(strSQL);
				}
				else
				{
					strSQL = "insert into shebei_mingxi values ("+strMingCheng+strGuiGe+strShuLiang+strChangShang+strRiQi+strZhouQi+strBeiZhu+")";
					Utility.Execute(strSQL);
					this.TextBox1.Text = "必填项"; 
					this.TextBox2.Text = "";
					this.TextBox3.Text = "";
					this.TextBox4.Text = "";
					this.TextBox5.Text = "";
					this.TextBox7.Text = "";
				}
				this.lblErrMsg.Text = "数据保存成功!";
				this.lblErrMsg.Visible = true;
			}
			catch
			{
				this.lblErrMsg.Text = "保存时出错,请重新输入!";
				this.lblErrMsg.Visible = true;
			}
		}

		private void btn_Reset_Click(object sender, System.EventArgs e)
		{
			//该处赋值有两个作用，首先可以提醒用户；其次可以防止点击返回时验证控件的阻止
			this.TextBox1.Text = "必填项";  
			this.TextBox2.Text = "";
			this.TextBox3.Text = "";
			this.TextBox4.Text = "";
			this.TextBox5.Text = "";
			this.TextBox7.Text = "";
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

			if ( (this.list_Month.SelectedIndex+1) < 8 ) //前7个月
			{
				if ( (this.list_Month.SelectedIndex+1)%2 == 0 )  //当选择的月份为偶数月份时(月小)
				{
					this.list_Day.Items.Remove("31");
					if (this.list_Month.SelectedIndex+1 == 2)
						this.list_Day.Items.Remove("30");
				}
			}
			else
			{
				if ( (this.list_Month.SelectedIndex+1)%2 != 0 )  //当选择的月份为奇数月份时(月大)
				{
					this.list_Day.Items.Remove("31");
				}
			}
		}

		private void btn_Back_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("shebei_mingxi.aspx?");
		}
	}
}
