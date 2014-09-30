package com.zcnation.zc.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;

import com.zcnation.zc.domain.ZcOrderDetail;
import com.zcnation.zc.domain.ZcOrdersInfo;
import com.zcnation.zc.domain.ZcResourceInfo;


public interface ZcOrderDetailNativeDao {

	
	public int updateZcOrderDetail(Integer proNumber,Integer detId);
	public List<ZcOrderDetail> findByUserCodeAndOrderCodeIsNull(Integer userCode);
	public void updateOrderCodeByUserCodeAndOrderCodeIsNull(Integer userCode,Integer orderCode);
	
	
	public List<ZcOrderDetail> findByUserCodeAndOCodes(Integer userCode,Integer ocodes);
	
}
