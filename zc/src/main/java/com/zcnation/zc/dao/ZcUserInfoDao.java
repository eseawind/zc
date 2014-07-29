package com.zcnation.zc.dao;
import java.util.List;

import org.springframework.data.repository.Repository;

import com.zcnation.zc.domain.ZcUserInfo;


public interface ZcUserInfoDao extends Repository<ZcUserInfo, Integer> {
	/**
	 * 添加客户
	 * @param zcUserInfo
	 * @return
	 */
	 public ZcUserInfo save(ZcUserInfo zcUserInfo);
	 
	 
	 public List<ZcUserInfo> findByUserPhone(String userPhone);
	 /**
	  * 通过ID得到客户信息
	  * @param userCode
	  * @return
	  */
	 public ZcUserInfo findByUserCode(int userCode);
	 
	 public List<ZcUserInfo> findByEmail(String email);
}