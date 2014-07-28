/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014-7-24 12:22:09
 * 说明：
 **********************************************/

package com.zcnation.zc.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexAction {
	private Logger logger=Logger.getLogger(IndexAction.class);
	
	@RequestMapping("/index.html")
	public String to_index(HttpServletRequest request){
		//List<Map<String, String>> list=new ArrayList<Map<String,String>>();
		List<String> list=new ArrayList<String>();
		for (int i = 0; i < 20; i++) {
			list.add("我是最好的设计师"+i);
		}
		request.setAttribute("reqData", list);
		System.out.println("test");
		logger.info("首页测试.///");
		return "index";
	}

}
