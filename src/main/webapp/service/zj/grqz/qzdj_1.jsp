<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title></title>
<jsp:include flush="true" page="/common/alert.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/styles/css/common.css"
	rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/commonjs.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
<script>
	$(function() {

		//ajax请求查询求职者是否已经登记
		$("#sfzhm").blur(function() {
			var exp = /^\d{17}[\d|X]|^\d{15}$/;
			var citizenId=$(this).val();
			if(exp.test(citizenId)){
				$.get("../../getBipAllInfo/" + citizenId,function(data){
					
					//判断是否存在数据，选择性加载文本框内容
					//首先清空所有文本框
						$("input:text:gt(0)").each(function(){
							$(this).val("");
						});
					if(data){
						$("#form1").attr("action","../../updateInfo");
						//个人id
						$("#bipId").val(data.bip_id);
						//求职登记表id
						$("#qzbh").val(data.qzbh);
						//工种id
						$("#qzgzbh").val(data.gz[0].QZGZBH);
						//外语id
						$("#bipFlId").val(data.language[0].bip_fl_id);
						//技能id
						$("#bipSId").val(data.skill[0].bip_s_id);
						//年龄
						$("#nl").val(data.bip_age);
						//姓名
						$("#xm").val(data.bip_name);
						//视力：
						$("#leftEye").val(data.bip_eyesightleft);
						$("#rightEye").val(data.bip_eyesightright);
						//身高：
						$("#height").val(data.bip_long);
						//体重:
						$("#weight").val(data.bip_weight);
						//专业
						$("#major").val(data.bip_subject);
						//毕业时间
						$("#bysj").val(data.bip_bysj);
						//毕业学校
						$("#school").val(data.bip_graduateschool);
						//固定电话
						$("#tel").val(data.bip_con_telephone);
						//手机号码
						$("#mobile").val(data.bip_con_mobile);
						//邮箱
						$("#bipemail").val(data.bip_con_email);
						//邮编
						$("#postcode").val(data.bip_con_postcode);
						//联系人
						$("#contact").val(data.bip_con_contact);
						//联系人电话
						$("#contacttel").val(data.bip_con_contacttel);
						//居住地
						$("#address").val(data.bip_res_address);
						//第二学历
						$("#secondEdu").val(data.bip_educationallevel2);
						//工作简历
						$("#resume").val(data.bip_resume);
						//其他说明
						$("#qtsm").val(data.bip_qtsm);
						
						//处理所有的checkbox
						//低保人员
						$("#db").attr("checked",data.bip_t_lowersecurity=="1");
						//两劳人员
						$("#ll").attr("checked",data.bip_t_criminal=="1");
						//特困人员
						$("#tk").attr("checked",data.bip_t_destitute=="1");
						//农转非
						$("#nf").attr("checked",data.bip_t_peasant=="1");
						//复员退伍
						$("#fy").attr("checked",data.bip_t_veteran=="1");
						//外埠转入
						$("#wb").attr("checked",data.bip_t_othercities=="1");
						//再就业优惠证
						$("#yh").attr("checked",data.bip_t_czjyyhz=="1");
						//人户分离
						$("#rh").attr("checked",data.bip_t_rhfl=="1");
						//应届毕业生
						$("#yj").attr("checked",data.bip_t_newgraduate=="1");
						//接收短信
						$("#jsdx").attr("checked",data.SFJSDX=="1");
						//参加培训
						$("#cjpx").attr("checked",data.SFCJPX=="1");
						//是否接受就业指导
						$("#jszd").attr("checked",data.SFJSZYZD=="1");
					}else{
						$("#form1").attr("action","../../saveInfo");
					}
					
					//获取所有的下拉选项数据
					var sex=data.bip_sex;
					//1.性别
					$("#xb").load("../../sex/"+(sex?sex:0));

					var mz=data.bip_minzu;
					//2.民族
					$("#mz").load("../../nation/"+(mz?mz:0));

					var zzmm=data.bip_zzmm;
					//3.政治面貌
					$("#zzmm").load("../../politicsAspect/"+(zzmm?zzmm:0));

					var hyzk=data.bip_hyzk;
					//4.婚姻状况
					$("#hyzk").load("../../marriage/"+(hyzk?hyzk:0));

					var hjxz=data.bip_hjxz;
					//5.户籍性质
					$("#hjxz").load("../../rprType/"+(hjxz?hjxz:0));

					var rylb=data.bip_rylb;
					//6.人员类别
					$("#rylb").load("../../personnelType/"+(rylb?rylb:0));

					var jkzk=data.bip_jkzk;
					//7.健康状况
					$("#jkzk").load("../../healthState/"+(jkzk?jkzk:0));

					//8.判断是否加载残疾情况
					var cjqk=data.bip_cjqk;
					if(cjqk){
						$("#cjzk").load("../../deformity/"+cjqk);
					}
					$("#jkzk").change(function() {
						var val = $(this).val();
						if (val == "5") {
							$("#cjzk").html("");
							//8.残疾情况
							$("#cjzk").load("../../deformity/0");
						} else {
							$("#cjzk").html("");
						}
					});

					//9.户口所在地
					var hkszd=data.bip_hkszd;
					if(hkszd){
						$("#dwszs").load("../../getRegion/" + hkszd + "/province");
						$("#dwszq").load("../../getRegion/" + hkszd + "/city");
						$("#dwszj").load("../../getRegion/" + hkszd + "/village");
					}else{
						$("#dwszs").load("../../getProvince");
					}
					//下拉列表联动
					$("#dwszs").change(function() {
						var code = $(this).val();
						//加载二级地区（市，区，县）
						$("#dwszq").load("../../getRegion/" + code + "/city");
						//清空三级地区数据
						$("#dwszj").html("");
					});
					$("#dwszq").change(function() {
						var code = $(this).val();
						//加载三级地区（镇，乡，街）
						$("#dwszj").load("../../getRegion/" + code + "/village");
					});

					var whcd=data.bip_whcd;
					//10.文化程度
					$("#whcd1").load("../../education/"+(whcd?whcd:0));

					var zyjn=data.skill[0].bip_s_zyjn;
					//11.职业技能
					$("#init_zyjn").load("../../specialty/"+(zyjn?zyjn:0));
					//从事年限
					$("#init_csnx").val(data.skill[0].bip_s_years);
					var jsdj=data.skill[0].bip_s_jsdj;
					//12.技术等级
					$("#init_jsdj").load("../../qualification/"+(jsdj?jsdj:0));

					var wylx=data.language[0].bip_fl_jywy;
					//13.外语类型
					$("#init_jywy").load("../../language/"+(wylx?wylx:0));
					var wycd=data.language[0].bip_fl_slcd;
					//14.外语熟练程度
					$("#init_wyslcd").load("../../proficiency/"+(wycd?wycd:0));
					//外语说明
					$("#init_wysm").val(data.language[0].bip_fl_wysm);
					
					var jsjdj=data.bip_pc_dj;
					//15.计算机等级
					$("#jsjdj").load("../../computer/"+(jsjdj?jsjdj:0));
					
					var jsjslcd=data.bip_pc_slcd;
					//16.计算机熟练程度
					$("#jsjslcd").load("../../proficiency/"+(jsjslcd?jsjslcd:0));

					var dwxz=data.dwxx;
					//17.单位性质
					$("#dwxz").load("../../orgType/"+(dwxz?dwxz:0));

					var dwhy=data.dwhy;
					//18.单位行业
					$("#dwhy").load("../../industry/"+(dwhy?dwhy:0));

					var jjlx=data.dwjjlx;
					//19.经济类型
					$("#dwjjlx").load("../../regType/"+(jjlx?jjlx:0));

					var gzdq=data.gzdq;
					//20.工作地区
					$("#gzdq").load("../../getRegion/"+(gzdq?gzdq:00)+"/province");
					
					var gz=data.gz[0];
					//21.工种
					$("#qzgz1").load("../../work/"+(gz.GZ?gz.GZ:0));

					//22.用工形式
					$("#ygxs1").load("../../employType/"+(gz.YGXS?gz.YGXS:0));
					//最低工资
					$("#zdyx1").val(gz.ZDYX);
					//最高工资
					$("#zgyx1").val(gz.ZGYX);
					
				});	
			}else{
				$(this).next().html("身份证格式错误".fontcolor("red"));
				$(this).val("");
			}
		});
		
		$("#sfzhm").focus(function(){
			$(this).next().html("");
		});
		
		/* //添加按钮
		$("#gztj").click(function(){
			var t=$(this).parents(".qzgztable");
			
		}); */
		//清空职业技能列表 
		$("#zyjnqc").click(function() {
			if ($("#panel_1").html() == "") {
				alert("未找到清除对象 ");
				return;
			} else {
				if (confirm("确认清空列表吗 ")) {
					$("#panel_1").empty();
				}
				return;
			}

		});

		//外语-清空按钮 
		$("#wyqc").click(function() {
			if ($("#panel_2").html() == "") {
				alert("未找到清除对象 ");
				return;
			} else {
				if (confirm("确认清空列表吗 ")) {
					$("#panel_2").empty();
				}
				return;
			}
		});
		//清空列表 
		$("#gzqc").click(function() {
			if ($("#panel_3").html() == "") {
				alert("未找到清除对象 ");
				return;
			} else {
				if (confirm("确认清空列表吗 ")) {
					$("#panel_3").empty();
				}
				return;
			}

		})
		$("#baocun").click(function() {
			var sfzhmReg = /^([0-9]{17})([0-9]|X)$/;
			if ($("#sfzhm").val() == "") {
				alert("身份证号不得为空");
				$("#sfzhm").focus();
				return;
			} else {
				if (!sfzhmReg.test($("#sfzhm").val())) {
					alert("身份证号格式不对");
					$("#sfzhm").focus();
					return;
				}
			}
			if ($("#xb").val() == "") {
				alert("性别为必添项，请选择一个！");
				$("#xb").focus();
				return;
			}
			if ($("#xm").val() == "") {
				alert("姓名为必添项");
				$("#xm").focus();
				return;
			}
			if ($("#mz").val() == "") {
				alert("民族为必添项，请选择一个！");
				$("#mz").focus();
				return;
			}
			if ($("#hjxz").val() == "") {
				alert("户籍性质为必添项，请选择一个！");
				$("#hjxz").focus();
				return;
			}
			if ($("#rylb").val() == "") {
				alert("人员类别为必添项，请选择一个！");
				$("#rylb").focus();
				return;
			}
			if ($("#dwszs").val() == "" && $("#dwszq").val() == "") {
				alert("户口所在地为必添项，请选择！");
				$("#dwszs").focus();
				return;
			}
			if ($("#whcd1").val() == "") {
				alert("文化程度为必添项，请选择一个！");
				$("#whcd1").focus();
				return;
			}
			if ($("#lxdh").val() == "" || $("#sj").val() == "") {
				alert("固话手机必添项其一，请填写！");
				$("#lxdh").focus();
				return;
			}
			$("form").submit();
		});
	});
