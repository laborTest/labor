package com.oracle.labor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.labor.po.Bip;
import com.oracle.labor.po.BipExample;
@Repository
public interface BipMapper {
	
	//查询个人基本信息
	Map<String,Object> getBipInfo(@Param("citizenId")String idNumber);
	
    long countByExample(BipExample example);

    int deleteByExample(BipExample example);

    int deleteByPrimaryKey(String bipId);

    int insert(Bip record);

    int insertSelective(Bip record);

    List<Bip> selectByExample(BipExample example);

    Bip selectByPrimaryKey(String bipId);

    int updateByExampleSelective(@Param("record") Bip record, @Param("example") BipExample example);

    int updateByExample(@Param("record") Bip record, @Param("example") BipExample example);

    int updateByPrimaryKeySelective(Bip record);

    int updateByPrimaryKey(Bip record);
    
    public Bip getBipByCardId(@Param("cardId") String cardId);
}