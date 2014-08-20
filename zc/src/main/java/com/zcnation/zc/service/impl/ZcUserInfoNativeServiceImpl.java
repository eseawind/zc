package com.zcnation.zc.service.impl;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.dao.ZcUserInfoNativeDao;
import com.zcnation.zc.service.ZcUserInfoNativeService;

@Service(value = "zcUserInfoNativeService")
public class ZcUserInfoNativeServiceImpl implements ZcUserInfoNativeService,Serializable {

	@Autowired private ZcUserInfoNativeDao zcUserInfoNativeDao;
	@org.springframework.transaction.annotation.Transactional(readOnly = false)
	
	
	@Override
	public int updateByUserCode(Integer userCode, String password) {
		// TODO Auto-generated method stub
		return zcUserInfoNativeDao.updateByUserCode(userCode, password);
	}
	@Override
	public int updateLoginTimeAndUserScoreByUserCode(Integer userScore,Integer userCode) {
		// TODO Auto-generated method stub
		return zcUserInfoNativeDao.updateLoginTimeAndUserScoreByUserCode(userScore,userCode);
	}

}
