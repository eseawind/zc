package com.zcnation.zc.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zcnation.zc.domain.ZcOrdersInfo;

public interface ZcOrdersInfoDao extends JpaRepository<ZcOrdersInfo, Integer> {

	public ZcOrdersInfo save(ZcOrdersInfo info);
}
