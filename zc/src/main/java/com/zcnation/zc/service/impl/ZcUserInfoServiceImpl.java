/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月28日 下午11:33:46
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.zcnation.zc.dao.ZcUserInfoDao;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcUserInfoService;

@Service(value="zcUserInfoService")
public class ZcUserInfoServiceImpl implements ZcUserInfoService {
	@Autowired ZcUserInfoDao zcUserInfoDao;

	public String queryUserInfoByPhone(ZcUserInfo zcUserInfo) {
		List<ZcUserInfo> list=zcUserInfoDao.findByUserPhone(zcUserInfo.getUserPhone());
		Gson g=new Gson();
		return g.toJson(list);
	}

}
