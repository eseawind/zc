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
import com.zcnation.zc.domain.ZcOrdersInfo;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcProjectLike;
import com.zcnation.zc.domain.ZcResourceInfo;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcAppraiseNativeService;
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
@RequestMapping("/projectinfo")
public class ZcProjectInfoAction {
	private static final String IMAGE_DIR = "/uploadImg";
	@Autowired
	private ZcProjectInfoService zcProjectInfoService;
	@Autowired
	private ZcResourceInfoService zcResourceInfoService;
	@Autowired
	private ZcProjecLikeService zcProjecLikeService;
	@Autowired
	private ZcProjectInfoNativeService zcProjectInfoNativeService;

	@Autowired
	private ZcProjectLikeNativeService zcProjectLikeNativeService;

	@Autowired
	private ZcOrderDetailNativeService zcOrderDetailNativeService;

	@Autowired
	private ZcAppraiseService zcAppraiseService;

	@Autowired
	private ZcOrderDetailService zcOrderDetailService;

	@Autowired
	private ZcAppraiseNativeService zcAppraiseNativeService;

	@RequestMapping("/project_add.xhtml")
	public String to_add(HttpServletRequest request) {
		return "projectinfo/project_add";
	}

	@RequestMapping("/project_list.html")
	public String to_list(HttpServletRequest request, String currentPage,
			String sortSele, String sortBy, String proType, String proFabric) {
		Getpagenum getpagenum = new Getpagenum();

		ZcUserInfo sezcUserInfo = (ZcUserInfo) request.getSession()
				.getAttribute(ZcContext.LOGIN_USER_KEY);

		Integer userCode = 0;

		if (sezcUserInfo == null || sezcUserInfo.equals("")) {
		} else {

			userCode = sezcUserInfo.getUserCode();
		}

		if (currentPage == null || currentPage.equals("")) {

			currentPage = "1";
		}

		if (sortSele == null || sortSele.equals("")) {

			sortSele = "0";
		}
		if (sortBy == null || sortBy.equals("")) {

			sortBy = "0";
		}

		List<ZcProjectInfo> prolist = new ArrayList<ZcProjectInfo>();
		prolist = zcProjectInfoNativeService.queryByProShStatusAndPage(
				Integer.parseInt(currentPage), Integer.parseInt(sortSele),
				Integer.parseInt(sortBy), Integer.parseInt(proType),
				Integer.parseInt(proFabric), userCode);

		request.setAttribute("proinfos", prolist);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("sortSele", sortSele);
		request.setAttribute("sortBy", sortBy);
		request.setAttribute("pagesize",
				getpagenum.getpagenum(zcProjectInfoNativeService
						.queryTtotalByProShStatusAndPage(
								Integer.parseInt(sortSele),
								Integer.parseInt(sortBy),
								Integer.parseInt(proType),
								Integer.parseInt(proFabric)), 16));
		request.setAttribute("proType", proType);
		request.setAttribute("proFabric", proFabric);

		return "projectinfo/project_list";
	}

	@RequestMapping("/project_like.xhtml")
	public String to_like(HttpServletRequest request) {
		List<ZcProjectLike> list = new ArrayList<ZcProjectLike>();
		ZcUserInfo sezcUserInfo = (ZcUserInfo) request.getSession()
				.getAttribute(ZcContext.LOGIN_USER_KEY);
		list = zcProjecLikeService.queryByUserCode(sezcUserInfo.getUserCode());
		request.setAttribute("prolikes", list);
		System.out.println(list.size());
		return "projectinfo/project_like";
	}

	@RequestMapping("/project_un{userCode}.xhtml")
	public String to_unlike(@PathVariable("userCode") String userCode,
			HttpServletRequest request) {
		System.out.println("userCode:" + userCode);

		try {
			ZcProjectLike zcProjectLike = zcProjecLikeService.queryOne(Integer
					.parseInt(userCode));
			zcProjecLikeService.delete(zcProjectLike);
			// ZcUserInfos zcUserInfos=
			// zcUserInfosService.queryOne(Integer.parseInt(userCode));
			// zcUserInfosService.delete(zcUserInfos);
			// zcProjecLikeService.deleteByLikeCode((Integer.parseInt(userCode)));
		} catch (Exception e) {
			RootLogger.error(e);
		}

		return "redirect:../projectinfo/project_like.xhtml";

	}

