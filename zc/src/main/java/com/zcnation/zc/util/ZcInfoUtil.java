/*************************************************************
 * �������ۿƼ��������޹�˾  @2014
 * ����:xiaoymin@foxmail.com Ф����
 * ʱ��:2014-7-21 22:37:34
 * ������
 *************************************************************/

package com.zcnation.zc.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcUserInfoService;

public class ZcInfoUtil {

	public static void main(String[] args) {
		System.out.println("sdsd");
		ApplicationContext cx=new ClassPathXmlApplicationContext("classpath:applicationContext*.xml");
		ZcUserInfoService obj=cx.getBean("zcUserInfoService",ZcUserInfoService.class);
		ZcUserInfo zcUserInfo=new ZcUserInfo();
		zcUserInfo.setUserPhone("13586552493");
		System.out.println(obj.queryUserInfoByPhone(zcUserInfo));
	}
}
