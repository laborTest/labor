<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>dwdj_7_insertzpgzxx</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<%=request.getContextPath()%>/styles/css/common.css"
			rel="stylesheet" type="text/css">
		<script src="<%=request.getContextPath()%>/js/commonjs.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript">
	$(function(){
		$("#zpgz").click(function(){
			var parent=$(this);
			$("#chooseGz").css("display","block");
			if($("#gzHy").is(":empty")){
				$("#gzHy").load("gz");
			}else{
				$("#gzHy").change();
			}
			$("#gz1").html("");
			$("#gz2").html("");
			$("#gz3").html("");
			$("#gzDm").val("");
			$("#gzName").val("");
			$("#gzHy").change(function(){
				$("#gz1").load("gz/"+$(this).val()+"/gz1");
				$("#gz2").html("");
				$("#gz3").html("");
			});
			$("#gz1").change(function(){
				$("#gz2").load("gz/"+$(this).val()+"/gz2");
				$("#gz3").html("");
			});
			$("#gz2").change(function(){
				$("#gz3").load("gz/"+$(this).val()+"/gz3");
				$("#gzDm").val($(this).val());
				$("#gzName").val($("#gz2 option:selected").html());
			});
			$("#gz3").change(function(){
				$("#gzDm").val($(this).val());
				$("#gzName").val($("#gz3 option:selected").html());
			});
			
			//确定按钮点击事件
			$("#btn_gz").click(function(){
				var code = $("#gzDm").val();
				parent.load("gzName/"+code);
				$("#chooseGz").css("display","none");
				
			});
		});
		$("#gwlb").load("station/0");
		$("#hjxz").load("rprType/0");
		$("#whcd").load("education/0");
		$("#ygxs").load("employType/0");
		$("#hyzk").load("marriage/0");
		$("#jkzk").load("healthState/0");
		$("#rylb").load("personnelType/0");
		$("#zpdq").load("getRegion/00/province");
		$("#jsjdj").load("computer/0");
		$("#jsjslcd").load("proficiency/0");
		$("#jyyz").load("language/0");
		$("#slcd").load("proficiency/0");
		
	
	$("#bc").click(function(){
		
			var reg=/[a-zA-Z_0-9]$/
        
      var regtoo=/[0-9]$/
        
      var regthree=/[_a-z0-9]+@([_a-z0-9]+\.)+[a-z0-9]{2,3}$/;   
		if(form1.zpgz.value==""){
			alert("招聘工种不允许为空!");
				return;
		}
		if($("#dwlxr").val()==""){
		alert("单位经办人不能为空");
		return;		
		}
		if($("#zprsn").val()==""&&$("#zprsnv").val()==""&&$("#xbbx").val()==""){
		alert("请至少填写一项招聘人数");					
		return;
		}
		if($("#ygxs").val()==""){
		alert("用工形式不能为空");		
		return;		
		}
		if(regtoo.test(form1.dwlxr.value)){
			alert("请正确填写经办人!");

			return;
		}
		if(!regtoo.test(form1.lxrsfzhm.value)){
		    alert("身份证格式输入不正确，请重新输入！");
		    alert(form1.lxrsfzhm.value);
		    return;
		}
		if(form1.lxrsj.value!=""&&!regtoo.test(form1.lxrsj.value)){
		    alert("手机格式输入不正确，请重新输入！");
		    return;
		}
		if(form1.kssj.value!=""&&!regtoo.test(form1.kssj.value)){
		    alert("开始时间格式输入不正确，请重新输入！");
		    return;
		}
		if(form1.jssj.value!=""&&!regtoo.test(form1.jssj.value)){
		    alert("结束时间格式输入不正确，请重新输入！");
		    return;
		}
		if(form1.zprsn.value!=""&&!regtoo.test(form1.zprsn.value)){
		    alert("招聘人数男只能输入数字，请重新输入！");
		    return;
		}
		if(form1.zprsnv.value!=""&&!regtoo.test(form1.zprsnv.value)){
		    alert("招聘人数女只能输入数字，请重新输入！");
		    return;
		}
		if(form1.xbbx.value!=""&&!regtoo.test(form1.xbbx.value)){
		    alert("招聘人数不限只能输入数字，请重新输入！");
		    return;
		}
		if(form1.zxnl.value!=""&&!regtoo.test(form1.zxnl.value)){
		    alert("开始年龄只能输入数字，请重新输入！");
		    return;
		}
		
		if(form1.zdnl.value!=""&&!regtoo.test(form1.zdnl.value)){
		    alert("截止年龄只能输入数字，请重新输入！");
		    return;
		}
		if(form1.zzyx.value!=""&&!regtoo.test(form1.zzyx.value)){
		    alert("开始月薪只能输入数字，请重新输入！");
		    return;
		}
		if(form1.zgyx.value!=""&&!regtoo.test(form1.zgyx.value)){
		    alert("结束月薪只能输入数字，请重新输入！");
		    return;
		}
		if($("#zprsn").val()==""){
		$("#zprsn").val("0");
		
		}
		if($("#zprsnv").val()==""){
		$("#zprsnv").val("0");
		
		}
		if($("#xbbx").val()==""){
		$("#xbbx").val("0");
		
		}
		
		form1.submit();
		
		});
	
	});