	@RequestMapping("/project_publish.xhtml")
	public String to_publish(HttpServletRequest request, String proName,
			String proShStatus) {
		System.out.println("proName" + proName);
		System.out.println("proShStatus" + proShStatus);
		// List<ZcProjectInfo> list=new ArrayList<ZcProjectInfo>();
		ZcUserInfo sezcUserInfo = (ZcUserInfo) request.getSession()
				.getAttribute(ZcContext.LOGIN_USER_KEY);

		List list = zcProjectInfoNativeService
				.queryByUserCodeAndProShStatusAndProNameAndProShStatus(
						sezcUserInfo.getUserCode(), proName, proShStatus);
		// list=zcProjectInfoService.queryByUserCodeAndProNameLike(sezcUserInfo.getUserCode(),"%"+proName+"%");
		request.setAttribute("proinfos", list);
		request.setAttribute("proName", proName);
		System.out.println(list.size());

		// if(list.size()>0){
		// for (int i = 0; i <list.size(); i++) {
		// System.out.println(list.get(i).getProCode());
		// System.out.println(list.get(i).getProName());
		// }
		//
		// }
		return "projectinfo/project_publish";
	}

	@RequestMapping("/project_{detailid}.html")
	public String to_show(@PathVariable("detailid") String detailId,
			HttpServletRequest request) {
		System.out.println("detailid:" + detailId);
		try {
			int preCode = NumberUtils.toInt(detailId);
			ZcProjectInfo info = zcProjectInfoService.queryOne(preCode);
			request.setAttribute("infoPro", info);
		} catch (Exception e) {
			RootLogger.error(e);
		}

		List<ZcAppraise> applist = new ArrayList<ZcAppraise>();
		applist = zcAppraiseService.queryByProCode(Integer.parseInt(detailId));

		List list = new ArrayList();
		list = zcAppraiseNativeService
				.queryByProCodeAndOrderCodeIsNotNull(Integer.parseInt(detailId));
		System.out.println(list.size());

		request.setAttribute("applist", applist);
		request.setAttribute("userlist", list);
		return "projectinfo/project_show";
	}

