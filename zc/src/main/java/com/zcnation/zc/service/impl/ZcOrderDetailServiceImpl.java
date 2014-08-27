package com.zcnation.zc.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.dao.ZcOrderDetailDao;
import com.zcnation.zc.domain.ZcOrderDetail;
import com.zcnation.zc.service.ZcOrderDetailService;


@Service(value = "zcOrderDetailService")
public class ZcOrderDetailServiceImpl implements ZcOrderDetailService {
	private Logger logger=Logger.getLogger(ZcOrderDetailServiceImpl.class);
	@Autowired private ZcOrderDetailDao zcOrderDetailDao;

	@Override
	public List<ZcOrderDetail> queryByProCodeAndProTypeAndUserCodeAndOrderCodeIsNull(Integer proCode ,String proType,Integer userCode){
		// TODO Auto-generated method stub
		return zcOrderDetailDao.findByProCodeAndProTypeAndUserCodeAndOrderCodeIsNull( proCode,proType, userCode);
	}

	@Override
	public String save(ZcOrderDetail zcOrderDetail) {
		// TODO Auto-generated method stub
		Result r = new Result();
		
		
		zcOrderDetailDao.save(zcOrderDetail);
				r.setSuccess(true);
		
		return r.toJson();
	}
	
	

}
