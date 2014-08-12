package com.zcnation.zc.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zcnation.zc.domain.ZcOrderDetail;

public interface ZcOrderDetailDao extends JpaRepository<ZcOrderDetail, Integer>{

	public ZcOrderDetail save(ZcOrderDetail detail);
}
