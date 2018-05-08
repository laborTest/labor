package com.oracle.labor.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.common.util.Tools;
import com.oracle.labor.dao.ZjGrqzdjbMapper;
import com.oracle.labor.po.ZjGrqzdjb;

/**
 * 个人求职记录表维护service层
 * @author dingshuangen
 *
 */
@Service
public class PersonnelRecordService {
	
	@Autowired
	ZjGrqzdjbMapper recordDao;
	
	/**
	 * 新增记录
	 * @param record
	 */
	@Transactional
	public void saveRecord(ZjGrqzdjb record) {
		recordDao.insertSelective(record);
	}
	@Transactional
	public void updateRecord(ZjGrqzdjb record) {
		recordDao.updateByPrimaryKeySelective(record);
	}
	/**
	 * 根据个人bipId查询求职登记记录
	 * @param bipId
	 * @return
	 */
	@Transactional(readOnly=true)
	public ZjGrqzdjb getRecord(String bipId) {
		return recordDao.getRecordByBipId(bipId);
	}
	
	/**
	 * 冻结个人求职记录表
	 * @param jobId
	 * @return
	 */
	@Transactional
	public int freeze(String jobId) {
		ZjGrqzdjb record=new ZjGrqzdjb();
		record.setQzbh(jobId);
		record.setSfdj("1");
		return recordDao.updateByPrimaryKeySelective(record);
	}

	/**
	 * 解冻个人求职记录表
	 * @param jobId
	 * @return
	 */
	@Transactional
	public int thaw(String jobId) {
		ZjGrqzdjb record=new ZjGrqzdjb();
		record.setQzbh(jobId);
		record.setSfdj("0");
		return recordDao.updateByPrimaryKeySelective(record);
	}
	
	/**
	 * 查询跟归档有关的信息
	 * @param citizenId
	 * @param bipName
	 * @param startTime
	 * @param endTime
	 * @param status
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<Map<String,Object>> getpersonalInfo(String citizenId,String bipName,String startTime,String endTime,String status){
		
		if(bipName!=null&&bipName!="") {
			bipName="%"+bipName+"%";
		}
		return recordDao.personalArchivingInfo(citizenId, bipName, startTime, endTime, status);
	}
	/**
	 * 归档
	 * @param jobIds
	 * @return
	 */
	@Transactional
	public int personalArchiving(String[] jobIds) {
		String time=Tools.getDate("yyyy-MM-dd");
		return recordDao.personalArchiving(jobIds, time);
	}
}
