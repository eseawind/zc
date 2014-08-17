package com.zcnation.zc.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zcnation.zc.dao.ZcOrdersInfoNativeDao;
import com.zcnation.zc.domain.ZcOrdersInfo;


@Repository("zcOrdersInfoNativeDao")
public class ZcOrdersInfoNativeDaoImpl implements ZcOrdersInfoNativeDao{

	@Autowired private EntityManagerFactory entityManagerFactory;
	public List<ZcOrdersInfo> findByUserCodeAndOcodesAndOrderStatus(Integer userCode,String ocodes,String orderStatus) {
		// TODO Auto-generated method stub
		String sql="select zoi.ORDER_CODE,zoi.USER_CODE,zoi.PRO_CODE,zoi.ORDER_MONEY,zoi.ORDER_STATUS,zoi.OCODES,zoi.ORDER_TIME from zc_orders_info zoi where 1=1 ";
		
		if(userCode!=0){
		 sql=sql+"  and  zoi.USER_CODE="+userCode+"";
			
		}
		if (orderStatus != null && !orderStatus.equalsIgnoreCase("")&&!orderStatus.equalsIgnoreCase("-1")) {
			
			 sql=sql+"  and  zoi.ORDER_STATUS="+orderStatus+"";
		}
		
		if (ocodes != null && !ocodes.equalsIgnoreCase("")) {
			
			 sql=sql+"  and  zoi.OCODES like '%"+ocodes+"%'";
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
	

}
