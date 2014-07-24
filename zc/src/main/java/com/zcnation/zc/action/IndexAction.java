/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014-7-24 12:22:09
 * 说明：
 **********************************************/

package com.zcnation.zc.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexAction {
	@RequestMapping("/index.html")
	public String to_index(){
		System.out.println("test");
		return "index";
	}

}
