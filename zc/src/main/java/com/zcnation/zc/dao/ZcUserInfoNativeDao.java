package com.zcnation.zc.dao;

import java.util.List;

import com.zcnation.zc.domain.ZcProjectInfo;


public interface ZcUserInfoNativeDao {
	
	public int updateByUserCode(Integer userCode,String password);
	public int updateLoginTimeAndUserScoreByUserCode(Integer userScore, Integer userCode);
	


}