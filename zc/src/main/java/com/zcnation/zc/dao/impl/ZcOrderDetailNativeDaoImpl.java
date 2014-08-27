package com.zcnation.zc.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zcnation.zc.common.util.RootLogger;
import com.zcnation.zc.dao.ZcOrderDetailDao;
import com.zcnation.zc.dao.ZcOrderDetailNativeDao;
import com.zcnation.zc.service.impl.ZcOrderDetailServiceImpl;

@Repository("zcOrderDetailNativeDao")
public class ZcOrderDetailNativeDaoImpl implements ZcOrderDetailNativeDao{
	
	@Autowired private EntityManagerFactory entityManagerFactory;
	@Override
	public int updateZcOrderDetail(Integer proNumber, Integer detId) {
		// TODO Auto-generated method stub
		
		int flag=0;
		try {
			String sql="update   zc_order_detail t set t.ORDER_NUMBER='"+proNumber+"' where t.DET_ID='"+detId+"'";
			EntityManager em=entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			Query query=em.createNativeQuery(sql);
			query.executeUpdate();
			em.getTransaction().commit();
		} catch (Exception e) {
			flag=1;
			RootLogger.error(e.getMessage());
			// TODO: handle exception
		}
		
				
				
		  
		return flag;
	}

}
