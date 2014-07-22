package com.zcnation.zc.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexAction {
	@RequestMapping("/index.html")
	public String to_index(){
		return "index";
	}

}
