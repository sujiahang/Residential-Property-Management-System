<%@ Page language="c#" Codebehind="shebei_weixiu.aspx.cs" AutoEventWireup="false" Inherits="SmallHouse.shebei_weixiu" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>物业管理系统 - 设备维修表单</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/mm.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body bgColor="#ffffff" leftMargin="0" topMargin="0" marginheight="0" marginwidth="0">
		<form name="theForm" runat="server" ID="Form1">
			<table cellSpacing="0" cellPadding="0" border="0" WIDTH="100%" HEIGHT="100%">
				<tr>
					<td>
						<table class="bborder" cellSpacing="0" cellPadding="0" width="100%" height="100%" border="0">
							<tr>
								<td height="22">
									<table cellSpacing="0" cellPadding="0" width="100%" height="100%" border="0">
										<tr>
											<td style="WIDTH: 100%; HEIGHT: 7px"><IMG height="16" hspace="3" src="images/loca.gif" width="16" align="absMiddle">
												位置:&nbsp;设备管理 &gt;&nbsp;设备维修表单</td>
											<td style="HEIGHT: 7px" align="right" width="60"><A onclick="self.history.back();" href="#"><IMG height="16" hspace="3" src="images/back2.gif" width="16" border="0"></A></td>
										</tr>
										<tr>
											<td style="WIDTH: 100%" align="center"><asp:label id="Label1" runat="server">设备名称:</asp:label><FONT face="宋体"></FONT><asp:textbox id="txt_Mingcheng" runat="server" ToolTip="该选项支持模糊查询" Width="54px"></asp:textbox>&nbsp;
												<asp:label id="Label2" runat="server">施工单位:</asp:label><asp:textbox id="txt_Danwei" runat="server" ToolTip="该选项支持模糊查询" Width="54px"></asp:textbox>&nbsp;<asp:label id="Label4" runat="server">是否付款:</asp:label>
												<asp:dropdownlist id="list_blPay" runat="server" Width="54">
													<asp:ListItem Selected="True"></asp:ListItem>
													<asp:ListItem Value="未知">未知</asp:ListItem>
													<asp:ListItem Value="是">是</asp:ListItem>
													<asp:ListItem Value="否">否</asp:ListItem>
												</asp:dropdownlist>&nbsp;<asp:label id="Label3" runat="server" Width="54px">施工日期:</asp:label>
												<asp:dropdownlist id="DropDownList2" runat="server" Width="99px"></asp:dropdownlist>&nbsp;&nbsp;<asp:button id="btn_Search" runat="server" BackColor="#C0C000" Text="查询"></asp:button></td>
											<td align="left"><FONT face="宋体"><asp:button id="btn_Add" runat="server" BackColor="#C0C000" Text="添加"></asp:button></FONT></td>
										</tr>
									</table>
							<tr>
								<td width="100%" height="100%">
									<asp:datagrid id="DataGrid1" runat="server" PageSize="8" DataKeyField="id" AllowPaging="True"
										AllowSorting="True" AutoGenerateColumns="False" CssClass="td" Height="100%" Width="100%">
										<AlternatingItemStyle BackColor="#CCCC99"></AlternatingItemStyle>
										<HeaderStyle ForeColor="#3333FF" CssClass="ct" BackColor="#C1DA90"></HeaderStyle>
										<Columns>
											<asp:BoundColumn Visible="False" DataField="id" HeaderText="id">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="mingcheng" SortExpression="mingcheng" HeaderText="设备名称">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="yuanyin" SortExpression="yuanyin" HeaderText="损坏原因">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="danwei" SortExpression="danwei" HeaderText="施工单位">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="fuzeren" SortExpression="fuzeren" HeaderText="工程负责人">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="riqi" SortExpression="riqi" HeaderText="施工日期">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="fukuanfou" SortExpression="fukuanfou" HeaderText="是否付款"></asp:BoundColumn>
											<asp:TemplateColumn>
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<HeaderTemplate>
													<FONT style="FONT-WEIGHT: bold; COLOR: #ff3333" face="宋体" size="2">修改</FONT>
												</HeaderTemplate>
												<ItemTemplate>
													<FONT face="宋体">
														<asp:ImageButton id="ImageButton1" runat="server" CommandName="edit" ImageUrl="images\edit.gif"></asp:ImageButton></FONT>
												</ItemTemplate>
												<EditItemTemplate>
													<FONT face="宋体">&nbsp; </FONT>
												</EditItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn>
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<HeaderTemplate>
													<FONT style="FONT-WEIGHT: bold" face="宋体" color="#ff3333" size="2">删除</FONT>
												</HeaderTemplate>
												<ItemTemplate>
													<FONT face="宋体">
														<asp:ImageButton id="Imbtn_del" runat="server" ImageUrl="images\delete.gif" CommandName="delete"></asp:ImageButton></FONT>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
										<PagerStyle Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td><IMG src="images/print.gif" align="absMiddle"> <A href="javascript:window.print()">打印</A></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
