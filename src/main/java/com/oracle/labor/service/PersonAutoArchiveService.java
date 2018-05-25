package com.oracle.labor.service;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.common.util.Tools;
import com.oracle.labor.dao.PersonAutoArchiveMapper;

@Service
public class PersonAutoArchiveService {
	
	@Autowired
	PersonAutoArchiveMapper autoDao;
	
	/**
	 * 获取已过期需要自动归档的编号
	 * @return
	 */
	private Set<String> getArchiveQZBH() {
		List<Map<String,Object>> list=autoDao.getAll();
		System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println("开始查找过期数据：");
		HashSet<String> set=null;
		for (Map<String, Object> map : list) {
			Integer djyxq=Integer.valueOf((String)map.get("djyxq"));//登记有效期
			if(djyxq<0) {
				synchronized (this) {
					if(set==null) {
						set=new HashSet<String>();
					}
				}
				System.out.println("查询到数据："+map.get("qzbh")+"..................");
				set.add((String)map.get("qzbh"));
			}
		}
		System.out.println("=============查找结束：");
		if(set!=null) {
			System.out.println(Arrays.toString(set.toArray()));
		}else {
			System.out.println("未查询到过期数据");
		}
		return set;
	}
	
	
	/**
	 * 归档操作
	 * @param objects
	 */
	@Transactional
	public int AutoArchive() {
		
		System.out.println(":::::::---------自动执行更新有效期-----------::::");
		String[] qzbh=null;
		autoDao.updateTime();
		Set<String> set=this.getArchiveQZBH();
		if(set!=null) {
			qzbh=new String[set.size()];
			set.toArray(qzbh);
		}
		
		if(qzbh!=null) {
			System.out.println(":::::-------------开始自动归档个人登记表---------::::::");
			autoDao.autoArchiveDJB(Tools.getDate("yyyy-MM-dd"),qzbh);
			System.out.println(":::::-------------开始自动归档个人冻结解冻表表---------::::::");
			autoDao.autoArchiveDJJDB(Tools.getDate("yyyy-MM-dd"), qzbh);
			System.out.println(":::::-------------开始自动归档个人求职工种表---------::::::");
			autoDao.autoArchiveGZB(Tools.getDate("yyyy-MM-dd"), qzbh);
			return qzbh.length;
		}
		return 0;
	}

}
