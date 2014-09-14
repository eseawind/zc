package com.zcnation.zc.action;


import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;









import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.common.ThreadLocalSession;
import com.zcnation.zc.common.util.RootLogger;
import com.zcnation.zc.context.ZcContext;
import com.zcnation.zc.domain.CartInfo;
import com.zcnation.zc.domain.ZcAppraise;
import com.zcnation.zc.domain.ZcOrderDetail;
import com.zcnation.zc.domain.ZcOrdersInfo;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcProjectLike;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.domain.ZcUserInfos;
import com.zcnation.zc.service.ZcOrderDetailNativeService;
import com.zcnation.zc.service.ZcOrdersInfoService;
import com.zcnation.zc.service.ZcOrdesInfoNativeService;
import com.zcnation.zc.service.ZcUserInfosService;

@RequestMapping("/order")
@Controller
public class ZcOrderInfoAction {
	@Autowired private ZcOrdersInfoService zcOrdersInfoService;
	@Autowired private ZcOrdesInfoNativeService zcOrdesInfoNativeService;
	@Autowired private ZcOrderDetailNativeService zcOrderDetailNativeService;
	@Autowired private ZcUserInfosService zcUserInfosService;
	
	@RequestMapping("/order.xhtml")
	public String order(){
		return "order/order";
	}
	
	
	
	@RequestMapping("/putOrder.xhtml")
	@ResponseBody
	public String beginAddOrderInfo(HttpServletRequest request,
			@ModelAttribute ZcAppraise zcAppraise, String proCode,String addressCode) {
		System.out.println("dddddddddddddddddddddddddddddddddd");
		Result rs = new Result();
		
		ZcUserInfos  zUserInfos=new ZcUserInfos();
		
		zUserInfos=zcUserInfosService.queryOne(Integer.parseInt(addressCode));
		
		

		ZcUserInfo info=(ZcUserInfo)ThreadLocalSession.getLocal_session().getAttribute(ZcContext.LOGIN_USER_KEY);

		Calendar ordtime=Calendar.getInstance();
		ZcOrdersInfo orderinfo=new ZcOrdersInfo();
		
		orderinfo.setUserAddress(zUserInfos.getUserAddress());
		orderinfo.setUserProvince(zUserInfos.getUserProvince());
		orderinfo.setUserCity(zUserInfos.getUserCity());
		orderinfo.setUserArea(zUserInfos.getUserArea());
		orderinfo.setUserZip(zUserInfos.getUserZip());
		orderinfo.setUserMobilephone(zUserInfos.getUserMobilephone());
		orderinfo.setUserTelephone(zUserInfos.getUserTelephone());
		orderinfo.setUserEmail(zUserInfos.getUserEmail());
		
		
		orderinfo.setOrderStatus(String.valueOf(ZcContext.ORDER_STATUS_FIRST));
		orderinfo.setOrderTime(Calendar.getInstance().getTime());
		orderinfo.setUserCode(info.getUserCode());
		//订单编号 生成规程 
		//随机三位数+订单人+订单日期
		DecimalFormat df=new DecimalFormat("00000");
		StringBuffer ords=new StringBuffer();
		ords.append(df.format(new Random().nextInt(99999)))
		.append(df.format(info.getUserCode()))
		.append(DateFormatUtils.format(ordtime, "yyyyMMddHHmmss"));
		orderinfo.setOrderCode(ords.toString());
		ZcOrdersInfo zoi= zcOrdersInfoService.save(orderinfo);
		if (zoi.getOcodes()>0) {//保存成功，保存明细
			zcOrderDetailNativeService.updateOrderCodeByUserCodeAndOrderCodeIsNull(info.getUserCode(), zoi.getOcodes());
//			for (CartInfo ci : carts) {
//				ZcOrderDetail zd=new ZcOrderDetail();
//				zd.setOrderCode(zoi.getOrderCode());
//				zd.setProCode(ci.getProCode());
//				zd.setProNumber(ci.getCartNumber());
//				zd.setProUnit(new BigDecimal(ci.getProUnit()));
//				zd.setProType(ci.getTshirtShort());
//				zcOrderDetailDao.save(zd);
//			}
			rs.setSuccess(true);
		}
		  

		rs.setReturnValue(proCode);
		rs.setSuccess(true);
		return rs.toJson();
	
	}
	
	
	@RequestMapping("/order_{detailid}.xhtml")
	public String to_show(@PathVariable("detailid") String detailId,
			HttpServletRequest request) {
		System.out.println("detailid:" + detailId);
		
		 ZcOrdersInfo zcOrdersInfo=new ZcOrdersInfo();
		 zcOrdersInfo=zcOrdersInfoService.queryByOcodes(Integer.parseInt(detailId));
		
//		try {
//			int preCode = NumberUtils.toInt(detailId);
//			ZcProjectInfo info = zcProjectInfoService.queryOne(preCode);
//			request.setAttribute("infoPro", info);
//		} catch (Exception e) {
//			RootLogger.error(e);
//		}
//		
//		
//		List<ZcAppraise> applist=new ArrayList<ZcAppraise>();
//		applist=zcAppraiseService.queryByProCode(Integer.parseInt(detailId));
//		
//		List list=new ArrayList();
//		list=zcAppraiseNativeService.queryByProCodeAndOrderCodeIsNotNull(Integer.parseInt(detailId));
//		System.out.println(list.size());
//		
//
//		request.setAttribute("applist", applist);
//		request.setAttribute("userlist", list);
		 request.setAttribute("zcOrdersInfo", zcOrdersInfo);
		return "order/order_detail";
	}
	
