<%@ Page language="c#" Codebehind="zhuhu_Edit.aspx.cs" AutoEventWireup="false" Inherits="SmallHouse.zhuhu_Edit" %>
<HTML>
	<HEAD>
		<title>С���ſ�</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/mm.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body bgColor="#ffffff" leftMargin="0" topMargin="0" marginheight="0" marginwidth="0">
		<form id="Form1" name="theForm" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td>
						<table class="bborder" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td height="20">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr>
											<td height="1"><IMG height="16" hspace="3" src="images/loca.gif" width="16" align="absMiddle">λ��:&nbsp;ס������ 
												&gt; ס����Ϣ &gt; �޸�ס����Ϣ</td>
											<td align="right" width="30"><A onclick="self.history.back();" href="#"><IMG height="16" hspace="3" src="images/back2.gif" width="16" border="0"></A></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table class="btd" cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr>
											<td style="HEIGHT: 2px" colSpan="6" height="2"></td>
										</tr>
										<TR>
											<TD style="WIDTH: 91px" align="right" width="91">ҵ�����</TD>
											<TD width="172"><FONT color="red">&nbsp;
													<asp:textbox id="TextBox1" runat="server" Width="96px">������</asp:textbox>*</FONT>
												<asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ErrorMessage="������" ControlToValidate="TextBox1"></asp:requiredfieldvalidator></TD>
											<td style="WIDTH: 129px" align="right" width="129">ҵ������</td>
											<td style="WIDTH: 157px" noWrap width="157"><FONT color="#ff0000">&nbsp;</FONT>
												<asp:textbox id="TextBox2" runat="server" Width="96px">������</asp:textbox><FONT color="#ff0000">*</FONT>
												<asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="������" ControlToValidate="TextBox2"></asp:requiredfieldvalidator></td>
											<td style="WIDTH: 102px" align="right" width="102">�Ա�</td>
											<td noWrap width="120"><FONT color="#ff0000">&nbsp;
													<asp:dropdownlist id="DropDownList1" runat="server" Width="96px">
														<asp:ListItem Value="��">��</asp:ListItem>
														<asp:ListItem Value="Ů">Ů</asp:ListItem>
													</asp:dropdownlist>*</FONT>
											</td>
										</TR>
										<tr>
											<td style="WIDTH: 91px; HEIGHT: 30px" align="right" width="91" height="30">���֤��</td>
											<td style="HEIGHT: 30px" noWrap width="172" height="30"><FONT color="#ff0000">&nbsp;</FONT>
												<asp:textbox id="TextBox4" runat="server" Width="96px">������</asp:textbox><FONT color="#ff0000">*</FONT>
												<asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" ErrorMessage="������" ControlToValidate="TextBox4"></asp:requiredfieldvalidator></td>
											<td style="WIDTH: 129px; HEIGHT: 30px" align="right" width="129" height="30">������λ</td>
											<td style="WIDTH: 157px; HEIGHT: 30px" width="157" height="30"><FONT face="����">&nbsp;</FONT>
												<asp:textbox id="TextBox5" runat="server" Width="96px"></asp:textbox></td>
											<td style="WIDTH: 102px; HEIGHT: 30px" align="right" width="102" height="30">�绰</td>
											<td style="HEIGHT: 30px" height="30"><FONT face="����">&nbsp;</FONT>
												<asp:textbox id="TextBox6" runat="server" Width="96px"></asp:textbox></td>
										</tr>
										<tr>
											<td style="WIDTH: 91px" align="right" width="91">�ֻ�����</td>
											<td width="172"><FONT face="����">&nbsp;</FONT>
												<asp:textbox id="TextBox7" runat="server" Width="96px"></asp:textbox></td>
											<td style="WIDTH: 129px" align="right" width="129">�����ʼ�</td>
											<td style="WIDTH: 157px" width="157"><FONT face="����">&nbsp;</FONT>
												<asp:textbox id="TextBox8" runat="server" Width="96px"></asp:textbox></td>
											<td style="WIDTH: 102px" align="right" width="102">������</td>
											<td><FONT face="����">&nbsp;</FONT>
												<asp:textbox id="TextBox9" runat="server" Width="96px"></asp:textbox></td>
										</tr>
										<tr>
											<td style="WIDTH: 91px" align="right" width="91" height="32">��Ƭ�ļ�</td>
											<td width="172" height="32"><FONT face="����">&nbsp;</FONT>
												<asp:textbox id="TextBox10" runat="server" Width="96px"></asp:textbox></td>
											<td style="WIDTH: 129px" align="right" width="129" height="32">ס������</td>
											<td style="WIDTH: 157px" width="157" height="32"><FONT face="����">&nbsp;</FONT>
												<asp:textbox id="TextBox11" runat="server" Width="96px"></asp:textbox></td>
											<td style="WIDTH: 102px" align="right" width="102" height="32">�Ƿ���ס</td>
											<td height="32"><FONT face="����">&nbsp;</FONT>
												<asp:dropdownlist id="DropDownList2" runat="server" Width="96px">
													<asp:ListItem Value="��">��</asp:ListItem>
													<asp:ListItem Value="��">��</asp:ListItem>
												</asp:dropdownlist></td>
										</tr>
										<tr>
											<td colSpan="6" height="2">
												<hr color="#c1da90" SIZE="1">
											</td>
										</tr>
										<tr>
											<td vAlign="top" align="center" colSpan="6"><asp:button id="btn_Save" runat="server" BackColor="#C0C000" Text="����"></asp:button><FONT face="����">&nbsp;
												</FONT><FONT face="Verdana">
													<asp:button id="btn_Back" runat="server" BackColor="#C0C000" Text="����"></asp:button></FONT><FONT face="����">&nbsp;
												</FONT>
												<asp:button id="btn_Reset" runat="server" BackColor="#C0C000" Text="����"></asp:button></td>
										</tr>
										<tr>
											<td colSpan="6" height="18"><asp:label id="lblErrMsg" runat="server" Width="100%" BackColor="DarkKhaki" Height="20px"></asp:label></td>
										</tr>
									</table>
									<INPUT id="p_theID" type="hidden" name="p_theID" runat="server">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</TBODY></form>
	</body>
</HTML>
