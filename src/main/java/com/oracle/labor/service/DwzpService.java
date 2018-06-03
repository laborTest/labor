package com.oracle.labor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.po.ZjDwzpgzb;


/**
 * 单位招聘登记及工种表的总service层
 * @author 李帅
 *
 */
@Service
public class DwzpService {
	//注入单位招聘基本表，单位招聘工种表的service层
	@Autowired
	DwzpdjService zpdjservice;
	@Autowired
	DwzpgzService zpgzservice;
	//事物控制
	@Transactional
	public void save(ZjDwzpdjb dwzpdj,ZjDwzpgzb zpgz) {
		//自动生成招聘编号作为招聘登记表的主键，并为招聘工种表的外键
		String zpbh=GenerateID.getGenerateId();
		//添加为主键
		dwzpdj.setZpbh(zpbh);
		//添加为外键
		zpgz.setZpbh(zpbh);
		//分别向单位招聘表和招聘工种表中保存数据
		zpdjservice.saveDw(dwzpdj);
		zpgzservice.saveGz(zpgz);
		
		
	}

}
