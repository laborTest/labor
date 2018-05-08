package com.oracle.labor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.labor.po.ZjGrqzdjb;
import com.oracle.labor.po.ZjGrqzdjbExample;
@Repository
public interface ZjGrqzdjbMapper {
	
	ZjGrqzdjb getRecordByBipId(@Param("bipId")String bipId);
	
    long countByExample(ZjGrqzdjbExample example);

    int deleteByExample(ZjGrqzdjbExample example);

    int deleteByPrimaryKey(String qzbh);

    int insert(ZjGrqzdjb record);

    int insertSelective(ZjGrqzdjb record);

    List<ZjGrqzdjb> selectByExample(ZjGrqzdjbExample example);

    ZjGrqzdjb selectByPrimaryKey(String qzbh);

    int updateByExampleSelective(@Param("record") ZjGrqzdjb record, @Param("example") ZjGrqzdjbExample example);

    int updateByExample(@Param("record") ZjGrqzdjb record, @Param("example") ZjGrqzdjbExample example);

    int updateByPrimaryKeySelective(ZjGrqzdjb record);

    int updateByPrimaryKey(ZjGrqzdjb record);
    
    /**
     * 个人归档信息查询
     * @param citizenId
     * @param bipName
     * @param startTime
     * @param endTime
     * @param status
     * @return
     */
    List<Map<String,Object>> personalArchivingInfo(@Param("citizenId")String citizenId,@Param("bipName")String bipName,@Param("startTime")String startTime,@Param("endTime")String endTime,@Param("status")String status);
    
    /**
     * 归档操作
     * @return
     */
    int personalArchiving(@Param("jobIds")String[] jobIds,@Param("time") String time);
}