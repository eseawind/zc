/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年8月1日 下午8:58:56
 * 说明：
 **********************************************/
package com.zcnation.zc.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.zcnation.zc.common.ThreadLocalSession;

public class GlobalFilter implements Filter{

	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session=req.getSession();
		ThreadLocalSession.setLocal_session(session);
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		HttpSession session=ThreadLocalSession.getLocal_session();
		if (session!=null) {
			session.invalidate();
		}
	}

}
