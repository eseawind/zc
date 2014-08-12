package com.zcnation.zc.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zcnation.zc.dao.TestDao;

@Repository("testDao")
public class TestDaoImpl implements TestDao {
	@Autowired private EntityManagerFactory entityManagerFactory;
	public void query() {
		String sql="select t.PRO_NAME,f.RESOURCE_NAME from zc_project_info t left join zc_resource_info f on t.RESOURCE_CODE=f.RESOURCE_CODE ";
		EntityManager em=entityManagerFactory.createEntityManager();
		Query query=em.createNativeQuery(sql);
		List list=query.getResultList();
		System.out.println("查询大小："+list.size());
		for (Object object : list) {
			//这个object应该是个数组
			Object[] oj=(Object[])object;
			System.out.println("项目名称："+oj[0]+" 资源名称："+oj[1]);
		}
	}

}
