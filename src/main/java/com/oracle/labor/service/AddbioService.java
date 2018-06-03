package com.oracle.labor.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.po.Bio;

@Service
public class AddbioService {

	@Autowired
	BioService bioService;
	@Autowired
	AddbioService addbioService;
	
	@Transactional
	public void insertInfo(Bio bio,Bio record){
		String bioId=GenerateID.getGenerateId();
		bio.setBioId(bioId);
		
		
		record.setBioId(bioId);
		
		bioService.save(bio);
	}
	
	@Transactional(readOnly=true)
	public Map<String,Object> getInfo(String idNumber){
		return null;
	}

}
