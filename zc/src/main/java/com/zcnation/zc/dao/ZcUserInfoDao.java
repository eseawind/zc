package com.zcnation.zc.dao;
import org.springframework.data.repository.Repository;

import com.zcnation.zc.domain.ZcUserInfo;


public interface ZcUserInfoDao extends Repository<ZcUserInfo, Integer> {
	/**
	 * 添加客户
	 * @param zcUserInfo
	 * @return
	 */
	 public ZcUserInfo save(ZcUserInfo zcUserInfo);
	 /**
	  * 通过ID得到客户信息
	  * @param userCode
	  * @return
	  */
	 
	 public ZcUserInfo findByUserCode(int userCode);

}