	@RequestMapping("/beginAdd.xhtml")
	@ResponseBody
	public String beginAddProject(HttpServletRequest request,
			@ModelAttribute ZcProjectInfo zcProjectInfo) {
		Result rs = new Result();
		System.out.println("你好,要上传图片了");
		System.out.println("项目名称：" + zcProjectInfo.getProName());
		MultipartResolver resolver = new CommonsMultipartResolver(request
				.getSession().getServletContext());
		MultipartHttpServletRequest mulreq = resolver.resolveMultipart(request);
		System.out.println("名称：" + mulreq.getParameter("proName"));

		ZcProjectInfo zInfo = zcProjectInfoService.queryByProName(mulreq
				.getParameter("proName").trim());

		if (zInfo != null) {
			rs.setSuccess(false);
			rs.getErrorMsgs().add("作品名字已被使用");
			RootLogger.error("项目名称有重复.");

			// throw new NotValidateCorrectException("项目名称有重复");
		} else {
			// 多文件
			List<MultipartFile> listfiles = mulreq.getFiles("fileupload");
			Result r = validateUpload(mulreq);
			if (r.isSuccess()) {
				ZcProjectInfo pinfo = (ZcProjectInfo) r.getReturnValue();
				
				for (int i = 0; i < listfiles.size(); i++) {
					// 单文件
					// MultipartFile file = mulreq.getFile("fileupload");
					MultipartFile file = listfiles.get(i);
					// List<MultipartFile>
					// fileupload=mulreq.getFiles("fileupload");
					RootLogger.info("上传文件名称：" + file.getOriginalFilename());
					String fileName = file.getOriginalFilename();

					String realPath = request.getSession().getServletContext()
							.getRealPath(IMAGE_DIR);
					File realFile = new File(realPath);
					if (!realFile.exists()) {
						realFile.mkdirs();
					}

					FileOutputStream fos = null;
					InputStream ins = null;
					try {
						if (!file.isEmpty()) {
							// 上传文件
							String imageType = StringUtils.substring(fileName,
									StringUtils.lastIndexOf(fileName, "."));
							Date uploadDate= Calendar.getInstance().getTime();
							if(i==1){
								uploadDate=	addSecond(uploadDate,1);
							}
							
							String uploadTime = DateFormatUtils.format(
									uploadDate, "yyyyMMddHHmmss");
							System.out.println(uploadTime);
							String targetFileName = genaretorTargeFileName(
									uploadTime+i, imageType);
							System.out.println("目标文件名称：" + targetFileName);
							File targetFile = new File(realFile, targetFileName);
							ins = file.getInputStream();
							fos = new FileOutputStream(targetFile);
							byte[] b = new byte[1024 * 1024];
							int flag;
							while ((flag = ins.read(b)) != -1) {
								fos.write(b, 0, flag);
								fos.flush();
							}
							// 水印输出
							if (i==0) {//正面
							String srcFile = request.getSession()
									.getServletContext().getRealPath("/images")
									+ "/6_front.jpg";
							ImageUtil.pressImage(srcFile,
									targetFile.getAbsolutePath(),
									targetFile.getAbsolutePath());
							ZcResourceInfo zr = new ZcResourceInfo();
							zr.setUptDate(uploadDate);
							zr.setUptIp(request.getRemoteAddr());
							zr.setResourceUrl(targetFile.getAbsolutePath());
							zr.setResourceName(targetFile.getName());

							ZcResourceInfo saveZr = zcResourceInfoService
									.saveResourceInfo(zr);
							pinfo.setResourceInfo(saveZr);
						
							// pinfo.setResourceCode(saveZr.getResourceCode());
							
								zcProjectInfoService.save(pinfo);
							}else{//反面
								String srcFile = request.getSession()
										.getServletContext().getRealPath("/images")
										+ "/6_back.jpg";
								ImageUtil.pressImage(srcFile,
										targetFile.getAbsolutePath(),
										targetFile.getAbsolutePath());
								ZcResourceInfo zr = new ZcResourceInfo();
								zr.setUptDate(uploadDate);
								zr.setUptIp(request.getRemoteAddr());
								zr.setResourceUrl(targetFile.getAbsolutePath());
								zr.setResourceName(targetFile.getName());

								ZcResourceInfo saveZr = zcResourceInfoService
										.saveResourceInfo(zr);
								pinfo.setResourceInfo1(saveZr);
							
								// pinfo.setResourceCode(saveZr.getResourceCode());
								
									zcProjectInfoService.save(pinfo);
							}
							rs.setSuccess(true);
							RootLogger.info("图片上传成功...");
						}
					} catch (IOException e) {
						rs.setSuccess(false);
						rs.getErrorMsgs().add(e.getMessage());
						RootLogger.error("上传图片出错.");
						RootLogger.error(e);
						throw new NotValidateCorrectException("上传项目出错");
					} finally {
						IOUtils.closeQuietly(ins);
						IOUtils.closeQuietly(fos);
					}
				}
			}
		}

		return rs.toJson();
		// return zcProjectInfoService.save(zcProjectInfo);
	}

	@RequestMapping("/beginAddLike.html")
	@ResponseBody
	public String beginAddProjectLike(HttpServletRequest request,
			@ModelAttribute ZcProjectLike zcProjectLike, String proCode) {
		Result rs = new Result();

		ZcUserInfo sezcUserInfo = (ZcUserInfo) request.getSession()
				.getAttribute(ZcContext.LOGIN_USER_KEY);
		zcProjectLike.setUserCode(sezcUserInfo.getUserCode());

		List<ZcProjectLike> zProjectLikeval = new ArrayList<ZcProjectLike>();
		zProjectLikeval = zcProjectLikeNativeService.queryByUserCodeAndproCode(
				sezcUserInfo.getUserCode(), Integer.parseInt(proCode));
		if (zProjectLikeval.size() == 0) {
			ZcProjectInfo projectInfo = new ZcProjectInfo();
			projectInfo.setProCode(Integer.parseInt(proCode));
			zcProjectLike.setZcProjectInfo(projectInfo);
			zcProjecLikeService.save(zcProjectLike);
		}

		rs.setReturnValue(proCode);
		rs.setSuccess(true);

		// System.out.println(rs.toJson());
		return rs.toJson();
		// return zcProjectInfoService.save(zcProjectInfo);
	}

