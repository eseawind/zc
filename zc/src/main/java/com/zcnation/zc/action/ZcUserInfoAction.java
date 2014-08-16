package com.zcnation.zc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.common.ThreadLocalSession;
import com.zcnation.zc.common.util.UrlHelp;
import com.zcnation.zc.context.ZcContext;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcUserInfoNativeService;
import com.zcnation.zc.service.ZcUserInfoService;

@Controller
@RequestMapping("/userinfo")
public class ZcUserInfoAction {
	
	
	@Autowired private ZcUserInfoService zcUserInfoService;
	@Autowired private ZcUserInfoNativeService zcUserInfoNativeService;

	@RequestMapping("/register.html")
	public String to_register(HttpServletRequest request) {
		return "userinfo/user_register";
	}
	
	
	
	
	@RequestMapping("/login.html")
	public String to_login(HttpServletRequest request) {
		return "userinfo/user_login";
	} 
	@RequestMapping("/show.xhtml")
	public String to_info(HttpServletRequest request) {
		return "userinfo/user_show";
	}
	
	@RequestMapping("/update_password.xhtml")
	public String to_update(HttpServletRequest request) {
		return "userinfo/user_update_password";
	}
	
	
	@RequestMapping("/update.xhtml")
	public String to_update_password(HttpServletRequest request) {
		return "userinfo/user_update";
	}
	
	 
	@RequestMapping("/beginRegister.html")
	@ResponseBody
	public String beginRegister(HttpServletRequest request,@ModelAttribute ZcUserInfo userinfo,@RequestParam(value="passwordagin") String passwordagin){
		return zcUserInfoService.save(userinfo, passwordagin, request.getRemoteAddr());
	}
	
	@RequestMapping("/beginLogin.html")
	@ResponseBody
	public String beginLogin(HttpServletRequest request,@RequestParam(value="userName") String userName,@RequestParam(value="password") String password){
		Result r=zcUserInfoService.login(userName, password);
		if (r.isSuccess()) {
			System.out.println("登录成功");
			ThreadLocalSession.getLocal_session().setAttribute(ZcContext.LOGIN_USER_KEY, (ZcUserInfo)r.getReturnValue());
		}
		return r.toJson();
	}
	@RequestMapping("/beginLogins.html")
	public ModelAndView beginLogins(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="userName") String userName,@RequestParam(value="password") String password){
		Result r=zcUserInfoService.login(userName, password);
		if (r.isSuccess()) {
			System.out.println("登录成功");
			ThreadLocalSession.getLocal_session().setAttribute(ZcContext.LOGIN_USER_KEY, (ZcUserInfo)r.getReturnValue());
			//return new ModelAndView("userinfo/user_login");
			return new ModelAndView(UrlHelp.getRedirect("../index.html", null));
		}
		response.setContentType("tex/html;charset=utf-8");
		try {
			response.getWriter().write(r.toJson());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping("/exit.html")
	public String exitLogin(HttpServletRequest request){
		ThreadLocalSession.getLocal_session().removeAttribute(ZcContext.LOGIN_USER_KEY);
		return "redirect:../index.html";
	}
	
	@RequestMapping("/beginUpdate.xhtml")
	@ResponseBody
	public String beginUpdate(HttpServletRequest request,@ModelAttribute ZcUserInfo zcUserInfo,@RequestParam(value="userName") String userName){
		Result r=new Result();
		//zcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		//zcUserInfoService.update(userName,zcUserInfo.getUserCode());
		ZcUserInfo sezcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		//用户主键id不存在页面隐藏域中，防止被看见
		zcUserInfo.setUserCode(sezcUserInfo.getUserCode());
		zcUserInfo.setPassword(sezcUserInfo.getPassword());
		zcUserInfo.setRegIp(sezcUserInfo.getRegIp());
		zcUserInfo.setRegTime(sezcUserInfo.getRegTime());
		System.out.println("用户编号："+zcUserInfo.getUserCode());
		int a=zcUserInfoService.update(zcUserInfo);
		if (a>0) {
			r.setSuccess(true);
			ThreadLocalSession.getLocal_session().removeAttribute(ZcContext.LOGIN_USER_KEY);
			ThreadLocalSession.getLocal_session().setAttribute(ZcContext.LOGIN_USER_KEY, zcUserInfo);
		}
		return r.toJson();
	}
	
	
	@RequestMapping("/beginUpdatePssword.xhtml")
	@ResponseBody
	public String beginUpdatePssword(HttpServletRequest request,@ModelAttribute ZcUserInfo zcUserInfo,@RequestParam(value="passwordagin") String passwordagin){
		Result r=new Result();
		//zcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		//zcUserInfoService.update(userName,zcUserInfo.getUserCode());
		
		ZcUserInfo sezcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		int flag=zcUserInfoNativeService.updateByUserCode(sezcUserInfo.getUserCode(), passwordagin);
		r.setSuccess(flag>0?true:false);
		System.out.println("flag"+flag);
		//zcUserInfoService.gengxinByUserCode(sezcUserInfo.getUserCode());
		//用户主键id不存在页面隐藏域中，防止被看见
//		zcUserInfo.setUserCode(sezcUserInfo.getUserCode());
//		System.out.println();
//		zcUserInfo.setPassword(passwordagin);
//		zcUserInfo.setRegIp(sezcUserInfo.getRegIp());
//		zcUserInfo.setRegTime(sezcUserInfo.getRegTime());
//		System.out.println("用户编号："+zcUserInfo.getUserCode());
//		int a=zcUserInfoService.update(zcUserInfo);
//		if (a>0) {
//			r.setSuccess(true);
//			ThreadLocalSession.getLocal_session().removeAttribute(ZcContext.LOGIN_USER_KEY);
//			ThreadLocalSession.getLocal_session().setAttribute(ZcContext.LOGIN_USER_KEY, zcUserInfo);
//		}
		return r.toJson();
	}
	
}
