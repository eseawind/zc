/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月28日 下午11:32:27
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.service;

import com.zcnation.zc.domain.ZcUserInfo;

public interface ZcUserInfoService {
	
	/****
	 * 根据电话查找用户
	 * @param zcUserInfo
	 * @return
	 */
	public ZcUserInfo queryUserInfoByPhone(ZcUserInfo zcUserInfo);
	
	/****
	 * 邮箱查询
	 * @param email
	 * @return
	 */
	public ZcUserInfo queryUserInfoByEmail(String email);
	/****
	 * 注册
	 * @param zcUserInfo
	 * @return
	 */
	public String save(ZcUserInfo zcUserInfo);

}
