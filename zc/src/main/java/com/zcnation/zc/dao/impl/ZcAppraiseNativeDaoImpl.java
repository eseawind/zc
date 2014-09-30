package com.zcnation.zc.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.zcnation.zc.dao.ZcAppraiseNativeDao;
import com.zcnation.zc.domain.ZcAppraise;
import com.zcnation.zc.domain.ZcOrderDetail;

@Repository("zcAppraiseNativeDao")
public class ZcAppraiseNativeDaoImpl implements ZcAppraiseNativeDao{
	@Autowired private EntityManagerFactory entityManagerFactory;
	@Override
	public List<ZcAppraise> findByProCodeAndOrderCodeIsNotNull(Integer proCode) {
		// TODO Auto-generated method stub
String sql="select  t.USER_CODE,zui.USER_NAME,t.ORDER_CODE,zoi.ORDER_TIME, t. PRO_CODE,zpi.pro_name,zri.RESOURCE_NAME,t.pro_unit, t.pro_unit*(t.S+t.M+t.L+t.XL+t.XXL+t.XXXL) as onepirce,  (t.S+t.M+t.L+t.XL+t.XXL+t.XXXL) as  onesum , t.S,t.M,t.L,t.XL,t.XXL,t.XXXL  from (SELECT zod.PRO_CODE,  zod.pro_unit,zod.USER_CODE,zod.ORDER_CODE,   SUM(CASE WHEN zod.PRO_TYPE='S' THEN zod.ORDER_NUMBER   ELSE 0 END)  AS S, SUM(CASE WHEN zod.PRO_TYPE='M' THEN zod.ORDER_NUMBER   ELSE 0 END)  AS M, SUM(CASE WHEN zod.PRO_TYPE='L' THEN zod.ORDER_NUMBER   ELSE 0 END)  AS L, SUM(CASE WHEN zod.PRO_TYPE='XL' THEN zod.ORDER_NUMBER   ELSE 0 END)  AS XL,  SUM(CASE WHEN zod.PRO_TYPE='XXL' THEN zod.ORDER_NUMBER  ELSE 0 END)  AS XXL,SUM(CASE WHEN zod.PRO_TYPE='XXXL' THEN zod.ORDER_NUMBER  ELSE 0 END)  AS XXXL FROM zc_order_detail AS zod where zod.ORDER_CODE is  not null     ";
		
		if(proCode!=0){
		 sql=sql+"  and  zod.PRO_CODE="+proCode+"";
			
		}
		//sql=sql+ " GROUP BY zod.PRO_CODE,zod.pro_unit,zod.USER_CODE,zod.ORDER_CODE)t,zc_project_info zpi,zc_resource_info zri,zc_user_info zui,zc_orders_info zoi  where t.pro_code=zpi.PRO_CODE and zpi.RESOURCE_CODE=zri.RESOURCE_CODE  and t.USER_CODE=zui.USER_CODE  and zoi.ORDER_CODE=t.ORDER_CODE";
		sql=sql+ " GROUP BY zod.PRO_CODE,zod.pro_unit,zod.USER_CODE,zod.ORDER_CODE)t,zc_project_info zpi,zc_resource_info zri,zc_user_info zui,zc_orders_info zoi  where t.pro_code=zpi.PRO_CODE and zpi.RESOURCE_CODE=zri.RESOURCE_CODE  and t.USER_CODE=zui.USER_CODE  and zoi.OCODES=t.ORDER_CODE";
		
		
		System.out.println("ssssssssssssssssssssssssssssssssssss"+sql);
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
	
	
	
}
