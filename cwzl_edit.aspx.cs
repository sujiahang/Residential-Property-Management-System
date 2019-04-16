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
	/// cwzl_edit 的摘要说明。
	/// </summary>
	public class cwzl_edit : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox tbNO;
		protected System.Web.UI.WebControls.TextBox tbArea;
		protected System.Web.UI.WebControls.TextBox tbMaster;
		protected System.Web.UI.WebControls.TextBox tbPlace;
		protected System.Web.UI.WebControls.TextBox tbMemo;
		protected System.Web.UI.WebControls.Button btCancel;
		protected System.Web.UI.WebControls.Button btSave;
		protected System.Web.UI.WebControls.Literal ErrorMsg;
		protected System.Web.UI.HtmlControls.HtmlInputHidden p_theID;
		protected System.Web.UI.HtmlControls.HtmlInputHidden theID;
	
		protected CCUtility Utility;
		protected string sFormAction="cwzl.aspx?";
		protected System.Web.UI.WebControls.TextBox tbType;
		protected System.Web.UI.WebControls.TextBox tbCarNO;
		
		protected string sErrMsg="该车位已经存在";
		
	
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
			
			if (p_theID.Value.Length > 0 ) 
			{
				string sWhere = "";
		
				sWhere += "ID=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);		
				
				string sSQL = "select * from Carbarn where " + sWhere;
                SqlDataAdapter dsCommand = new SqlDataAdapter(sSQL, Utility.Connection);
				DataSet ds = new DataSet();
				DataRow row;

				if (dsCommand.Fill(ds, 0, 1, "Table") > 0) 
				{
					row = ds.Tables[0].Rows[0];				
					theID.Value = CCUtility.GetValue(row, "ID");									
					tbNO.Text=CCUtility.GetValue(row,"theNO");													
					tbCarNO.Text=CCUtility.GetValue(row,"carNO");
					tbType.Text=CCUtility.GetValue(row,"carType");
					tbArea.Text=CCUtility.GetValue(row,"area");							
					tbPlace.Text=CCUtility.GetValue(row,"Place");
					tbMaster.Text=CCUtility.GetValue(row,"Master");
					tbMemo.Text=CCUtility.GetValue(row,"Memo");																				
				}
			}

		
		}
		private void btSave_Click(object sender, System.EventArgs e)
		{
		
			string sSQL="";
			string sWhere="",sExist;		
			
			string p2_NO=CCUtility.ToSQL(Utility.GetParam("tbNO"), FieldTypes.Text) ;
			string p2_CarNO=CCUtility.ToSQL(Utility.GetParam("tbCarNO"), FieldTypes.Text) ;
			string p2_Type=CCUtility.ToSQL(Utility.GetParam("tbType"), FieldTypes.Text) ;
			string p2_Area=CCUtility.ToSQL(Utility.GetParam("tbArea"), FieldTypes.Text) ;
			string p2_Place=CCUtility.ToSQL(Utility.GetParam("tbPlace"), FieldTypes.Text);			
			string p2_Master=CCUtility.ToSQL(Utility.GetParam("tbMaster"), FieldTypes.Text);			  
			string p2_Memo=CCUtility.ToSQL(Utility.GetParam("tbMemo"), FieldTypes.Text);

			if (tbNO.Text.Trim()=="")
			{
				ShowErrMsg("请输入车位号.");
				return;
			}
			

			if (p_theID.Value.Length == 0) //插入查询
			{	
				sExist="theNO=" + CCUtility.ToSQL(Utility.GetParam("tbNO"), FieldTypes.Text);					

				int iCount = Utility.DlookupInt("CarBarn", "count(*)", sExist);
				if (iCount!=0)
				{
					ShowErrMsg(sErrMsg);
					return;
				}
		
				sSQL = "insert into Carbarn ( "+					
					"theNO,"+
					"carNO,"+
					"carType,"+
					"Area,"+
					"Place,"+									
					"Master,"+		
					"Memo) "+
					" values(" +
					p2_NO + "," + 
					p2_CarNO + "," + 
					p2_Type + "," + 
					p2_Area + "," + 
					p2_Place + "," + 					
					p2_Master + "," +					 														
					p2_Memo + ")";					
				
			}
			else
			{
				//查看车位是否已经存在
				sExist="theNO=" + CCUtility.ToSQL(Utility.GetParam("tbNO"), FieldTypes.Text)+					
					" and ID<>"+ CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);

				int iCount = Utility.DlookupInt("Carbarn", "count(*)", sExist);
				if (iCount!=0)
				{
					ShowErrMsg(sErrMsg);
					return;
				}
				
				sWhere= " ID=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);

				sSQL=" update carbarn set "+
					"[theNO]=" +p2_NO+
					",[carNO]=" +p2_CarNO+
					",[carType]=" +p2_Type+
					",[Area]=" +p2_Area+
					",[Place]=" +p2_Place+
					",[Master]=" +p2_Master+									
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

