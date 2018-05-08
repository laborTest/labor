package com.oracle.labor.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.labor.service.BipService;
import com.oracle.labor.service.FreezeService;

/**
 * 冻结解冻
 * @author dingshuangen
 *
 */
@Controller
@RequestMapping("/service")
public class FreezeHandler {
	
	@Autowired
	FreezeService service;
	@Autowired
	BipService bipService;

	@ResponseBody
	@RequestMapping(value="/checkCitizenId",produces="text/html;charset=UTF-8")
	public String checkCitizenId(String bip_citizenid) {
		
		if(bipService.getBipInfo(bip_citizenid)==null) {
			return "no";
		}else {
			return "ok";
		}
	}
	
	/**
	 * 根据姓名或者身份证查询基本信息
	 * @param bip_name
	 * @param bip_citizenid
	 * @param map
	 * @return
	 */
	@RequestMapping("/getBasicInfo")
	public String getFreezeInfo(String bip_name,String bip_citizenid,Map<String,Object> map) {
		if(bip_citizenid!=null&&bip_citizenid!="") {
			map.put("info",service.getBasicInfoByCitizenId(bip_citizenid));
		}else {
			map.put("info", service.getBasicInfoByName(bip_name));
		}
		return "service/zj/grqz/qzdjjd_2";
	}

	/**
	 * 详细信息查询（冻结解冻第三页面数据）
	 * @param bipId
	 * @param map
	 * @return
	 */
	@RequestMapping("/getDetailInfo")
	public String getDetailInfo(String bipId,Map<String,Object> map) {
		if(bipId!=null&&bipId!="") {
			map.put("bipInfo",service.getAllByBipId(bipId));
		}
		return "service/zj/grqz/qzdjjd_3";
	}
	
	/**
	 * 冻结操作
	 * @param jobId
	 * @param djreason
	 * @return
	 */
	@RequestMapping("/freeze/{jobId}")
	public String freeze(@PathVariable("jobId")String jobId,String djreason) {
		service.freeze(jobId, djreason);
		return "redirect:/service/zj/grqz/qzdjjd_1.jsp";
	}
	
	/**
	 * 解冻操作
	 * @param jobId
	 * @param djreason
	 * @return
	 */
	@RequestMapping("/thaw/{jobId}")
	public String thaw(@PathVariable("jobId") String jobId,String djreason) {
		service.thaw(jobId, djreason);
		return "redirect:/service/zj/grqz/qzdjjd_1.jsp";
	}
}
