/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月29日 下午12:37:20
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.common.exception;

/***
 * 未登录异常
 * @author xym
 *
 */
public class NotLoginException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public NotLoginException(String msg) {
		super(msg);
	}
}
