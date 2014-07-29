/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月29日 下午12:07:29
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：控制用户登录
 **********************************************/
package com.zcnation.zc.common.interceptor;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zcnation.zc.common.exception.NotLoginException;
import com.zcnation.zc.context.ZcContext;

/****
 * 用户登录控制
 * @author xym
 *
 */
public class LoginInterceptor implements HandlerInterceptor {
	private Logger logger=Logger.getLogger(LoginInterceptor.class);

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		boolean flag=true;
		String url=request.getRequestURI();
		logger.info("用户请求地址URL:"+url);
		Pattern p=Pattern.compile("(.*)\\.do(.*)?");
		Matcher m=p.matcher(url);
		if (m.matches()) {
			HttpSession session=request.getSession();
			if (session.getAttribute(ZcContext.LOGIN_USER_KEY)!=null) {
				logger.debug("用户已经登录,继续执行");
				flag=true;
			}else{
				logger.debug("用户未登录");
				flag=false;
				throw new NotLoginException("用户未登录");
			}
		}
		return flag;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.debug("postHandle..."+handler.getClass());
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.debug("afterCompletion...");
		
	}

}
