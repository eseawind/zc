package com.zcnation.zc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.zcnation.zc.domain.ZcProjectInfo;


public interface ZcUserInfoNativeService {

	public int updateByUserCode(Integer userCode,String password,String userOldPassowrd);
	
	public int updateLoginTimeAndUserScoreByUserCode(Integer userScore,Integer userCode);

}