<%@ Page language="c#" Codebehind="zhuhu.aspx.cs" AutoEventWireup="false" Inherits="SmallHouse.zhuhu" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>lvhua</title>
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
											<td WIDTH="100%" HEIGHT="100%"><IMG height="16" hspace="3" src="images/loca.gif" width="16" align="absMiddle">
												位置:&nbsp;住户管理 &gt;&nbsp;住户信息 &gt;&nbsp;住户基本信息</td>
											<td align="right" width="60">
												<A onclick="self.history.back();" href="#"><IMG height="16" hspace="3" src="images/back2.gif" width="16" border="0"></A></td>
										</tr>
										<tr>
											<td align="left">&nbsp;<asp:label id="Label4" runat="server" Width="48px">业主编号</asp:label><asp:textbox id="txt_Bianhao" runat="server" Width="56px" ToolTip="该选项支持模糊查询"></asp:textbox>&nbsp;
												<asp:label id="Label3" runat="server" Width="48px">业主姓名</asp:label><asp:textbox id="txt_Mingcheng" runat="server" Width="56px" ToolTip="该选项支持模糊查询"></asp:textbox>&nbsp;
												<asp:label id="Label2" runat="server" Width="48px">身份证号</asp:label><asp:textbox id="txt_ID" runat="server" Width="55px" ToolTip="该选项支持模糊查询"></asp:textbox>&nbsp;
												<asp:label id="Label1" runat="server" Width="40px">建立者</asp:label><asp:dropdownlist id="DropDownList1" runat="server" Width="64px"></asp:dropdownlist>&nbsp;
												<asp:label id="Label5" runat="server">是否入住</asp:label><asp:dropdownlist id="DropDownList2" runat="server" Width="48px">
													<asp:ListItem></asp:ListItem>
													<asp:ListItem Value="是">是</asp:ListItem>
													<asp:ListItem Value="否">否</asp:ListItem>
												</asp:dropdownlist>&nbsp;
												<asp:button id="btn_Search" runat="server" BackColor="#C0C000" Text="查询"></asp:button>&nbsp;<asp:button id="btn_Add" runat="server" BackColor="#C0C000" Text="添加"></asp:button></td>
											<td align="left"><FONT face="宋体"></FONT></td>
										</tr>
									</table>
							<tr align="center">
								<td height="100%" width="100%">
									<asp:datagrid id="DataGrid1" runat="server" Width="100%" Height="96%" PageSize="8" DataKeyField="bianhao"
										AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="td">
										<SelectedItemStyle BackColor="#999999"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#CCCC99"></AlternatingItemStyle>
										<HeaderStyle ForeColor="#3333FF" CssClass="ct" BackColor="#C1DA90"></HeaderStyle>
										<Columns>
											<asp:TemplateColumn>
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
												<HeaderTemplate>
													<FONT style="FONT-WEIGHT: bold; COLOR: #ff3333" color="#ff3333" size="2">修改</FONT>
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
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
												<HeaderTemplate>
													<FONT style="FONT-WEIGHT: bold" color="#ff3333" size="2">删除</FONT>
												</HeaderTemplate>
												<ItemTemplate>
													<FONT face="宋体">
														<asp:ImageButton id="Imbtn_del" runat="server" CommandName="delete" ImageUrl="images\delete.gif"></asp:ImageButton></FONT>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="bianhao" SortExpression="bianhao" HeaderText="业主编号">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="xingming" SortExpression="xingming" HeaderText="业主姓名">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="xingbie" SortExpression="xingbie" HeaderText="性别">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="danwei" SortExpression="danwei" HeaderText="所属单位">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="shenfenzhenghao" SortExpression="shenfenzhenghao" HeaderText="身份证号">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="dianhua" SortExpression="dianhua" HeaderText="电话">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="shouji" SortExpression="shouji" HeaderText="手机">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="youjian" SortExpression="youjian" HeaderText="电子邮件地址">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="jianlizhe" SortExpression="jianlizhe" HeaderText="经办人">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn>
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
												<HeaderTemplate>
													照片
												</HeaderTemplate>
												<ItemTemplate>
													<asp:Image id=Image1 runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "zhaopian") %>'>
													</asp:Image>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="leixing" SortExpression="leixing" HeaderText="住户类型">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td><IMG src="images/print.gif" align="absMiddle"> <A href="javascript:window.print()">打印</A>&nbsp;&nbsp;
									<asp:literal id="ErrorMsg" runat="server"></asp:literal></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
