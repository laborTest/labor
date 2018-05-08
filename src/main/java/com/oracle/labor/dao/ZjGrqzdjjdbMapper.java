package com.oracle.labor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.oracle.labor.po.ZjGrqzdjjdb;
import com.oracle.labor.po.ZjGrqzdjjdbExample;

public interface ZjGrqzdjjdbMapper {
    long countByExample(ZjGrqzdjjdbExample example);

    int deleteByExample(ZjGrqzdjjdbExample example);

    int deleteByPrimaryKey(String grdjjdbh);

    int insert(ZjGrqzdjjdb record);

    /**
     * 冻结,插入一条新的冻结记录
     */
    int insertSelective(ZjGrqzdjjdb record);

    List<ZjGrqzdjjdb> selectByExample(ZjGrqzdjjdbExample example);

    ZjGrqzdjjdb selectByPrimaryKey(String grdjjdbh);

    int updateByExampleSelective(@Param("record") ZjGrqzdjjdb record, @Param("example") ZjGrqzdjjdbExample example);

    int updateByExample(@Param("record") ZjGrqzdjjdb record, @Param("example") ZjGrqzdjjdbExample example);

    int updateByPrimaryKeySelective(ZjGrqzdjjdb record);

    int updateByPrimaryKey(ZjGrqzdjjdb record);
    /**
     * 解冻，此操作意味着一条冻结解冻记录的完成，需要进行归档操作
     */
    public void thaw(@Param("record")ZjGrqzdjjdb record);
    
    /**
     * 查询未归档的冻结解冻详细信息
     * @param bipId
     * @return
     */
    public Map<String,Object> getFreezeInfo(@Param("bipId")String bipId);
    
    /**
     * 根据用户名查询基本信息
     * @param name
     * @return
     */
    public List<Map<String,Object>> getBasicInfoByName(@Param("name") String name);
    
    /**
     * 根据身份证号码查询基本信息
     * @param citizenId
     * @return
     */
    public List<Map<String,Object>> getBasicInfoByCitizenId(@Param("citizenId") String citizenId);
}