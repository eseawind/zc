package com.zcnation.zc.dao;

import java.util.List;



import com.zcnation.zc.domain.ZcAppraise;


public interface ZcAppraiseNativeDao {

	
	public List<ZcAppraise> findByProCodeAndOrderCodeIsNotNull(Integer proCode);
}
