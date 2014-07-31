/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月28日 下午11:33:46
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.common.exception.NotValidateCorrectException;
import com.zcnation.zc.dao.ZcUserInfoDao;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcUserInfoService;

@Service(value = "zcUserInfoService")
public class ZcUserInfoServiceImpl implements ZcUserInfoService {
	@Autowired private ZcUserInfoDao zcUserInfoDao;

	public String save(ZcUserInfo userinfo, String passwordagin, String reqIp) {
		Result r = new Result();
		// 后台验证
		validate(userinfo, passwordagin);
		List<ZcUserInfo> list = zcUserInfoDao.findByEmail(userinfo.getEmail());
		if (list != null && list.size() > 0) {
			throw new NotValidateCorrectException("该邮箱已注册");
		} else {
			list = zcUserInfoDao.findByUserPhone(userinfo.getUserPhone());
			if (list != null && list.size() > 0) {
				throw new NotValidateCorrectException("用户手机已注册");
			} else {
				userinfo.setRegIp(reqIp);
				zcUserInfoDao.save(userinfo);
				r.setSuccess(true);
			}
		}
		return r.toJson();
	}

	/****
	 * 用户注册验证
	 * 
	 * @param userinfo
	 */
	private void validate(ZcUserInfo userinfo, String passwordagin) {
		String emailRegex = "^[a-z0-9_\\-]+(\\.[_a-z0-9\\-]+)*@([_a-z0-9\\-]+\\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$";
		String phoneRegex = "^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$";
		if (StringUtils.isBlank(userinfo.getEmail())) {
			throw new NotValidateCorrectException("邮箱不能为空");
		} else {
			if (!userinfo.getEmail().matches(emailRegex)) {
				throw new NotValidateCorrectException("邮箱格式不正确");
			}
		}
		if (StringUtils.isBlank(userinfo.getUserPhone())) {
			throw new NotValidateCorrectException("手机不能为空");
		} else {
			if (!userinfo.getUserPhone().matches(phoneRegex)) {
				throw new NotValidateCorrectException("手机格式不正确");
			}
		}
		if (StringUtils.isBlank(userinfo.getPassword())) {
			throw new NotValidateCorrectException("密码不能为空");
		} else {
			if (StringUtils.length(userinfo.getPassword()) < 6||StringUtils.length(userinfo.getPassword())>20) {
				throw new NotValidateCorrectException("密码必须6-20个字符");
			}
			if (!StringUtils.equals(userinfo.getPassword(), passwordagin)) {
				throw new NotValidateCorrectException("两次密码输入不一致");
			}
		}
		if (StringUtils.isBlank(userinfo.getUserName())) {
			throw new NotValidateCorrectException("用户名不能为空");
		}
	}


}
