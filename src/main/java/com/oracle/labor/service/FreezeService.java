package com.oracle.labor.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.common.util.Tools;
import com.oracle.labor.dao.ZjGrqzdjjdbMapper;
import com.oracle.labor.po.ZjGrqzdjjdb;
import com.oracle.labor.po.ZjGrqzdjjdbExample;
/**
 * 冻结解冻操作service
 * @author dingshuangen
 *
 */
@Service
public class FreezeService {
	
	@Autowired
	ZjGrqzdjjdbMapper dao;
	
	@Autowired
	PersonnelRecordService recordService;
	
	/**
	 * 冻结
	 * @param jobId
	 * @param djreason
	 */
	@Transactional
	public void freeze(String jobId,String djreason) {
		ZjGrqzdjjdb record=new ZjGrqzdjjdb();
		record.setGrdjjdbh(GenerateID.getGenerateId());
		record.setDojyy(djreason);
		record.setQzbh(jobId);
		record.setDojsj(Tools.getDate("yyyy-MM-dd hh:mm:ss"));
		dao.insertSelective(record);//插入冻结信息记录
		recordService.freeze(jobId);//修改个人登记表状态为已冻结
	}
	
	/**
	 * 解冻求职信息
	 */
	@Transactional
	public void thaw(String jobId,String djreason) {
		ZjGrqzdjjdb record=new ZjGrqzdjjdb();
		record.setJidyy(djreason);
		record.setQzbh(jobId);
		record.setJidsj(Tools.getDate("yyyy-MM-dd hh:mm:ss"));//解冻时间
		record.setGdsj(Tools.getDate("yyyy-MM-dd hh:mm:ss"));//归档操作
		dao.thaw(record);
		recordService.thaw(jobId);//修改求职状态
	}
	
	/**
	 * 查询未归档的信息
	 * @param jobNumber
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<ZjGrqzdjjdb> getAll(String jobNumber){
		ZjGrqzdjjdbExample e=new ZjGrqzdjjdbExample();
		e.createCriteria().andQzbhEqualTo(jobNumber).andGdsjIsNull();
		return dao.selectByExample(e);
	}
	/**
	 * 新增一条记录
	 * @param record
	 */
	@Transactional
	public void insert(ZjGrqzdjjdb record) {
		dao.insert(record);
	}
	
	/**
	 * 查询未归档详细信息Map形式
	 * @param BipId
	 * @return
	 */
	@Transactional(readOnly=true)
	public Map<String,Object> getAllByBipId(String bipId){
		return dao.getFreezeInfo(bipId);
	}
	
	/**
	 * 根据用户名查询基本信息
	 * @param name
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<Map<String,Object>> getBasicInfoByName(String name){
		return dao.getBasicInfoByName("%"+name+"%");
	}
	
	/**
	 * 根据身份证查询基本信息
	 * @param citizenId
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<Map<String,Object>> getBasicInfoByCitizenId(String citizenId){
		return dao.getBasicInfoByCitizenId(citizenId);
	}
}
