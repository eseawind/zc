package com.zcnation.zc.service;

import java.util.List;

import com.zcnation.zc.domain.ZcProjectInfo;


public interface ZcProjectInfoNativeService {
	
	public  List<ZcProjectInfo> queryByUserCodeAndProShStatusAndProNameAndProShStatus(Integer userCode,String proName,String proShStatus);
	
	public List<ZcProjectInfo> queryByProShStatus();

	public List<ZcProjectInfo> queryByProShStatus(Integer currentPage);
}