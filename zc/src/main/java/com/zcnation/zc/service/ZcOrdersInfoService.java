package com.zcnation.zc.service;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.domain.ZcOrdersInfo;

public interface ZcOrdersInfoService {

	/***
	 * 下单
	 * @return
	 */
	public Result process();
	public ZcOrdersInfo save(ZcOrdersInfo info);
}
