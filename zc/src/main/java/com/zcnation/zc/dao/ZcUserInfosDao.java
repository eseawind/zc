package com.zcnation.zc.dao;


import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;

import com.zcnation.zc.domain.ZcUserInfos;


public interface ZcUserInfosDao extends Repository<ZcUserInfos, Integer>,CrudRepository<ZcUserInfos,Integer> {
	
	/**
	 * 添加地址
	 * @param zcUserInfo
	 * @return
	 */
	 public ZcUserInfos save(ZcUserInfos zcUserInfos);
	 
	 public List<ZcUserInfos> findAll();
	 
	 public ZcUserInfos findByUserCode(int userCode);
	 
	 public void deleteByUserCode(int userCode);

	 public void delete(ZcUserInfos zcUserInfos);
	
	 
}
