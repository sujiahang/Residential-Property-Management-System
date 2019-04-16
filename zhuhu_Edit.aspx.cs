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
	/// XQkk_edit 的摘要说明。
	/// </summary>
	public class zhuhu_Edit : System.Web.UI.Page
	{
		protected CCUtility Utility;

		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.TextBox TextBox4;
		protected System.Web.UI.WebControls.TextBox TextBox5;
		protected System.Web.UI.WebControls.TextBox TextBox6;
		protected System.Web.UI.WebControls.TextBox TextBox7;
		protected System.Web.UI.WebControls.TextBox TextBox8;
		protected System.Web.UI.WebControls.TextBox TextBox9;
		protected System.Web.UI.WebControls.TextBox TextBox10;
		protected System.Web.UI.WebControls.TextBox TextBox11;
		protected System.Web.UI.HtmlControls.HtmlInputHidden p_theID;
		protected System.Web.UI.WebControls.Button btn_Reset;
		protected System.Web.UI.WebControls.Button btn_Back;
		protected System.Web.UI.WebControls.DropDownList DropDownList1;
		protected System.Web.UI.WebControls.Label lblErrMsg;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator1;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator2;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator3;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator3;
		protected System.Web.UI.WebControls.DropDownList DropDownList2;
		protected System.Web.UI.WebControls.Button btn_Save;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			Utility=new CCUtility(this);			
			Utility.CheckSecurity(2);
			if (!IsPostBack)
			{			
				p_theID.Value = Utility.GetParam("bianhao");
				Page_Show(sender,e);
			}
		}

		protected void Page_Show(object sender, EventArgs e)
		{
			if (p_theID.Value.Length > 0 ) 
			{
				string sWhere = "";
		
				sWhere += "bianhao='" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number) + "'";		
				
				string sSQL = "select * from zhuhu where " + sWhere;
                SqlCommand cmd = new SqlCommand(sSQL, Utility.Connection);
                SqlDataReader rdr = cmd.ExecuteReader();
				while (rdr.Read())
				{
					TextBox1.Text = rdr["bianhao"].ToString().Trim();
					TextBox2.Text = rdr["xingming"].ToString().Trim();
					if (rdr["xingbie"].ToString().Trim() == "男")
						DropDownList1.SelectedIndex = 0;
					else
						DropDownList1.SelectedIndex = 1;
					TextBox4.Text = rdr["shenfenzhenghao"].ToString().Trim();
					TextBox5.Text = rdr["danwei"].ToString().Trim();
					TextBox6.Text = rdr["dianhua"].ToString().Trim();
					TextBox7.Text = rdr["shouji"].ToString().Trim();
					TextBox8.Text = rdr["youjian"].ToString().Trim();
					TextBox9.Text = rdr["jianlizhe"].ToString().Trim();
					string strURL = rdr["zhaopian"].ToString().Trim();
					char[] separator = {'\\'};
					string[] arrayYMD = strURL.Split(separator,3);
					TextBox10.Text = arrayYMD[1];
					TextBox11.Text = rdr["leixing"].ToString().Trim();
					if (rdr["shifouruzhu"].ToString().Trim() == "是")
						DropDownList2.SelectedIndex = 1;
					else
						DropDownList2.SelectedIndex = 0;
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
			this.btn_Save.Click += new System.EventHandler(this.btn_Save_Click);
			this.btn_Back.Click += new System.EventHandler(this.btn_Back_Click);
			this.btn_Reset.Click += new System.EventHandler(this.btn_Reset_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btn_Save_Click(object sender, System.EventArgs e)
		{
			string strSQL="";
			string sWhere="";

			string strBianhao = "'" + TextBox1.Text.Trim() + "',";
			string strXingming = "'" + TextBox2.Text.Trim() + "',";
			string strXingbie = "'" + DropDownList1.SelectedItem.Text.Trim() + "',";
			string strID = "'" + TextBox4.Text.Trim() + "',";
			string  strDanwei= "'" + TextBox5.Text.Trim() + "',";
			string strDianhua = "'" + TextBox6.Text.Trim() + "',";
			string strShouji = "'" + TextBox7.Text.Trim() + "',";
			string strYoujian = "'" + TextBox8.Text.Trim() + "',";
			string strJianlizhe = "'" + TextBox9.Text.Trim() + "',";
			string strZhaopian = "'human\\" + TextBox10.Text.Trim() + "',";
			string strLeixing = "'" + TextBox11.Text.Trim() + "',";
			string strShifouruzhu = "'" + DropDownList2.SelectedItem.Text.Trim() + "'";


			if (p_theID.Value.Length > 0) 
			{
				sWhere =" where bianhao='" + p_theID.Value.Trim() + "'";
				strSQL = "update zhuhu set "+
					"bianhao="+strBianhao + 
					"xingming="+strXingming + 
					"xingbie="+strXingbie + 
					"danwei="+strDanwei + 
					"shenfenzhenghao="+strID + 
					"dianhua="+strDianhua + 
					"shouji="+strShouji + 
					"youjian="+strYoujian + 
					"jianlizhe="+strJianlizhe + 
					"zhaopian="+strZhaopian + 
					"leixing="+strLeixing+
					"shifouruzhu="+strShifouruzhu;
				strSQL+=sWhere;
				SqlCommand cmd = new SqlCommand(strSQL, Utility.Connection);
				try 
				{
					cmd.ExecuteNonQuery();
					this.lblErrMsg.Text = "数据保存成功!";
					this.lblErrMsg.Visible = true;
				}
				catch
				{
					this.lblErrMsg.Text = "保存时出错,请重新输入!";
					this.lblErrMsg.Visible = true;
					return;
				}			
			}
			else
			{
				strSQL = "insert into zhuhu values (" + strBianhao + 
					strXingming + strXingbie + strDanwei+ strID + 
					strDianhua + strShouji + strYoujian + strJianlizhe +
					strZhaopian + strLeixing +"'否')";
				SqlCommand cmd = new SqlCommand(strSQL, Utility.Connection);
				try 
				{
					cmd.ExecuteNonQuery();
					this.TextBox1.Text = "必填项";
					this.TextBox2.Text = "必填项";
					this.DropDownList1.SelectedIndex = 0;
					this.TextBox4.Text = "必填项";
					this.TextBox5.Text = "";
					this.TextBox6.Text = "";
					this.TextBox7.Text = "";
					this.TextBox8.Text = "";
					this.TextBox9.Text = "";
					this.TextBox10.Text = "";
					this.TextBox11.Text = "";
					this.DropDownList2.SelectedIndex = 0;
					this.lblErrMsg.Text = "数据保存成功!";
					this.lblErrMsg.Visible = true;
				}
				catch
				{
					this.lblErrMsg.Text = "保存时出错,请重新输入!";
					this.lblErrMsg.Visible = true;
					return;
				}			
			}
		}

		private void btn_Back_Click(object sender, System.EventArgs e)
		{
		   Response.Redirect("zhuhu.aspx");		
		}

		private void btn_Reset_Click(object sender, System.EventArgs e)
		{
			this.TextBox1.Text = "必填项";
			this.TextBox2.Text = "必填项";
			this.DropDownList1.SelectedIndex = 0;
			this.TextBox4.Text = "必填项";
			this.TextBox5.Text = "";
			this.TextBox6.Text = "";
			this.TextBox7.Text = "";
			this.TextBox8.Text = "";
			this.TextBox9.Text = "";
			this.TextBox10.Text = "";
			this.TextBox11.Text = "";
			this.DropDownList2.SelectedIndex = 0;
			this.lblErrMsg.Visible = false;
		}
	}
}
