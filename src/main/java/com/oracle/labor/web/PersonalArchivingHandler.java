package com.oracle.labor.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.labor.service.PersonnelRecordService;

/**
 * 个人归档service
 * @author dingshuangen
 *
 */
@Controller
@RequestMapping("/service")
public class PersonalArchivingHandler {
	
	@Autowired
	PersonnelRecordService service;
	
	/**
	 * 查询信息
	 * @param citizenId
	 * @param bipName
	 * @param startTime
	 * @param endTime
	 * @param status
	 * @param map
	 * @return
	 */
	@RequestMapping("/select")
	public String selectPersonalInfo(String citizenId,String bipName,String startTime,String endTime,String status,Map<String,Object> map) {
		map.put("infoList", service.getpersonalInfo(citizenId, bipName, startTime, endTime, status));
		return "service/zj/grqz/qzgd_2";
		
	}
	
	/**
	 * 归档
	 * @param jobId
	 * @return
	 */
	@RequestMapping(value="/archive")
	public Object personalArchiving(String[] jobId) {
		service.personalArchiving(jobId);
		return "redirect:/service/zj/grqz/qzgd_1.jsp";
	}

}
