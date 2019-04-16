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

namespace SmallHouse
{
	/// <summary>
	/// index 的摘要说明。
	/// </summary>
	public class _default : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox Login_password;
		protected System.Web.UI.WebControls.Button Login_login;
		protected System.Web.UI.WebControls.Button Login_reset;
		protected System.Web.UI.WebControls.TextBox Login_name;
		protected string Login_FormAction="index.htm";
		protected CCUtility Utility;
	

		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			Utility=new CCUtility(this);
			//===============================
			// Login Open Event begin
			// Login Open Event end
			//===============================
		
			//===============================
			// Login OpenAnyPage Event begin
			// Login OpenAnyPage Event end
			//===============================
			//
			//===============================
			// Login PageSecurity begin
			// Login PageSecurity end
			//===============================
			if (Session["UserID"] != null && Int16.Parse(Session["UserID"].ToString()) > 0)
				Login_logged = true;

			if (!IsPostBack)
			{
				Page_Show(sender, e);
			}
		}
		protected void Page_Show(object sender, EventArgs e)
		{
			Login_Show();
		
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
			this.Login_login.Click += new System.EventHandler(this.Login_login_Click);
			this.Login_reset.Click += new System.EventHandler(this.Login_reset_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		void Login_Show() 
		{
	
			// Login Show begin
	
			// Login Open Event begin
			// Login Open Event end

			// Login BeforeShow Event begin
			// Login BeforeShow Event end

			if (Login_logged) 
			{
				// User logged in		
				Login_login.Text = "退出";
				Login_password.Visible = false;
				Login_reset.Visible = false;
				//Login_trname.Visible = false;
				//Login_labelname.Visible = true;
				Login_name.Text = Utility.Dlookup("members", "member_login", "member_id=" + Session["UserID"]);
			} 
			else 
			{
				// User is not logged in
				Login_login.Text = "登陆";
				Login_password.Visible = true;
				Login_reset.Visible = true;
				//Login_trname.Visible = true;
				//Login_labelname.Visible = false;
			}
		}
		protected bool Login_logged = false;

		private void Login_login_Click(object sender, System.EventArgs e)
		{
			if (Login_logged) 
			{
		
				// Login Logout begin
		
				// Login OnLogout Event begin
				// Login OnLogout Event end
				Login_logged = false;
				Session["UserID"] = 0;
				Session["UserRights"] = 0;
				Login_Show();
				// Login Logout end
		
			} 
			else 
			{
		
				// Login Login begin
				int iPassed = Convert.ToInt32(Utility.Dlookup("members", "count(*)", "member_login ='" + Login_name.Text + "' and member_password='" + CCUtility.Quote(Login_password.Text) + "'"));
				if (iPassed > 0) 
				{
			
					// Login OnLogin Event begin
					// Login OnLogin Event end
					//Login_message.Visible = false;
					Session["UserID"] = Convert.ToInt32(Utility.Dlookup("members", "member_id", "member_login ='" + Login_name.Text + "' and member_password='" + CCUtility.Quote(Login_password.Text) +"'"));
					Login_logged = true;
			
					Session["UserRights"] = Convert.ToInt32(Utility.Dlookup("members", "security_level_id", "member_login ='" + Login_name.Text + "' and member_password='" + CCUtility.Quote(Login_password.Text) + "'"));
			
					string sQueryString = Utility.GetParam("querystring");
					string sPage = Utility.GetParam("ret_page");
					if (! sPage.Equals(Request.ServerVariables["SCRIPT_NAME"]) && sPage.Length > 0) 
					{
						Response.Redirect(sPage + "?" + sQueryString);
					} 
					else 
					{
				
						Response.Redirect(Login_FormAction);
					}
				} 
				else 
				{
					//Login_message.Visible = true;
				}
				// Login Login end
	
			}
		}

		private void Login_reset_Click(object sender, System.EventArgs e)
		{
			Login_name.Text="";
			Login_password.Text="";
		}
	}
}

