package com.zcnation.zc.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;

import com.zcnation.zc.domain.ZcOrderDetail;


public interface ZcOrderDetailDao extends Repository<ZcOrderDetail, Integer>,CrudRepository<ZcOrderDetail,Integer>{

	//public ZcOrderDetail save(ZcOrderDetail detail);
	 public List<ZcOrderDetail> findByProCodeAndProTypeAndUserCodeAndOrderCodeIsNull(Integer proCode,String proType,Integer userCode );
	 public ZcOrderDetail save(ZcOrderDetail zcOrderDetail);
}