	private Result validateUpload(MultipartHttpServletRequest req) {
		ZcProjectInfo proinfo = new ZcProjectInfo();
		Result r = new Result();
		// 项目名称、目标、单价、筹集天数、类别、面料、打样、省份、城市、简介、标签
		String proName = req.getParameter("proName");
		String proTarget = req.getParameter("proTarget");
		String proUnit = req.getParameter("proUnit");
		String proDays = req.getParameter("proDays");
		String proType = req.getParameter("proType");
		String proFabric = req.getParameter("proFabric");
		String proSample = req.getParameter("proSample");
		String proProvince = req.getParameter("proProvince");
		String proCity = req.getParameter("proCity");
		String proRemarks = req.getParameter("proRemarks");
		String proTag = req.getParameter("proTag");
		if (StringUtils.isBlank(proName)) {
			throw new NotValidateCorrectException("项目名称不能为空");
		}
		if (StringUtils.isBlank(proTarget)) {
			throw new NotValidateCorrectException("项目目标不能为空");
		}
		if (StringUtils.isBlank(proUnit)) {
			throw new NotValidateCorrectException("单价不能为空");
		}
		if (StringUtils.isBlank(proDays)) {
			throw new NotValidateCorrectException("筹集天数不能为空");
		}
		if (StringUtils.isBlank(proType)) {

			throw new NotValidateCorrectException("请选择类型");
		}
		if (StringUtils.isBlank(proFabric)) {
			throw new NotValidateCorrectException("请选择面料");
		}
		if (StringUtils.isBlank(proProvince)) {
			throw new NotValidateCorrectException("请选择省份");
		}
		if (StringUtils.isBlank(proCity)) {
			throw new NotValidateCorrectException("请选择城市");
		}
		r.setSuccess(true);
		proinfo.setProName(proName);
		proinfo.setProTarget(NumberUtils.toInt(proTarget));
		proinfo.setProUnit(NumberUtils.toDouble(proUnit));
		proinfo.setProDays(NumberUtils.toInt(proDays));
		proinfo.setProType(NumberUtils.toInt(proType));
		proinfo.setProFabric(NumberUtils.toInt(proFabric));
		proinfo.setProSample(NumberUtils.toInt(proSample));
		proinfo.setProProvince(proProvince);
		proinfo.setProCity(proCity);
		proinfo.setProRemarks(proRemarks);
		proinfo.setProTag(proTag);
		ZcUserInfo info = (ZcUserInfo) ThreadLocalSession.getLocal_session()
				.getAttribute(ZcContext.LOGIN_USER_KEY);
		proinfo.setUserCode(info.getUserCode());
		r.setReturnValue(proinfo);
		return r;
	}

	/***
	 * 生成目标文件名称，一定要唯一 生成规则 MD5加密 （上传用户ID+上传时间yyyyMMddHHmmss)
	 * 
	 * @param uploadTime
	 *            上传时间 yyyyMMddHHmmss
	 * @param imageType
	 *            图片类型 jpg、jpeg、bmp、gif、png
	 * @return
	 */
	private String genaretorTargeFileName(String uploadTime, String imageType) {
		ZcUserInfo info = (ZcUserInfo) ThreadLocalSession.getLocal_session()
				.getAttribute(ZcContext.LOGIN_USER_KEY);
		String str = ObjectUtils.toString(info.getUserCode()) + uploadTime;
		return MD5.getMD5Str(str) + imageType;
	}

