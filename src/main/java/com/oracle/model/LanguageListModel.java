package com.oracle.model;

import java.util.List;

import com.oracle.labor.po.BipForeignlanguage;

/**
 * 语言List模型
 * 用来接收多条语言数据
 * @author dingshuangen
 *
 */
public class LanguageListModel {
	
	private List<BipForeignlanguage> list;

	public List<BipForeignlanguage> getList() {
		return list;
	}

	public void setList(List<BipForeignlanguage> list) {
		this.list = list;
	}

	public LanguageListModel(List<BipForeignlanguage> list) {
		super();
		this.list = list;
	}

	public LanguageListModel() {
		super();
	}
	

}
