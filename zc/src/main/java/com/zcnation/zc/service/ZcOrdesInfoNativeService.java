package com.zcnation.zc.service;

import java.util.List;

import com.zcnation.zc.domain.ZcOrdersInfo;
import com.zcnation.zc.domain.ZcProjectInfo;


public interface ZcOrdesInfoNativeService {
	
	public  List<ZcOrdersInfo> queryByUserCodeAndOcodesAndOrderStatus(Integer userCode,String ocodes,String orderStatus);
	


}