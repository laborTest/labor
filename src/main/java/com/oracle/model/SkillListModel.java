package com.oracle.model;

import java.util.List;

import com.oracle.labor.po.BipSkill;

public class SkillListModel {
	
	private List<BipSkill> skills;

	public List<BipSkill> getSkills() {
		return skills;
	}

	public void setSkills(List<BipSkill> skills) {
		this.skills = skills;
	}

	public SkillListModel(List<BipSkill> skills) {
		super();
		this.skills = skills;
	}

	public SkillListModel() {
		super();
	}
	

}