</script>

<script>

	function doInsert(){
		if(form1.zpgz.value==""){
			alert("职业名称不能为空!");
			return;
		}
		if(form1.xbbx.value==""&&form1.zprsnv.value==""&&form1.zprsn.value==""){
			alert("招聘人数不能为空!");
			return;
		}
		if(form1.ygxs.value==""){
			alert("用工形式不能为空!");
			return;
		}
		if(form1.fwcslx.options[form1.fwcslx.selectedIndex].value=="2"){
			if(form1.fwcs.value==""){
				alert("您已经选择了自定义服务次数,请填写服务次数");
				return;
			}
		}
		if(!testNum(form1.fwcs.value)){
			alert("服务次数需为数字!");
			return;
		}
		form1.bc.disabled=true;
		form1.fh.disabled=true;
		
		form1.submit();
	}
	function setZymc(){
		var rtValue;
		var dx=(screen.height/2-85)+"";
   		var dy=(screen.width/2-200)+"";
   		
		rtValue=window.showModalDialog("<%=request.getContextPath()%>/common/choosegz_ModalDialog_qyc.jsp",null,"dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=170px;dialogWidth=400px;help=no;fullscreen=1;status=no;center=yes");
		if(rtValue!=undefined&&rtValue!=""){
			document.all.zpgztd.removeChild(form1.zpgz);
			document.all.zpgztd.innerHTML="<select name=\"zpgz\" style=\"WIDTH: 100%\" onclick=\"setZymc()\">"+rtValue+"</select>";
		}
	}
	
	function setZyjn(){
	
		var rtValue;
		var dx=(screen.height/2-85)+"";
   		var dy=(screen.width/2-200)+"";
		rtValue=window.showModalDialog("<%=request.getContextPath()%>/common/choosegz_ModalDialog_qyc.jsp","工种选择","dialogTop="+ dx+ ";dialogLeft="+ dy+ ";dialogHeight=170px;dialogWidth=400px;help=no;fullscreen=1;status=no;center=yes");
		if (rtValue != undefined && rtValue != "") {
			document.all.zpjntd.removeChild(form1.jyzyjn);
			document.all.zpjntd.innerHTML = "<select name=\"jyzyjn\" style=\"WIDTH: 100%\" onclick=\"setZyjn()\">"+ rtValue + "</select>";
		}
	}
	/*
	function operateZprs(){
		if(form1.xbbx.value==""&&(form1.nvrs.value!=""||form1.nars.value!="")){
			document.all.xbbxtd.removeChild(form1.xbbx);
			document.all.xbbxtd.innerHTML="<INPUT name=\"xbbx\" size=\"8\" style=\"WIDTH: 100%\" maxlength=\"3\" readonly>";
		}else if(form1.xbbx.value!=""&&(form1.nvrs.value==""&&form1.nars.value=="")){
			document.all.narstd.removeChild(form1.nars);
			document.all.narstd.innerHTML="<INPUT name=\"nars\" size=\"8\" style=\"WIDTH: 100%\" maxlength=\"3\" readonly>";
			document.all.nvrstd.removeChild(form1.nvrs);
			document.all.nvrstd.innerHTML="<INPUT name=\"nvrs\" size=\"8\" style=\"WIDTH: 100%\" maxlength=\"3\" readonly>";
		}else if(form1.xbbx.value==""&&form1.nvrs.value==""&&form1.nars.value=="")){
			document.all.xbbxtd.removeChild(form1.xbbx);
			document.all.xbbxtd.innerHTML="<INPUT name=\"xbbx\" size=\"8\" style=\"WIDTH: 100%\" maxlength=\"3\" onblur=\"operateZprs();\">";
			document.all.narstd.removeChild(form1.nars);
			document.all.narstd.innerHTML="<INPUT name=\"nars\" size=\"8\" style=\"WIDTH: 100%\" maxlength=\"3\" onblur=\"operateZprs();\">";
			document.all.nvrstd.removeChild(form1.nvrs);
			document.all.nvrstd.innerHTML="<INPUT name=\"nvrs\" size=\"8\" style=\"WIDTH: 100%\" maxlength=\"3\" onblur=\"operateZprs();\">";
		}
	}
	 */
	function operateFwcs() {
		if (form1.fwcslx.options[form1.fwcslx.selectedIndex].value == "1") {
			document.all.fwcstd.removeChild(form1.fwcs);
			document.all.fwcstd.innerHTML = "<input name=\"fwcs\" style=\"WIDTH: 100%\" maxlength=\"4\" value=\"10\" readonly>";
		} else if (form1.fwcslx.options[form1.fwcslx.selectedIndex].value == "2") {
			document.all.fwcstd.removeChild(form1.fwcs);
			document.all.fwcstd.innerHTML = "<input name=\"fwcs\" style=\"WIDTH: 100%\" maxlength=\"4\" value=\"\">";
		}
	}
