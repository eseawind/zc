/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年8月6日 下午9:33:59
 * 说明：
 **********************************************/
package com.zcnation.zc.dao;

import org.springframework.data.repository.Repository;

import com.zcnation.zc.domain.ZcResourceInfo;

/***
 * 资源dao层
 * @author xym
 *
 */
public interface ZcResourceInfoDao extends Repository<ZcResourceInfo, Integer>{
	
	public ZcResourceInfo save(ZcResourceInfo resourceInfo);

}
