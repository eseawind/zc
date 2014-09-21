package com.zcnation.zc.dao.impl;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zcnation.zc.common.util.RootLogger;
import com.zcnation.zc.dao.ZcOrdersInfoNativeDao;
import com.zcnation.zc.domain.ZcOrdersInfo;


@Repository("zcOrdersInfoNativeDao")
public class ZcOrdersInfoNativeDaoImpl implements ZcOrdersInfoNativeDao{

	@Autowired private EntityManagerFactory entityManagerFactory;
	public List<ZcOrdersInfo> findByUserCodeAndOrderCodeAndOrderStatus(Integer userCode,String orderCode,String orderStatus) {
		// TODO Auto-generated method stub
		String sql="select    zoi.ocodes,zoi.order_code, zoi.user_code,zoi.order_status,zoi.order_time ,(select sum(zod.order_number*zod.pro_unit)from zc_order_detail zod where zod.order_code in( zoi.ocodes) ) as total  from zc_orders_info zoi where 1=1 ";
		
		if(userCode!=0){
		 sql=sql+"  and  zoi.USER_CODE="+userCode+"";
			
		}
		if (orderStatus != null && !orderStatus.equalsIgnoreCase("")&&!orderStatus.equalsIgnoreCase("-1")) {
			
			 sql=sql+"  and  zoi.ORDER_STATUS="+orderStatus+"";
		}
		
		if (orderCode != null && !orderCode.equalsIgnoreCase("")) {
			
			 sql=sql+"  and  zoi.order_code like '%"+orderCode+"%'";
		}
		
		EntityManager em=entityManagerFactory.createEntityManager();
		Query query=em.createNativeQuery(sql);
		List list=query.getResultList();
		for (Object object : list) {
			//这个object应该是个数组
			Object[] oj=(Object[])object;
			System.out.println("项目名称："+oj[0]+" 资源名称："+oj[1]);
		}
		return list;
	}
	@Override
	public void deleteByUserCodeAndProCodOAndProTypeAndOrderCodeIsNull(
			Integer userCode, Integer proCode, String proType) {
		// TODO Auto-generated method stub
	
	
		try {
			String sql="delete from zc_order_detail where pro_code='"+proCode+"' and user_code='"+userCode+"' and pro_type='"+proType+"' and order_code is null ";
			EntityManager em=entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			Query query=em.createNativeQuery(sql);
			query.executeUpdate();
			em.getTransaction().commit();
		} catch (Exception e) {
		
			RootLogger.error(e.getMessage());
			// TODO: handle exception
		}
		
	}
	@Override
	public int updateOrderCanceTimeByOCodes(Integer oCodes) {
		// TODO Auto-generated method stub
		
		String sql="update   zc_orders_info t set t.ORDER_CANCELTIME='"+new Timestamp(
		        Calendar.getInstance().getTimeInMillis())+"', t.ORDER_STATUS='1' where t.OCODES='"+oCodes+"'";
		System.out.println(sql);
		EntityManager em=entityManagerFactory.createEntityManager();
		em.getTransaction().begin();
		Query query=em.createNativeQuery(sql);
		int flag= query.executeUpdate();
	
		em.getTransaction().commit();
		
		return 0;
	}
				
	}
	


