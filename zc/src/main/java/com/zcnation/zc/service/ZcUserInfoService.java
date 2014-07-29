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
	 * 用户注册
	 * @param zcUserInfo
	 * @param agaPass
	 * @param reqIp
	 * @return
	 */
	public String save(ZcUserInfo zcUserInfo,String agaPass,String reqIp);

}
