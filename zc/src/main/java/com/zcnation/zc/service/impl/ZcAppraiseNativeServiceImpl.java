package com.zcnation.zc.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.dao.ZcAppraiseNativeDao;
import com.zcnation.zc.dao.ZcOrderDetailNativeDao;
import com.zcnation.zc.domain.ZcAppraise;
import com.zcnation.zc.service.ZcAppraiseNativeService;
import com.zcnation.zc.service.ZcOrderDetailNativeService;

@Service(value = "zcAppraiseNativeService")
public class ZcAppraiseNativeServiceImpl implements ZcAppraiseNativeService {
	private Logger logger=Logger.getLogger(ZcAppraiseNativeServiceImpl.class);
	@Autowired private ZcAppraiseNativeDao zcAppraiseNativeDao;

	@Override
	public List<ZcAppraise> queryByProCodeAndOrderCodeIsNotNull(Integer proCode) {
		// TODO Auto-generated method stub
		return zcAppraiseNativeDao.findByProCodeAndOrderCodeIsNotNull(proCode);
	}

}
