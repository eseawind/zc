/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月28日 下午11:33:46
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.service.impl;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.zcnation.zc.common.Result;




import com.zcnation.zc.dao.ZcUserInfosDao;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcUserInfos;
import com.zcnation.zc.service.ZcUserInfosService;

@Service(value = "zcUserInfosService")
public class ZcUserInfosServiceImpl implements ZcUserInfosService {
	@Autowired private ZcUserInfosDao zcUserInfosDao;

	public String save(ZcUserInfos zcUserInfos) {
		Result r = new Result();
	
	
		zcUserInfosDao.save(zcUserInfos);
				r.setSuccess(true);
		
		return r.toJson();
	}

	
	@Override
	public List<ZcUserInfos> queyAll() {
Sort s=new Sort("userCode");
		
		return zcUserInfosDao.findAll();
	
	}


	@Override
	public void deleteByUserCode(int userCode) {
		// TODO Auto-generated method stub
		zcUserInfosDao.deleteByUserCode(userCode);
	}


	@Override
	public ZcUserInfos queryOne(int usercode) {
		return zcUserInfosDao.findByUserCode(usercode);
	}


	@Override
	public void delete(ZcUserInfos zcUserInfos) {
		zcUserInfosDao.delete(zcUserInfos);
		
	}

	
}
