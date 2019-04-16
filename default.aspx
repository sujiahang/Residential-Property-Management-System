<%@ Page CodeBehind="default.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse._default" %>

<HTML>
  <HEAD>
		<title>物业管理系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<style type="text/css"> TD { FONT-SIZE: 12px; LINE-HEIGHT: 14px } .tl { FONT-SIZE: 14px; LINE-HEIGHT: 14px } .ts { FONT-SIZE: 12px; LINE-HEIGHT: 14px } .INPUT { WIDTH: 115px; HEIGHT: 20px } .TT { FONT-SIZE: 12px; COLOR: #ffffff } .ts2 { FONT-SIZE: 10px; COLOR: #ffffff; FONT-FAMILY: "Verdana", "Arial", "Helvetica", "sans-serif" } </style>
</HEAD>
	<BODY background="images/sch-01.gif">
		<FORM name="theform" runat="server">
			<BR>
			<BR>
			<TABLE cellSpacing="0" borderColorDark="#3300cc" cellPadding="0" width="760" align="center"
				borderColorLight="#ffffff"  border="0">
				<TBODY>
					<TR>
						<TD height="435">
							<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
								<TBODY>
									<TR bgColor="#9999ff">
									</TR>
									<TR>
										<TD width="100%" height="435" background="images/dl-1.gif"><BR>
											<P align="center">
											</P>
											<p>&nbsp;</p>
											<p>&nbsp;</p>
											<p>&nbsp;</p>
											<p>&nbsp;</p>
											<p>&nbsp;</p>
											<p>&nbsp;</p>
											<p>&nbsp;</p>
            <P>&nbsp;</P>
											<table cellspacing="0" cellpadding="0" width="360" align="right" border="0">
												<tbody>
													<tr>
													</tr>
													<tr>
														<td width="511" height="75">
															<div align="center">
																<br>
																姓名代码：
																<asp:TextBox id="Login_name" runat="server" Width="112px"></asp:TextBox>
																<br>
																<br>
																登录口令：
																<asp:TextBox id="Login_password" runat="server" Width="112px" TextMode="Password"></asp:TextBox>
															</div>
														</td>
													</tr>
													<tr>
														<td width="511" height="2">
															<table cellspacing="0" cellpadding="0" width="100%" border="0">
																<tbody>
																	<tr>
																		<td width="58%" height="37">
																			<div align="right">
																				<asp:Button id="Login_login" runat="server" Width="40px" Text="登陆"></asp:Button>
																			</div>
																		</td>
																		<td width="4%" height="37">&nbsp;
																		</td>
																		<td width="38%" height="37"><asp:Button id="Login_reset" runat="server" Width="40px" Text="重置"></asp:Button>
																		</td>
																	</tr>
																</tbody>
															</table>
														</td>
													</tr>
												</tbody>
											</table>
											<p>&nbsp;</p>
											<P align="center">
											</P>
										</TD>
									</TR>
									<TR bgColor="#003399">
									</TR>
								</TBODY></TABLE>
						</TD>
					</TR>
				</TBODY></TABLE>
		</FORM>
	</BODY>
</HTML>
