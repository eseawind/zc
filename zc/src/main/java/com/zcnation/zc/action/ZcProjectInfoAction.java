package com.zcnation.zc.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcProjectInfoService;
import com.zcnation.zc.service.ZcUserInfoService;

@Controller
@RequestMapping("/projectinfo")
public class ZcProjectInfoAction {
	@Autowired private ZcProjectInfoService zcProjectInfoService;
	
	@RequestMapping("/project_add.html")
	public String to_add(HttpServletRequest request) {
		return "projectinfo/project_add";
	}
	
	@RequestMapping("/project_{detailid}.html")
	public String to_show(@PathVariable("detailid") String detailId,HttpServletRequest request){
		System.out.println("detailid:"+detailId);
		request.setAttribute("zc_title", "我是最好的设计师"+detailId);
		return "projectinfo/project_show";
	}
 
	
	@RequestMapping("/beginAdd.html")
	@ResponseBody
	public String beginRegister(HttpServletRequest request,@ModelAttribute ZcProjectInfo zcProjectInfo){
		return zcProjectInfoService.save(zcProjectInfo);
	}
	
}
