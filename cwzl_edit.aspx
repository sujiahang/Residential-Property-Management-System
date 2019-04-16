<%@ Page CodeBehind="cwzl_edit.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.cwzl_edit" %>
<HTML>
	<HEAD>
		<title>车位资料 : 修改车位</title>
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
												&gt; 车位资料 &gt; 修改车位</td>
											<td align="right" width="30"><a href="#" onClick="self.history.back();"><img src=".images/back2.gif" hspace="3" border="0" width="16" height="16"></a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table border="0" cellspacing="0" cellpadding="5" class="btd" width="100%">
										<tr>
											<td colspan="4">&nbsp;
												<asp:Literal id="ErrorMsg" runat="server"></asp:Literal><INPUT id="p_theID" type="hidden" size="7" name="p_theID" runat="server"><INPUT id="theID" type="hidden" size="5" name="theID" runat="server"></td>
										</tr>
										<tr>
											<td width="25%" align="right">车位号</td>
											<td width="25%"><font color="#ff0000">
													<asp:textbox id="tbNO" runat="server" Width="136px"></asp:textbox>*</font>
											</td>
											<td width="12%" align="right">车牌号</td>
											<td><FONT face="宋体">
													<asp:textbox id="tbCarNO" runat="server" Width="136px"></asp:textbox></FONT>
											</td>
										</tr>
										<tr>
											<td align="right">车类型</td>
											<td>
												<asp:textbox id="tbType" runat="server" Width="136px"></asp:textbox>
											</td>
											<td align="right">面 积</td>
											<td>
												<asp:textbox id="tbArea" runat="server" Width="136px"></asp:textbox>
											</td>
										</tr>
										<tr>
											<td align="right">位 置</td>
											<td>
												<asp:textbox id="tbPlace" runat="server" Width="136px"></asp:textbox>
											</td>
											<td align="right">承租人</td>
											<td>
												<asp:textbox id="tbMaster" runat="server" Width="136px"></asp:textbox>
											</td>
										</tr>
										<tr>
											<td align="right">备 注</td>
											<td colspan="3">
												<asp:textbox id="tbMemo" runat="server" Width="320px"></asp:textbox>
											</td>
										</tr>
										<tr>
											<td colspan="4" height="15"><hr size="1" color="#c1da90">
											</td>
										</tr>
										<tr>
											<td colspan="4" height="38" align="center" valign="top">&nbsp;
												<asp:Button id="btSave" runat="server" Text="保存"></asp:Button>
												<asp:Button id="btCancel" runat="server" Text="取消"></asp:Button>
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
