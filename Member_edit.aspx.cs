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
	/// Member_edit ��ժҪ˵����
	/// </summary>
	public class Member_edit : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Literal ErrorMsg;
		protected System.Web.UI.WebControls.TextBox tbMemo;
		protected System.Web.UI.WebControls.Button btSave;
		protected System.Web.UI.WebControls.Button btCancel;
		protected System.Web.UI.HtmlControls.HtmlInputHidden p_theID;
		protected System.Web.UI.WebControls.DropDownList ddl_Level;
		protected System.Web.UI.WebControls.TextBox tbLogin;
		protected System.Web.UI.WebControls.TextBox tbPassWord;
		protected System.Web.UI.WebControls.TextBox tbName;
		protected System.Web.UI.HtmlControls.HtmlInputHidden theID;
		protected CCUtility Utility;
		protected string sErrMsg="���û��Ѿ�����";
		protected string sFormAction="Member_List.aspx?";
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// �ڴ˴������û������Գ�ʼ��ҳ��
			Utility=new CCUtility(this);			
			Utility.CheckSecurity(2);
			if (!IsPostBack)
			{			
				p_theID.Value = Utility.GetParam("ID");				
				Page_Show(sender,e);
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
			str="<script language='javascript'>";
			str+=" alert('" +err + "')";
			str+="</script>";
			ErrorMsg.Visible=true;
			ErrorMsg.Text=str;
				
		}

		protected void Page_Show(object sender, EventArgs e)
		{
			Utility.buildListBox(ddl_Level.Items,"select ID,Name from bm_sLevel","ID","Name",null,"");
			if (p_theID.Value.Length > 0 ) 
			{
				string sWhere = "";
		
				sWhere += "member_id=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);		
				
				string sSQL = "select * from Members where " + sWhere;
                SqlDataAdapter dsCommand = new SqlDataAdapter(sSQL, Utility.Connection);
				DataSet ds = new DataSet();
				DataRow row;

				if (dsCommand.Fill(ds, 0, 1, "Table") > 0) 
				{
					row = ds.Tables[0].Rows[0];														
					tbLogin.Text=CCUtility.GetValue(row,"member_login");													
					tbPassWord.Text=CCUtility.GetValue(row,"member_password");
					tbName.Text=CCUtility.GetValue(row,"name");					
					tbMemo.Text=CCUtility.GetValue(row,"Memo");
					string s=CCUtility.GetValue(row, "security_level_id");		
					try 
					{
						ddl_Level.SelectedIndex=ddl_Level.Items.IndexOf(ddl_Level.Items.FindByValue(s));
					}
					catch{}															
				}
			}

		
		}
		private void btSave_Click(object sender, System.EventArgs e)
		{
		
			string sSQL="";
			string sWhere="",sExist;		
			
			string p2_Login=CCUtility.ToSQL(Utility.GetParam("tbLogin"), FieldTypes.Text) ;
			string p2_PassWord=CCUtility.ToSQL(Utility.GetParam("tbPassWord"), FieldTypes.Text) ;
			string p2_Name=CCUtility.ToSQL(Utility.GetParam("tbName"), FieldTypes.Text) ;
			string p2_Level=CCUtility.ToSQL(Utility.GetParam("ddl_Level"), FieldTypes.Number) ;						  
			string p2_Memo=CCUtility.ToSQL(Utility.GetParam("tbMemo"), FieldTypes.Text);

			if (tbLogin.Text.Trim()=="")
			{
				ShowErrMsg("�������½��.");
				return;
			}
			

			if (p_theID.Value.Length == 0) //�����ѯ
			{	
				sExist="member_login=" + CCUtility.ToSQL(Utility.GetParam("tbLogin"), FieldTypes.Text);					

				int iCount = Utility.DlookupInt("Members", "count(*)", sExist);
				if (iCount!=0)
				{
					ShowErrMsg(sErrMsg);
					return;
				}
		
				sSQL = "insert into Members ( "+					
					"name,"+
					"member_login,"+
					"member_password,"+
					"security_level_id,"+					
					"Memo) "+
					" values(" +
					p2_Name + "," + 
					p2_Login + "," + 
					p2_PassWord + "," + 
					p2_Level + "," +
							 														
					p2_Memo + ")";					
				
			}
			else
			{
				//�鿴��λ�Ƿ��Ѿ�����
				sExist="member_login=" + CCUtility.ToSQL(Utility.GetParam("tbLogin"), FieldTypes.Text)+					
					" and member_id<>"+ CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);

				int iCount = Utility.DlookupInt("Members", "count(*)", sExist);
				if (iCount!=0)
				{
					ShowErrMsg(sErrMsg);
					return;
				}
				
				sWhere= " member_id=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);

				sSQL=" update members set "+
					"[name]=" +p2_Name+
					",[member_login]=" +p2_Login+
					",[member_password]=" +p2_PassWord+
					",[security_level_id]=" +p2_Level+														
					",[Memo]=" +p2_Memo;
					
					
				sSQL+=" where "+sWhere;
			}
			SqlCommand cmd = new SqlCommand(sSQL, Utility.Connection);
			try 
			{
				cmd.ExecuteNonQuery();
			} 
			catch(Exception E) 
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
			string sURL=sFormAction;//+
			//"paID="+CCUtility.ToSQL(paID.Value, FieldTypes.Number);

			Response.Redirect(sURL);
		}
	}
}


