package com.zcnation.zc.dao;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.zcnation.zc.domain.ZcProjectLike;




public interface ZcProjectLikeDao extends JpaRepository<ZcProjectLike, Integer>,CrudRepository<ZcProjectLike,Integer> {
	
	 
	
	 public List<ZcProjectLike> findByUserCode(Integer userCode);
	
	 public void deleteByLikeCode(int likeCode);
	 
	 public void delete(ZcProjectLike zcProjectLike);
	 public ZcProjectLike findByLikeCode(int likeCode);
}
