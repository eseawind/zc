/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年8月1日 下午10:44:02
 * 说明：
 **********************************************/
package com.zcnation.zc.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.view.RedirectView;

public class UrlHelp {
	public static RedirectView getRedirect(HttpServletRequest request, Map<String, ?> m){
		RedirectView rv = new RedirectView(getAllUrl(request));
		if(m != null)rv.setAttributesMap(m);
		return rv;
	}
	public static RedirectView getRedirect(String _url, Map<String, ?> m){
		RedirectView rv = new RedirectView(_url);
		if(m != null)rv.setAttributesMap(m);
		return rv;
	}
	/**
	 * 返回除去路径
	 * @param request
	 * @return
	 */
	public static String getUrl(HttpServletRequest request){
		String pathall = getAllUrl(request);
		String path = request.getContextPath()+"/";
		return pathall.substring((path.length()+pathall.indexOf(path)));
	}
	/**
	 * 返回全路径
	 * @param request
	 * @return
	 */
	public static String getAllUrl(HttpServletRequest request){
		return request.getHeader("Referer");
	}
}
