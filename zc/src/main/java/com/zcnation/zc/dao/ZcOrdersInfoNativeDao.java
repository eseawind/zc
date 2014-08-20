package com.zcnation.zc.dao;

import java.util.List;
import com.zcnation.zc.domain.ZcOrdersInfo;

public interface ZcOrdersInfoNativeDao {
	
	public List<ZcOrdersInfo> findByUserCodeAndOrderCodeAndOrderStatus(Integer userCode,String orderCode,String orderStatus);
	


}