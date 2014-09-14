package com.zcnation.zc.service.impl;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.common.ThreadLocalSession;
import com.zcnation.zc.context.ZcContext;
import com.zcnation.zc.dao.ZcOrderDetailDao;
import com.zcnation.zc.dao.ZcOrdersInfoDao;
import com.zcnation.zc.domain.CartInfo;
import com.zcnation.zc.domain.ZcOrderDetail;
import com.zcnation.zc.domain.ZcOrdersInfo;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcOrdersInfoService;

@Service("zcOrdersInfoService")
public class ZcOrdersInfoServiceImpl implements ZcOrdersInfoService {

	@Autowired private ZcOrdersInfoDao zcOrdersInfoDao;
	@Autowired private ZcOrderDetailDao zcOrderDetailDao;
	
	public Result process() {
		Result r=new Result();
		ZcUserInfo info=(ZcUserInfo)ThreadLocalSession.getLocal_session().getAttribute(ZcContext.LOGIN_USER_KEY);
		List<CartInfo> carts=(List<CartInfo>)ThreadLocalSession.getLocal_session().getAttribute(ObjectUtils.toString(info.getUserCode()));
		if (carts!=null&&carts.size()>0) {
			//订单
			//订单表
			Calendar ordtime=Calendar.getInstance();
			ZcOrdersInfo orderinfo=new ZcOrdersInfo();
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
			// 
			ZcOrdersInfo zoi= zcOrdersInfoDao.save(orderinfo);
			if (zoi.getOcodes()>0) {//保存成功，保存明细
				for (CartInfo ci : carts) {
					ZcOrderDetail zd=new ZcOrderDetail();
					zd.setOrderCode(zoi.getOrderCode());
					zd.setProCode(ci.getProCode());
					zd.setProNumber(ci.getCartNumber());
					zd.setProUnit(new BigDecimal(ci.getProUnit()));
					zd.setProType(ci.getTshirtShort());
					zcOrderDetailDao.save(zd);
				}
				r.setSuccess(true);
			}
			
		}else{
			r.setSuccess(false);
			r.getErrorMsgs().add("非法提交订单");
		}
		
		return r;
	}
	public static void main(String[] args) {
		Random r=new Random();
		DecimalFormat df=new DecimalFormat("00000");
		System.out.println(df.format(r.nextInt(99999)));
		System.out.println(df.format(new Random().nextInt(99999)));
	}
	@Override
	public ZcOrdersInfo save(ZcOrdersInfo info) {
		// TODO Auto-generated method stub
		return zcOrdersInfoDao.save(info);
	}
	@Override
	public ZcOrdersInfo queryByOcodes(Integer ocodes) {
		// TODO Auto-generated method stub
		return zcOrdersInfoDao.findByOcodes(ocodes);
	}

}
