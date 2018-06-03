package com.oracle.labor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.oracle.labor.dao.ZjDwzpdjbMapper;
import com.oracle.labor.po.ZjDwzpdjb;


/**
 * 单位招聘登记表service层
 * @author 李帅
 *
 */


@Service
public class DwzpdjService {

//注入单位招聘登记表的dao
	@Autowired
	ZjDwzpdjbMapper dwzpdjdao;
	
//事物控制
	@Transactional
	public void saveDw(ZjDwzpdjb dwzpdj){
		
        dwzpdjdao.insertSelective(dwzpdj);
        
	}
}
