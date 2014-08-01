package com.zcnation.zc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.common.ThreadLocalSession;
import com.zcnation.zc.common.exception.NotValidateCorrectException;
import com.zcnation.zc.context.ZcContext;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcUserInfoService;
import com.zcnation.zc.util.UrlHelp;

@Controller
@RequestMapping("/userinfo")
public class ZcUserInfoAction {
	
	
	@Autowired private ZcUserInfoService zcUserInfoService;

	@RequestMapping("/register.html")
	public String to_register(HttpServletRequest request) {
		return "userinfo/user_register";
	}
	
	
	@RequestMapping("/login.html")
	public String to_login(HttpServletRequest request) {
		return "userinfo/user_login";
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
}
