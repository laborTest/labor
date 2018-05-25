package com.oracle.labor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.dao.BipForeignlanguageMapper;
import com.oracle.labor.po.BipForeignlanguage;

@Service
public class BipLanguageService {

	@Autowired
	BipForeignlanguageMapper langDao;
	
	/**
	 * 根据用户id查询用户的外语信息
	 * @param bipId
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<BipForeignlanguage> getLanguage(String bipId) {
		return langDao.getLanguageByBipId(bipId);
	}
	
	/**
	 * 更新外语信息
	 * @param bfl
	 */
	@Transactional
	public void updateLanguage(List<BipForeignlanguage> list,String bipId) {
		
		//删除已存在数据
		langDao.deleteAllByBipId(bipId);
		//重新插入
		for (BipForeignlanguage f : list) {
			f.setBipFlId(GenerateID.getGenerateId());
			f.setBipId(bipId);
			langDao.insertSelective(f);
		}
	}
	
	/**
	 * 添加新的外语信息
	 * @param language
	 */
	@Transactional
	public void saveLanguage(List<BipForeignlanguage> language) {
		
		for(int i=0;i<language.size();i++) {
			langDao.insertSelective(language.get(i));
		}
	}
}
