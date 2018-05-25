package com.oracle.labor.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.common.util.Tools;
import com.oracle.labor.po.Bip;
import com.oracle.labor.po.BipForeignlanguage;
import com.oracle.labor.po.BipSkill;
import com.oracle.labor.po.ZjGrqzdjb;
import com.oracle.labor.po.ZjGrqzgzb;
import com.oracle.model.GzListModel;
import com.oracle.model.LanguageListModel;
import com.oracle.model.SkillListModel;

/**
 * 个人求职service层
 * @author dingshuangen
 *
 */
@Service
public class ApplyJobService {
	
	@Autowired
	BipSkillService skillService;//个人技能
	@Autowired
	BipLanguageService langService;//语言
	@Autowired
	BipService bipService;//基本信息
	@Autowired
	GzService gzService;//工种
	@Autowired
	PersonnelRecordService recordService;//登记
	/**
	 * 保存信息
	 * @param bip
	 * @param language
	 * @param skill
	 * @param record 
	 * @param list 
	 */
	@Transactional
	public void insertInfo(Bip bip,List<BipForeignlanguage> language,List<BipSkill> skill, List<ZjGrqzgzb> list, ZjGrqzdjb record) {
		
		//根据个人省份证号获得生日
		String date=bip.getBipCitizenid().substring(6, 14);
		String birth=date.substring(0,4)+"-"+date.substring(4,6)+"-"+date.substring(6,8);
		bip.setBipBirthday(birth);
		//生成个人基本信息随机bipId
		String bipId=GenerateID.getGenerateId();
		bip.setBipId(bipId);
		
		//将bipId赋值到需要的对象中
		record.setBipId(bipId);
		
		for(int i=0;i<language.size();i++) {
			//为每一个个人外语表每条记录生成id
			language.get(i).setBipFlId(GenerateID.getGenerateId());
			//添加外键bipId
			language.get(i).setBipId(bipId);
		}
		
		for(int i=0;i<skill.size();i++) {
			//为个人技能表每条技能生成随机id
			skill.get(i).setBipSId(GenerateID.getGenerateId());
			//添加外键id
			skill.get(i).setBipId(bipId);
		}
		
		//生成登记表主键（求职编号）
		String qzbh=GenerateID.getGenerateId();
		record.setQzbh(qzbh);
		//生成当前时间作为登记时间
		record.setDjsj(Tools.getDate("yyyy-MM-dd"));
		//为求职工种表生成主键
		for(int i=0;i<list.size();i++) {
			list.get(i).setQzgzbh(GenerateID.getGenerateId());
			//设置外键
			list.get(i).setQzbh(qzbh);
		}
		//保存
		bipService.insertBip(bip);//个人基本信息
		skillService.saveSkill(skill);//个人技能
		langService.saveLanguage(language);//个人外语
		recordService.saveRecord(record);//登记表
		gzService.save(list);//工种信息
	}
	
	/**
	 * 修改信息
	 * @param bip
	 * @param language
	 * @param skill
	 */
	@Transactional
	public void updateInfo(Bip bip,SkillListModel skill,LanguageListModel language,GzListModel gz,ZjGrqzdjb record) {
		
		bipService.updateBip(bip);//更新个人信息
		skillService.updateSkill(skill.getSkills(),bip.getBipId());//更新技能信息
		langService.updateLanguage(language.getList(),bip.getBipId());//更新外语信息
		gzService.update(gz.getGzList(),record.getQzbh());//更新工种信息
		recordService.updateRecord(record);//更新登记表信息
	}
	
	/**
	 * 根据个人身份证号查询个人信息登记表的所有数据信息
	 * @param idNumber
	 * @return
	 */
	@Transactional(readOnly=true)
	public Map<String,Object> getInfo(String idNumber){
		return bipService.getBipInfo(idNumber);
	}
}
