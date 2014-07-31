package com.zcnation.zc.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zcnation.zc.common.exception.NotValidateCorrectException;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcUserInfoService;

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
}
