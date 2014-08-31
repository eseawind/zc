package com.zcnation.zc.dao;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;
import com.zcnation.zc.domain.ZcAppraise;

public interface ZcAppraiseDao extends Repository<ZcAppraise, Integer>,CrudRepository<ZcAppraise,Integer>{

	
	 public List<ZcAppraise> findByZcProjectInfoProCode(Integer proCode);
	 public ZcAppraise save(ZcAppraise zcAppraise);
}
