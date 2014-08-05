/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年7月30日 上午10:33:54
 * 说明：
 **********************************************/
package com.zcnation.zc.common.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;

import com.zcnation.zc.domain.EmailInfo;

/***
 * 邮箱验证
 * @author xym
 *
 */
public class ZcEmailUtil {
	private static Logger logger=Logger.getLogger(ZcEmailUtil.class);
	/***
	 * 发送邮件
	 * @param info
	 * @return
	 */
	public static boolean sendEmail(EmailInfo info){
		boolean isSend=false;
		String port=ConstantUtil.attr("zc.Email.port");
		String host=ConstantUtil.attr("zc.Email.host");
		Properties p=new Properties();
		p.put("mail.smtp.host", host);
		Session session=Session.getDefaultInstance(p, null);
		session.setDebug(true);
		try {
			MimeMessage msg=new MimeMessage(session);
			msg.setFrom(new InternetAddress(info.getFromEmail()));
			InternetAddress[] toAddress={new InternetAddress(info.getToEmail())};
			msg.setRecipients(Message.RecipientType.TO, toAddress);
			msg.setSubject(info.getSubject());
			msg.setSentDate(info.getSendTime());
			MimeBodyPart body=new MimeBodyPart();
			body.setText(info.getContent());
			
			Multipart mp=new MimeMultipart();
			mp.addBodyPart(body);
			msg.setContent(mp);
			Transport.send(msg);
		} catch (MessagingException e) {
			logger.error(e);
		}
		return isSend;
	}

}