</script>
</head>
<body>
	<form id="form1" name="form1" action="" method="post">
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="20" valign="bottom"><img
					src="<%=request.getContextPath()%>/styles/images/right/now.gif"
					width="11" height="12"> 当前位置：职业介绍 &gt; 个人求职 &gt; 求职登记</td>
			</tr>
			<tr>
				<td valign="bottom"
					background="<%=request.getContextPath()%>/styles/images/right/dsline.gif"
					height="8"><img
					src="<%=request.getContextPath()%>/styles/images/index/spacer.gif"></td>
			</tr>
			<tr>
				<td height="20" valign="bottom">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td valign="middle"
											background="<%=request.getContextPath()%>/styles/images/right/tagm_on_bg.gif"
											class="white" style="padding-left: 10px; padding-top: 2px">登记信息</td>
										<td><img
											src="<%=request.getContextPath()%>/styles/images/right/tagr_on_x.gif"
											width="23" height="18"></td>
									</tr>
								</table></td>
							<td><table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td
											background="<%=request.getContextPath()%>/styles/images/right/tagm_off_bg.gif"
											style="padding-top: 2px">查看失业信息</td>
										<td><img
											src="<%=request.getContextPath()%>/styles/images/right/tagr_off_all.gif"
											width="23" height="18"></td>
									</tr>
								</table></td>
							<td><table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td
											background="<%=request.getContextPath()%>/styles/images/right/tagm_off_bg.gif"
											style="padding-top: 2px"><a href="#" class="link04">查看培训信息</a></td>
										<td><img
											src="<%=request.getContextPath()%>/styles/images/right/tagr_off_end.gif"
											width="23" height="18"></td>
									</tr>
								</table></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="98%" align="center" border="0" cellpadding="0"
			cellspacing="0" onClick="collapseCon('1');" class="titlehand">
			<tr>
				<td width="60">
					<table width="38" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="30"><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif"></td>
							<td width="8"><img
								src="<%=request.getContextPath()%>/styles/images/right/ico_up.gif"
								id="imgmini1"></td>
						</tr>
					</table>
				</td>
				<td valign="bottom">登记信息&nbsp;&nbsp;&nbsp;提示：[个人初始登记有效期为:15天,使用修改功能可以延长有效期:12次]</td>
			</tr>
		</table>
		<table width="98%" border="0" cellspacing="0" cellpadding="0"
			style="display: block" id="c1" align="center"
			style="word-break:break-all;width:fixed">
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="1" cellpadding="0">
						<tr class="line1">
							<td width="13%" align="right"><span class="redtxt">*</span>身份证号码</td>
							<td width="20%"><INPUT id="sfzhm" name="bipCitizenid"
								style="WIDTH: 100%" value="" /><span></span>
								<input type="text" hidden="true" id="bipId" name="bipId" value=""/>
								</td>
							<td width="13%" align="right"><span class="redtxt">*</span>性
								别</td>
							<td width="20%"><select name="bipSex" id="xb" size="1"
								style="WIDTH: 100%"></select></td>
							<td width="13%" align="right">年 龄</td>
							<td width="20%"><INPUT id="nl" name="bipAge"
								style="WIDTH: 100%" value=""></td>
						</tr>
						<tr class="line2">
							<td align="right"><span class="redtxt">*</span>姓 名</td>
							<td><INPUT id="xm" name="bipName" maxlength="32"
								style="WIDTH: 100%" value=""></td>
							<td align="right"><span class="redtxt">*</span>民 族</td>
							<td><select id="mz" name="bipMinzu" size="1"
								style="WIDTH: 100%"></select></td>
							<td align="right">政治面貌</td>
							<td><select id="zzmm" name="bipZzmm" size="1"
								style="WIDTH: 100%"></select></td>
						</tr>
						<tr class="line1">
							<td align="right">婚姻状况</td>
							<td><select id="hyzk" name="bipHyzk" size="1"
								style="WIDTH: 100%"></select></td>
							<td align="right"><span class="redtxt">*</span>户籍性质</td>
							<td><select id="hjxz" name="bipHjxz" size="1"
								style="WIDTH: 100%"></select></td>
							<td align="right"><span class="redtxt">*</span>人员类别</td>
							<td><select id="rylb" name="bipRylb" size="1"
								style="WIDTH: 100%"></select></td>
						</tr>
						<tr class="line2">
							<td align="right">健康状况</td>
							<td><select id="jkzk" name="bipJkzk" size="1"
								style="WIDTH: 100%"></select></td>
							<td align="right">
								<table border="0" cellpadding="0" cellspacing="0">
									<tr class="line2" id="id1">
										<td align="right">残疾状况</td>
									</tr>
								</table>
							</td>
							<td class="line2" colspan="3">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr id="id2">
										<td><select id="cjzk" name="bipCjqk" size="1"
											style="WIDTH: 100%"></select></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr class="line1">
							<td align="right">视 力</td>
							<td>左<INPUT id="leftEye" name="bipEyesightleft" maxlength="3"
								style="WIDTH: 34%" value=""> 右 <INPUT
								name="bipEyesightright" id="rightEye" maxlength="3" style="WIDTH: 34%"
								value="">
							</td>
							<td align="right">身 高</td>
							<td><INPUT name="bipLong" id="height" maxlength="3" style="WIDTH: 65%"
								value="${info.bip.height }">(厘米)</td>
							<td align="right">体 重</td>
							<td><INPUT name="bipWeight" id="weight" maxlength="3" style="WIDTH: 65%"
								value="${info.bip.weight }">(公斤)</td>
						</tr>

						<tr class="line2">
							<td align="right"><span class="redtxt">*</span>户口所在地</td>
							<td><select id="dwszs" name="" style="WIDTH: 100%"></select></td>
							<td align="right">市(区\县)</td>
							<td id="sqx"><select id="dwszq" name="dwszq"
								style="WIDTH: 100%"></select></td>
							<td align="right">街(镇\乡)</td>
							<td id="jzx"><select id="dwszj" name="bipHkszd"
								style="WIDTH: 100%"></select></td>
						</tr>

						<tr class="line2">
							<td align="right"><span class="redtxt">*</span>文化程度</td>
							<td><select id="whcd1" name="bipWhcd" style="width: 100%"></select></td>
							<td align="right">所学专业</td>
							<td><input name="bipSubject" id="major" maxlength="32"
								style="WIDTH: 100%" value=""></td>
							<td align="right">毕业时间</td>
							<td><input name="bipBysj" id="bysj"maxlength="32" style="WIDTH: 100%"
								value="" maxlength="8"></td>
						</tr>
						<tr class="line1">
							<td align="right">毕业学校</td>
							<td colspan="5"><input name="bipGraduateschool" id="school"
								maxlength="32" style="WIDTH: 100%" value=""></td>

						</tr>

						<tr class="line2">
							<td align="right"><span class="redtxt">*</span>固定电话</td>
							<td><INPUT name="bipConTelephone" id="tel"style="WIDTH: 100%"
								value="" maxlength="32"></td>
							<td width="12%" align="right"><span class="redtxt">*</span>手
								机</td>
							<td width="21%"><INPUT name="bipConMobile" id="mobile"maxlength="11"
								style="WIDTH: 100%" value=""></td>
							<td align="right">E-mail</td>
							<td width="21%"><INPUT name="bipConEmail" id="bipemail" maxlength="48"
								style="WIDTH: 100%" value=""></td>
						</tr>
						<tr class="line1">
							<td align="right">邮政编码</td>
							<td><INPUT name="bipConPostcode" id="postcode" maxlength="6"
								style="WIDTH: 100%" value=""></td>
							<td align="right">联系人</td>
							<td><INPUT name="bipConContact" id="contact"maxlength="32"
								style="WIDTH: 100%" value=""></td>
							<td align="right">联系人电话</td>
							<td><INPUT name="bipConContacttel" id="contacttel"maxlength="32"
								style="WIDTH: 100%" value=""></td>
						</tr>
						<tr class="line2">
							<td width="13%" align="right">居住地址</td>
							<td colspan="5"><INPUT name="bipResAddress" id="address" maxlength="32"
								style="WIDTH: 100%" value=""></td>
						</tr>
						<tr class="line1">
							<td align="right">第二学历</td>
							<td colspan="5"><textarea name="bipEducationallevel2"
									id="secondEdu"style="width: 100%"></textarea></td>
						</tr>
						<tr class="line2">
							<td width="13%" align="right">工作简历</td>
							<td class="line1" colspan="5"><textarea name="bipResume"
								id="resume"	style="width: 100%"></textarea></td>
						</tr>
						<tr class="line1">
							<td width="13%" align="right">其他说明</td>
							<td colspan="5"><textarea id="qtsm" name="bipQtsm"
								id="qtsm"	style="width: 100%"></textarea></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="titlehand" onClick="collapseCon('4');">
			<tr>
				<td width="60">
					<table width="37" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="30"><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif"
								height="19"></td>
							<td width="7"><img
								src="<%=request.getContextPath()%>/styles/images/right/ico_up.gif"
								id="imgmini4"></td>
						</tr>
					</table>
				</td>
				<td valign="bottom">其它信息</td>
			</tr>
		</table>

		<TABLE width="98%" border=0 align="center" cellPadding=0 cellSpacing=1
			class="tablebody" style="display: block" id="c4">
			<tr class="line2">
				<td width="12%" align="right"><input name="bipTLowersecurity"
					id="db"type="checkbox" class="radio" value="1"></td>
				<td colspan="18%">低保人员</td>
				<td width="12%" align="right"><input name="bipTDestitute"
					id="tk"type="checkbox" class="radio" value="1"></td>
				<td width="18%">特困人员</td>
				<td width="12%" align="right"><input type="checkbox"
					id="yj"name="bipTNewgraduate" class="radio" value="1"></td>
				<td width="26%">应届高校毕业生</td>
			</tr>
			<tr class="line1">
				<td width="12%" align="right"><input name="bipTVeteran"
					id="fy"type="checkbox" class="radio" value="1"></td>
				<td colspan="18%">复员退伍</td>
				<td width="12%" align="right"><input type="checkbox"
					id="wb"name="bipTOthercities" class="radio" value="1"></td>
				<td width="18%">外埠转入</td>
				<td width="12%" align="right"><input type="checkbox"
					id="rh"name="bipTRhfl" class="radio" value="1"></td>
				<td width="26%">是否人户分离</td>
			</tr>
			<tr class="line2">
				<td width="12%" align="right"><input name="bipTPeasant"
					id="nf"type="checkbox" class="radio" value="1"></td>
				<td colspan="18%">农转非</td>
				<td width="12%" align="right"><input type="checkbox"
					id="ll"name="bipTCriminal" class="radio" value="1"></td>
				<td width="18%">两劳释放</td>
				<td width="12%" align="right"><input type="checkbox"
					id="yh"class="radio" name="bipTCzjyyhz" value="1"></td>
				<td width="26%">是否持再就业优惠证</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="titlehand" onClick="collapseCon('5');">
			<tr>
				<td width="60">
					<table width="37" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="30"><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif"
								height="19"></td>
							<td width="7"><img
								src="<%=request.getContextPath()%>/styles/images/right/ico_up.gif"
								id="imgmini5"></td>
						</tr>
					</table>
				</td>
				<td valign="bottom">具有信息</td>
			</tr>
		</table>

		<table width="98%" border="0" cellspacing="0" align="center"
			cellpadding="0" style="display: block" id="jnTable">
			<tr align="center">
				<td valign="top">
					<table id="zyjnTable" width="100%" border="0" cellpadding="0"
						cellspacing="1">
						<tr class="line1">
							<td width="13%" align="right">职业技能
								<!-- 职业技能id -->
								<input type="text" hidden="true" id="bipSId" name="skills[0].bipSId" value=""/>
							</td>
							<td id="o2" width="19%"><select id="init_zyjn"
								name="skills[0].bipSZyjn" size="1" style="WIDTH: 100%"></select></td>
							<td width="11%" align="right">技术等级</td>
							<td width="18%"><select id="init_jsdj"
								name="skills[0].bipSJsdj" size="1" style="WIDTH: 100%"></select></td>
							<td width="11%" align="right">从事年限</td>
							<td width="15%"><INPUT id="init_csnx"
								name="skills[0].bipSYears" style="WIDTH: 100%" maxlength="2"></td>
							<td width="7%" align="center"><input id="zyjntj"
								name="zyjntj" type="button" value="添加" class="BUTTON2"></td>
							<td width="8%" align="center"><input id="zyjnqc"
								type="button" value="清空" class="BUTTON2"></td>
						</tr>
					</table>
					<div id="language_1">
						<!-- 外语 div+css+jQuery -->
						<table id="jywyTable" width="100%" align="center" border="0"
							cellpadding="0" cellspacing="1"
							style="word-break: break-all; width: fixed">

							<tr class="line2" align="center">
								<td width="13%" align="right">具有外语
								<!-- 外语id -->
								<input type="text" hidden="true" id="bipFlId" name="list[0].bipFlId" value=""/>
								</td>
								<td width="19%"><select class="init_jywy" id="init_jywy"
									name="list[0].bipFlJywy" size="1" style="WIDTH: 100%"></select></td>
								<td width="11%" align="right">熟练程度</td>
								<td width="18%"><select id="init_wyslcd" size="1"
									name="list[0].bipFlSlcd" style="WIDTH: 100%"></select></td>
								<td width="11%" align="right">外语说明</td>
								<td width="15%"><INPUT id="init_wysm"
									name="list[0].bipFlWysm" style="WIDTH: 100%"></td>
								<td width="7%" align="center"><input id="wytj" name="wytj"
									type="button" value="添加" class="BUTTON2"></td>
								<td width="8%" align="center"><input id="wyqc" name="wyqc"
									type="button" value="清空" class="BUTTON2"></td>
							</tr>
						</table>
						<div id="panel_2"></div>
						<table width="100%" border="0" cellpadding="0" align="center"
							cellspacing="1">
							<tr class="line1" align="center">
								<td width="13%" align="right">计算机等级</td>
								<td width="19%"><select id="jsjdj" name="bipPcDj" size="1"
									style="WIDTH: 100%"></select></td>
								<td width="11%" align="right">熟练程度</td>
								<td width="18%"><select id="jsjslcd" name="bipPcSlcd"
									size="1" style="WIDTH: 100%"></select></td>
								<td width="10%"></td>
								<td width="15%"></td>
								<td width="7%"></td>
								<td width="8%"></td>
							</tr>
						</table>
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="titlehand" onClick="collapseCon('6');">
			<tr>
				<td width="60">
					<table width="37" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="30"><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif"
								height="19"></td>
							<td width="7"><img
								src="<%=request.getContextPath()%>/styles/images/right/ico_up.gif"
								id="imgmini6"></td>
						</tr>
					</table>
				</td>
				<td valign="bottom">择业信息</td>
			</tr>
		</table>
		<table width="98%" border="0" cellspacing="0" align="center"
			cellpadding="0" id="c6" style="display: block">
			<tr align="center">
				<td>
					<TABLE width="100%" border=0 cellPadding=0 cellSpacing=1
						class="tablebody">
						<tr class="line1">
							<td width="13%" align="right">
							<input type="text" hidden="true" id="qzbh" name="qzbh" value=""/>
							单位性质</td>
							<td width="22%"><select id="dwxz" name="dwxx" size="1"
								style="WIDTH: 100%"></select></td>
							<td width="10%" align="right">单位行业</td>
							<td width="21%"><select id="dwhy" name="dwhy" size="1"
								style="WIDTH: 100%"></select></td>
							<td width="11%" align="right">经济类型</td>
							<td width="23%"><select id="dwjjlx" name="dwjjlx" size="1"
								style="WIDTH: 100%"></select></td>
						</tr>
						<tr class="line2">
							<td align="right">工作地区</td>
							<td><select id="gzdq" name="gzdq" size="1"
								style="WIDTH: 100%"></select></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="0" cellspacing="1">
						<tr class="line2">
							<td width="14%" align="right">是否接收短信</td>
							<td width="17%"><input name="sfjsdx" type="checkbox"
								id="jsdx"value="1" class="radio"></td>
							<td width="14%" align="right">是否参加培训</td>
							<td width="14%"><input name="sfcjpx" type="checkbox"
								id="cjpx"value="1" class="radio"></td>
							<td width="18%" align="right">是否接受职业指导</td>
							<td width="23%"><input name="sfjszyzd" type="checkbox"
								id="jszd"value="1" class="radio"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="titlehand" onClick="collapseCon('7');">
			<tr>
				<td width="60">
					<table width="37" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="30"><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif"
								height="19"></td>
							<td width="7"><img
								src="<%=request.getContextPath()%>/styles/images/right/ico_up.gif"
								id="imgmini7"></td>
						</tr>
					</table>
				</td>
				<td valign="bottom">择业工种</td>
			</tr>
		</table>
		<table width="98%" id="c7" border=0 cellPadding=0 cellSpacing=1
			align="center" class="tablebody" style="display: block">
			<tr align="center">
				<td>
					<table id="qzgzTable" class="qzgztable" width="100%" border=0 cellPadding=0
						cellSpacing=1 class="tablebody" style="display: block">
						<tr class="line1" align="center">
							<td width="40"><span class="redtxt">*</span>工种
							<!-- 求职工种编号 -->
							<input type="text" hidden="true" id="qzgzbh" name="gzList[0].qzgzbh" value=""/>
							</td>
							<td id="o1" width="110"><select class="qzgz1" id="qzgz1"
								name="gzList[0].gz" size="1" style="WIDTH: 100%"></select></td>
							<td width="50">用工形式</td>
							<td width="80"><select class="ygxs1" id="ygxs1"
								name="gzList[0].ygxs" size="1" style="WIDTH: 100%"></select></td>
							<td width="50" align="right">月薪</td>
							<td width="140">
								<div id="yx" style="display:">
									<table>
										<tr>
											<td><input id="zdyx1" name="gzList[0].zdyx" type="text"
												style="width: 40px" maxlength="6"> 至 <input
												id="zgyx1" name="gzList[0].zgyx" type="text"
												style="width: 40px" maxlength="6"> 元</td>
										</tr>
									</table>
								</div>
							</td>
							<!--  -->
							<td width="40"><input type="button" id="gztj" name="gztj"
								value="添加" class="BUTTON2"></td>
							<td width="40"><input type="button" id="gzqc" name="gzsc"
								value="清空" class="BUTTON2"></td>
						</tr>
					</table>

				</td>
			</tr>
		</table>
		<table width="98%" id="c8" border=0 cellPadding=0 cellSpacing=1
			align="center" class="tablebody" style="display: block">
			<tr align="center">
				<td>
					<div id="panel_3"></div>

				</td>
			</tr>
		</table>
		<TABLE width="98%" border=0 cellPadding="0" cellSpacing=1
			align="center" class="tablebody">
			<tr align="center">
				<td colspan="9">&nbsp;&nbsp;
			</tr>
			<tr align="center">
				<td colspan="9" class="line2"><input type="button" id="baocun"
					class="BUTTONs3" name="bc" value="保 存"> &nbsp;&nbsp; <INPUT
					name="cz" type="reset" class="BUTTONs3" id="cz" value="取 消"
					onClick="valueReset();"> <input name="hkszd" type="hidden">
			</tr>
		</TABLE>
	</form>
</body>
</html>