	@RequestMapping("/addCart.xhtml")
	@ResponseBody
	public String addCart(HttpServletRequest request,
			@RequestParam("proCode") Integer proCode,
			@RequestParam("cartNumber") Integer cartNumber,
			@RequestParam("tshirtShort") String tshirtShort,
			@RequestParam("imageUrl") String imageUrl,
			@RequestParam("proName") String proName,
			@RequestParam("proUnit") double proUnit) {
		Result r = new Result();
		ZcUserInfo user = (ZcUserInfo) ThreadLocalSession.getLocal_session()
				.getAttribute(ZcContext.LOGIN_USER_KEY);
		List<ZcOrderDetail> listzcd = new ArrayList<ZcOrderDetail>();
		System.out.println(tshirtShort);
		System.out.println(proCode);
		System.out.println(user.getUserCode());
		listzcd = zcOrderDetailService
				.queryByProCodeAndProTypeAndUserCodeAndOrderCodeIsNull(proCode,
						tshirtShort, user.getUserCode());

		ZcOrderDetail zd = new ZcOrderDetail();

		zd.setProCode(proCode);
		zd.setProNumber(cartNumber);
		zd.setProUnit(new BigDecimal(proUnit));
		zd.setProType(tshirtShort);
		zd.setUserCode(user.getUserCode());
		if (listzcd.size() == 0) {

			zcOrderDetailService.save(zd);

		} else {
			int dd = zcOrderDetailNativeService.updateZcOrderDetail(listzcd
					.get(0).getProNumber() + cartNumber, listzcd.get(0)
					.getDetId());
		}

		// CartInfo ci = new CartInfo();
		// ci.setCartNumber(cartNumber);
		// ci.setTshirtShort(tshirtShort);
		// ci.setProCode(proCode);
		// ci.setUserCode(user.getUserCode());
		// ci.setImageUrl(imageUrl);
		// ci.setProUnit(proUnit);
		// ci.setProName(proName);
		// 取当前购物车
		// Object obj = ThreadLocalSession.getLocal_session().getAttribute(
		// ObjectUtils.toString(user.getUserCode()));
		// if (obj == null) {// 购物车为空
		// List<CartInfo> list = new ArrayList<CartInfo>();
		//
		// list.add(ci);
		// ThreadLocalSession.getLocal_session().setAttribute(
		// ObjectUtils.toString(user.getUserCode()), list);
		// } else {
		// List<CartInfo> list = (List<CartInfo>) obj;
		// // 当前购物车中有产品
		// if (list.contains(ci)) {
		// // 包含该产品，数量累计
		// int index = list.indexOf(ci);
		// CartInfo newC = list.get(index);
		// int num = newC.getCartNumber() + ci.getCartNumber();
		// newC.setCartNumber(num);
		// list.remove(index);
		// list.add(newC);
		// } else {
		// list.add(ci);
		// }
		// ThreadLocalSession.getLocal_session().setAttribute(
		// ObjectUtils.toString(user.getUserCode()), list);
		// }
		r.setSuccess(true);
		// 购物车html
		// String cartHtml = generateCartHtml();
		return r.toJson();
	}

