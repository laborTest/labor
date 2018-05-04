package com.oracle.labor.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.labor.common.codetable.ComputergradeOperation;
import com.oracle.labor.common.codetable.Deformity;
import com.oracle.labor.common.codetable.EducationallevelOperation;
import com.oracle.labor.common.codetable.EmploytypeOperation;
import com.oracle.labor.common.codetable.HealthstateOperation;
import com.oracle.labor.common.codetable.IndustryOperation;
import com.oracle.labor.common.codetable.LanguageOperation;
import com.oracle.labor.common.codetable.MarriageOperation;
import com.oracle.labor.common.codetable.NationOperation;
import com.oracle.labor.common.codetable.OrgtypeOperation;
import com.oracle.labor.common.codetable.PersonneltypeOperation;
import com.oracle.labor.common.codetable.PoliticsaspectOperation;
import com.oracle.labor.common.codetable.ProficiencyOperation;
import com.oracle.labor.common.codetable.QualificationOperation;
import com.oracle.labor.common.codetable.RegioncodeOperation;
import com.oracle.labor.common.codetable.RegtypeOperation;
import com.oracle.labor.common.codetable.RprtypeOperation;
import com.oracle.labor.common.codetable.SexOperation;
import com.oracle.labor.common.codetable.SpecialtyOperation;
import com.oracle.labor.common.codetable.ZjdgwlbOperation;

@Controller
public class CommonHandler {

	/**
	 * 生成语言选项下拉框
	 * @param val
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/language/{code}",produces="text/html;charset=UTF-8")
	public String getLanguage(@PathVariable("code")String code) {
		String result=LanguageOperation.getOption(code);
		return result;
	}
	
	/**
	 * 生成性别下拉选项
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/sex/{code}",produces="text/html;charset=UTF-8")
	public String getSex(@PathVariable("code")String code) {
		String result=SexOperation.getOption(code);
		return result;
	}
	
	/**
	 * 生成计算机等级下拉选项
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/computer/{code}",produces="text/html;charset=UTF-8")
	public String getComputerGrade(@PathVariable("code")String code) {
		String result=ComputergradeOperation.getOption(code);
		return result;
	}
	
	/**
	 * 获取残疾等级下拉选项
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/deformity/{code}",produces="text/html;charset=UTF-8")
	public String getDeformity(@PathVariable("code")String code) {
		String result=Deformity.getOption(code);
		System.out.println(result);
		return result;
	}
	
	/**
	 * 获取学历水平下拉选项
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/education/{code}",produces="text/html;charset=UTF-8")
	public String getEducationLevel(@PathVariable("code")String code) {
		String result=EducationallevelOperation.getOption(code);
		return result;
	}
	
	/**
	 * 获取雇佣类型下拉列表
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/employType/{code}",produces="text/html;charset=UTF-8")
	public String getemployType(@PathVariable("code")String code) {
		String result=EmploytypeOperation.getOption(code);
		return result;
	}
	
	/**
	 * 获取健康状况下来列表
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/healthState/{code}",produces="text/html;charset=UTF-8")
	public String getHealthstate(@PathVariable("code")String code) {
		String result=HealthstateOperation.getOption(code);
		return result;
	}
	
	/**
	 * 企业类型下拉数据
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/industry/{code}",produces="text/html;charset=UTF-8")
	public String getIndustry(@PathVariable("code")String code) {
		String result=IndustryOperation.getOption(code);
		return result;
	}
	
	/**
	 * 婚姻情况下拉数据
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/marriage/{code}",produces="text/html;charset=UTF-8")
	public String getMarriage(@PathVariable("code")String code) {
		String result=MarriageOperation.getOption(code);
		return result;
	}
	
	/**
	 * 民族下拉数据
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/nation/{code}",produces="text/html;charset=UTF-8")
	public String getNation(@PathVariable("code")String code) {
		String result=NationOperation.getOption(code);
		return result;
	}
	
	/**
	 * 组织类型,单位性质
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/orgType/{code}",produces="text/html;charset=UTF-8")
	public String getOrgType(@PathVariable("code")String code) {
		String result=OrgtypeOperation.getOption(code);
		return result;
	}
	
	/**
	 * 人员类型
	 * 无业，失业等
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/personnelType/{code}",produces="text/html;charset=UTF-8")
	public String getPersonnelType(@PathVariable("code")String code) {
		String result=PersonneltypeOperation.getOption(code);
		return result;
	}
	/**
	 * 政治面貌
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/politicsAspect/{code}",produces="text/html;charset=UTF-8")
	public String getPoliticsAspect(@PathVariable("code")String code) {
		String result=PoliticsaspectOperation.getOption(code);
		return result;
	}
	
	/**
	 * 技能掌握程度（熟练，精通，掌握，了解。。。）
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/proficiency/{code}",produces="text/html;charset=UTF-8")
	public String getProficiency(@PathVariable("code")String code) {
		String result=ProficiencyOperation.getOption(code);
		return result;
	}
	
	/**
	 * 资格证书（高级技师，技师。。。。）
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/qualification/{code}",produces="text/html;charset=UTF-8")
	public String getQualification(@PathVariable("code")String code) {
		String result=QualificationOperation.getOption(code);
		return result;
	}
	
	/**
	 * 省级
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/getProvince",produces="text/html;charset=UTF-8")
	public String getProvince() {
		String result=RegioncodeOperation.getProvince();
		return result;
	}
	
	/**
	 * 根据参数获得下级地区
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/getRegion/{code}/{name}",produces="text/html;charset=UTF-8")
	public String getRegion(@PathVariable("code")String code,@PathVariable("name")String name) {
		String result=RegioncodeOperation.getSelectedRegion(code, name);
		return result;
	}
	
	/**
	 * 企业经济类型（国有，私有。。。。）
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/regType/{code}",produces="text/html;charset=UTF-8")
	public String getRegType(@PathVariable("code")String code) {
		String result=RegtypeOperation.getOption(code);
		return result;
	}
	
	/**
	 * 户口类型
	 */
	@ResponseBody
	@RequestMapping(value="/service/rprType/{code}",produces="text/html;charset=UTF-8")
	public String getRprType(@PathVariable("code")String code) {
		String result=RprtypeOperation.getOption(code);
		return result;
	}
	
	/**
	 * 人员类别，职位，证件等
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/specialty/{code}",produces="text/html;charset=UTF-8")
	public String getSpecialty(@PathVariable("code")String code) {
		String result=SpecialtyOperation.getOption(code);
		return result;
	}
	
	/**
	 * 一级工种行业
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/work",produces="text/html;charset=UTF-8")
	public String getWorkType() {
		String result=SpecialtyOperation.getHy();
		return result;
	}
	
	/**
	 * 岗位类别
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/service/station/{code}",produces="text/html;charset=UTF-8")
	public String getStation(@PathVariable("code")String code) {
		String result=ZjdgwlbOperation.getOption(code);
		return result;
	}
	
}
