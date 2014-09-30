package com.zcnation.zc.dao.impl;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.aspectj.apache.bcel.classfile.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Repository;

import com.zcnation.zc.dao.ZcProjectInfoDao;
import com.zcnation.zc.dao.ZcProjectInfoNativeDao;
import com.zcnation.zc.domain.ZcProjectInfo;

@Repository("zcProjectInfoNativeDao")
public class ZcProjectInfoNativeDaoImpl implements ZcProjectInfoNativeDao{

	@Autowired private EntityManagerFactory entityManagerFactory;
	public List<ZcProjectInfo> findByUserCodeAndProShStatusAndProNameAndProShStatus(Integer userCode,
			String proName,String proShStatus) {
		// TODO Auto-generated method stub
		String sql="select zpi.PRO_CODE,zpi.PRO_NAME,zpi.PRO_SH_STATUS,zpi.PRO_TARGET,zpi.RESOURCE_CODE as zpircode,zri.RESOURCE_CODE as zrircode,zri.RESOURCE_NAME,zpi.PRO_STARTTIME,zpi.PRO_ENDTIME,zpi.PRO_DAYS from zc_project_info zpi left JOIN zc_resource_info zri on zpi.RESOURCE_CODE=zri.RESOURCE_CODE where 1=1 ";
		
		if(userCode!=0){
		 sql=sql+"  and  zpi.USER_CODE="+userCode+"";
			
		}
		if (proShStatus != null && !proShStatus.equalsIgnoreCase("")&&!proShStatus.equalsIgnoreCase("-1")) {
			
			 sql=sql+"  and  zpi.PRO_SH_STATUS="+proShStatus+"";
		}
		
		if (proName != null && !proName.equalsIgnoreCase("")) {
			
			 sql=sql+"  and  zpi.PRO_NAME like '%"+proName+"%'";
		}
		
		EntityManager em=entityManagerFactory.createEntityManager();
		Query query=em.createNativeQuery(sql);
		List list=query.getResultList();
//		for (Object object : list) {
//			//这个object应该是个数组
//			Object[] oj=(Object[])object;
//			System.out.println("项目名称："+oj[0]+" 资源名称："+oj[1]);
//		}
		return list;
	}
	/**
	 * 最受欢迎
	 */
	@Override
	public List<ZcProjectInfo> findByProShStatus() {
		// TODO Auto-generated method stub
		String sql="select zpi.PRO_CODE,zpi.PRO_NAME,zpi.PRO_SH_STATUS,zpi.PRO_TARGET,zpi.RESOURCE_CODE as zpircode,zpi.pro_unit, zri.RESOURCE_CODE as zrircode,zri.RESOURCE_NAME,(select count(*) from  zc_project_like zpl where zpl.pro_code in(zpi.pro_code)) as likecount,"
				+ "concat ( ROUND ((select sum(zod.ORDER_NUMBER) from  zc_order_detail zod where zod.pro_code in(zpi.pro_code))  /zpi.PRO_TARGET *100,2),'%') as orderdiscount,(select sum(zod.ORDER_NUMBER) from  zc_order_detail zod where zod.pro_code in(zpi.pro_code)) as ordercount,zpi.pro_days from zc_project_info zpi left JOIN zc_resource_info zri on zpi.RESOURCE_CODE=zri.RESOURCE_CODE where 1=1    order by   likecount desc limit 0, 6 ";
//String sql1="select zpi.PRO_CODE,zpi.PRO_NAME,zpi.PRO_SH_STATUS,zpi.PRO_TARGET,zpi.RESOURCE_CODE as zpircode,zri.RESOURCE_CODE as zrircode,zri.RESOURCE_NAME,(select count(*) from  zc_project_like zpl where zpl.pro_code in(zpi.pro_code)) as likecount from zc_project_info zpi left JOIN zc_resource_info zri on zpi.RESOURCE_CODE=zri.RESOURCE_CODE where 1=1  and zpi.PRO_SH_STATUS<>0   order by   likecount desc limit 0, 6  ";
	
	
		EntityManager em=entityManagerFactory.createEntityManager();
		Query query=em.createNativeQuery(sql);
		List list=query.getResultList();
		
		return list;
	}
	/**
	 * 所有产品分页
	 */
	@Override
	public List<ZcProjectInfo> findByProShStatusAndPage(Integer currentPage,Integer sortSele,Integer sortBy,Integer proType,Integer proFabric,Integer stateSele,Integer userCode) {
		// TODO Auto-generated method stub
		 int start = (currentPage - 1) * 16;  
			String sql="select zpi.PRO_CODE,zpi.PRO_NAME,zpi.PRO_SH_STATUS,zpi.PRO_TARGET,zpi.RESOURCE_CODE as zpircode,zpi.pro_unit, zri.RESOURCE_CODE as zrircode,zri.RESOURCE_NAME,(select count(*) from  zc_project_like zpl where zpl.pro_code in(zpi.pro_code) and  zpl.user_code='"+userCode+"') as likecount,zpi.pro_remarks,zpi.pro_time,concat ( ROUND ((select sum(zod.ORDER_NUMBER) from  zc_order_detail zod where zod.pro_code in(zpi.pro_code))  /zpi.PRO_TARGET *100,2),'%') as orderdiscount,(select sum(zod.ORDER_NUMBER) from  zc_order_detail zod where zod.pro_code in(zpi.pro_code)) as ordercount,zpi.pro_endtime,zpi.pro_days from zc_project_info zpi left JOIN zc_resource_info zri on zpi.RESOURCE_CODE=zri.RESOURCE_CODE where 1=1 ";
			
		
	if(proType==1||proType==2){
				
				sql=sql+" and zpi.pro_type='"+proType+"'";
			}
			
			if(proFabric==1||proFabric==2||proFabric==3){
				
				sql=sql+" and zpi.pro_fabric='"+proFabric+"'";
			}
				
			if(stateSele==4||stateSele==5||stateSele==6){
				
				sql=sql+" and zpi.PRO_SH_STATUS='"+stateSele+"'";
			}else if(stateSele==-1){
				sql=sql+" and zpi.PRO_SH_STATUS in(0,1,2,3,4,5,6)";
			}
			if(sortSele==0&&sortBy==0){
				
				sql=sql+" order by zpi.pro_unit asc ";
			}else if (sortSele==0&&sortBy==1) {
			
				sql=sql+" order by zpi.pro_unit desc ";
			}else if (sortSele==1&&sortBy==0) {
				sql=sql+" order by zpi.pro_time asc ";
			}else if (sortSele==1&&sortBy==1) {
				sql=sql+" order by zpi.pro_time desc ";
			}else {
				sql=sql+" order by   likecount desc ";
			}
			
			
		
			
			  
			EntityManager em=entityManagerFactory.createEntityManager();
			System.out.println("sql"+sql);
		 Query query = em.createNativeQuery(sql); 
		 int total = query.getResultList().size();  
		
		System.out.println(total);
			 query.setFirstResult(start);  
			 query.setMaxResults(16);  
			 List list=query.getResultList();
			         
				       

		 
		return list;
	}
	/**
	 * 最新
	 */
	@Override
	public List<ZcProjectInfo> findByProTime() {
		// TODO Auto-generated method stub
				String sql="select zpi.PRO_CODE,zpi.PRO_NAME,zpi.PRO_SH_STATUS,zpi.PRO_TARGET,zpi.RESOURCE_CODE as zpircode,zpi.pro_unit, zri.RESOURCE_CODE as zrircode,zri.RESOURCE_NAME,concat ( ROUND ((select sum(zod.ORDER_NUMBER) from zc_order_detail zod where zod.pro_code in(zpi.pro_code))  /zpi.PRO_TARGET *100,2),'%') as orderdiscount,(select sum(zod.ORDER_NUMBER) from  zc_order_detail zod where zod.pro_code in(zpi.pro_code)) as ordercount,zpi.pro_days from zc_project_info zpi left JOIN zc_resource_info zri on zpi.RESOURCE_CODE=zri.RESOURCE_CODE where 1=1   order by   zpi.pro_time desc limit 0, 6 ";
		//String sql1="select zpi.PRO_CODE,zpi.PRO_NAME,zpi.PRO_SH_STATUS,zpi.PRO_TARGET,zpi.RESOURCE_CODE as zpircode,zri.RESOURCE_CODE as zrircode,zri.RESOURCE_NAME,(select count(*) from  zc_project_like zpl where zpl.pro_code in(zpi.pro_code)) as likecount from zc_project_info zpi left JOIN zc_resource_info zri on zpi.RESOURCE_CODE=zri.RESOURCE_CODE where 1=1  and zpi.PRO_SH_STATUS<>0   order by   likecount desc limit 0, 6  ";
			
			
				EntityManager em=entityManagerFactory.createEntityManager();
				Query query=em.createNativeQuery(sql);
				List list=query.getResultList();
			
				return list;
	}
	@Override
	public Integer findTotalByProShStatusAndPage(Integer sortSele, Integer sortBy,
			Integer proType, Integer proFabric,Integer stateSele) {
		// TODO Auto-generated method stub
		String sql="select zpi.PRO_CODE,zpi.PRO_NAME,zpi.PRO_SH_STATUS,zpi.PRO_TARGET,zpi.RESOURCE_CODE as zpircode,zpi.pro_unit, zri.RESOURCE_CODE as zrircode,zri.RESOURCE_NAME,(select count(*) from  zc_project_like zpl where zpl.pro_code in(zpi.pro_code)) as likecount,zpi.pro_remarks,zpi.pro_time,concat ( ROUND ((select sum(zod.ORDER_NUMBER) from  zc_order_detail zod where zod.pro_code in(zpi.pro_code))  /zpi.PRO_TARGET *100,2),'%') as orderdiscount,(select sum(zod.ORDER_NUMBER) from  zc_order_detail zod where zod.pro_code in(zpi.pro_code)) as ordercount,zpi.pro_endtime,zpi.pro_days from zc_project_info zpi left JOIN zc_resource_info zri on zpi.RESOURCE_CODE=zri.RESOURCE_CODE where 1=1 ";
		
		
		if(proType==1||proType==2){
					
					sql=sql+" and zpi.pro_type='"+proType+"'";
				}
				
				if(proFabric==1||proFabric==2||proFabric==3){
					
					sql=sql+" and zpi.pro_fabric='"+proFabric+"'";
				}
if(stateSele==4||stateSele==5||stateSele==6){
					
					sql=sql+" and zpi.PRO_SH_STATUS='"+stateSele+"'";
				}else if(stateSele==-1){
					sql=sql+" and zpi.PRO_SH_STATUS in(0,1,2,3,4,5,6)";
				}
				
				if(sortSele==0&&sortBy==0){
					
					sql=sql+" order by zpi.pro_unit asc ";
				}else if (sortSele==0&&sortBy==1) {
				
					sql=sql+" order by zpi.pro_unit desc ";
				}else if (sortSele==1&&sortBy==0) {
					sql=sql+" order by zpi.pro_time asc ";
				}else if (sortSele==1&&sortBy==1) {
					sql=sql+" order by zpi.pro_time desc ";
				}else {
					sql=sql+" order by   likecount desc ";
				}
				
				
			
				
				  
				EntityManager em=entityManagerFactory.createEntityManager();
			 Query query = em.createNativeQuery(sql); 
			 Integer total = query.getResultList().size();  
		return total;
	}
	@Override
	public int updateProCanceTimeByProCode(Integer proCode) {
		// TODO Auto-generated method stub
		String sql="update   zc_project_info t set t.PRO_CANCELTIME='"+new Timestamp(
		        Calendar.getInstance().getTimeInMillis())+"', t.PRO_SH_STATUS='1' where t.PRO_CODE='"+proCode+"'";
		System.out.println(sql);
		EntityManager em=entityManagerFactory.createEntityManager();
		em.getTransaction().begin();
		Query query=em.createNativeQuery(sql);
		int flag= query.executeUpdate();
	
		em.getTransaction().commit();
		
		return 0;
	}
	
	
}
