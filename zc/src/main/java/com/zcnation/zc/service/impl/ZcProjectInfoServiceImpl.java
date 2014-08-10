/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月28日 下午11:33:46
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.service.impl;





import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.dao.ZcProjectInfoDao;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.service.ZcProjectInfoService;

@Service(value = "zcProjectInfoService")
public class ZcProjectInfoServiceImpl implements ZcProjectInfoService{
	private Logger logger=Logger.getLogger(ZcProjectInfoServiceImpl.class);
	@Autowired private ZcProjectInfoDao zcProjectInfoDao;
	@Override
	public String save(ZcProjectInfo zcProjectInfo) {
		Result r = new Result();
		zcProjectInfoDao.save(zcProjectInfo);
				r.setSuccess(true);
			
		
		return r.toJson();
	}
	@Override
	public Page<ZcProjectInfo> queryByPage(int pageNumber, int pageSize) {
		Pageable page=new PageRequest(pageNumber, pageSize);
		Sort s=new Sort("proTime");
		
		return zcProjectInfoDao.findAll(page);
	}
	@Override
	public ZcProjectInfo queryOne(int precode) {
		return zcProjectInfoDao.findByProCode(precode);
	}

	



}
