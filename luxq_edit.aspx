<%@ Page CodeBehind="luxq_edit.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.luxq_edit" %>
<HTML>
	<HEAD>
		<title>楼宇详情</title>
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
											<td><img src="images/loca.gif" width="16" height="16" hspace="3" align="absMiddle">位置:&nbsp;物业管理 
												&gt; 楼房资料 &gt; 修改楼宇资料</td>
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
												<asp:Literal id="ErrorMsg" runat="server"></asp:Literal><INPUT id="p_theID" type="hidden" name="p_theID" runat="server"><INPUT id="theID" type="hidden" name="theID" runat="server"></td>
										</tr>
										<tr>
											<td align="right" width="10%">楼名</td>
											<td width="122">
												<font color="#ff0000">
													<asp:TextBox id="tbName" runat="server" Width="104px"></asp:TextBox>*</font>
											</td>
											<td align="right" width="9%">建筑面积</td>
											<td width="15%"><FONT face="宋体">
													<asp:TextBox id="tbArea" runat="server" Width="104px"></asp:TextBox></FONT>
											</td>
											<td width="9%">&nbsp;</td>
											<td width="15%">&nbsp;</td>
											<td width="9%">&nbsp;</td>
											<td width="17%">&nbsp;</td>
										</tr>
										<tr>
											<td align="right" width="10%">层数</td>
											<td width="122">
												<asp:TextBox id="tbLayer" runat="server" Width="104px"></asp:TextBox>&nbsp;
											</td>
											<td align="right" width="9%">类别</td>
											<td width="15%">
												<font color="#ff0000">
													<asp:DropDownList id="ddlType" runat="server" Width="96px"></asp:DropDownList>*</font>
											</td>
											<td width="9%" align="right">&nbsp;</td>
											<td width="15%">&nbsp;</td>
											<td width="9%" align="right">&nbsp;</td>
											<td width="17%">&nbsp;</td>
										</tr>
										<tr>
											<td align="right" width="10%">高度</td>
											<td width="122">
												<asp:TextBox id="tbHigh" runat="server" Width="104px"></asp:TextBox>
											</td>
											<td align="right" width="9%">朝向</td>
											<td width="15%">
												<font color="#ff0000">
													<asp:DropDownList id="ddlSunny" runat="server" Width="96px"></asp:DropDownList>*</font>
											</td>
											<td align="right" width="9%">&nbsp;</td>
											<td width="15%">&nbsp;</td>
											<td align="right" width="9%">&nbsp;</td>
											<td width="17%">&nbsp;</td>
										</tr>
										<tr>
											<td align="right" width="10%">建成日期</td>
											<td colspan="7">
												<asp:TextBox id="tbBuildDate" runat="server" Width="104px"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right" width="10%" height="27">备 注</td>
											<td colspan="7" height="27">
												<asp:TextBox id="tbMemo" runat="server" Width="288px"></asp:TextBox>
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
