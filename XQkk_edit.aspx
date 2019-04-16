<%@ Page CodeBehind="XQkk_edit.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.XQkk_edit" %>
<HTML>
	<HEAD>
		<title>小区概况</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet" href="css/mm.css" type="text/css">
	</HEAD>
	<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name="theForm" method="post" runat="server">
			<table width="100%" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="1" cellpadding="0" class="bborder">
							<tr>
								<td height="20">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="images/loca.gif" width="16" height="16" hspace="3" align="absMiddle">位置:&nbsp;物业管理 
												&gt; 小区资料 &gt; 修改小区资料</td>
											<td align="right" width="30"><a href="#" onClick="self.history.back();"><img src="images/back2.gif" hspace="3" border="0" width="16" height="16"></a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table border="0" cellspacing="0" cellpadding="4" class="btd" width="100%">
										<tr>
											<td colspan="6" height="20"><INPUT id="p_theID" type="hidden" name="p_theID" runat="server"><INPUT id="theID" type="hidden" name="theID" runat="server"></td>
										</tr>
										<tr>
											<td align="right">小区名称</td>
											<td width="110">
												<font color="red">
													<asp:TextBox id="TextBox1" runat="server" Width="82px"></asp:TextBox>*</font>
											</td>
											<td align="right">负 责 人</td>
											<td width="110" nowrap>
												<asp:TextBox id="TextBox2" runat="server" Width="82px"></asp:TextBox>
											</td>
											<td align="right">建立日期</td>
											<td width="120" nowrap>
												<asp:TextBox id="TextBox3" runat="server" Width="82px"></asp:TextBox>
												<font color="red">*</font>
											</td>
										</tr>
										<tr>
											<td align="right">联 系 人</td>
											<td nowrap>
												<asp:TextBox id="TextBox4" runat="server" Width="82px"></asp:TextBox>
											</td>
											<td align="right">联系电话</td>
											<td>
												<asp:TextBox id="TextBox5" runat="server" Width="82px"></asp:TextBox>
											</td>
											<td align="right">移动电话</td>
											<td>
												<asp:TextBox id="TextBox6" runat="server" Width="82px"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right">占地面积</td>
											<td>
												<asp:TextBox id="TextBox7" runat="server" Width="82px"></asp:TextBox>
											</td>
											<td align="right">道路面积</td>
											<td>
												<asp:TextBox id="TextBox8" runat="server" Width="82px"></asp:TextBox>
											</td>
											<td align="right">设计车位面积</td>
											<td>
												<asp:TextBox id="TextBox9" runat="server" Width="82px"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right">建筑面积</td>
											<td>
												<asp:TextBox id="TextBox10" runat="server" Width="82px"></asp:TextBox>
											</td>
											<td align="right">高层楼宇数量</td>
											<td>
												<asp:TextBox id="TextBox11" runat="server" Width="82px"></asp:TextBox>
											</td>
											<td align="right">车库面积</td>
											<td>
												<asp:TextBox id="TextBox12" runat="server" Width="82px"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right" height="30">公共场所面积</td>
											<td height="30">
												<asp:TextBox id="TextBox13" runat="server" Width="82px"></asp:TextBox>
											</td>
											<td align="right" height="30">多层楼宇数量</td>
											<td height="30">
												<asp:TextBox id="TextBox14" runat="server" Width="82px"></asp:TextBox>
											</td>
											<td align="right" height="30">车 位 数</td>
											<td height="30">
												<asp:TextBox id="TextBox15" runat="server" Width="82px"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right">绿化面积</td>
											<td>
												<asp:TextBox id="TextBox16" runat="server" Width="82px"></asp:TextBox>
											</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td align="right">位置说明</td>
											<td colspan="5">
												<asp:TextBox id="TextBox17" runat="server" Width="312px"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right">备 注</td>
											<td colspan="5">
												<asp:TextBox id="TextBox18" runat="server" Width="312px"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td colspan="6"><hr size="1" color="#c1da90">
												<asp:Literal id="ErrorMsg" runat="server"></asp:Literal>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td valign="top" height="38">&nbsp;
											</td>
											<td align="center" colspan="4" valign="top">
												<asp:Button id="bt_Save" runat="server" Text="保存"></asp:Button>&nbsp;
												<asp:Button id="bt_Cancel" runat="server" Text="返回"></asp:Button>
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
