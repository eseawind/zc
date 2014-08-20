package com.zcnation.zc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.dao.ZcOrdersInfoNativeDao;
import com.zcnation.zc.dao.ZcProjectInfoDao;
import com.zcnation.zc.dao.ZcProjectInfoNativeDao;
import com.zcnation.zc.domain.ZcOrdersInfo;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.service.ZcOrdesInfoNativeService;
import com.zcnation.zc.service.ZcProjectInfoNativeService;

@Service(value = "zcOrdesInfoNativeService")
public class ZcOrdesInfoNativeServiceImpl implements ZcOrdesInfoNativeService {
	@Autowired private ZcOrdersInfoNativeDao zcOrdersInfoNativeDao;
	@Override
	public List<ZcOrdersInfo> queryByUserCodeAndOrderCodeAndOrderStatus(Integer userCode,String orderCode,String orderStatus) {
		// TODO Auto-generated method stub
	return	zcOrdersInfoNativeDao.findByUserCodeAndOrderCodeAndOrderStatus(userCode, orderCode, orderStatus);
	}

}
