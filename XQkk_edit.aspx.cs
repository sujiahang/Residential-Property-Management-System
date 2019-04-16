using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Data.OleDb;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace SmallHouse
{
	/// <summary>
	/// XQkk_edit 的摘要说明。
	/// </summary>
	public class XQkk_edit : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.TextBox TextBox3;
		protected System.Web.UI.WebControls.TextBox TextBox4;
		protected System.Web.UI.WebControls.TextBox TextBox5;
		protected System.Web.UI.WebControls.TextBox TextBox6;
		protected System.Web.UI.WebControls.TextBox TextBox7;
		protected System.Web.UI.WebControls.TextBox TextBox8;
		protected System.Web.UI.WebControls.TextBox TextBox9;
		protected System.Web.UI.WebControls.TextBox TextBox10;
		protected System.Web.UI.WebControls.TextBox TextBox11;
		protected System.Web.UI.WebControls.TextBox TextBox12;
		protected System.Web.UI.WebControls.TextBox TextBox13;
		protected System.Web.UI.WebControls.TextBox TextBox14;
		protected System.Web.UI.WebControls.TextBox TextBox15;
		protected System.Web.UI.WebControls.TextBox TextBox16;
		protected System.Web.UI.WebControls.TextBox TextBox17;
		protected System.Web.UI.WebControls.TextBox TextBox18;
		protected System.Web.UI.WebControls.Button bt_Save;
		protected System.Web.UI.HtmlControls.HtmlInputHidden p_theID;
		protected System.Web.UI.HtmlControls.HtmlInputHidden theID;		
		protected System.Web.UI.WebControls.Button bt_Cancel;
		protected System.Web.UI.WebControls.Literal ErrorMsg;
		protected CCUtility Utility;
	
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
				
				string sSQL = "select * from Area where " + sWhere;
                SqlDataAdapter dsCommand = new SqlDataAdapter(sSQL, Utility.Connection);
				DataSet ds = new DataSet();
				DataRow row;

				if (dsCommand.Fill(ds, 0, 1, "Table") > 0) 
				{
					row = ds.Tables[0].Rows[0];				
					theID.Value = CCUtility.GetValue(row, "ID");
					System.Web.UI.WebControls.TextBox[] tempBox={TextBox1,TextBox2,TextBox3,TextBox4,TextBox5,TextBox6,
											TextBox7,TextBox8,TextBox9,TextBox10,TextBox11,TextBox12,
																	TextBox13,TextBox14,TextBox15,TextBox16,TextBox17,TextBox18};
					for(int i=0;i<18;i++)
					{
						tempBox[i].Text=row[i+1].ToString();
					}
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
			this.bt_Save.Click += new System.EventHandler(this.bt_Save_Click);
			this.bt_Cancel.Click += new System.EventHandler(this.bt_Cancel_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void bt_Save_Click(object sender, System.EventArgs e)
		{
            string sSQL = "";
			string sWhere="";

            if (p_theID.Value.Length > 0)
            {
                sWhere = " where ID=" + CCUtility.ToSQL(p_theID.Value, FieldTypes.Number);
                sSQL = @" UPDATE Area SET Name='{0}',[fuzeren]='{1}',[jianchengdate]='{2}',[lianxiren]='{3}',[lianxitel]='{4}',[yidongtel]='{5}',[zhandiarea]='{6}'
      ,[daoluarea]='{7}',[dcheweiarea]='{8}',[jianzhuarea]='{9}',[gaocengnum]='{10}',[chekuarea]='{11}',[gonggarea]='{12}'
      ,[duocengnum]='{13}',[cheweinum]='{14}',[luhuaarea]='{15}',[weizhi]='{16}',[beizhu]='{17}' ";
                sSQL = string.Format(sSQL, TextBox1.Text.Trim(), TextBox2.Text.Trim(), TextBox3.Text.Trim(), TextBox4.Text.Trim(),
                    TextBox5.Text.Trim(), TextBox6.Text.Trim(), TextBox7.Text.Trim(), TextBox8.Text.Trim(), TextBox9.Text.Trim(),
                    TextBox10.Text.Trim(), TextBox11.Text.Trim(), TextBox12.Text.Trim(), TextBox13.Text.Trim(), TextBox14.Text.Trim(),
                    TextBox15.Text.Trim(), TextBox16.Text.Trim(), TextBox17.Text.Trim(), TextBox18.Text.Trim());
                sSQL += sWhere;
            }
            else
            {
                sSQL = @"INSERT INTO Area (Name,[fuzeren],[jianchengdate],[lianxiren],[lianxitel],[yidongtel],[zhandiarea]
      ,[daoluarea],[dcheweiarea],[jianzhuarea],[gaocengnum],[chekuarea],[gonggarea]
      ,[duocengnum],[cheweinum],[luhuaarea],[weizhi],[beizhu])
VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}'); ";

                sSQL = string.Format(sSQL, TextBox1.Text.Trim(), TextBox2.Text.Trim(), TextBox3.Text.Trim(), TextBox4.Text.Trim(),
    TextBox5.Text.Trim(), TextBox6.Text.Trim(), TextBox7.Text.Trim(), TextBox8.Text.Trim(), TextBox9.Text.Trim(),
    TextBox10.Text.Trim(), TextBox11.Text.Trim(), TextBox12.Text.Trim(), TextBox13.Text.Trim(), TextBox14.Text.Trim(),
    TextBox15.Text.Trim(), TextBox16.Text.Trim(), TextBox17.Text.Trim(), TextBox18.Text.Trim());
            }

            SqlCommand cmd = new SqlCommand(sSQL, Utility.Connection);
			try 
			{
				cmd.ExecuteNonQuery();
			} 
			catch(Exception E) 
			{
			  ShowErrMsg(E.Message);
			}			
			Response.Redirect("XQKK.aspx");
		}

		private void bt_Cancel_Click(object sender, System.EventArgs e)
		{
		   Response.Redirect("XQKK.aspx");
		}
	}
}
