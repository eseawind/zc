package com.zcnation.zc.service.impl;

import java.io.Serializable;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.dao.ZcProjectInfoNativeDao;
import com.zcnation.zc.dao.ZcUserInfoNativeDao;
import com.zcnation.zc.service.ZcUserInfoNativeService;

@Service(value = "zcUserInfoNativeService")
public class ZcUserInfoNativeServiceImpl implements ZcUserInfoNativeService,Serializable {

	@Autowired private ZcUserInfoNativeDao zcUserInfoNativeDao;
	@Override
	@Transactional
	
	public int updateByUserCode(Integer userCode, String password) {
		// TODO Auto-generated method stub
		return zcUserInfoNativeDao.updateByUserCode(userCode, password);
	}

}
