package com.zcnation.zc.service;

import java.util.List;

import com.zcnation.zc.domain.ZcAppraise;

public interface ZcAppraiseNativeService {
	public List<ZcAppraise> queryByProCodeAndOrderCodeIsNotNull(Integer proCode);

}
