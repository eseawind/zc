/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月28日 下午11:39:12
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.service;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit38.AbstractJUnit38SpringContextTests;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.zcnation.zc.domain.ZcUserInfo;

@ContextConfiguration(locations="classpath:config/applicationContext*.xml")
@TransactionConfiguration(defaultRollback=true)
public class ZcUserInfoServiceTest extends AbstractJUnit38SpringContextTests{

	public void testFindPhone(){
		/*ZcUserInfoService service=applicationContext.getBean("zcUserInfoService", ZcUserInfoService.class);
		ZcUserInfo z=new ZcUserInfo(); 
		z.setUserPhone("13586552493");
		ZcUserInfo json=service.queryUserInfoByPhone(z);
		System.out.println(json);*/
	}
}
