<%@ Page CodeBehind="Member_List.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.Member_List" %>

<HTML>
  <HEAD>
		<title>��ҵ����ϵͳ</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<LINK href="css/mm.css" type="text/css" rel="stylesheet">
  </HEAD>
	<body bgColor="#ffffff" leftMargin="0" topMargin="0" marginheight="0" marginwidth="0">
		<form name="theForm" runat="server">
			<table cellSpacing="10" cellPadding="0" width="100%" border="0">
				<tr>
					<td>
						<table class="bborder" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td height="22">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr>
											<td><IMG height="16" hspace="3" src="images/loca.gif" width="16" align="absMiddle"> 
												λ��:&nbsp;ϵͳ���� &gt;&nbsp;�û�����</td>
											<td align="right" width="30"><A onclick="self.history.back();" href="#"><IMG height="16" hspace="3" src="images/back2.gif" width="16" border="0"></A></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table cellSpacing="1" cellPadding="3" width="100%" border="0">
										<tr>
											<td class="btd" colSpan="9">
												<table cellSpacing="0" cellPadding="3" width="100%" border="0">
													<tr>
														<td width="49">
															<div align="right"><FONT face="����"></FONT>&nbsp;</div>
														</td>
														<td width="166">&nbsp;
														</td>
														<td width="40">
															<div align="right"><FONT face="����"></FONT>&nbsp;</div>
														</td>
														<td align="left" width="139"><FONT face="����"></FONT></td>
														<td align="left" width="39">
															<div align="right">��½��</div>
														</td>
														<td align="left" width="147"><FONT face="����"><asp:textbox id="Search_search" runat="server" Width="112px"></asp:textbox></FONT></td>
														<td align="left" width="94">&nbsp;
															<asp:button id="btSearch" runat="server" Text="����"></asp:button></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr class="btd3" align="center">
											<td class="btd"><asp:datagrid id="DataGrid1" runat="server" Width="100%" AllowPaging="True" AllowSorting="True"
													CssClass="td" AutoGenerateColumns="False" PageSize="13" ShowFooter="True">
													<HeaderStyle CssClass="ct" BackColor="#C1DA90"></HeaderStyle>
													<Columns>
														<asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
														<asp:BoundColumn DataField="m_member_login" SortExpression="m_member_login" HeaderText="��½��"></asp:BoundColumn>
														<asp:BoundColumn DataField="name" SortExpression="name" HeaderText="����"></asp:BoundColumn>
														<asp:BoundColumn DataField="m_security_level_id" SortExpression="m_security_level_id" HeaderText="�û���ɫ"></asp:BoundColumn>
														<asp:BoundColumn DataField="memo" SortExpression="memo" HeaderText="��ע"></asp:BoundColumn>
														<asp:TemplateColumn>
															<HeaderStyle Width="20px"></HeaderStyle>
															<ItemTemplate>
																<asp:ImageButton id="ib_Edit" runat="server" ImageUrl="images/edit.gif" CommandName="Edit" AlternateText="�޸�"></asp:ImageButton>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn>
															<HeaderStyle Width="20px"></HeaderStyle>
															<ItemTemplate>
																<asp:ImageButton id="ib_delete" runat="server" CausesValidation="False" AlternateText="ɾ��" ImageUrl="images/delete.gif" 
 CommandName="delete"></asp:ImageButton>
															</ItemTemplate>
														</asp:TemplateColumn>
													</Columns>
													<PagerStyle Mode="NumericPages"></PagerStyle>
												</asp:datagrid>&nbsp;</td>
										</tr>
										<tr>
											<td class="btd" colSpan="9">
												<table cellSpacing="0" cellPadding="5" width="100%" border="0">
													<tr>
														<td><IMG src="images/print.gif" align="absMiddle"> <A href="javascript:window.print()">��ӡ</A>&nbsp;&nbsp;
															<asp:literal id="ErrorMsg" runat="server"></asp:literal></td>
														<td align="right"><asp:button id="bt_Add" runat="server" Text="����"></asp:button></td>
													</tr>
												</table>
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
