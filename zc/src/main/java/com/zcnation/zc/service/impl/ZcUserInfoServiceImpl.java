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
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.common.ThreadLocalSession;
import com.zcnation.zc.common.exception.NotValidateCorrectException;
import com.zcnation.zc.context.ZcContext;
import com.zcnation.zc.dao.ZcUserInfoDao;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcUserInfoService;

@Service(value = "zcUserInfoService")
public class ZcUserInfoServiceImpl implements ZcUserInfoService {
	private Logger logger=Logger.getLogger(ZcUserInfoServiceImpl.class);
	@Autowired private ZcUserInfoDao zcUserInfoDao;

	public String save(ZcUserInfo userinfo, String passwordagin, String reqIp) {
		Result r = new Result();
		// 后台验证
		validate(userinfo, passwordagin);
		if (zcUserInfoDao.countUserName(userinfo.getUserName())>0) {
			throw new NotValidateCorrectException("该用户名已注册");
		}
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

	@Override
	public Result login(String userName, String password) {
		Result r=new Result();
		logger.info("登录用户名："+userName+" 登录密码："+password);
		if (zcUserInfoDao.countByUerOrEmailOrPhone(userName, userName, userName)>0) {
			List<ZcUserInfo> loginLst=zcUserInfoDao.findByUserNameAndPassword(userName, password);
			if (loginLst!=null&&loginLst.size()>0) {
				//登录成功
				r.setSuccess(true);
				r.setReturnValue(loginLst.get(0));
			}else{
				loginLst=zcUserInfoDao.findByEmailAndPassword(userName, password);
				if (loginLst!=null&&loginLst.size()>0) {
					r.setSuccess(true);
					r.setReturnValue(loginLst.get(0));
				}else{
					loginLst=zcUserInfoDao.findByUserPhoneAndPassword(userName, password);
					if (loginLst!=null&&loginLst.size()>0) {
						r.setSuccess(true);
						r.setReturnValue(loginLst.get(0));
					}else{
						r.setSuccess(false);
						r.getErrorMsgs().add("用户名或密码错误");
					}
				}
			}
		}else{
			r.setSuccess(false);
			r.getErrorMsgs().add("用户不存在");
		}
		return r;
	}

	@Override
	public int update(ZcUserInfo info) {
		int dd=0;

		//zcUserInfoDao.update(userName,userCode);
		zcUserInfoDao.save(info);
		dd=1;
		return dd;
	}

	@Override
	public int gengxinByUserCode(int userCode) {
		// TODO Auto-generated method stub
	  return	zcUserInfoDao.gengxinByUserCode(userCode);
		
	}

}
