package com.zcnation.zc.service;

import java.util.List;

import com.zcnation.zc.domain.ZcOrderDetail;




public interface ZcOrderDetailNativeService {
	public int updateZcOrderDetail(Integer proNumber,Integer detId);
	public List<ZcOrderDetail> queryByUserCodeAndOrderCodeIsNull(Integer userCode);
}
