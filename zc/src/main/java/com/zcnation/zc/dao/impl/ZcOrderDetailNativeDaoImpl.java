package com.zcnation.zc.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zcnation.zc.common.util.RootLogger;
import com.zcnation.zc.dao.ZcOrderDetailDao;
import com.zcnation.zc.dao.ZcOrderDetailNativeDao;
import com.zcnation.zc.domain.ZcOrderDetail;
import com.zcnation.zc.domain.ZcOrdersInfo;
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
	@Override
	public List<ZcOrderDetail> findByUserCodeAndOrderCodeIsNull(Integer userCode) {
		// TODO Auto-generated method stub
String sql="select  t. PRO_CODE,zpi.pro_name,zri.RESOURCE_NAME,t.pro_unit, t.pro_unit*(t.S+t.M+t.L+t.XL+t.XXL+t.XXXL) as onepirce,  (t.S+t.M+t.L+t.XL+t.XXL+t.XXXL) as  onesum , t.S,t.M,t.L,t.XL,t.XXL,t.XXXL  from (SELECT zod.PRO_CODE,  zod.pro_unit,    SUM(CASE WHEN zod.PRO_TYPE='S' THEN zod.ORDER_NUMBER   ELSE 0 END)  AS S, SUM(CASE WHEN zod.PRO_TYPE='M' THEN zod.ORDER_NUMBER   ELSE 0 END)  AS M, SUM(CASE WHEN zod.PRO_TYPE='L' THEN zod.ORDER_NUMBER   ELSE 0 END)  AS L, SUM(CASE WHEN zod.PRO_TYPE='XL' THEN zod.ORDER_NUMBER   ELSE 0 END)  AS XL,  SUM(CASE WHEN zod.PRO_TYPE='XXL' THEN zod.ORDER_NUMBER  ELSE 0 END)  AS XXL,SUM(CASE WHEN zod.PRO_TYPE='XXXL' THEN zod.ORDER_NUMBER  ELSE 0 END)  AS XXXL FROM zc_order_detail AS zod where zod.ORDER_CODE is null  ";
		
		if(userCode!=0){
		 sql=sql+"  and  zod.USER_CODE="+userCode+"";
			
		}
		sql=sql+ " GROUP BY zod.PRO_CODE,zod.pro_unit)t,zc_project_info zpi,zc_resource_info zri  where t.pro_code=zpi.PRO_CODE and zpi.RESOURCE_CODE=zri.RESOURCE_CODE ";
		
		
		EntityManager em=entityManagerFactory.createEntityManager();
		Query query=em.createNativeQuery(sql);
		List list=query.getResultList();
		for (Object object : list) {
			//这个object应该是个数组
			Object[] oj=(Object[])object;
			System.out.println("总价："+oj[4]+" 总数："+oj[5]);
		}
		return list;
	}
	@Override
	public void updateOrderCodeByUserCodeAndOrderCodeIsNull(Integer userCode,Integer orderCode) {
		// TODO Auto-generated method stub
		try {
			String sql="update   zc_order_detail t set t.ORDER_CODE='"+orderCode+"' where t.user_Code='"+userCode+"' and t.ORDER_CODE is null";
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
	


}
