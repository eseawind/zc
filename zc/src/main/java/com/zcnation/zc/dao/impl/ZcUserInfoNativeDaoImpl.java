package com.zcnation.zc.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zcnation.zc.dao.ZcUserInfoNativeDao;
import com.zcnation.zc.domain.ZcProjectInfo;

@Repository("zcUserInfoNativeDao")
public class ZcUserInfoNativeDaoImpl implements ZcUserInfoNativeDao {

	@Autowired private EntityManagerFactory entityManagerFactory;
	public int updateByUserCode(Integer userCode,String password) {
		// TODO Auto-generated method stub
		String sql="update  from zc_user_info t set t.password='"+password+"' were t.user_code='"+userCode+"'";
		System.out.println(sql);
		EntityManager em=entityManagerFactory.createEntityManager();
		Query query=em.createNativeQuery(sql);
		int flag= query.executeUpdate();
	
		return flag;
	}
	
	

}