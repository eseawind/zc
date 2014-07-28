package com.zcnation.zc.dao;
import org.springframework.data.repository.Repository;

import com.zcnation.zc.domain.ZcUserInfo;


public interface ZcUserInfoDao extends Repository<ZcUserInfo, Long> {
	/**
	 * 添加客户
	 * @param zcUserInfo
	 * @return
	 */
	 public ZcUserInfo save(ZcUserInfo zcUserInfo);

}
