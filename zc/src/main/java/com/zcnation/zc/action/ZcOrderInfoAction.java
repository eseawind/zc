package com.zcnation.zc.action;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.common.ThreadLocalSession;
import com.zcnation.zc.context.ZcContext;
import com.zcnation.zc.domain.CartInfo;
import com.zcnation.zc.domain.ZcOrdersInfo;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcOrdersInfoService;

@RequestMapping("/order")
@Controller
public class ZcOrderInfoAction {
	@Autowired private ZcOrdersInfoService zcOrdersInfoService;

	@RequestMapping("/order.xhtml")
	public String order(){
		return "order/order";
	}
	
	@RequestMapping("/putOrder.xhtml")
	@ResponseBody
	public String putorder(){
		Result r=new Result();
		zcOrdersInfoService.process();
		r.setSuccess(true);
		ZcUserInfo info=(ZcUserInfo)ThreadLocalSession.getLocal_session().getAttribute(ZcContext.LOGIN_USER_KEY);
		ThreadLocalSession.getLocal_session().removeAttribute(info.getUserCode()+"");
		return r.toJson();
	}
}
