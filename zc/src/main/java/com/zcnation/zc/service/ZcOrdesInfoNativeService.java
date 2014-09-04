package com.zcnation.zc.service;

import java.util.List;

import com.zcnation.zc.domain.ZcOrdersInfo;
import com.zcnation.zc.domain.ZcProjectInfo;


public interface ZcOrdesInfoNativeService {
	
	public  List<ZcOrdersInfo> queryByUserCodeAndOrderCodeAndOrderStatus(Integer userCode,String orderCode,String orderStatus);
	
	  public void  deleteByUserCodeAndProCodOAndProTypeAndOrderCodeIsNull(Integer userCode,Integer proCode,String proType);

}