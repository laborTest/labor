package com.oracle.model;

import java.util.List;

import com.oracle.labor.po.ZjGrqzgzb;

/**
 * 个人求职工种List模型
 * 用来从客户端接收多条工种信息
 * @author dingshuangen
 *
 */
public class GzListModel {
	
	private List<ZjGrqzgzb> gzList;

	public List<ZjGrqzgzb> getGzList() {
		return gzList;
	}

	public void setGzList(List<ZjGrqzgzb> gzList) {
		this.gzList = gzList;
	}

	public GzListModel(List<ZjGrqzgzb> gzList) {
		super();
		this.gzList = gzList;
	}

	public GzListModel() {
		super();
	}

}
