package com.zcnation.zc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.dao.ZcProjectInfoDao;
import com.zcnation.zc.dao.ZcProjectInfoNativeDao;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.service.ZcProjectInfoNativeService;

@Service(value = "zcProjectInfoNativeService")
public class ZcProjectInfoNativeServiceImpl implements ZcProjectInfoNativeService {
	@Autowired private ZcProjectInfoNativeDao zcProjectInfoNativeDao;
	@Override
	public List<ZcProjectInfo> queryByUserCodeAndProShStatusAndProNameAndProShStatus(Integer userCode,
			String proName,String proShStatus) {
		// TODO Auto-generated method stub
	return	zcProjectInfoNativeDao.findByUserCodeAndProShStatusAndProNameAndProShStatus(userCode, proName,proShStatus);
	}
	@Override
	public List<ZcProjectInfo> queryByProShStatus() {
		// TODO Auto-generated method stub
		return zcProjectInfoNativeDao.findByProShStatus();
	}
	@Override
	public List<ZcProjectInfo> queryByProShStatusAndPage(Integer currentPage,Integer sortSele,Integer sortBy,Integer proType,Integer proFabric,Integer userCode) {
		// TODO Auto-generated method stub
		return zcProjectInfoNativeDao.findByProShStatusAndPage(currentPage,sortSele,sortBy,proType,proFabric,userCode);
	}
	@Override
	public List<ZcProjectInfo> queryByProTime() {
		// TODO Auto-generated method stub
		return zcProjectInfoNativeDao.findByProTime();
	}
	@Override
	public Integer queryTtotalByProShStatusAndPage(Integer sortSele,
			Integer sortBy, Integer proType, Integer proFabric) {
		// TODO Auto-generated method stub
		return zcProjectInfoNativeDao.findTotalByProShStatusAndPage(sortSele, sortBy, proType, proFabric);
	}

}
