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
												λ��:&nbsp;ס������ &gt;&nbsp;ס����Ϣ &gt;&nbsp;ס��������Ϣ</td>
											<td align="right" width="60">
												<A onclick="self.history.back();" href="#"><IMG height="16" hspace="3" src="images/back2.gif" width="16" border="0"></A></td>
										</tr>
										<tr>
											<td align="left">&nbsp;<asp:label id="Label4" runat="server" Width="48px">ҵ�����</asp:label><asp:textbox id="txt_Bianhao" runat="server" Width="56px" ToolTip="��ѡ��֧��ģ����ѯ"></asp:textbox>&nbsp;
												<asp:label id="Label3" runat="server" Width="48px">ҵ������</asp:label><asp:textbox id="txt_Mingcheng" runat="server" Width="56px" ToolTip="��ѡ��֧��ģ����ѯ"></asp:textbox>&nbsp;
												<asp:label id="Label2" runat="server" Width="48px">���֤��</asp:label><asp:textbox id="txt_ID" runat="server" Width="55px" ToolTip="��ѡ��֧��ģ����ѯ"></asp:textbox>&nbsp;
												<asp:label id="Label1" runat="server" Width="40px">������</asp:label><asp:dropdownlist id="DropDownList1" runat="server" Width="64px"></asp:dropdownlist>&nbsp;
												<asp:label id="Label5" runat="server">�Ƿ���ס</asp:label><asp:dropdownlist id="DropDownList2" runat="server" Width="48px">
													<asp:ListItem></asp:ListItem>
													<asp:ListItem Value="��">��</asp:ListItem>
													<asp:ListItem Value="��">��</asp:ListItem>
												</asp:dropdownlist>&nbsp;
												<asp:button id="btn_Search" runat="server" BackColor="#C0C000" Text="��ѯ"></asp:button>&nbsp;<asp:button id="btn_Add" runat="server" BackColor="#C0C000" Text="���"></asp:button></td>
											<td align="left"><FONT face="����"></FONT></td>
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
													<FONT style="FONT-WEIGHT: bold; COLOR: #ff3333" color="#ff3333" size="2">�޸�</FONT>
												</HeaderTemplate>
												<ItemTemplate>
													<FONT face="����">
														<asp:ImageButton id="ImageButton1" runat="server" CommandName="edit" ImageUrl="images\edit.gif"></asp:ImageButton></FONT>
												</ItemTemplate>
												<EditItemTemplate>
													<FONT face="����">&nbsp; </FONT>
												</EditItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn>
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
												<HeaderTemplate>
													<FONT style="FONT-WEIGHT: bold" color="#ff3333" size="2">ɾ��</FONT>
												</HeaderTemplate>
												<ItemTemplate>
													<FONT face="����">
														<asp:ImageButton id="Imbtn_del" runat="server" CommandName="delete" ImageUrl="images\delete.gif"></asp:ImageButton></FONT>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="bianhao" SortExpression="bianhao" HeaderText="ҵ�����">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="xingming" SortExpression="xingming" HeaderText="ҵ������">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="xingbie" SortExpression="xingbie" HeaderText="�Ա�">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="danwei" SortExpression="danwei" HeaderText="������λ">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="shenfenzhenghao" SortExpression="shenfenzhenghao" HeaderText="���֤��">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="dianhua" SortExpression="dianhua" HeaderText="�绰">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="shouji" SortExpression="shouji" HeaderText="�ֻ�">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="youjian" SortExpression="youjian" HeaderText="�����ʼ���ַ">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="jianlizhe" SortExpression="jianlizhe" HeaderText="������">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn>
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
												<HeaderTemplate>
													��Ƭ
												</HeaderTemplate>
												<ItemTemplate>
													<asp:Image id=Image1 runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "zhaopian") %>'>
													</asp:Image>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="leixing" SortExpression="leixing" HeaderText="ס������">
												<HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td><IMG src="images/print.gif" align="absMiddle"> <A href="javascript:window.print()">��ӡ</A>&nbsp;&nbsp;
									<asp:literal id="ErrorMsg" runat="server"></asp:literal></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
