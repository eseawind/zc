package com.zcnation.zc.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.common.ThreadLocalSession;
import com.zcnation.zc.common.exception.NotValidateCorrectException;
import com.zcnation.zc.common.security.MD5;
import com.zcnation.zc.common.util.Getpagenum;
import com.zcnation.zc.common.util.ImageUtil;
import com.zcnation.zc.common.util.RootLogger;
import com.zcnation.zc.context.ZcContext;
import com.zcnation.zc.domain.CartInfo;
import com.zcnation.zc.domain.ZcAppraise;
import com.zcnation.zc.domain.ZcOrderDetail;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcProjectLike;
import com.zcnation.zc.domain.ZcResourceInfo;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcAppraiseService;
import com.zcnation.zc.service.ZcOrderDetailNativeService;
import com.zcnation.zc.service.ZcOrderDetailService;
import com.zcnation.zc.service.ZcProjecLikeService;
import com.zcnation.zc.service.ZcProjectInfoNativeService;
import com.zcnation.zc.service.ZcProjectInfoService;
import com.zcnation.zc.service.ZcProjectLikeNativeService;
import com.zcnation.zc.service.ZcResourceInfoService;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;

@Controller
@RequestMapping("/appraise")
public class ZcAppraiseAction {
	
	
	
	@Autowired
	private ZcAppraiseService zcAppraiseService;
	
	
	@RequestMapping("/beginAddAppraise.xhtml")
	@ResponseBody
	public String beginAddAppraise(HttpServletRequest request,
			@ModelAttribute ZcAppraise zcAppraise, String proCode) {
		Result rs = new Result();
	ZcUserInfo sezcUserInfo = (ZcUserInfo) request.getSession()
				.getAttribute(ZcContext.LOGIN_USER_KEY);
	
	   ZcProjectInfo zcProjectInfo=new ZcProjectInfo();
	   zcProjectInfo.setProCode(Integer.parseInt(proCode));
	   zcAppraise.setZcProjectInfo(zcProjectInfo);
	   
	   ZcUserInfo zcUserInfo=new ZcUserInfo();
	   zcUserInfo.setUserCode(sezcUserInfo.getUserCode());
	   
	   		zcAppraise.setZcUserInfo(zcUserInfo);
			zcAppraiseService.save(zcAppraise);
			
			
			
		

		rs.setReturnValue(proCode);
		rs.setSuccess(true);
		return rs.toJson();
	
	}


}
