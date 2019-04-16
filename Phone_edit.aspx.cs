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
	/// Phone_edit 的摘要说明。
	/// </summary>
	public class Phone_edit : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Literal ErrorMsg;
		protected System.Web.UI.WebControls.Label theValidationSummary;
		protected System.Web.UI.WebControls.DropDownList ddl_Pavilion;
		protected System.Web.UI.WebControls.DropDownList ddl_House;
		protected System.Web.UI.WebControls.TextBox tb_Memo;
		protected System.Web.UI.WebControls.Button btSave;
		protected System.Web.UI.WebControls.Button btCancel;
		protected System.Web.UI.HtmlControls.HtmlInputHidden p_theID;
		protected System.Web.UI.HtmlControls.HtmlInputHidden theID;
		protected System.Web.UI.WebControls.TextBox tbPhone;
		protected System.Web.UI.HtmlControls.HtmlInputHidden paID;
		protected CCUtility Utility;
	
		protected string sFormAction="Phone_List.aspx?";
	
		public void ValidateNumeric(object source, ServerValidateEventArgs args) 
		{
			try
			{
				Decimal temp=Decimal.Parse(args.Value);
				args.IsValid=true;
			}
			catch
			{
				args.IsValid=false;	}
		}
		private bool EditMeter_Validate()
		{
			bool result=true;
			theValidationSummary.Text="";

			for(int i=0;i<Page.Validators.Count;i++)
			{
				//if(((System.Web.UI.WebControls.BaseValidator)Page.Validators[i]).ID.ToString().StartsWith("EditMeter"))
			{
				if(!Page.Validators[i].IsValid)
				{
					theValidationSummary.Text+=Page.Validators[i].ErrorMessage+"<br>";
					result=false;
				}
			}
			}

			theValidationSummary.Visible=(!result);
			return result;
		}
		private void ShowErrMsg(string err)
		{
			string str;
			str="<script language='javascript'>";
			str+=" alert('" +err + "')";
			str+="</script>";
			ErrorMsg.Visible=true;
			ErrorMsg.Text=str;
				
		}
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			Utility=new CCUtility(this);			
			Utility.CheckSecurity(2);
			if (!IsPostBack)
			{			
				p_theID.Value = Utility.GetParam("ID");
				paID.Value = Utility.GetParam("paID");
				Page_Show(sender,e);
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
		
		void Page_Show(object sender, System.EventArgs e)
		{	
			// EditMeter Show begin
			Utility.buildListBox(ddl_Pavilion.Items,"select paID,Name from pavilion order by 1","paID","Name",null,"");
			//string cSQL="select hoID,hoRoom from House where paID="+CCUtility.ToSQL(Utility.GetParam("ddl_Pavilion"), FieldTypes.Number) ;			
			
			if (p_theID.Value.Length == 0 ) 
			{
				string ssSQL="select hoID,hoRoom from House where paID="+Utility.GetParam("paID");
				Utility.buildListBox(ddl_House.Items,ssSQL,"hoID","hoRoom",null,"");							
			}
	
			if (p_theID.Value.Length > 0 ) 
			{
				string sWhere = "";
		
				sWhere += "ID=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);
		
				// EditMeter Open Event begin
				// EditMeter Open Event end
				string sSQL = "select * from Phone where " + sWhere;
                SqlDataAdapter dsCommand = new SqlDataAdapter(sSQL, Utility.Connection);
				DataSet ds = new DataSet();
				DataRow row;

				if (dsCommand.Fill(ds, 0, 1, "EditMeter") > 0) 
				{
					row = ds.Tables[0].Rows[0];
				
					theID.Value = CCUtility.GetValue(row, "ID");	
					paID.Value=CCUtility.GetValue(row, "paID");
					tbPhone.Text = CCUtility.GetValue(row, "phone");//电话		         					
					tb_Memo.Text = CCUtility.GetValue(row, "memo");	//注解
				
					string s;					
					s=CCUtility.GetValue(row, "paID");//楼宇		
					try 
					{
						ddl_Pavilion.SelectedIndex=ddl_Pavilion.Items.IndexOf(ddl_Pavilion.Items.FindByValue(s));
					}
					catch{}
					
					sSQL="select hoID,hoRoom from House where paID="+s;
					Utility.buildListBox(ddl_House.Items,sSQL,"hoID","hoRoom",null,"");
					s=CCUtility.GetValue(row, "hoID");//房间号		
					try 
					{
						ddl_House.SelectedIndex=ddl_House.Items.IndexOf(ddl_House.Items.FindByValue(s));
					}
					catch{}					
									
				}								
											
			}
			ddl_Pavilion.Enabled=false;		

		}
		
		private void btSave_Click(object sender, System.EventArgs e)
		{
			string sSQL="";			
			// EditMeter Check Event begin
			bool bResult=EditMeter_Validate();			
			// EditMeter Check Event end			
			if (!bResult) return;

			string p2_Pavilion=CCUtility.ToSQL(paID.Value, FieldTypes.Number);
			string p2_House=CCUtility.ToSQL(Utility.GetParam("ddl_House"), FieldTypes.Number) ;			
			string p2_Phone=CCUtility.ToSQL(Utility.GetParam("tbPhone"), FieldTypes.Text) ;
			string p2_Memo=CCUtility.ToSQL(Utility.GetParam("tb_Memo"), FieldTypes.Text) ;	
			
			if (tbPhone.Text=="")
			{
				ShowErrMsg("请输入电话号码");
				return;
			}

			if(p_theID.Value.Length==0)
			{
				sSQL="phone="+p2_Phone;
				int iCount = Utility.DlookupInt("Phone", "count(*)", sSQL);
				if (iCount!=0)
				{
					ShowErrMsg("该电话已经存在!");
					return;
				}			 
			 
				sSQL = "insert into Phone (" +						
					"paID," +
					"hoID," +						
					"phone," +						
					"Memo)" +
					" values (" +						
					p2_Pavilion + "," + 
					p2_House + "," + 						
					p2_Phone + "," + 						
					p2_Memo + ")";
			}
			else
			{						 												 
				string sExist;				
				sExist="phone="+p2_Phone+" and id<>"+CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);
				 
				int iCount = Utility.DlookupInt("Phone", "count(*)", sExist);
				if (iCount!=0)
				{
					ShowErrMsg("该电话已经存在!");
					return;
				}
				
				string sWhere ="ID=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);

				sSQL = "update Phone set" +					
					"[paID]=" +p2_Pavilion+
					",[hoID]=" +p2_House+					
					",[phone]=" +p2_Phone+
					",[Memo]=" +p2_Memo;					
				
			
				sSQL=sSQL+" where "+ sWhere;
			}

			SqlCommand cmd = new SqlCommand(sSQL, Utility.Connection);
			try 
			{
				cmd.ExecuteNonQuery();
			} 
			catch (Exception E)	
			{
				theValidationSummary.Text += E.Message;
				theValidationSummary.Visible = true;
				return ;
			}	
		
			Back();
			
		}		 		  	 			 		

		private void btCancel_Click(object sender, System.EventArgs e)
		{
			Back();
		}
		private void Back()
		{
			string sURL=sFormAction+
				"paID="+CCUtility.ToSQL(paID.Value, FieldTypes.Number);

			Response.Redirect(sURL);
		}
	}
}