	/***
	 * 购物车html
	 * 
	 * @return
	 */
	private String generateCartHtml() {
		ZcUserInfo user = (ZcUserInfo) ThreadLocalSession.getLocal_session()
				.getAttribute(ZcContext.LOGIN_USER_KEY);
		// 购物车html
		StringBuffer cartHtml = new StringBuffer();
		cartHtml.append("<table style=\"width:100%;\">")
				.append("<tr>")
				.append("<td>商品</td><td>&nbsp;</td><td>单价</td><td>型号</td><td>数量</td><td>小计</td><td>操作</td>")
				.append("</tr>");
		@SuppressWarnings("unchecked")
		List<CartInfo> cartList = (List<CartInfo>) ThreadLocalSession
				.getLocal_session().getAttribute(
						ObjectUtils.toString(user.getUserCode()));
		BigDecimal b = new BigDecimal(0);
		for (CartInfo c : cartList) {
			BigDecimal b1 = new BigDecimal(c.getProUnit());
			cartHtml.append("<tr>")
					.append("<td><img alt=\"\" src=\"" + c.getImageUrl()
							+ "\" width=\"100\" height=\"100\"> </td>")
					.append("<td>" + c.getProName() + "</td>")
					.append("<td>" + c.getProUnit() + "</td>")
					.append("<td>" + c.getTshirtShort() + "</td>")
					.append("<td>" + c.getCartNumber() + "</td>")
					.append("<td>" + c.getCartNumber() + "*" + c.getProUnit()
							+ "=" + (c.getCartNumber() * c.getProUnit())
							+ "元</td>")
					.append("<td><a href=\"javascript:void(0)\" proCode=\""
							+ c.getProCode() + "\" ttype=\""
							+ c.getTshirtShort() + "\">删除<a></td>")
					.append("</tr>");
			b = b.add(b1.multiply(new BigDecimal(c.getCartNumber())));
		}
		cartHtml.append("<tr>")
				.append("<td colspan=\"6\" align=\"right\">共" + cartList.size()
						+ "件商品，商品总金额" + b + "元   </td>").append("</tr>");
		return cartHtml.toString();
	}

	@RequestMapping("/beginDelecart.xhtml")
	@ResponseBody
	public String beginDeleteCart(HttpServletRequest request,
			@ModelAttribute CartInfo info) {
		Result r = new Result();
		ZcUserInfo user = (ZcUserInfo) ThreadLocalSession.getLocal_session()
				.getAttribute(ZcContext.LOGIN_USER_KEY);
		@SuppressWarnings("unchecked")
		List<CartInfo> cartList = (List<CartInfo>) ThreadLocalSession
				.getLocal_session().getAttribute(
						ObjectUtils.toString(user.getUserCode()));
		if (cartList.contains(info)) {
			cartList.remove(info);
		}
		ThreadLocalSession.getLocal_session().setAttribute(
				ObjectUtils.toString(user.getUserCode()), cartList);
		r.setSuccess(true);
		return r.toJson();
	}

	@RequestMapping("/getCart.xhtml")
	@ResponseBody
	public String getCartHtml() {
		String carthtml = generateCartHtml();
		return carthtml;
	}

	@RequestMapping("/beginorders.xhtml")
	@ResponseBody
	public String beginPutOrders(HttpServletRequest request) {
		String str = "";

		Result r = new Result();
		r.setSuccess(true);
		return r.toJson();
	}
	@RequestMapping("/project_{detailid}.xhtml")
	public String to_detail(@PathVariable("detailid") String detailId,
			HttpServletRequest request) {
		//System.out.println("detailid:" + detailId);
		ZcProjectInfo zcProjectInfo=zcProjectInfoService.queryOne(Integer.parseInt(detailId));
		
		
		
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
		request.setAttribute("zcProjectInfo", zcProjectInfo);
		return "projectinfo/project_detail";
	}

	
	@RequestMapping("/project_cancel{proCode}.xhtml")
	public String to_cancel(@PathVariable("proCode") String proCode,
			HttpServletRequest request) {
		System.out.println("proCode:" + proCode);
		zcProjectInfoNativeService.updateProCanceTimeByProCode(Integer.parseInt(proCode));

		try {
//			ZcProjectLike zcProjectLike = zcProjecLikeService.queryOne(Integer
//					.parseInt(userCode));
			//zcProjecLikeService.delete(zcProjectLike);
			// ZcUserInfos zcUserInfos=
			// zcUserInfosService.queryOne(Integer.parseInt(userCode));
			// zcUserInfosService.delete(zcUserInfos);
			// zcProjecLikeService.deleteByLikeCode((Integer.parseInt(userCode)));
		} catch (Exception e) {
			RootLogger.error(e);
		}

		return "redirect:../projectinfo/project_publish.xhtml";

	}

	public static Date addSecond(Date date, int seconds) { 
		Calendar calendar = Calendar.getInstance(); 
		calendar.setTime(date); 
		calendar.add(Calendar.SECOND, seconds); 
		return calendar.getTime(); 
		} 
	
	public static void main(String[] args) {
		System.out.println("ddd");
	}

}
