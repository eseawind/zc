package com.zcnation.zc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.dao.ZcProjectLikeDao;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcProjectLike;
import com.zcnation.zc.service.ZcProjecLikeService;
@Service(value = "zcProjecLikeService")
public class ZcProjecLikeServiceImpl implements ZcProjecLikeService {
	@Autowired private ZcProjectLikeDao zcProjectLikeDao;
	@Override
	public List<ZcProjectLike> queryByUserCode(Integer userCode) {
		Sort s=new Sort("likeCode");
		
		return zcProjectLikeDao.findByUserCode(userCode);
	}
	@Override
	public void deleteByLikeCode(int likeCode) {
		// TODO Auto-generated method stub
		zcProjectLikeDao.deleteByLikeCode(likeCode);
	}
	@Override
	public void delete(ZcProjectLike zcProjectLike) {
		// TODO Auto-generated method stub
		zcProjectLikeDao.delete(zcProjectLike);
		
	}
	@Override
	public ZcProjectLike queryOne(int likeCode) {
		// TODO Auto-generated method stub
		return zcProjectLikeDao.findByLikeCode(likeCode);
	}
	@Override
	public String save(ZcProjectLike zcProjectLike) {
		// TODO Auto-generated method stub
		Result r = new Result();
		zcProjectLikeDao.save(zcProjectLike);
				r.setSuccess(true);
			
		
		return r.toJson();
		
	}
	@Override
	public ZcProjectLike queryByUserCodeAndZcProjectInfo(Integer userCode,ZcProjectInfo zcProjectInfo ) {
		// TODO Auto-generated method stub
		return zcProjectLikeDao.findByUserCodeAndZcProjectInfo(userCode, zcProjectInfo);
	}

}
