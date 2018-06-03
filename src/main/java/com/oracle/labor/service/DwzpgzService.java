package com.oracle.labor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.dao.ZjDwzpgzbMapper;
import com.oracle.labor.po.ZjDwzpgzb;

/**
 * 单位招聘工种表service层
 * @author 李帅
 *
 */
@Service
public class DwzpgzService {

	@Autowired
	ZjDwzpgzbMapper zpgzdao;
	
	@Transactional
	public void saveGz(ZjDwzpgzb zpgz){
		
		//自动生成招聘工种编号做为主键
		String zpgzbh=GenerateID.getGenerateId();
		
		zpgz.setZpgzbh(zpgzbh);
		
		zpgz.setZrs(zpgz.getZprsn()+zpgz.getZprsnv());
		zpgzdao.insertSelective(zpgz);
	}
}
