package com.zcnation.zc.service;

import java.util.List;

import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcProjectLike;


public interface ZcProjectLikeNativeService {
	
	public List<ZcProjectLike> queryByUserCodeAndproCode(Integer userCode,Integer proCode);
	
	
}