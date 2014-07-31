/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年7月30日 上午11:51:11
 * 说明：
 **********************************************/
package com.zcnation.zc.service;

import com.zcnation.zc.domain.EmailInfo;

/***
 * 邮件发送
 * @author xym
 *
 */
public interface AccountEmailService {

	public boolean sendMail(EmailInfo info);
}
