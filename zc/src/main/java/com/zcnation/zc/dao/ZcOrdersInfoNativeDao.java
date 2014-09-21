package com.zcnation.zc.dao;

import java.util.List;

import com.zcnation.zc.domain.ZcOrdersInfo;
import com.zcnation.zc.domain.ZcResourceInfo;

public interface ZcOrdersInfoNativeDao {
	
	public List<ZcOrdersInfo> findByUserCodeAndOrderCodeAndOrderStatus(Integer userCode,String orderCode,String orderStatus);
	
   public void  deleteByUserCodeAndProCodOAndProTypeAndOrderCodeIsNull(Integer userCode,Integer proCode,String proType);
   
   public int updateOrderCanceTimeByOCodes(Integer oCodes);
   
  // public int updateResourceInfo(ZcResourceInfo info);
	


}