/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年7月31日 下午7:22:45
 * 说明：
 **********************************************/
package com.zcnation.zc.common.exception;

/***
 * 验证不通过异常
 * @author xym
 *
 */
public class NotValidateCorrectException extends RuntimeException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public NotValidateCorrectException(String msg) {
		super(msg);
	}
	

}
