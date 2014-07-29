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

import com.zcnation.zc.common.Result;
import com.zcnation.zc.dao.ZcUserInfoDao;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcUserInfoService;

@Service(value="zcUserInfoService")
public class ZcUserInfoServiceImpl implements ZcUserInfoService {
	@Autowired ZcUserInfoDao zcUserInfoDao;

	public ZcUserInfo queryUserInfoByPhone(ZcUserInfo zcUserInfo) {
		List<ZcUserInfo> list=zcUserInfoDao.findByUserPhone(zcUserInfo.getUserPhone());
		return (list!=null&&list.size()>0)?list.get(0):null;
	}

	@Override
	public String save(ZcUserInfo zcUserInfo) {
		Result r=new Result();
		zcUserInfoDao.save(zcUserInfo);
		r.setSuccess(true);
		return r.toJson();
	}

	@Override
	public ZcUserInfo queryUserInfoByEmail(String email) {
		List<ZcUserInfo> list=zcUserInfoDao.findByEmail(email);
		return (list!=null&&list.size()>0)?list.get(0):null;
	}

}
