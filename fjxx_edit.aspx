<%@ Page CodeBehind="fjxx_edit.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.fjxx_edit" %>
<HTML>
	<HEAD>
		<title>������Ϣ</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet" href="css/mm.css" type="text/css">
	</HEAD>
	<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name="theForm" runat="server">
			<table width="100%" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="1" cellpadding="0" class="bborder">
							<tr>
								<td height="20">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="images/loca.gif" width="16" height="16" hspace="3" align="absMiddle">λ��:&nbsp;��ҵ���� 
												&gt;¥������ &gt; �޸ķ�����Ϣ</td>
											<td align="right" width="30"><a href="#" onClick="self.history.back();"><img src="images/back2.gif" hspace="3" border="0" width="16" height="16"></a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table border="0" cellspacing="0" cellpadding="5" class="btd" width="100%">
										<tr>
											<td width="15%">&nbsp;</td>
											<td width="15%">&nbsp;</td>
											<td>&nbsp;</td>
											<td width="15%">&nbsp;</td>
											<td>&nbsp;</td>
											<td width="25%">&nbsp;
											</td>
										</tr>
										<tr>
											<td align="right">¥ ��<FONT color="#ff0033">*</FONT></td>
											<td>
												<asp:TextBox id="tbPaName" runat="server" Width="112px"></asp:TextBox>
											</td>
											<td align="right">�����<FONT color="#ff3300">*</FONT></td>
											<td>
												<asp:TextBox id="tbRoom" runat="server" Width="112px"></asp:TextBox>
											</td>
											<td align="right">�������&nbsp;</td>
											<td>
												<font color="#ff0000">
													<asp:TextBox id="tbArea" runat="server" Width="112px"></asp:TextBox></font>
											</td>
										</tr>
										<tr>
											<td align="right">
												��Ԫ��</td>
											<td><FONT face="����">
													<asp:DropDownList id="ddlCell" runat="server" Width="112px"></asp:DropDownList></FONT>
											</td>
											<td align="right">¥ ��</td>
											<td>
												<asp:TextBox id="tbLayer" runat="server" Width="112px"></asp:TextBox>
											</td>
											<td align="right">ʵ�����</td>
											<td><FONT face="����">
													<asp:TextBox id="tbArea2" runat="server" Width="112px"></asp:TextBox></FONT>
											</td>
										</tr>
										<tr>
											<td align="right">�� ��</td>
											<td><FONT face="����">
													<asp:DropDownList id="ddlSunny" runat="server" Width="112px"></asp:DropDownList></FONT>
											</td>
											<td align="right">��������</td>
											<td>
												<asp:DropDownList id="ddlType" runat="server" Width="112px"></asp:DropDownList>
											</td>
											<td align="right"><FONT face="����"></FONT></td>
											<td><FONT face="����"></FONT>
											</td>
										</tr>
										<tr>
											<td align="right">������Ϣ</td>
											<td colspan="5" align="left"><HR color="#c1da90" width="100%" SIZE="1">
											</td>
										</tr>
										<tr>
											<td align="right">������</td>
											<td><FONT face="����">
													<asp:TextBox id="tbClientName" runat="server" Width="112px"></asp:TextBox></FONT>
											</td>
											<td align="right">���֤</td>
											<td>
												<asp:TextBox id="tbClientID" runat="server" Width="112px"></asp:TextBox>
											</td>
											<td align="right">Ǩ������</td>
											<td>
												<asp:TextBox id="tbUseDate" runat="server" Width="112px"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right">��ϵ�绰</td>
											<td>
												<asp:TextBox id="tbPhone" runat="server" Width="112px"></asp:TextBox>
											</td>
											<td align="right">�����ʺ�</td>
											<td>
												<asp:TextBox id="tbClientCard" runat="server" Width="112px"></asp:TextBox>
											</td>
											<td align="right">������λ</td>
											<td>
												<asp:TextBox id="tbUnit" runat="server" Width="112px"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right">�� ע</td>
											<td colspan="5">
												<asp:TextBox id="tbMemo" runat="server" Width="240px"></asp:TextBox>
											</td>
										</tr>
										<tr align="center">
											<td colspan="6">
												<hr size="1" color="#c1da90">
												<asp:Literal id="ErrorMsg" runat="server"></asp:Literal><INPUT id="p_theID" type="hidden" size="7" name="p_theID" runat="server"><INPUT id="theID" type="hidden" size="5" name="theID" runat="server"><INPUT id="paID" type="hidden" size="5" name="paID" runat="server">
											</td>
										</tr>
										<tr align="center" valign="top">
											<td colspan="6" height="38">
												<asp:Button id="btSave" runat="server" Text="����"></asp:Button>
												<asp:Button id="btCancel" runat="server" Text="ȡ��"></asp:Button>&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
