package com.zcnation.zc.dao;

import java.util.List;
import com.zcnation.zc.domain.ZcOrdersInfo;

public interface ZcOrdersInfoNativeDao {
	
	public List<ZcOrdersInfo> findByUserCodeAndOcodesAndOrderStatus(Integer userCode,String ocodes,String orderStatus);
	


}