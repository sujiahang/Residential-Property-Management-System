<%@ Page CodeBehind="cwzl.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.cwzl" %>
<HTML>
	<HEAD>
		<title>��λ����</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet" href="css/mm.css" type="text/css">
	</HEAD>
	<body leftmargin="0" bgcolor="#ffffff" topmargin="0" marginwidth="0" marginheight="0">
		<form name="theForm" runat="server">
			<table border="0" cellspacing="10" cellpadding="0" width="100%">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bborder">
							<tr>
								<td height="22">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="images/loca.gif" width="16" height="16" hspace="3" align="absMiddle">λ��:&nbsp;��ҵ���� 
												&gt; ��λ����</td>
											<td align="right" width="30"><a href="#" onClick="self.history.back();"><img src="images/back2.gif" hspace="3" border="0" width="16" height="16"></a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table border="0" cellspacing="1" cellpadding="3" width="100%">
										<tr>
											<td colspan="9" class="btd">
												<table border="0" cellspacing="0" cellpadding="3" width="100%">
													<tr>
														<td width="49">
															<div align="right"><FONT face="����"></FONT>&nbsp;</div>
														</td>
														<td width="81">&nbsp;
														</td>
														<td width="40">
															<div align="right">��λ��</div>
														</td>
														<td align="left" width="174"><FONT face="����">
																<asp:TextBox id="tbNO" runat="server" Width="112px"></asp:TextBox></FONT>
														</td>
														<td align="left" width="39">
															<div align="right">������</div>
														</td>
														<td align="left" width="147"><FONT face="����">
																<asp:TextBox id="tbMaster" Width="112px" runat="server"></asp:TextBox></FONT>
														</td>
														<td align="left" width="94">&nbsp;
															<asp:Button id="btSearch" runat="server" Text="����"></asp:Button>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr class="btd3" align="center">
											<td class="btd">
												<asp:datagrid id="DataGrid1" PageSize="13" Width="100%" AutoGenerateColumns="False" CssClass="td"
													AllowSorting="True" AllowPaging="True" runat="server">
													<HeaderStyle CssClass="ct" BackColor="#C1DA90"></HeaderStyle>
													<Columns>
														<asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
														<asp:BoundColumn DataField="theNO" SortExpression="theNO" HeaderText="��λ��"></asp:BoundColumn>
														<asp:BoundColumn DataField="Master" SortExpression="Master" HeaderText="������"></asp:BoundColumn>
														<asp:BoundColumn DataField="carNO" SortExpression="carNO" HeaderText="���ƺ�"></asp:BoundColumn>
														<asp:BoundColumn DataField="carType" SortExpression="carType" HeaderText="������"></asp:BoundColumn>
														<asp:BoundColumn DataField="Area" SortExpression="Area" HeaderText="���"></asp:BoundColumn>
														<asp:BoundColumn DataField="Place" SortExpression="Place" HeaderText="λ��"></asp:BoundColumn>
														<asp:BoundColumn DataField="Memo" SortExpression="Memo" HeaderText="��ע"></asp:BoundColumn>
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
											<td colspan="9" class="btd">
												<table border="0" cellspacing="0" cellpadding="5" width="100%">
													<tr>
														<td><IMG src="images/print.gif" align="absMiddle"> <A href="javascript:window.print()">��ӡ</A>&nbsp;&nbsp;
															<asp:literal id="ErrorMsg" runat="server"></asp:literal></td>
														<td align="right">
															<asp:button id="bt_Add" runat="server" Text="����"></asp:button>
														</td>
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
