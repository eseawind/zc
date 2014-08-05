/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年8月5日 下午9:42:48
 * 说明：
 **********************************************/
package com.zcnation.zc.common.util;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.apache.log4j.Logger;

/***
 * log4j日志类
 * @author xym
 *
 */
public class RootLogger {

	private static Logger logger=Logger.getLogger("logFile");
	private static Logger root=Logger.getLogger(RootLogger.class);
	
	public static void info(Object msg){
		logger.info(msg);
	}
	public static void error(Object msg){
		StringWriter sw=new StringWriter();
		if (msg instanceof Exception) {
			Exception ex=(Exception)msg;
			ex.printStackTrace(new PrintWriter(sw));
			root.error(sw);
		}else{
			root.error(msg);
		}
	}
}
