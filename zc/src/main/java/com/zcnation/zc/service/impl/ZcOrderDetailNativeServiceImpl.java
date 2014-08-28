package com.zcnation.zc.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.dao.ZcOrderDetailDao;
import com.zcnation.zc.dao.ZcOrderDetailNativeDao;
import com.zcnation.zc.domain.ZcOrderDetail;
import com.zcnation.zc.service.ZcOrderDetailNativeService;
import com.zcnation.zc.service.ZcOrderDetailService;


@Service(value = "zcOrderDetailNativeService")
public class ZcOrderDetailNativeServiceImpl implements ZcOrderDetailNativeService {
	private Logger logger=Logger.getLogger(ZcOrderDetailNativeService.class);
	@Autowired private ZcOrderDetailNativeDao zcOrderDetailNativeDao;
	@Override
	public int updateZcOrderDetail(Integer proNumber, Integer detId) {
		// TODO Auto-generated method stub
		return zcOrderDetailNativeDao.updateZcOrderDetail(proNumber, detId);
	}
	@Override
	public List<ZcOrderDetail> queryByUserCodeAndOrderCodeIsNull(
			Integer userCode) {
		// TODO Auto-generated method stub
		return zcOrderDetailNativeDao.findByUserCodeAndOrderCodeIsNull(userCode);
	}


}
