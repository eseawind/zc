package com.zcnation.zc.service;

import java.util.List;






import com.zcnation.zc.domain.ZcOrderDetail;


public interface ZcOrderDetailService {

	 public List<ZcOrderDetail> queryByProCodeAndProTypeAndUserCodeAndOrderCodeIsNull(Integer proCode,String proType,Integer userCode );
		public String save(ZcOrderDetail zcOrderDetail);
}
