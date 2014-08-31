package com.zcnation.zc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.dao.ZcAppraiseDao;
import com.zcnation.zc.dao.ZcProjectLikeDao;
import com.zcnation.zc.domain.ZcAppraise;
import com.zcnation.zc.service.ZcAppraiseService;

@Service(value = "zcAppraiseService")
public class ZcAppraiseServiceImpl implements ZcAppraiseService {

	@Autowired private ZcAppraiseDao zcAppraiseDao;
	@Override
	public List<ZcAppraise> queryByProCode(Integer proCode) {
		// TODO Auto-generated method stub
		return zcAppraiseDao.findByZcProjectInfoProCode(proCode);
	}

	@Override
	public String save(ZcAppraise zcAppraise) {
		// TODO Auto-generated method stub
		Result r = new Result();
		zcAppraiseDao.save(zcAppraise);
				r.setSuccess(true);
		return r.toJson();
	}

}
