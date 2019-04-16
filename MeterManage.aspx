<%@ Register TagPrefix="CC" TagName="Footer" Src="Footer.ascx" %>
<%@ Register TagPrefix="CC" TagName="Header" Src="Header.ascx" %>
<%@ Page language="c#" Codebehind="MeterManage.aspx.cs" AutoEventWireup="false" Inherits="SmallHouse.MeterManage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>MeterManage</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="ioffice.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="MeterManage" method="post" runat="server">
			<CC:HEADER id="Header" runat="server"></CC:HEADER>
			<Center>
				<TABLE id="Table1" cellSpacing="0" cellPadding="0" border="0">
					<TR>
						<TD align="center">
							<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="95%" border="0">
								<TR>
									<TD vAlign="bottom" align="center">
										<TABLE class="td" id="Table3" cellSpacing="0" cellPadding="0" border="0" style="WIDTH: 273px; HEIGHT: 20px">
											<TR>
												<TD vAlign="bottom" align="left"><STRONG><FONT color="#3366cc">仪表管理</FONT></STRONG></TD>
												<TD vAlign="bottom" align="center"></TD>
												<TD vAlign="middle" align="center"></TD>
												<TD vAlign="middle" align="center"></TD>
												<TD vAlign="middle" align="right"><asp:hyperlink id="HyperLink3" runat="server" NavigateUrl="EditMeter.aspx" Width="146px"><img src="images/add.gif" border="0" align="absbottom"> &nbsp;添加</asp:hyperlink></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD vAlign="top">
										<asp:datagrid id="dg_Meter" runat="server" AllowPaging="True" AllowSorting="True" CssClass="td"
											AutoGenerateColumns="False" Width="100%" PageSize="13">
											<AlternatingItemStyle BackColor="Beige"></AlternatingItemStyle>
											<ItemStyle BackColor="#F3E2A6"></ItemStyle>
											<HeaderStyle CssClass="tttable" BackColor="#FFFFC0"></HeaderStyle>
											<Columns>
												<asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
												<asp:BoundColumn DataField="taName" SortExpression="taName" HeaderText="收费项目"></asp:BoundColumn>
												<asp:BoundColumn DataField="paName" SortExpression="paName" HeaderText="楼宇">
													<HeaderStyle Width="80px"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="hoRoom" SortExpression="hoRoom" HeaderText="房间">
													<HeaderStyle Width="80px"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="mrYear" SortExpression="mrYear" HeaderText="年"></asp:BoundColumn>
												<asp:BoundColumn DataField="mrMonth2" SortExpression="mrMonth2" HeaderText="月份"></asp:BoundColumn>
												<asp:BoundColumn DataField="mrPreceding" SortExpression="mrPreceding" HeaderText="上月读数"></asp:BoundColumn>
												<asp:BoundColumn DataField="mrCurrent" SortExpression="mrCurrent" HeaderText="本月读数"></asp:BoundColumn>
												<asp:BoundColumn DataField="mrNumber" SortExpression="mrNumber" HeaderText="走表量" DataFormatString="{0:####0}">
													<HeaderStyle Width="50px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right"></ItemStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="20px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderTemplate>
														<FONT face="宋体"></FONT>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:ImageButton id="ib_Edit" runat="server" ImageUrl="images/edit.gif" CommandName="Edit" AlternateText="修改"></asp:ImageButton>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="20px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderTemplate>
														<FONT face="宋体"></FONT>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:ImageButton id="ib_delete" runat="server" CausesValidation="False" ImageUrl="images/delete.gif"
															CommandName="delete"></asp:ImageButton>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid>
										<asp:Literal id="ErrorMsg" runat="server"></asp:Literal></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</Center>
			<CC:FOOTER id="Footer" runat="server"></CC:FOOTER>
		</form>
	</body>
</HTML>
