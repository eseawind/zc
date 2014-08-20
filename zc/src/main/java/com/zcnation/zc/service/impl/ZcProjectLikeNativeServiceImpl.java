package com.zcnation.zc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.dao.ZcProjectInfoDao;
import com.zcnation.zc.dao.ZcProjectInfoNativeDao;
import com.zcnation.zc.dao.ZcProjectLikeNativeDao;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcProjectLike;
import com.zcnation.zc.service.ZcProjectInfoNativeService;
import com.zcnation.zc.service.ZcProjectLikeNativeService;

@Service(value = "zcProjectLikeNativeService")
public class ZcProjectLikeNativeServiceImpl implements ZcProjectLikeNativeService {
	@Autowired private ZcProjectLikeNativeDao zcProjectLikeNativeDao;

	@Override
	public List<ZcProjectLike> queryByUserCodeAndproCode(Integer userCode,
			Integer proCode) {
		// TODO Auto-generated method stub
		return zcProjectLikeNativeDao.findByUserCodeAndproCode(userCode, proCode);
	}
	

}
