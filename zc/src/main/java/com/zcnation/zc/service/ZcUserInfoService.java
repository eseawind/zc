/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月28日 下午11:32:27
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.service;

import java.util.List;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.domain.ZcUserInfo;

public interface ZcUserInfoService {
	
	/****
	 * 用户注册
	 * @param zcUserInfo
	 * @param agaPass
	 * @param reqIp
	 * @return
	 */
	public String save(ZcUserInfo zcUserInfo,String agaPass,String reqIp);
	
	/***
	 * 用户登录
	 * @param userName  用户名/邮箱/手机号
	 * @param password  密码
	 * @return
	 */
	public Result login(String userName,String password);
	
	/****
	 * 用户注册
	 * @param zcUserInfo
	 * @return
	 */
	public int update(ZcUserInfo info);
	
	
	/****
	 * 用户注册
	 * @param zcUserInfo
	 * @return
	 */
	public int gengxinByUserCode(int userCode);
	
	public ZcUserInfo queryOne(int userCode);
	
	
	
	 public List<ZcUserInfo> queryByUserPhone(String userPhone);
	 public List<ZcUserInfo> queryByEmail(String email);
	 
	 
 public List<ZcUserInfo> queryByUserPhoneAndUserCodeNotIn(String userPhone,Integer userCode);
	 
	 public List<ZcUserInfo> queryByEmailAndUserCodeNotIn(String email,Integer userCode);

	 public ZcUserInfo queryByUserName(String userName);

}
