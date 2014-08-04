package com.zcnation.zc.dao;


import org.springframework.data.repository.Repository;

import com.zcnation.zc.domain.ZcProjectInfo;


public interface ZcProjectInfoDao extends Repository<ZcProjectInfo, Integer> {
	/**
	 * 添加作品
	 * @param zcProjectInfo
	 * @return
	 */
	 public ZcProjectInfo save(ZcProjectInfo zcProjectInfo);
	 
	
}
