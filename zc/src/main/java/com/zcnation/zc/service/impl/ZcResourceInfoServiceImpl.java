/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年8月6日 下午9:35:57
 * 说明：
 **********************************************/
package com.zcnation.zc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.dao.ZcResourceInfoDao;
import com.zcnation.zc.domain.ZcResourceInfo;
import com.zcnation.zc.service.ZcResourceInfoService;

@Service("zcResourceInfoService")
public class ZcResourceInfoServiceImpl implements ZcResourceInfoService {
	@Autowired private ZcResourceInfoDao zcResourceInfoDao;

	public ZcResourceInfo saveResourceInfo(ZcResourceInfo info) {
		return zcResourceInfoDao.save(info);
	}

}
