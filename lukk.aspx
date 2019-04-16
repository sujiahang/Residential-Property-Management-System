<%@ Page CodeBehind="lukk.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.lukk" %>

<HTML>
  <HEAD>
		<title>设施概况</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<LINK href="css/mm.css" type="text/css" rel="stylesheet">
  </HEAD>
	<body bgColor="#ffffff" leftMargin="0" topMargin="0" marginheight="0" marginwidth="0">
		<form name="theForm" runat="server">
			<table cellSpacing="10" cellPadding="0" width="100%" bgColor="#ffffff" border="0">
				<tr>
					<td>
						<table class="bborder" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td height="20">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr>
											<td><IMG height="16" hspace="3" src="images/loca.gif" width="16" align="absMiddle">位置:&nbsp;物业管理 
												&gt; 楼房资料&gt; 楼宇概况</td>
											<td align="right" width="30"><A onclick="self.history.back();" href="#"><IMG height="16" hspace="3" src="images/back2.gif" width="16" border="0"></A></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table cellSpacing="1" cellPadding="3" width="100%" border="0">
										<tr>
											<td class="btd" colSpan="6">
												<table cellSpacing="0" cellPadding="3" width="100%" border="0">
													<tr>
														<td width="6%">&nbsp;</td>
														<td width="95%">
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr class="btd2">
											<td class="btd"><asp:datagrid id="DataGrid1" runat="server" PageSize="13" Width="100%" AutoGenerateColumns="False"
													CssClass="td" AllowSorting="True" AllowPaging="True">
													<HeaderStyle CssClass="ct" BackColor="#C1DA90"></HeaderStyle>
													<Columns>
														<asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
														<asp:BoundColumn DataField="Name" SortExpression="Name" HeaderText="楼名"></asp:BoundColumn>
														<asp:BoundColumn DataField="typeName" SortExpression="typeName" HeaderText="类别"></asp:BoundColumn>
														<asp:BoundColumn DataField="sunny" SortExpression="sunny" HeaderText="朝向"></asp:BoundColumn>
														<asp:BoundColumn DataField="Area" SortExpression="Area" HeaderText="建筑面积"></asp:BoundColumn>
														<asp:BoundColumn DataField="Layer" SortExpression="Layer" HeaderText="层数"></asp:BoundColumn>
														<asp:BoundColumn DataField="High" SortExpression="High" HeaderText="高度"></asp:BoundColumn>
														<asp:BoundColumn DataField="buildDate" SortExpression="buildDate" HeaderText="建成日期"></asp:BoundColumn>
														<asp:TemplateColumn>
															<HeaderStyle Width="40px"></HeaderStyle>
															<ItemTemplate>
																<asp:ImageButton id="ib_Edit" runat="server" ImageUrl="images/edit.gif" CommandName="Edit" AlternateText="修改"></asp:ImageButton>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn>
															<HeaderStyle Width="40px"></HeaderStyle>
															<ItemTemplate>
																<asp:ImageButton id="ib_delete" runat="server" CausesValidation="False" AlternateText="删除" ImageUrl="images/delete.gif" 
 CommandName="delete"></asp:ImageButton>
															</ItemTemplate>
														</asp:TemplateColumn>
													</Columns>
													<PagerStyle Mode="NumericPages"></PagerStyle>
												</asp:datagrid><asp:literal id="ErrorMsg" runat="server"></asp:literal></td>
										</tr>
										<tr>
											<td class="btd">
												<table cellSpacing="0" cellPadding="5" width="100%" border="0">
													<tr>
														<td align="right">&nbsp;
														</td>
													</tr>
													<tr>
														<td align="right" height="36"><FONT face="宋体"><asp:button id="bt_Add" Text="增加" runat="server"></asp:button></FONT></td>
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