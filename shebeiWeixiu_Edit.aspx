<%@ Page language="c#" Codebehind="shebeiWeixiu_Edit.aspx.cs" AutoEventWireup="false" Inherits="SmallHouse.sheibeiWeixiu_Edit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>��ҵ����ϵͳ - �豸ά�ޱ��޸�</title>
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
												<td style=" WIDTH: 100%; HEIGHT: 1px"><IMG height="16" hspace="3" src="images/loca.gif" width="16" align="absMiddle">
													λ��:&nbsp;�豸���� &gt;&nbsp;�豸ά�ޱ��޸�</td>
												<td style="WIDTH: 51px; HEIGHT: 1px" align="right" width="51"><A onclick="self.history.back();" href="#"><IMG height="16" hspace="3" src="images/back2.gif" width="16" border="0"></A></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<TABLE class="btd" style=" WIDTH: 100%; HEIGHT: 159px" cellSpacing="0" cellPadding="0">
								<TR>
									<td style="WIDTH: 30%; HEIGHT: 34px"><FONT face="����"></FONT>&nbsp;<asp:label id="Label1" runat="server" Width="40px">��  ��:</asp:label><FONT face="����">&nbsp;</FONT>
										<asp:DropDownList id="list_Name" runat="server" Width="98px"></asp:DropDownList><FONT face="����"></FONT></td>
									<td style="WIDTH: 32.94%; HEIGHT: 34px"><asp:label id="Label2" runat="server" Width="54">  ��ԭ��:</asp:label><FONT face="����">
										</FONT>
										<asp:textbox id="TextBox2" runat="server" Width="136px"></asp:textbox></td>
									<td style="WIDTH: 30%; HEIGHT: 34px">
										<asp:label id="Label5" runat="server">�Ƿ񸶿�:</asp:label>&nbsp;
										<asp:DropDownList id="list_blPay" runat="server" Width="48px">
											<asp:ListItem Value="δ֪">δ֪</asp:ListItem>
											<asp:ListItem Value="��">��</asp:ListItem>
											<asp:ListItem Value="��">��</asp:ListItem>
										</asp:DropDownList></FONT></td>
								</TR>
								<TR>
									<TD style="WIDTH: 30.19%; HEIGHT: 32px">&nbsp;
										<asp:label id="Label4" runat="server" Width="48px">������:</asp:label><FONT face="����"></FONT>
										<asp:textbox id="TextBox3" runat="server" Width="98" Height="22"></asp:textbox></TD>
									<TD style="WIDTH: 24.49%; HEIGHT: 32px">
										<asp:label id="Label3" runat="server" Width="54px">ʩ����λ:</asp:label>&nbsp;<asp:textbox id="TextBox4" runat="server" Width="128px"></asp:textbox></TD>
									<TD style="WIDTH: 38%; HEIGHT: 32px">
										<asp:label id="Label6" runat="server">ʩ������:</asp:label>&nbsp;
										<asp:dropdownlist id="list_Year" runat="server">
											<asp:ListItem Value="���  ">���  </asp:ListItem>
										</asp:dropdownlist>
										<asp:dropdownlist id="list_Month" runat="server" Width="51px" AutoPostBack="True">
											<asp:ListItem Value="�·�">�·�</asp:ListItem>
										</asp:dropdownlist>
										<asp:dropdownlist id="list_Day" runat="server" Width="51px">
											<asp:ListItem Value="����">����</asp:ListItem>
										</asp:dropdownlist><FONT face="����"></FONT><FONT face="����"></FONT></TD>
								</TR>
								<TR>
									<TD style=" WIDTH: 100%; HEIGHT: 32px" colSpan="3">&nbsp;
										<asp:label id="Label7" runat="server">��  ע:</asp:label><FONT face="����">&nbsp; </FONT>
										<asp:textbox id="TextBox5" runat="server" Width="520px" Height="22px"></asp:textbox></TD>
								</TR>
							</TABLE>
							<TABLE class="bborder" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TR>
									<TD style="HEIGHT: 5px" vAlign="top"><FONT face="����"></FONT></TD>
								</TR>
								<TR>
									<TD vAlign="top" align="center">
										<asp:button id="btn_Save" runat="server" BackColor="#C0C000" Text="����"></asp:button><FONT face="����">&nbsp;&nbsp;&nbsp;
										</FONT><FONT face="Verdana">
											<asp:button id="btn_Back" runat="server" Text="����" BackColor="#C0C000"></asp:button>&nbsp;&nbsp;
										</FONT>&nbsp;
										<asp:button id="btn_Reset" runat="server" BackColor="#C0C000" Text="����"></asp:button></TD>
								</TR>
							</TABLE>
							<FONT face="����"></FONT>
							<asp:label id="lblErrMsg" runat="server" Width="100%" BackColor="DarkKhaki" Visible="False"></asp:label>
							<INPUT id="theID" style="WIDTH: 82px; HEIGHT: 20px" type="hidden" size="8" name="theID"
								runat="server"></td>
					<TR>
					</TR>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>