</script>
	</head>
	<body>
	
	    <div id="chooseGz" style="text-align:center;background-color: #7bbfea;width:500px;height:180px;position: fixed;margin: auto;left: 90;top:0;bottom:0;z-index: 1;display: none;" >
		<h2 align="center">工种选择：</h2>
		大&nbsp;&nbsp;&nbsp;&nbsp;类：<select id="gzHy" size="1"  style="WIDTH: 35%"></select>&nbsp;&nbsp;
		中&nbsp;&nbsp;&nbsp;&nbsp;类：<select id="gz1" size="1"  style="WIDTH: 35%"></select><br><br>
		小&nbsp;&nbsp;&nbsp;&nbsp;类：<select id="gz2" size="1"  style="WIDTH: 35%"></select>&nbsp;&nbsp;
		细&nbsp;&nbsp;&nbsp;&nbsp;类：<select id="gz3" size="1"  style="WIDTH: 35%"></select><br><br>
		工种代码：<input size="1" id="gzDm"  style="WIDTH: 34%" type="text" value="" readonly="readonly">&nbsp;&nbsp;工种名称：<input type="text"  id="gzName" size="1"  style="WIDTH: 34%" value="" readonly="readonly"><br><br>
		<input type="button" id="btn_gz" value="确定" class="BUTTONS2">
	</div>
		<form method="post" name="form1" action="zpgzInfo">
			<input type="hidden" name="dwdj" value="dwdj3" />

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table width="98%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td height="20" valign="bottom">
									<img
										src="<%=request.getContextPath()%>/styles/images/right/now.gif"
										width="11" height="12">
									当前位置：职业介绍 &gt; 单位登记 &gt; 新增招聘工种信息
								</td>
							</tr>
							<tr>
								<td valign="bottom"
									background="<%=request.getContextPath()%>/styles/images/right/dsline.gif"
									height="8">
									<img
										src="<%=request.getContextPath()%>/styles/images/index/spacer.gif">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center" valign="top">
						<table width="98%" border="0" cellpadding="0" cellspacing="0"
							class="title">
							<tr>
								<td width="30">
									<table border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<img src="<%=request.getContextPath()%>/styles/css/bb_d.gif">
											</td>
										</tr>
									</table>
								</td>
								<td valign="bottom">
									招聘信息[公司名称法人码]
								</td>
							</tr>
						</table>
						<table width="98%" border="0" cellpadding="0" cellspacing="1">
							<tr class="line2">
								<td align="right" width="13%">
								<input type="hidden" value="${bioId }" name="dwbh">
									<span class="redtxt">*</span>经办人
								</td>
								<td align="right" width="20%">
									<INPUT name="dwlxr" id="dwlxr" style="WIDTH: 100%"
										maxlength="32">
								</td>
								<td align="right" width="13%">
									身份证
								</td>
								<td align="right" width="20%">
									<INPUT name="lxrsfzhm" id="lxrsfzhm" style="WIDTH: 100%"
										maxlength="32">
								</td>
								<td align="right" width="13%">
									手机
								</td>
								<td align="right" width="20%">
									<input name="lxrsj" id="lxrsj" style="WIDTH: 100%"
										maxlength="11">
								</td>
							</tr>
							<tr>
								<td colspan="6" valign="bottom"
									background="<%=request.getContextPath()%>/styles/images/right/dsline.gif"
									height="8">
									<img
										src="<%=request.getContextPath()%>/styles/images/index/spacer.gif">
								</td>
							</tr>
							<tr class="line2">
								<td align="right">
									<span class="redtxt">*</span>招聘工种
								</td>
								<td id="zpgztd">
									<select name="zpgz" id="zpgz" class="" style="WIDTH: 100%">
										<!--弹出ModalDialog-->
									</select>
								</td>
								<td align="right">
									岗位名称
								</td>
								<!-- 登记默认岗位类别为日常招聘岗位 -->
								<td align="left">
									<INPUT name="zpgzbm" style="WIDTH: 100%" maxlength="16">
								</td>
								<td align="right">
									岗位类别
								</td>
								<td>
									<select id="gwlb" name="gwlb" style="WIDTH: 100%"></select>
								</td>
							</tr>
							<tr class="line1">
								<td align="right">
									<span class="redtxt">*</span>招聘人数
								</td>
								<td colspan="3">
									男
									<INPUT name="zprsn" id="nars" size="1">
									女
									<INPUT name="zprsnv" id="nvrs" size="1">
									不限
									<INPUT name="xbbx" id="xbbx" size="1">
								</td>
								<td align="right">
									户籍性质
								</td>
								<td>
									<select id="hjxz" name="hjxz" style="WIDTH: 100%">
										${Rprtype}

									</select>
								</td>
							</tr>
							<tr class="line2">
								<td align="right" width="140">
									开始时间
								</td>
								<td>
									<textarea name="kssj" style="WIDTH: 100%" class='mask'
										htcurl="url(<%=request.getContextPath()%>/common/htc/format.htc)"
										rows="1" cols="10" mask='date' maxlength="8"></textarea>
								</td>

								<td align="right">
									截至时间
								</td>
								<td>
									<textarea name="jssj" style="WIDTH: 100%" class='mask'
										htcurl="url(<%=request.getContextPath()%>/common/htc/format.htc)"
										rows="1" cols="10" mask='date' maxlength="8"></textarea>
								</td>
								<td align="right">
									年龄
								</td>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td width="45%">
												<INPUT name="zxnl" style="WIDTH: 100%" maxlength="2">
											</td>
											<td width="10%">
												至
											</td>
											<td width="45%">
												<INPUT name="zdnl" style="WIDTH: 100%" maxlength="2">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr class="line1">
								<td align="right" width="140">
									文化程度
								</td>
								<td>
									<select id="whcd" name="whcd" style="WIDTH: 100%">
										${Educationallevel}


									</select>
								</td>

								<td align="right">
									<span class="redtxt">*</span>用工形式
								</td>
								<td>
									<select id="ygxs" name="ygxs" style="WIDTH: 100%">
										${Employtype}

									</select>
								</td>

								<td align="right">
									月薪
								</td>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td width="45%">
												<INPUT name="zzyx" style="WIDTH: 100%" maxlength="5"
													onblur="checkJe(this);">
											</td>
											<td width="10%">
												至
											</td>
											<td width="45%">
												<INPUT name="zgyx" style="WIDTH: 100%" maxlength="5"
													onblur="checkJe(this);">
											</td>
										</tr>
									</table>
								</td>

							</tr>
							<tr class="line2">
								<td align="right">
									婚姻状况
								</td>
								<td>
									<select id="hyzk" name="hyzk" style="WIDTH: 100%">
										${Marriage}

									</select>
								</td>
								<td align="right">
									健康状况
								</td>
								<td>
									<select id="jkzk" name="jkzk" style="WIDTH: 100%">
										${Healthstate}

									</select>
								</td>
								<td align="right">
									招用应届生
								</td>
								<td>
									<select name="sfbys" style="WIDTH: 100%">
										<option value=""></option>
										<option value="1">
											是
										</option>
										<option value="0">
											否
										</option>
									</select>
								</td>
							</tr>
							<tr class="line2">
								<td align="right">
									人员类别
								</td>
								<td>
									<select id="rylb" name="rylb" style="WIDTH: 100%">
										${Personneltype}

									</select>
								</td>
								<td align="right">
									招聘地区
								</td>
								<td>
									<select id="zpdq" name="zpdq" style="WIDTH: 100%">
										${Regioncode}

									</select>
								</td>
								<td align="right"></td>
								<td></td>

							</tr>

							<tr class="line1">
								<td align="right">
									计算机等级
								</td>
								<td>
									<select id="jsjdj" name="jsjdj" style="WIDTH: 100%">
										${Computergrade}

									</select>
								</td>
								<td align="right">
									熟练程度
								</td>
								<td>
									<select id="jsjslcd" name="jsjslcd" style="WIDTH: 100%">
										${Proficiency}

									</select>
								</td>
							</tr>
							<tr class="line2">
								<td align="right">
									具有外语
								</td>
								<td>
									<select id="jyyz" name="jyyz" style="WIDTH: 100%">
										${Language}

									</select>
								</td>
								<td align="right">
									熟练程度
								</td>
								<td>
									<select id="slcd" name="slcd" style="WIDTH: 100%">
										${Proficiency}

									</select>
								</td>

							</tr>
							<tr class="line1">
								<td align="right">
									工作地点
								</td>
								<td colspan="5">
									<INPUT name="gzdd" style="WIDTH: 100%">
								</td>

							</tr>
							<tr class="line2">
								<td align="right">
									岗位描述
								</td>
								<td>
									<textarea name="gwms" style="width: 152"></textarea>
								</td>
								<td align="right" width="140">
									其他说明
								</td>
								<td colspan="3">
									<textarea name="fldy" style="width: 100%"></textarea>
								</td>
							</tr>

						</table>
						<tr>
							<td>
								<TABLE width="100%" border=0 cellPadding=0 cellSpacing=1
									class="tablebody" align="center">
									<tr height="15px">
										<td>
											b
										</td>
									</tr>
									<TR align="center">
										<TD class="line2">
											<input name="bc" id="bc" type="button" class="BUTTONs3"
												value="保 存">
											&nbsp;&nbsp;
											<INPUT name="fh" type="submit" class="BUTTONs3" value="返 回">
										</TD>
									</TR>
								</TABLE>
							</td>
						</tr>
			</table>
		</form>
	</body>
</html>