	@RequestMapping("/order_info.xhtml")
	public String to_publish(HttpServletRequest request, String  orderCode, String orderStatus) {
		System.out.println("orderCode"+orderCode);
		System.out.println("orderStatus"+orderStatus);
		//List<ZcProjectInfo> list=new ArrayList<ZcProjectInfo>();
		ZcUserInfo sezcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		
		
		List list=zcOrdesInfoNativeService.queryByUserCodeAndOrderCodeAndOrderStatus(sezcUserInfo.getUserCode(), orderCode,orderStatus);
		//list=zcProjectInfoService.queryByUserCodeAndProNameLike(sezcUserInfo.getUserCode(),"%"+proName+"%");
		request.setAttribute("ordinfos", list);
		request.setAttribute("orderCode", orderCode);
		request.setAttribute("orderStatus", orderStatus);
		System.out.println(list.size());
		
//		if(list.size()>0){
//			for (int i = 0; i <list.size(); i++) {
//				System.out.println(list.get(i).getProCode());
//				System.out.println(list.get(i).getProName());
//			}
//			
//		}
		return "order/order_info";
	}
	
	
	@RequestMapping("/order_balance.xhtml")
	public String to_balance(HttpServletRequest request) {
		double totalprice=0.00;
		int totalnumber=0;
		ZcUserInfo sezcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		List list=zcOrderDetailNativeService.queryByUserCodeAndOrderCodeIsNull(sezcUserInfo.getUserCode());
		
	
		for (Object object : list) {
			//这个object应该是个数组
			Object[] oj=(Object[])object;
			totalprice=totalprice+Double.valueOf(oj[4].toString());
			totalnumber=totalnumber+Integer.parseInt(oj[5].toString());
			System.out.println("总价："+oj[4]+" 总数："+oj[5]);
		}
		
		//List listusers=zcUserInfosService.queyByUserCode(sezcUserInfo.getUserCode());
		List listusers=zcUserInfosService.queyAll();
		System.out.println(listusers.size());
		
		request.setAttribute("usersinfo", listusers);
		request.setAttribute("ordcart", list);
		request.setAttribute("totalprice", totalprice);
		request.setAttribute("totalnumber", totalnumber);
		return "order/order_balance";
	}
	
	
	@RequestMapping("/order_cart.xhtml")
	public String to_cart(HttpServletRequest request) {
		double totalprice=0.00;
		int totalnumber=0;
		ZcUserInfo sezcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		List list=zcOrderDetailNativeService.queryByUserCodeAndOrderCodeIsNull(sezcUserInfo.getUserCode());
		
	
		for (Object object : list) {
			//这个object应该是个数组
			Object[] oj=(Object[])object;
			totalprice=totalprice+Double.valueOf(oj[4].toString());
			totalnumber=totalnumber+Integer.parseInt(oj[5].toString());
			System.out.println("总价："+oj[4]+" 总数："+oj[5]);
		}
		request.setAttribute("ordcart", list);
		request.setAttribute("totalprice", totalprice);
		request.setAttribute("totalnumber", totalnumber);
		return "order/order_cart";
	}
	
	
	@RequestMapping("/beginDeleOrder_{proCode}_{proType}.xhtml")
	
	public String beginDelete(HttpServletRequest request,
			@PathVariable("proCode")  String proCode,@PathVariable("proType") String proType) {
	try {
			
		ZcUserInfo sezcUserInfo = (ZcUserInfo) request.getSession()
				.getAttribute(ZcContext.LOGIN_USER_KEY);

		 zcOrdesInfoNativeService.deleteByUserCodeAndProCodOAndProTypeAndOrderCodeIsNull(sezcUserInfo.getUserCode(),Integer.parseInt(proCode), proType) ;
		    
		   
		
			
		} catch (Exception e) {
			RootLogger.error(e);
		}
		
		
		
			return "redirect:../order/order_cart.xhtml";

	}

	
}
