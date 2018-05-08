package com.oracle.labor.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.labor.po.BipForeignlanguage;
import com.oracle.labor.po.BipForeignlanguageExample;

@Repository
public interface BipForeignlanguageMapper {
    long countByExample(BipForeignlanguageExample example);

    int deleteByExample(BipForeignlanguageExample example);

    int deleteByPrimaryKey(String bipFlId);

    int insert(BipForeignlanguage record);

    int insertSelective(BipForeignlanguage record);

    List<BipForeignlanguage> selectByExample(BipForeignlanguageExample example);

    BipForeignlanguage selectByPrimaryKey(String bipFlId);

    int updateByExampleSelective(@Param("record") BipForeignlanguage record, @Param("example") BipForeignlanguageExample example);

    int updateByExample(@Param("record") BipForeignlanguage record, @Param("example") BipForeignlanguageExample example);

    int updateByPrimaryKeySelective(BipForeignlanguage record);

    int updateByPrimaryKey(BipForeignlanguage record);
    
    public List<BipForeignlanguage> getLanguageByBipId(@Param("bipId")String bipId);
    
    public void deleteAllByBipId(@Param("bipId")String bipId);
}