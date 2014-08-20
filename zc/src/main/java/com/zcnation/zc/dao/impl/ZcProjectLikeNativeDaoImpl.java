package com.zcnation.zc.dao.impl;

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
import com.zcnation.zc.dao.ZcProjectLikeNativeDao;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcProjectLike;

@Repository("zcProjectLikeNativeDao")
public class ZcProjectLikeNativeDaoImpl implements ZcProjectLikeNativeDao{

	@Autowired private EntityManagerFactory entityManagerFactory;

	@Override
	public List<ZcProjectLike> findByUserCodeAndproCode(Integer userCode,
			Integer proCode) {
		// TODO Auto-generated method stub
		String sql=" select * from  zc_project_like  zpl where zpl.user_code='"+userCode+"' and zpl.pro_code='"+proCode+"'";
		
			
				EntityManager em=entityManagerFactory.createEntityManager();
				Query query=em.createNativeQuery(sql);
				List list=query.getResultList();
				
				
		
		return list;
	}
	
	
}
