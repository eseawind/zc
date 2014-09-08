package com.zcnation.zc.action;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;






import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zcnation.zc.common.util.RootLogger;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcUserInfos;
import com.zcnation.zc.service.ZcUserInfosService;

@Controller
@RequestMapping("/userinfos")
public class ZcUserInfosAction {
	
	@Autowired private ZcUserInfosService zcUserInfosService;
	
	
	@RequestMapping("/address.xhtml")
	public String to_address(HttpServletRequest request) {
		List<ZcUserInfos> list=new ArrayList<ZcUserInfos>();
		list=zcUserInfosService.queyAll();
		request.setAttribute("userInfos", list);
		System.out.println(list.size());
		return "userinfos/user_address";
	}
	
	
	@RequestMapping("/address_add.xhtml")
	public String to_add(HttpServletRequest request) {
		return "userinfos/address_add";
	}
	

	
	@RequestMapping("/beginAdd.html")
	@ResponseBody
	public String beginRegister(HttpServletRequest request,@ModelAttribute ZcUserInfos zcUserInfos){
		return zcUserInfosService.save(zcUserInfos);
	}
	
	
	
	
	@RequestMapping("/address_{userCode}.xhtml")
	public String to_show(@PathVariable("userCode") String userCode,
			HttpServletRequest request) {
		
		try {
			
			ZcUserInfos zcUserInfos= zcUserInfosService.queryOne(Integer.parseInt(userCode));
			zcUserInfosService.delete(zcUserInfos);
			
		} catch (Exception e) {
			RootLogger.error(e);
		}
		
		return "redirect:../userinfos/address.xhtml";
		
	}

	
}
