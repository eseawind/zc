package com.zcnation.zc.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zcnation.zc.dao.ZcUserInfoNativeDao;

import java.sql.Timestamp;
import java.util.Calendar;

@Repository("zcUserInfoNativeDao")

public class ZcUserInfoNativeDaoImpl implements ZcUserInfoNativeDao {

	@Autowired private EntityManagerFactory entityManagerFactory;
	public int updateByUserCode(Integer userCode,String password,String userOldPassowrd) {
		// TODO Auto-generated method stub
		
		int flag=0;
		   if(findByuserCodeAndpassword(userCode, userOldPassowrd)==1){
			   flag=1;
		   }else{
				
				String sql="update   zc_user_info t set t.password='"+password+"' where t.user_code='"+userCode+"'";
				System.out.println(sql);
				EntityManager em=entityManagerFactory.createEntityManager();
				em.getTransaction().begin();
				Query query=em.createNativeQuery(sql);
				query.executeUpdate();
				flag=0;
			 System.out.println("flagflag"+flag);
				em.getTransaction().commit();
				
		   }
		
		
		   System.out.println("flagflag11111111111111111111"+flag);
		return flag;
	}
	@Override
	public int updateLoginTimeAndUserScoreByUserCode(Integer userScore,Integer userCode) {
		// TODO Auto-generated method stub
		String sql="update   zc_user_info t set t.login_time='"+new Timestamp(
		        Calendar.getInstance().getTimeInMillis())+"',user_score='"+userScore+"' where t.user_code='"+userCode+"'";
		System.out.println(sql);
		EntityManager em=entityManagerFactory.createEntityManager();
		em.getTransaction().begin();
		Query query=em.createNativeQuery(sql);
		int flag= query.executeUpdate();
	
		em.getTransaction().commit();
		
		
		return 0;
	}
	@Override
	public int findByuserCodeAndpassword(Integer userCode, String password) {
		// TODO Auto-generated method stub
		 
		int flag=0;
		
		String sql="select  * from  zc_user_info   zui  where 1=1 ";
		
		if(userCode!=0){
		 sql=sql+"  and  zui.USER_CODE="+userCode+"";
			
		}
		if (password != null && !password.equalsIgnoreCase("")) {
			
			 sql=sql+"  and  zui.password="+password+"";
		}
		
		
		EntityManager em=entityManagerFactory.createEntityManager();
		Query query=em.createNativeQuery(sql);
		    System.out.println("query.getResultList().size()query.getResultList().size()query.getResultList().size()query.getResultList().size()"+query.getResultList().size());
		  if(query.getResultList().size()==0){
			  flag=1;
		  }
		
		
		return flag;
	}
	
	

}