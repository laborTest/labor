package com.oracle.labor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.oracle.labor.dao.BioMapper;
import com.oracle.labor.po.Bio;

/**
 * 单位基本信息表service层
 * @author 李帅
 *
 */


@Service
public class BioService {
	
	@Autowired
	BioMapper biodao;
	
	/**
	 * 新增记录
	 * @param record
	 */
	@Transactional
	public void save(Bio insert) {
		biodao.insertSelective(insert);
	}
	@Transactional
	public void update(Bio record) {
		biodao.updateByPrimaryKey(record);
	}
	
}
