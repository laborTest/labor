package com.oracle.labor.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.labor.po.Bip;
import com.oracle.labor.po.ZjGrqzdjb;
import com.oracle.labor.service.ApplyJobService;
import com.oracle.model.GzListModel;
import com.oracle.model.LanguageListModel;
import com.oracle.model.SkillListModel;

@Controller
@RequestMapping("/service")
public class ApplyJobHandler {

	@Autowired
	ApplyJobService service;
	
	/**
	 * 保存个人的所有表单信息
	 * 个人基本信息表
	 * 个人技能表
	 * 个人外语水平表
	 * 个人求职登记表
	 * 个人求职工种表
	 * 
	 * 
	 * @param bip
	 * @param skill
	 * @param language
	 * @return
	 */
	@RequestMapping("/saveInfo")
	public String saveBipInfo(Bip bip,SkillListModel skill,LanguageListModel language,GzListModel gz,ZjGrqzdjb record) {
		service.insertInfo(bip, language.getList(), skill.getSkills(), gz.getGzList(), record);
		return "/success";
	}
	
	/**
	 * 回显求职者全部信息
	 * @param idNumber
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getBipAllInfo/{idNumber}")
	public Map<String,Object> geAllInfo(@PathVariable("idNumber") String idNumber){
		
			return service.getInfo(idNumber);
		
	}
	@RequestMapping("/updateInfo")
	public String updateBipInfo(Bip bip,SkillListModel skill,LanguageListModel language,GzListModel gz,ZjGrqzdjb record) {
		service.updateInfo(bip, skill, language, gz, record);
		return "/success";
	}
}
