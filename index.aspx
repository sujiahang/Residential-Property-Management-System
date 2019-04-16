<%@ Page CodeBehind="index.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.index" %>
<HTML>
	<HEAD>
		<title>物业管理系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<style type="text/css"> TD { FONT-SIZE: 12px; LINE-HEIGHT: 14px } .tl { FONT-SIZE: 14px; LINE-HEIGHT: 14px } .ts { FONT-SIZE: 12px; LINE-HEIGHT: 14px } .INPUT { WIDTH: 115px; HEIGHT: 20px } .TT { FONT-SIZE: 12px; COLOR: #ffffff } .ts2 { FONT-SIZE: 10px; COLOR: #ffffff; FONT-FAMILY: "Verdana", "Arial", "Helvetica", "sans-serif" } </style>
	</HEAD>
	<body bgcolor="#699326" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<table width="100%" border="0" height="100%" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center">
					<table width="587" border="0" cellspacing="0" cellpadding="0" height="296">
						<tr>
							<td height="55" background="images/home_top.gif" align="right" valign="bottom">
								<table width="116" border="0" cellspacing="0" cellpadding="5">
									<tr>
										<td>&nbsp;<font color="#e08204">&copy;物业管理系统</font></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td valign="top" height="202">
								<table width="100%" border="0" height="202" cellspacing="0" cellpadding="0">
									<tr>
										<td valign="top" width="311"><img src="images/home_left.jpg" width="311" height="202"></td>
										<td background="images/home_cen.jpg" valign="top">
											<table width="100%" border="0" height="202" cellspacing="0" cellpadding="0">
												<tr>
													<td height="60">
														<table width="100%" border="0" cellpadding="3" cellspacing="0" height="60">
															<tr>
																<td height="30" valign="bottom">&nbsp;&nbsp;<font color="#e08204"></font>
																</td>
															</tr>
															<tr>
																<td height="20" valign="bottom">&nbsp;&nbsp;<font color="#e08204">请输入<FONT color="#e08204">账号</FONT>与密码...</font></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td>
														<table width="100%" border="0" height="142" cellspacing="0" cellpadding="17">
															<tr>
																<td>
																	<table width="100%" border="0" cellspacing="0" cellpadding="3">
																		<form method="post" runat="server">
																			<TBODY>
																				<tr>
																					<td align="right" width="28%"><font color="#e08204">账号:</font></td>
																					<td width="72%">
																						<asp:TextBox id="Login_name" runat="server" Width="112px"></asp:TextBox>
																					</td>
																				</tr>
																				<tr>
																					<td align="right" width="28%"><font color="#e08204">密码:</font></td>
																					<td width="72%">
																						<asp:TextBox id="Login_password" runat="server" Width="112px" TextMode="Password"></asp:TextBox>
																					</td>
																				</tr>
																				<tr>
																					<td width="28%">&nbsp;</td>
																					<td width="72%">&nbsp;
																						<asp:Button id="Login_login" runat="server" Width="40px" Text="登录"></asp:Button>&nbsp;&nbsp;
																						<asp:Button id="Login_reset" runat="server" Width="40px" Text="重置"></asp:Button>
																					</td>
																				</tr>
																		</form>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
										<TD vAlign="top" width="45"><IMG height="202" src="images/home_right.jpg" width="45"></TD>
									</tr>
								</table>
							</td>
						</tr>
						<TR>
							<TD vAlign="top" height="39"><IMG height="39" src="images/home_bottom.jpg" width="587"></TD>
						</TR>
					</table>
				</td>
			</tr>
			</TBODY>

		</table>

		<SCRIPT language="javascript">

	function dologin() {
		if (form1.username.value=="") {
			alert("用户名不能为空！");
			return false;
		}
		if (form1.pwd.value=="") {
			alert("密码不能为空！");
                        return false;
		}
		form1.submit;

	}
		</SCRIPT>
	</body>
</HTML>
