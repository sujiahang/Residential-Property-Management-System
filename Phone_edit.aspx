<%@ Page CodeBehind="Phone_edit.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.Phone_edit" %>

<HTML>
  <HEAD>
		<title>物业管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet" href="css/mm.css" type="text/css">
  </HEAD>
	<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name="theForm" runat="server">
			<table width="100%" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="1" cellpadding="0" class="bborder">
							<tr>
								<td height="20">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="images/loca.gif" width="16" height="16" hspace="3" align="absMiddle"> 
												位置:&nbsp;住户管理 &gt;&nbsp;电话资料 &gt; 电话资料修改</td>
											<td align="right" width="30"><a href="#" onClick="self.history.back();"><img src="images/back2.gif" hspace="3" border="0" width="16" height="16"></a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="3" class="btd">
										<tr>
											<td colspan="8" height="24">
												<asp:Literal id="ErrorMsg" runat="server"></asp:Literal><INPUT id="p_theID" type="hidden" name="p_theID" runat="server"><INPUT id="theID" type="hidden" name="theID" runat="server">
												<asp:label id="theValidationSummary" runat="server" cssclass="DataTD" Visible="false"></asp:label><INPUT id="paID" type="hidden" size="5" name="paID" runat="server"></td>
										</tr>
										<tr>
											<td align="right" width="10%">电话</td>
											<td width="276">
												<font color="#ff0000">
													<asp:TextBox id="tbPhone" runat="server" Width="129px"></asp:TextBox>*</font>
											</td>
											<td align="right" width="9%">楼宇</td>
											<td width="15%">
												<asp:dropdownlist id="ddl_Pavilion" runat="server" Width="88px" AutoPostBack="True"></asp:dropdownlist>&nbsp;
											</td>
											<TD width="136" align="center">&nbsp;房号<FONT face="宋体" color="#ff0000">*</FONT></TD>
											<TD width="124">
												<asp:DropDownList id="ddl_House" runat="server" Width="96px"></asp:DropDownList></TD>
											<td width="93">&nbsp;</td>
											<td width="17%">&nbsp;</td>
										</tr>
										<tr>
											<td align="right" width="10%" height="27">备 注</td>
											<td colspan="7" height="27">
												<asp:TextBox id="tb_Memo" runat="server" Width="288px"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td colspan="8" height="50" align="center">
												<asp:Button id="btSave" runat="server" Text="保存"></asp:Button>
												<asp:Button id="btCancel" runat="server" Text="取消"></asp:Button>&nbsp;&nbsp;
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