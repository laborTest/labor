package com.oracle.labor.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.dao.BipMapper;
import com.oracle.labor.po.Bip;

/**
 * 个人信息表对应service
 * @author dingshuangen
 *
 */
@Service
public class BipService {
	
	@Autowired
	BipMapper bipDao;
	
	/**
	 * 插入
	 * @param bip
	 */
	@Transactional
	public void insertBip(Bip bip) {
		bipDao.insertSelective(bip);
	}
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	@Transactional(readOnly=true)
	public Bip getBip(String id) {
		return bipDao.getBipByCardId(id);
	}

	/**
	 * 根据主键更新个人信息
	 * @param bip
	 */
	@Transactional
	public void updateBip(Bip bip) {
		bipDao.updateByPrimaryKeySelective(bip);
	}
	
	/**
	 * 查询身份证对应的个人信息
	 * @return
	 */
	@Transactional(readOnly=true)
	public Map<String,Object> getBipInfo(String idNumber){
		return bipDao.getBipInfo(idNumber);
	}
}
