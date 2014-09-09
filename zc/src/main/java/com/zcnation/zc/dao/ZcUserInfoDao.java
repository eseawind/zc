package com.zcnation.zc.dao;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;

import com.zcnation.zc.domain.ZcUserInfo;


public interface ZcUserInfoDao extends Repository<ZcUserInfo, Integer>,CrudRepository<ZcUserInfo, Integer> {
	
	/**
	 * 添加客户
	 * @param zcUserInfo
	 * @return
	 */
	 public ZcUserInfo save(ZcUserInfo zcUserInfo);
	 
	 /***
	  * 根据电话查找用户
	  * @param userPhone
	  * @return
	  */
	 public List<ZcUserInfo> findByUserPhone(String userPhone);
	 /**
	  * 通过ID得到客户信息
	  * @param userCode
	  * @return
	  */
	 public ZcUserInfo findByUserCode(int userCode);
	 /***
	  * 根据邮箱查找用户
	  * @param email
	  * @return
	  */
	 public List<ZcUserInfo> findByEmail(String email);
	 
	 @Query("select count(*) from zc_user_info where user_name =?1")
	 public Long countUserName(String userName);
	 
	 /***
	  * 根据用户名查询
	  * @param userName
	  * @param password
	  * @return
	  */
	 public List<ZcUserInfo> findByUserNameAndPassword(String userName,String password);
	 
	 /***
	  * 根据邮箱查找
	  * @param email
	  * @param password
	  * @return
	  */
	 public List<ZcUserInfo> findByEmailAndPassword(String email,String password);
	 
	 /**
	  * 根据手机号查找
	  * @param userPhone
	  * @param password
	  * @return
	  */
	 public List<ZcUserInfo> findByUserPhoneAndPassword(String userPhone,String password);
	 
	 /***
	  * 查询用户是否存在
	  * @param userName 用户名
	  * @param email 邮箱
	  * @param userPhone 手机号
	  * @return
	  */
	 @Query("select count(*) from zc_user_info where user_name =?1 or email =?2 or user_phone =?3 ")
	 public Long countByUerOrEmailOrPhone(String userName,String email,String userPhone);
	 
	 @Transactional
	 @Modifying
	   
	 @Query("update zc_user_info set password='123456' where user_code=?1")
	 public int gengxinByUserCode(int userCode);


	 public List<ZcUserInfo> findByUserPhoneAndUserCodeNotIn(String userPhone,Integer userCode);
	 
	 public List<ZcUserInfo> findByEmailAndUserCodeNotIn(String email,Integer userCode);
	 
}
