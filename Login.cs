namespace SmallHouse
{

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

    /// <summary>
    ///    Summary description for Login.
    /// </summary>

	public class Login : System.Web.UI.Page	
    {
		private void InitializeComponent()
		{
		 Response.Redirect("index.aspx");
		}
	 
        protected void Page_Load(object sender, EventArgs e)
        {
			 Response.Redirect("index.aspx");							
	    }
    }
}