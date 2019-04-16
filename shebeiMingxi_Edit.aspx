<%@ Page language="c#" Codebehind="shebeiMingxi_Edit.aspx.cs" AutoEventWireup="false" Inherits="SmallHouse.shebeiMingxi_Edit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>物业管理系统 - 设备明细表单修改</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/mm.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body bgColor="#ffffff" leftMargin="0" topMargin="0" marginheight="0" marginwidth="0">
		<form name="theForm" runat="server" ID="Form1">
			<table cellSpacing="0" cellPadding="0" border="0" WIDTH="100%" HEIGHT="100%">
				<TBODY>
					<tr>
						<td style="HEIGHT: 118px">
							<table class="bborder" style="WIDTH: 100%; HEIGHT: 24px" cellSpacing="0" cellPadding="0"
								border="0">
								<tr>
									<td style="WIDTH: 100%; HEIGHT: 2px">
										<table style="WIDTH: 100%; HEIGHT: 16px" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<tr>
												<td style="WIDTH: 100%; HEIGHT: 1px"><IMG height="16" hspace="3" src="images/loca.gif" width="16" align="absMiddle">
													位置:&nbsp;设备管理 &gt;&nbsp;设备明细表单修改</td>
												<td style="WIDTH: 51px; HEIGHT: 1px" align="right" width="51"><A onclick="self.history.back();" href="#"><IMG height="16" hspace="3" src="images/back2.gif" width="16" border="0"></A></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<TABLE class="btd" style="WIDTH: 100%; HEIGHT: 159px" cellSpacing="0" cellPadding="0" border="0">
								<TR>
									<td style="WIDTH: 30.19%; HEIGHT: 34px"><FONT face="宋体">&nbsp;</FONT><asp:label id="Label1" runat="server" Width="40px">名  称:</asp:label><FONT face="宋体">&nbsp;&nbsp;</FONT>
										<asp:textbox id="TextBox1" runat="server" Width="97" ToolTip="此项必填" placeholder="必选项"></asp:textbox><FONT face="宋体"></FONT><asp:label id="Label9" runat="server" Height="10px" ForeColor="Red">*</asp:label><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" Width="24px" ControlToValidate="TextBox1"
											ErrorMessage="必填"></asp:requiredfieldvalidator></td>
									<td style="WIDTH: 26%; HEIGHT: 34px"><asp:label id="Label2" runat="server">规  格:</asp:label><FONT face="宋体">&nbsp; 
											&nbsp; </FONT>
										<asp:textbox id="TextBox2" runat="server" Width="97px"></asp:textbox></td>
									<td style="WIDTH: 38%; HEIGHT: 34px"><FONT face="宋体"></FONT><asp:label id="Label3" runat="server">数  量:</asp:label><FONT face="宋体">&nbsp;&nbsp; 
											&nbsp;</FONT><asp:textbox id="TextBox3" runat="server" Width="88px" ToolTip="此处只能填写数字"></asp:textbox>
										<asp:label id="Label8" runat="server" ForeColor="Red" DESIGNTIMEDRAGDROP="337">请输入数字</asp:label><FONT face="宋体">&nbsp;</FONT></td>
								</TR>
								<tr>
									<td style="WIDTH: 30.19%; HEIGHT: 8px"><FONT face="宋体">&nbsp;</FONT><asp:label id="Label4" runat="server" Width="54">生产厂商:</asp:label><FONT face="宋体"></FONT><asp:textbox id="TextBox4" runat="server" Width="97px" Height="22"></asp:textbox></td>
									<td style="WIDTH: 26%; HEIGHT: 8px"><asp:label id="Label5" runat="server">检修周期:</asp:label>&nbsp;<FONT face="宋体"></FONT><asp:textbox id="TextBox5" runat="server" Width="97px"></asp:textbox></td>
									<td style="WIDTH: 38%; HEIGHT: 8px"><asp:label id="Label6" runat="server">生产日期:</asp:label>&nbsp;
										<asp:dropdownlist id="list_Year" runat="server">
											<asp:ListItem Value="年份  ">年份  </asp:ListItem>
										</asp:dropdownlist><asp:dropdownlist id="list_Month" runat="server" Width="51px" AutoPostBack="True">
											<asp:ListItem Value="月份">月份</asp:ListItem>
										</asp:dropdownlist><asp:dropdownlist id="list_Day" runat="server" Width="51px">
											<asp:ListItem Value="日期">日期</asp:ListItem>
										</asp:dropdownlist><FONT face="宋体"></FONT><FONT face="宋体"></FONT></td>
								</tr>
								<tr>
									<td style="WIDTH: 590px; HEIGHT: 32px" colSpan="3"><FONT face="宋体">&nbsp;</FONT><asp:label id="Label7" runat="server">备  注:</asp:label><FONT face="宋体">&nbsp;&nbsp;&nbsp;</FONT>
										<asp:textbox id="TextBox7" runat="server" Width="464px" Height="22px"></asp:textbox></td>
								</tr>
							</TABLE>
							<table class="bborder" style="WIDTH: 100%; HEIGHT: 41px" cellSpacing="0" cellPadding="0"
								border="0">
								<TR>
									<TD style="HEIGHT: 5px" vAlign="top"><FONT face="宋体"></FONT></TD>
								</TR>
								<TR>
									<TD vAlign="top" align="center"><asp:button id="btn_Save" runat="server" Text="保存" BackColor="#C0C000"></asp:button><FONT face="宋体">&nbsp;&nbsp;&nbsp;
										</FONT><FONT face="Verdana">
											<asp:button id="btn_Back" runat="server" BackColor="#C0C000" Text="返回"></asp:button>
										</FONT>&nbsp;<FONT face="宋体">&nbsp;&nbsp; </FONT>
										<asp:button id="btn_Reset" runat="server" Text="重置" BackColor="#C0C000"></asp:button>
										<INPUT id="theID" style="WIDTH: 82px; HEIGHT: 20px" type="hidden" size="8" name="theID"
											runat="server"></TD>
								</TR>
							</table>
							<asp:label id="lblErrMsg" runat="server" Width="100%" BackColor="DarkKhaki" Visible="False"></asp:label></td>
					<tr>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>
