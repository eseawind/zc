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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexAction {
	@RequestMapping("/index.html")
	public String to_index(HttpServletRequest request){
		List<Map<String, String>> list=new ArrayList<Map<String,String>>();
		Map<String, String> m1=new HashMap<String, String>();
		Map<String, String> m2=new HashMap<String, String>();
		Map<String, String> m3=new HashMap<String, String>();
		m1.put("username", "张三");
		m1.put("address", "张家界1号");
		m2.put("username", "张三2");
		m2.put("address", "张家界2号");
		m3.put("username", "张三3");
		m3.put("address", "张家界3号");
		list.add(m1);
		list.add(m2);
		list.add(m3);
		request.setAttribute("reqData", list);
		System.out.println("test");
		return "index";
	}

}
