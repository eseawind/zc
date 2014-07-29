/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月29日 上午11:54:56
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.common.exception;

public class NotRollbackException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public NotRollbackException() {
		// TODO Auto-generated constructor stub
	}
	
	public NotRollbackException(String msg){
		super(msg);
	}
}
