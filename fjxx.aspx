<%@ Page CodeBehind="fjxx.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.fjxx" %>
<HTML>
	<HEAD>
		<title>¥������</title>
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
											<td><IMG height="16" hspace="3" src="images/loca.gif" width="16" align="absMiddle">λ��:&nbsp;��ҵ���� 
												&gt; ¥������ &gt; ������Ϣ</td>
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
														<td width="49"><FONT face="����"></FONT>
														</td>
														<td width="166">&nbsp;
														</td>
														<td width="40">
															<div align="right">¥��</div>
														</td>
														<td align="left" width="174"><FONT face="����"><asp:dropdownlist id="ddlPavilion" runat="server" Width="80px"></asp:dropdownlist></FONT></td>
														<td align="left" width="39">
															<div align="right">����</div>
														</td>
														<td align="left" width="147"><FONT face="����"><asp:textbox id="tbRoom" runat="server" Width="112px"></asp:textbox></FONT></td>
														<td align="left" width="94">&nbsp;
															<asp:button id="btSearch" runat="server" Text="����"></asp:button></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr class="btd3" align="center">
											<td class="btd"><asp:datagrid id="DataGrid1" runat="server" Width="100%" AllowPaging="True" AllowSorting="True"
													CssClass="td" AutoGenerateColumns="False" PageSize="13">
													<HeaderStyle CssClass="ct" BackColor="#C1DA90"></HeaderStyle>
													<Columns>
														<asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
														<asp:BoundColumn DataField="hoRoom" SortExpression="hoRoom" HeaderText="����"></asp:BoundColumn>
														<asp:BoundColumn DataField="Client_Name" SortExpression="Client_Name" HeaderText="����"></asp:BoundColumn>
														<asp:BoundColumn DataField="cellName" SortExpression="cellName" HeaderText="��Ԫ��"></asp:BoundColumn>
														<asp:BoundColumn DataField="IndoorName" SortExpression="IndoorName" HeaderText="����"></asp:BoundColumn>
														<asp:BoundColumn DataField="hoArchArce" SortExpression="hoArchArce" HeaderText="�������"></asp:BoundColumn>
														<asp:BoundColumn DataField="hoUseArce" SortExpression="hoUseArce" HeaderText="ʵ�����"></asp:BoundColumn>
														<asp:BoundColumn DataField="SunnyName" SortExpression="SunnyName" HeaderText="����"></asp:BoundColumn>
														<asp:TemplateColumn>
															<HeaderStyle Width="40px"></HeaderStyle>
															<ItemTemplate>
																<asp:ImageButton id="ib_Edit" runat="server" ImageUrl="images/edit.gif" CommandName="Edit" AlternateText="�޸�"></asp:ImageButton>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn>
															<HeaderStyle Width="40px"></HeaderStyle>
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
