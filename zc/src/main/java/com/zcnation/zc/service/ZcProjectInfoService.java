/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月28日 下午11:32:27
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.service;


import org.springframework.data.domain.Page;

import com.zcnation.zc.domain.ZcProjectInfo;


public interface ZcProjectInfoService {
	
	/****
	 * 作品发布
	 * @param zcProjectInfo
	 * @return
	 */
	public String save(ZcProjectInfo zcProjectInfo);
	
	/***
	 * 分页查询
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public Page<ZcProjectInfo> queryByPage(int pageNumber,int pageSize);
	
	/***
	 * 根据主键查询
	 * @param precode
	 * @return
	 */
	public ZcProjectInfo queryOne(int precode);

}
