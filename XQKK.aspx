<%@ Page CodeBehind="XQKK.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.XQKK" %>
<HTML>
	<HEAD>
		<title>С���ſ�</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<script language="javascript" src="../../inc/public.js"></script>
		<link rel="stylesheet" href="css/mm.css" type="text/css">
	</HEAD>
	<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name="Form1" method="post" runat="server">
			<table width="100%" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="bborder" height="22">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="images/loca.gif" width="16" height="16" hspace="3" align="absMiddle">λ��:&nbsp;��ҵ���� 
												&gt; С������ &gt; С���ſ�</td>
											<td align="right" width="30"><a href="#" onClick="self.history.back();"><img src="images/back2.gif" hspace="3" border="0" width="16" height="16"></a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td class="bborder">
									<table border="0" cellspacing="1" cellpadding="5" width="100%">
										<tr class="btd">
											<td colspan="6" height="20"></td>
										</tr>
										<tr class="btd">
											<td align="right" width="16%">С������</td>
											<td><FONT face="����">&nbsp;</FONT>
												<asp:DropDownList id="ddl_Area" runat="server" Width="64px" AutoPostBack="True"></asp:DropDownList>
											</td>
											<td align="right" width="16%">�� �� ��</td>
											<td width="16%">&nbsp;
												<asp:Label id="Label2" runat="server"></asp:Label>
											</td>
											<td align="right" width="16%">��������</td>
											<td width="16%">&nbsp;
												<asp:Label id="Label3" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td align="right">�� ϵ ��</td>
											<td>&nbsp;
												<asp:Label id="Label4" runat="server"></asp:Label>
											</td>
											<td align="right">��ϵ�绰</td>
											<td>
												<asp:Label id="Label5" runat="server"></asp:Label>
											</td>
											<td align="right">�ƶ��绰</td>
											<td>&nbsp;
												<asp:Label id="Label6" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td align="right">ռ�����</td>
											<td>&nbsp;
												<asp:Label id="Label7" runat="server"></asp:Label>
											</td>
											<td align="right">��·���</td>
											<td>&nbsp;
												<asp:Label id="Label8" runat="server"></asp:Label>
											</td>
											<td align="right">��Ƴ�λ���</td>
											<td>&nbsp;
												<asp:Label id="Label9" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td align="right">�������</td>
											<td>&nbsp;
												<asp:Label id="Label10" runat="server"></asp:Label>
											</td>
											<td align="right">�߲�¥������</td>
											<td>&nbsp;
												<asp:Label id="Label11" runat="server"></asp:Label>
											</td>
											<td align="right">�������</td>
											<td>&nbsp;
												<asp:Label id="Label12" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td align="right">�����������</td>
											<td>&nbsp;
												<asp:Label id="Label13" runat="server"></asp:Label>
											</td>
											<td align="right">���¥������</td>
											<td>&nbsp;
												<asp:Label id="Label14" runat="server"></asp:Label>
											</td>
											<td align="right">�� λ ��</td>
											<td>&nbsp;
												<asp:Label id="Label15" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td align="right">�̻����</td>
											<td>&nbsp;
												<asp:Label id="Label16" runat="server"></asp:Label>
											</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr class="btd">
											<td align="right">λ��˵��</td>
											<td colspan="5">&nbsp;
												<asp:Label id="Label17" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td align="right">�� ע</td>
											<td colspan="5">&nbsp;
												<asp:Label id="Label18" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td colspan="2" align="right" height="36">&nbsp;
											</td>
											<td colspan="4" align="center">
												<asp:Button id="bt_Update" runat="server" Text="�޸�" Enabled="False"></asp:Button>&nbsp;
                                                <asp:Button ID="btn_Add" runat="server" Text="���" />
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
