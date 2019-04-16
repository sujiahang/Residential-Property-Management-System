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
	/// luxq_edit 的摘要说明。
	/// </summary>
	public class luxq_edit : System.Web.UI.Page
	{
		protected System.Web.UI.HtmlControls.HtmlInputHidden p_theID;
		protected System.Web.UI.HtmlControls.HtmlInputHidden theID;
		protected System.Web.UI.WebControls.Button btCancel;
		protected System.Web.UI.WebControls.Button btSave;
		protected System.Web.UI.WebControls.TextBox tbMemo;
		protected System.Web.UI.WebControls.TextBox tbName;
		protected System.Web.UI.WebControls.TextBox tbLayer;
		protected System.Web.UI.WebControls.TextBox tbHigh;
		protected System.Web.UI.WebControls.TextBox tbBuildDate;
		protected System.Web.UI.WebControls.TextBox tbArea;
		protected System.Web.UI.WebControls.DropDownList ddlType;
		protected System.Web.UI.WebControls.DropDownList ddlSunny;
		protected System.Web.UI.WebControls.Literal ErrorMsg;
		protected CCUtility Utility;
		protected string sFormAction="lukk.aspx?";
		protected string sErrMsg="该楼宇已经存在";
		
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			Utility=new CCUtility(this);			
			Utility.CheckSecurity(2);
			if (!IsPostBack)
			{			
				p_theID.Value = Utility.GetParam("ID");
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
			this.btCancel.Click += new System.EventHandler(this.btCancel_Click);
			this.btSave.Click += new System.EventHandler(this.btSave_Click);
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
			Utility.buildListBox(ddlType.Items,"select typeID,Name from bm_PavilionType","typeID","Name",null,"");
			Utility.buildListBox(ddlSunny.Items,"select ID,Name from bm_Sunny","ID","Name",null,"");
		
			if (p_theID.Value.Length > 0 ) 
			{
				string sWhere = "";
		
				sWhere += "paID=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);		
				
				string sSQL = "select * from Pavilion where " + sWhere;
                SqlDataAdapter dsCommand = new SqlDataAdapter(sSQL, Utility.Connection);
				DataSet ds = new DataSet();
				DataRow row;

				if (dsCommand.Fill(ds, 0, 1, "Table") > 0) 
				{
					row = ds.Tables[0].Rows[0];				
					theID.Value = CCUtility.GetValue(row, "paID");
					//System.Web.UI.WebControls.TextBox[] tempBox={tbName,tb,btNote,btP1,btP2,btPhone,btMemo};
					tbName.Text=CCUtility.GetValue(row,"Name");
					tbHigh.Text=CCUtility.GetValue(row,"High");
					tbArea.Text=CCUtility.GetValue(row,"Area");
					tbLayer.Text=CCUtility.GetValue(row,"Layer");
					tbBuildDate.Text=CCUtility.GetValue(row,"BuildDate");
					tbMemo.Text=CCUtility.GetValue(row,"Memo");					
					//类型
					string s=CCUtility.GetValue(row, "typeID");		
					try 
					{
						ddlType.SelectedIndex=ddlType.Items.IndexOf(ddlType.Items.FindByValue(s));
					}
					catch{}
					//朝向
					s=CCUtility.GetValue(row, "sunnyID");		
					try 
					{
						ddlSunny.SelectedIndex=ddlSunny.Items.IndexOf(ddlSunny.Items.FindByValue(s));
					}
					catch{}
				}
						
			}

		
		}
		private void btSave_Click(object sender, System.EventArgs e)
		{
		
			string sSQL="";
			string sWhere="";
			string p2_Name=CCUtility.ToSQL(Utility.GetParam("tbName"), FieldTypes.Text) ;
			string p2_Area=CCUtility.ToSQL(Utility.GetParam("tbArea"), FieldTypes.Text) ;
			string p2_High=CCUtility.ToSQL(Utility.GetParam("tbHigh"), FieldTypes.Text) ;
			string p2_Layer=CCUtility.ToSQL(Utility.GetParam("tbLayer"), FieldTypes.Text) ;
			string p2_BuildDate=CCUtility.ToSQL(Utility.GetParam("tbBuildDate"), FieldTypes.Text) ;
			string p2_Type=CCUtility.ToSQL(Utility.GetParam("ddlTYpe"), FieldTypes.Number) ;
			string p2_Sunny=CCUtility.ToSQL(Utility.GetParam("ddlSunny"), FieldTypes.Number) ;
			string p2_Memo=CCUtility.ToSQL(Utility.GetParam("tbMemo"), FieldTypes.Text) ;
			if (tbName.Text.Trim()=="")
			{
				ShowErrMsg("请输入楼宇名称");
				return;
			}
			if (p_theID.Value.Length == 0) 
			{	
				int iCount = Utility.DlookupInt("pavilion", "count(*)", "Name=" + CCUtility.ToSQL(Utility.GetParam("tbName"), FieldTypes.Text));
				if (iCount!=0)
				{
					ShowErrMsg(sErrMsg);
					return;
				}
		
				sSQL = "insert into Pavilion ( "+
					"name,"+
					"Area,"+
					"High,"+
					"Layer,"+
					"BuildDate,"+
					"Memo,"+
					"sunnyID,"+
					"typeID) "+
					" values(" +
					p2_Name + "," + 
					p2_Area + "," + 
					p2_High + "," + 
					p2_Layer+ "," + 
					p2_BuildDate + "," + 
					p2_Memo + "," + 
					p2_Sunny + "," + 															
					p2_Type + ")";	
			}
			else
			{
				sWhere= " paID=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);				
				int iCount = Utility.DlookupInt("pavilion", "count(*)", "Name=" + CCUtility.ToSQL(Utility.GetParam("tbName"), FieldTypes.Text)+ " and not(" + sWhere + ")");
				if (iCount!=0)
				{
					ShowErrMsg(sErrMsg);
					return;
				}

				sSQL=" update Pavilion set "+
					"[Name]=" +p2_Name+
					",[Area]=" +p2_Area+
					",[High]=" +p2_High+
					",[Layer]=" +p2_Layer+
					",[BuildDate]=" +p2_BuildDate+
					",[Memo]=" +p2_Memo+
					",[typeID]=" +p2_Type+
					",[sunnyID]=" +p2_Sunny;
					
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
		
			Response.Redirect(sFormAction);
			
		}

		private void btCancel_Click(object sender, System.EventArgs e)
		{
			Response.Redirect(sFormAction);
		}	
	}
}

