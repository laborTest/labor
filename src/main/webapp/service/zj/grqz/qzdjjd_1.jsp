<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include flush="true" page="/common/alert.jsp"></jsp:include>
<%@ include file="/common/import.jsp"%>
<html>

<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/styles/css/common.css"
	rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#bip_citizenid").blur(
				function() {
					var id = $(this).val();
					var exp = /^\d{17}[\d|X]|^\d{15}$/;
					if (exp.test(id)) {
						$.get("../../checkCitizenId", {
							bip_citizenid : $(this).val()
						}, function(data) {
							if (data == "no") {
								$("#tips_id").html(
										"该身份证号不存在，请检查后重新输入".fontcolor("red"));
								$("#bip_citizenid").focus();
							} else {
								$("#tips_id").html("");
							}
						});
					}else{
						alert("请填写正确的身份证号码！");
						$("#bip_citizenid").val("");
					}
				});1
		//提交按钮点击事件
		$("#btn_submit").click(function() {
			var name = $("#bip_name").val();
			var id = $("#bip_citizenid").val();
			if (name == "" && id == "") {
				alert("请至少输入一项！");
				return;
			} else {
				$("#selectForm").submit();
			}

		});

	});
</script>
</head>
<body>
	<form id="selectForm" method="post" action="../../getBasicInfo"
		name="form1">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<table width="98%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td height="20" valign="bottom"><img
								src="<%=request.getContextPath()%>/styles/images/right/now.gif"
								width="11" height="12"> 当前位置：职业介绍 &gt; 个人求职 &gt; 冻结解冻</td>
						</tr>
						<tr>
							<td valign="bottom"
								background="<%=request.getContextPath()%>/styles/images/right/dsline.gif"
								height="8"><img
								src="<%=request.getContextPath()%>/styles/images/index/spacer.gif"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="98%" align="center" border="0" cellpadding="0"
			cellspacing="0" class="titlehand">
			<tr>
				<td width="30">
					<table border="0" cellspacing="0" cellpadding="0">
						<TR>
							<TD><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif"></TD>
						</TR>
					</table>
				</td>
				<td valign="bottom">查询条件&nbsp;&nbsp;&nbsp;提示：[请输入你要冻结解冻的人员的身份证号码或姓名]</td>
			</tr>
		</table>
		<TABLE width="98%" border="1" cellPadding="0" cellSpacing="0"
			bordercolor="#FFFFFF" class="tablebody" align="center">
			<TR>
				<TD align="center" class="line2">
					<table width="250" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="103">身份证号码</td>
							<td width="194"><input id="bip_citizenid"
								name="bip_citizenid" type="text" maxlength="18"
								style='width: 100%'> <span id="tips_id"></span></td>
						</tr>
					</table>
				</TD>
			</TR>
			<TR>
				<TD align="center" class="line2">
					<table width="250" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="103">姓 名</td>
							<td width="194"><input id="bip_name" name="bip_name"
								type="text" maxlength="18" value="" style='width: 100%'></td>
						</tr>
					</table>
				</TD>
			</TR>
		</TABLE>
		<table width="98%">
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center">
			<TR align="center" class="line2">
				<TD><INPUT name="button" type="button" class="BUTTONs3"
					value="确 定" id="btn_submit"> &nbsp;&nbsp; <INPUT
					class="BUTTONs3" type="reset" value="重 置" name="button2"></TD>
			</TR>
		</table>
	</form>
</body>

</html>
