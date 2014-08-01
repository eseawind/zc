/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年8月1日 下午8:50:24
 * 说明：
 **********************************************/
package com.zcnation.zc.common;

import javax.servlet.http.HttpSession;

import com.zcnation.zc.common.exception.NotLoginException;

/***
 * 本地存储session类
 * @author xym
 *
 */
public class ThreadLocalSession {
	
	private static ThreadLocal<HttpSession> local_session=new ThreadLocal<HttpSession>();
	
	private ThreadLocalSession(){}
	
	public static HttpSession getLocal_session(){
		HttpSession session=local_session.get();
		if (session==null) {
			throw new NotLoginException("用户未登录");
		}
		return session;
	}

	public static void setLocal_session(HttpSession session) {
		local_session.set(session);
	}
	
	

}
