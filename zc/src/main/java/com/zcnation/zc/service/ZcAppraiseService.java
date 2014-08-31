package com.zcnation.zc.service;

import java.util.List;

import com.zcnation.zc.domain.ZcAppraise;


public interface ZcAppraiseService {
	
	public List<ZcAppraise> queryByProCode(Integer proCode);
	
	
	 public String save(ZcAppraise zcAppraise);

}
