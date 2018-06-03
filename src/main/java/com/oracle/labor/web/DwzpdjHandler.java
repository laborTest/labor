package com.oracle.labor.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.po.ZjDwzpgzb;
import com.oracle.labor.service.DwzpService;

/**
 * 单位招聘登记控制层
 * @author 李帅
 * 
 */

@Controller
@RequestMapping("/service")
public class DwzpdjHandler {

	//注入单位招聘的service层
	@Autowired
	DwzpService Dwzpservice;
	
	@RequestMapping("/zpgzInfo")
	public String saveDwzp(ZjDwzpdjb dwzpdj,ZjDwzpgzb zpgz){
		
		Dwzpservice.save(dwzpdj, zpgz);
	    
		return "/service/zj/dwzp/dwdj_3";
	}
}
