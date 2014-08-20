package com.zcnation.zc.dao;



import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;


import com.zcnation.zc.domain.ZcProjectInfo;



public interface ZcProjectInfoDao extends JpaRepository<ZcProjectInfo, Integer>,PagingAndSortingRepository<ZcProjectInfo, Integer> {
	/**
	 * 添加作品
	 * @param zcProjectInfo
	 * @return
	 */
	 public  ZcProjectInfo save(ZcProjectInfo zcProjectInfo);
	 
	 public  ZcProjectInfo findByProCode(int proCode);
	 
	 public Page<ZcProjectInfo> findAll(Pageable page);
	 
	 public List<ZcProjectInfo> findByUserCodeAndProNameLike(Integer userCode,String proName);
	
	 
}
