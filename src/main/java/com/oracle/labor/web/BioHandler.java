package com.oracle.labor.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.po.Bio;
import com.oracle.labor.service.BioService;


/**
 * 单位基本信息请求处理控制层
 * @author 李帅
 *
 */
@Controller
@RequestMapping("/service")
public class BioHandler {
//注入bio表的service
	@Autowired
	BioService service;
	
	@RequestMapping("/dwdjInfo")
	public String saveBio(Bio bio,Map<String,Object> map) {
		//自动生成单位编号作为主键
		String bioId=GenerateID.getGenerateId();
		//添加主键
		bio.setBioId(bioId);
		//主键信息传递到下个页面，作为其他表的外键
		map.put("bioId", bioId);
	    service.save(bio);
		return "/service/zj/dwzp/dwdj_3";
	}
	
}