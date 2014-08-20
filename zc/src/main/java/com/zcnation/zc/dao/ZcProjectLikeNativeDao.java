package com.zcnation.zc.dao;




import java.util.List;

import com.zcnation.zc.domain.ZcProjectLike;


public interface ZcProjectLikeNativeDao {
	
	public List<ZcProjectLike> findByUserCodeAndproCode(Integer userCode,Integer proCode);
	
	
	

}