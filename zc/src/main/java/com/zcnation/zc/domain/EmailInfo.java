/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年7月30日 上午10:35:49
 * 说明：
 **********************************************/
package com.zcnation.zc.domain;

import java.util.Date;

/***
 * 邮件 信息
 * @author xym
 *
 */
public class EmailInfo {
	//发送人
	private String fromEmail;
	//发送人密码
	private String fromEmailPassword;
	//接手人
	private String toEmail;
	//主题
	private String subject;
	//内容
	private String content;
	//发送时间
	private Date sendTime;
	public String getFromEmail() {
		return fromEmail;
	}
	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}
	public String getFromEmailPassword() {
		return fromEmailPassword;
	}
	public void setFromEmailPassword(String fromEmailPassword) {
		this.fromEmailPassword = fromEmailPassword;
	}
	public String getToEmail() {
		return toEmail;
	}
	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	
}
