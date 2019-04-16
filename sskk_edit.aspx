<%@ Page CodeBehind="sskk_edit.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="SmallHouse.sskk_edit" %>
<HTML>
	<HEAD>
		<title>设施详情</title>
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
											<td height="17"><img src="images/loca.gif" width="16" height="16" hspace="3" align="absMiddle">位置:&nbsp;物业管理 
												&gt; 设施概况&gt; 修改小区设施</td>
											<td align="right" width="30" height="17"><a href="#" onClick="self.history.back();"><img src="images/back2.gif" hspace="3" border="0" width="16" height="16"></a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table border="0" cellspacing="0" cellpadding="5" class="btd" width="100%">
										<tr>
											<td colspan="4">&nbsp;<INPUT id="p_theID" type="hidden" name="p_theID" runat="server"><INPUT id="theID" type="hidden" name="theID" runat="server"></td>
										</tr>
										<tr>
											<td align="right" width="139">设施名称</td>
											<td colspan="3">
												<font color="red">
													<asp:TextBox id="btName" runat="server"></asp:TextBox>*</font> &nbsp;&nbsp;&nbsp;类别&nbsp;
												<asp:DropDownList id="ddl_Type" runat="server" Width="96px"></asp:DropDownList>
												<font color="red">*</font>
											</td>
										</tr>
										<tr>
											<td align="right" width="139">全称</td>
											<td colspan="3">
												<asp:TextBox id="btAllName" runat="server"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right" width="139">设施说明</td>
											<td colspan="3">
												<asp:TextBox id="btNote" runat="server" Width="296px"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right" width="139">负责人</td>
											<td colspan="2" width="228">
												<asp:TextBox id="btP1" runat="server"></asp:TextBox>
											</td>
											<td rowspan="3" width="355">
												<asp:TextBox id="btMemo" runat="server" Width="184px" TextMode="MultiLine" Height="70px"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right" width="139">联系人</td>
											<td width="187">
												<asp:TextBox id="btP2" runat="server"></asp:TextBox>
											</td>
											<td width="25" align="right">备注</td>
										</tr>
										<tr>
											<td align="right" width="139">联系电话</td>
											<td colspan="2" width="228">
												<asp:TextBox id="btPhone" runat="server"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td colspan="4" height="30" valign="bottom">
												<hr size="1" color="#c1da90">
												<asp:Literal id="ErrorMsg" runat="server"></asp:Literal>
											</td>
										</tr>
										<tr valign="top">
											<td colspan="4" align="center" height="38">
												<asp:Button id="btSave" runat="server" Text="保存"></asp:Button>&nbsp;
												<asp:Button id="btCancel" runat="server" Text="取消"></asp:Button>&nbsp;
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
