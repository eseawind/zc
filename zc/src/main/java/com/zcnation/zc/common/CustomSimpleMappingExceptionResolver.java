/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月29日 下午12:30:15
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.common;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import com.zcnation.zc.common.exception.NotLoginException;
import com.zcnation.zc.common.exception.NotValidateCorrectException;
import com.zcnation.zc.common.util.RootLogger;

public class CustomSimpleMappingExceptionResolver extends SimpleMappingExceptionResolver {

	protected ModelAndView doResolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		String viewName=determineViewName(ex, request);
		Result r=new Result();
		if (viewName!=null) {
			if (StringUtils.indexOf(request.getHeader("Accept"), "application/json") > -1 || StringUtils.indexOf(request.getHeader("X-Requested-With"), "XMLHttpRequest") > -1) {// 如果不是异步请求
				RootLogger.info("用户json请求");
				try {
					//用户未登录
					if (ex instanceof NotLoginException) {
							response.getWriter().write("用户未登录");
							//用户未登录
							//响应到登录页面
							Integer codeStatus=determineStatusCode(request, viewName);
							RootLogger.info("用户未登录，跳转>>"+viewName);
							if (codeStatus!=null) {
								applyStatusCodeIfPossible(request, response, codeStatus);
							}
							//用户未登录
							response.setStatus(HttpServletResponse.SC_MULTIPLE_CHOICES);
							request.setAttribute("error", ex.getMessage());
							return getModelAndView(viewName, ex,request);
					}else if(ex instanceof NotValidateCorrectException){//验证异常
						r.setSuccess(false);
						r.getErrorMsgs().add(ex.getMessage());
						response.setStatus(HttpServletResponse.SC_OK);
						response.setContentType("text/html;charset=UTF-8");
						response.getWriter().write(r.toJson());
					}else{
						System.out.println("响应内容：");
						ex.printStackTrace();
						r.setSuccess(false);
						r.getErrorMsgs().add(ex.getMessage());
						//r.setReturnValue(ex.getMessage());
						response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
						response.setContentType("text/html;charset=UTF-8");
						response.getWriter().write(r.toJson());
					}
				} catch (Exception e) {
					RootLogger.error(e);
					//logger.error(e);
				}
				RootLogger.info("异常："+ex.getMessage());
				return new ModelAndView();
			}else{
				Integer codeStatus=determineStatusCode(request, viewName);
				RootLogger.info("jsp格式返回："+viewName+" code:"+codeStatus);
				if (codeStatus!=null) {
					applyStatusCodeIfPossible(request, response, codeStatus);
				}
				System.out.println("错误："+ex.getMessage());
				request.setAttribute("error", ex.getMessage());
				return getModelAndView(viewName, ex,request);
			}
		}else{ 
			return null;
		}
	}
}
