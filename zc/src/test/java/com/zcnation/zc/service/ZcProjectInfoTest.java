/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年8月9日 下午1:28:50
 * 说明：
 **********************************************/
package com.zcnation.zc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit38.AbstractJUnit38SpringContextTests;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.zcnation.zc.dao.ZcProjectInfoDao;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcResourceInfo;

@ContextConfiguration(locations={"classpath:config/applicationContext*.xml"})
@TransactionConfiguration(defaultRollback=true)
public class ZcProjectInfoTest  extends AbstractJUnit38SpringContextTests{

	public void testFindPage(){
		ZcProjectInfoDao prodao=applicationContext.getBean(ZcProjectInfoDao.class);
		ZcProjectInfo pinfo=prodao.findByProCode(1);
		ZcResourceInfo pr= pinfo.getResourceInfo();
		System.out.println("查询：");
		System.out.println(pinfo.getProName());
		System.out.println(pinfo.getResourceInfo().getResourceName());
		System.out.println(pr.getResourceUrl());
		/***Pageable page=new PageRequest(1, 8);
		Page<Object> ojbs=prodao.findAll(page);
		System.out.println(ojbs.getNumber());***/
		
	}
	public void testPage(){
		ZcProjectInfoDao prodao=applicationContext.getBean(ZcProjectInfoDao.class);
		Sort s=new Sort(Direction.DESC, "proTime");
		Pageable p=new PageRequest(0, 8,s);
		Page<ZcProjectInfo> ps=prodao.findAll(p);
		System.out.println(ps.getTotalPages());
		System.out.println(ps.getNumber());
		List<ZcProjectInfo> list=ps.getContent();
		for (ZcProjectInfo pr : list) {
			
			System.out.println(pr.getProName()+">>>"+pr.getProTime());
		}
		System.out.println(ps.getContent().size());
	}
}
