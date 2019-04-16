<%@ Page language="c#" Codebehind="ruzhu.aspx.cs" AutoEventWireup="false" Inherits="SmallHouse.ruzhu" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>入住房屋详情</title>
		<META http-equiv="Content-Type" content="text/html; charset=gb2312">
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
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
											<td width="100%" height="100%"><IMG height="100%" hspace="3" src="images/loca.gif" align="absMiddle">位置:&nbsp;住户管理 
												&gt; 房屋资料 &gt; 入住房屋信息</td>
											<td align="right" width="100%"><A onclick="self.history.back();" href="#"><IMG height="16" hspace="3" src="images/back2.gif" width="16" border="0"></A></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table cellSpacing="1" cellPadding="3" width="100%" height="100%" border="0">
										<tr>
											<td colSpan="9">
												<table cellSpacing="0" cellPadding="3" width="100%" height="100%" border="0">
													<tr>
														<td align="left" width="95" style="WIDTH: 95px">房号:
															<asp:DropDownList id="DropDownList1" runat="server" Width="89"></asp:DropDownList>
														</td>
														<td align="left" width="92" style="WIDTH: 92px">&nbsp; 户主:
															<asp:dropdownlist id="DropDownList2" runat="server" Width="89px"></asp:dropdownlist>
														</td>
														<td align="left" width="98" style="WIDTH: 98px">单元号:
															<asp:DropDownList id="DropDownList3" runat="server" Width="89px"></asp:DropDownList>
														</td>
														<td align="left" width="101" style="WIDTH: 101px">房型:
															<asp:DropDownList id="DropDownList4" runat="server" Width="89px"></asp:DropDownList></td>
														<td align="left" width="104" style="WIDTH: 104px">实用面积:
															<asp:DropDownList id="DropDownList5" runat="server" Width="89px"></asp:DropDownList>
														</td>
														<td align="left" width="98" style="WIDTH: 98px">朝向:
															<asp:DropDownList id="DropDownList6" runat="server" Width="89px"></asp:DropDownList></td>
														<td valign="bottom" width="94">&nbsp;
															<asp:button id="btSearch" runat="server" Text="查找" BackColor="#C0C000"></asp:button></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr align="center">
											<td height="100%" width="100%">
												<asp:datagrid id="DataGrid1" runat="server" Width="100%" Height="100%" PageSize="8" DataKeyField="ID"
													AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="td">
													<SelectedItemStyle BackColor="#999999"></SelectedItemStyle>
													<AlternatingItemStyle BackColor="#CCCC99"></AlternatingItemStyle>
													<HeaderStyle ForeColor="#3333FF" CssClass="ct" BackColor="#C1DA90"></HeaderStyle>
													<Columns>
														<asp:BoundColumn Visible="False" DataField="ID" HeaderText="ID">
															<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="hoRoom" SortExpression="hoRoom" HeaderText="房号">
															<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="Client_Name" SortExpression="Client_Name" HeaderText="户主">
															<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="cellName" SortExpression="cellName" HeaderText="单元号">
															<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="IndoorName" SortExpression="IndoorName" HeaderText="房型">
															<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="hoArchArce" SortExpression="hoArchArce" HeaderText="建筑面积">
															<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
															<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="hoUseArce" SortExpression="hoUseArce" HeaderText="实用面积">
															<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
															<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="SunnyName" SortExpression="SunnyName" HeaderText="朝向"></asp:BoundColumn>
													</Columns>
													<PagerStyle Mode="NumericPages"></PagerStyle>
												</asp:datagrid>&nbsp;</td>
										</tr>
										<tr>
											<td><IMG src="images/print.gif" align="absMiddle"> <A href="javascript:window.print()">打印</A>&nbsp;&nbsp;
												<asp:literal id="ErrorMsg" runat="server"></asp:literal>
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
