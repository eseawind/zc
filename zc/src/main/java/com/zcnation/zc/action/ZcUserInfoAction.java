package com.zcnation.zc.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcUserInfoService;

@Controller
public class ZcUserInfoAction {
	private ZcUserInfo zcUserInfo;
	private ZcUserInfoService zcUserInfoService;

	@RequestMapping("/zcuserinfo/zcuserinfo_register.html")
	public String to_register(HttpServletRequest request) {
		System.out.println("ccccccc");
		return "/zcuserinfo/zcuserinfo_register";
	}

	public String to_save() {
		zcUserInfoService.save(zcUserInfo);
		return "/zcuserinfo/zcuserinfo_register";

	}

}
