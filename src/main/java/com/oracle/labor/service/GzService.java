package com.oracle.labor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.dao.ZjGrqzgzbMapper;
import com.oracle.labor.po.ZjGrqzgzb;
import com.oracle.labor.po.ZjGrqzgzbExample;
/**
 * 个人求职工种表维护service
 * @author dingshuangen
 *
 */
@Service
public class GzService {
	
	@Autowired
	ZjGrqzgzbMapper gzDao;
	
	/**
	 * 保存个人求职工种信息
	 * @param gz
	 */
	@Transactional
	public void save(List<ZjGrqzgzb> gz) {
		
		for(int i=0;i<gz.size();i++) {
			gzDao.insertSelective(gz.get(i));
		}
		
	}
	
	/**
	 * 更新个人求职工种表信息
	 * @param gz
	 */
	@Transactional
	public void update(List<ZjGrqzgzb> gz,String qzbh) {
		
		//删除已存在信息
		ZjGrqzgzbExample e= new ZjGrqzgzbExample();
		e.createCriteria().andQzbhEqualTo(qzbh).andGdsjIsNull();
		gzDao.deleteByExample(e);
		for (ZjGrqzgzb z : gz) {
			z.setQzbh(qzbh);
			z.setQzgzbh(GenerateID.getGenerateId());
			gzDao.insertSelective(z);
		}
	}
	
	/**
	 * 根据跟人身份证信息查询求职工种
	 * @param bipId
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<ZjGrqzgzb> getGz(String cardId){
		return gzDao.getGzByCardId(cardId);
	}

}
