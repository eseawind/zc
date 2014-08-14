package com.zcnation.zc.dao;

import java.util.List;

import com.zcnation.zc.domain.ZcProjectInfo;


public interface ZcProjectInfoNativeDao {
	
	public List<ZcProjectInfo> findByUserCodeAndProShStatusAndProNameAndProShStatus(Integer userCode,String proName,String proShStatus);
	


}