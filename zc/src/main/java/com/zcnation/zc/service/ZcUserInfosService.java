/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月28日 下午11:32:27
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.service;

import java.util.List;


import com.zcnation.zc.domain.ZcUserInfos;


public interface ZcUserInfosService {
	
	/****
	 * 地址添加
	 * @param zcUserInfos
	
	 * @return
	 */
	public String save(ZcUserInfos zcUserInfos);
	
	 public List<ZcUserInfos> queyAll();
	 
	 public void deleteByUserCode(int userCode);
	 public void delete(ZcUserInfos zcUserInfos);
	 
	 public ZcUserInfos queryOne(int usercode);
	 
	 
	 public List<ZcUserInfos> queyByUserCode(Integer userCode);

}
