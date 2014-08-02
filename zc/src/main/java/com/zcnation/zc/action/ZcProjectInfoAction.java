package com.zcnation.zc.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcUserInfoService;

@Controller
@RequestMapping("/projectinfo")
public class ZcProjectInfoAction {
	
	@RequestMapping("/project_add.html")
	public String to_add(HttpServletRequest request) {
		return "projectinfo/project_add";
	}
	
	
	@RequestMapping("/project_show.html")
	public String to_show(HttpServletRequest request) {
		return "projectinfo/project_show";
	}
	
}
