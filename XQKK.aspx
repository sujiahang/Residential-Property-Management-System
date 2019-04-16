<%@ Page CodeBehind="XQKK.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.XQKK" %>
<HTML>
	<HEAD>
		<title>小区概况</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<script language="javascript" src="../../inc/public.js"></script>
		<link rel="stylesheet" href="css/mm.css" type="text/css">
	</HEAD>
	<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name="Form1" method="post" runat="server">
			<table width="100%" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="bborder" height="22">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="images/loca.gif" width="16" height="16" hspace="3" align="absMiddle">位置:&nbsp;物业管理 
												&gt; 小区资料 &gt; 小区概况</td>
											<td align="right" width="30"><a href="#" onClick="self.history.back();"><img src="images/back2.gif" hspace="3" border="0" width="16" height="16"></a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td class="bborder">
									<table border="0" cellspacing="1" cellpadding="5" width="100%">
										<tr class="btd">
											<td colspan="6" height="20"></td>
										</tr>
										<tr class="btd">
											<td align="right" width="16%">小区名称</td>
											<td><FONT face="宋体">&nbsp;</FONT>
												<asp:DropDownList id="ddl_Area" runat="server" Width="64px" AutoPostBack="True"></asp:DropDownList>
											</td>
											<td align="right" width="16%">负 责 人</td>
											<td width="16%">&nbsp;
												<asp:Label id="Label2" runat="server"></asp:Label>
											</td>
											<td align="right" width="16%">建立日期</td>
											<td width="16%">&nbsp;
												<asp:Label id="Label3" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td align="right">联 系 人</td>
											<td>&nbsp;
												<asp:Label id="Label4" runat="server"></asp:Label>
											</td>
											<td align="right">联系电话</td>
											<td>
												<asp:Label id="Label5" runat="server"></asp:Label>
											</td>
											<td align="right">移动电话</td>
											<td>&nbsp;
												<asp:Label id="Label6" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td align="right">占地面积</td>
											<td>&nbsp;
												<asp:Label id="Label7" runat="server"></asp:Label>
											</td>
											<td align="right">道路面积</td>
											<td>&nbsp;
												<asp:Label id="Label8" runat="server"></asp:Label>
											</td>
											<td align="right">设计车位面积</td>
											<td>&nbsp;
												<asp:Label id="Label9" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td align="right">建筑面积</td>
											<td>&nbsp;
												<asp:Label id="Label10" runat="server"></asp:Label>
											</td>
											<td align="right">高层楼宇数量</td>
											<td>&nbsp;
												<asp:Label id="Label11" runat="server"></asp:Label>
											</td>
											<td align="right">车库面积</td>
											<td>&nbsp;
												<asp:Label id="Label12" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td align="right">公共场所面积</td>
											<td>&nbsp;
												<asp:Label id="Label13" runat="server"></asp:Label>
											</td>
											<td align="right">多层楼宇数量</td>
											<td>&nbsp;
												<asp:Label id="Label14" runat="server"></asp:Label>
											</td>
											<td align="right">车 位 数</td>
											<td>&nbsp;
												<asp:Label id="Label15" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td align="right">绿化面积</td>
											<td>&nbsp;
												<asp:Label id="Label16" runat="server"></asp:Label>
											</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr class="btd">
											<td align="right">位置说明</td>
											<td colspan="5">&nbsp;
												<asp:Label id="Label17" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td align="right">备 注</td>
											<td colspan="5">&nbsp;
												<asp:Label id="Label18" runat="server"></asp:Label>
											</td>
										</tr>
										<tr class="btd">
											<td colspan="2" align="right" height="36">&nbsp;
											</td>
											<td colspan="4" align="center">
												<asp:Button id="bt_Update" runat="server" Text="修改" Enabled="False"></asp:Button>&nbsp;
                                                <asp:Button ID="btn_Add" runat="server" Text="添加" />
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
