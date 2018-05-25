package com.oracle.labor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonAutoArchiveMapper {

	/**
	 * 查询所有未归档的信息，求职编号，登记时间，有效期
	 * @return
	 */
	public List<Map<String,Object>> getAll();
	
	/**
	 * 每次登记有效期-1
	 * @return
	 */
	public int updateTime();
	
	/**自动归档登记表
	 * @return
	 */
	public int autoArchiveDJB(@Param("endTime")String endTime,@Param("qzbh")String[] qzbh);
	/**
	 * 自动归档工种表
	 * @return
	 */
	public int autoArchiveGZB(@Param("endTime")String endTime,@Param("qzbh")String[] qzbh);
	
	/**
	 * 归档冻结解冻表
	 * @return
	 */
	public int autoArchiveDJJDB(@Param("endTime")String endTime,@Param("qzbh")String[] objects);
}
