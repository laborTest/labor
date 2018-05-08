package com.oracle.labor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.dao.BipSkillMapper;
import com.oracle.labor.po.BipSkill;
/**
 * 个人技能表维护service层
 * @author dingshuangen
 *
 */
@Service
public class BipSkillService {
	
	@Autowired
	BipSkillMapper skillDao;
	
	/**
	 * 根据个人id查询技能信息
	 * @param bipId
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<BipSkill> getSkill(String bipId) {
		return skillDao.getSkillByBipId(bipId);
	}

	/**
	 * 新增信息
	 * @param skill
	 */
	@Transactional
	public void saveSkill(List<BipSkill> skill) {
		for(int i=0;i<skill.size();i++) {
			 skillDao.insertSelective(skill.get(i));
		}
	}
	
	/**
	 * 修改信息
	 * @param bipId
	 * @return
	 */
	@Transactional
	public void updateSkill(List<BipSkill> skill) {
		for(int i=0;i<skill.size();i++) {
			skillDao.updateByPrimaryKeySelective(skill.get(i));
		}
	}
}
