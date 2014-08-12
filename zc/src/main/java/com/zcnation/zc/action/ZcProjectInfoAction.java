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
import org.springframework.web.bind.annotation.RequestBody;
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
import com.zcnation.zc.common.util.RootLogger;
import com.zcnation.zc.context.ZcContext;
import com.zcnation.zc.domain.CartInfo;
import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcResourceInfo;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcProjectInfoService;
import com.zcnation.zc.service.ZcResourceInfoService;
import com.zcnation.zc.service.ZcUserInfoService;

@Controller
@RequestMapping("/projectinfo")
public class ZcProjectInfoAction {
	private static final String IMAGE_DIR = "/uploadImg";
	@Autowired
	private ZcProjectInfoService zcProjectInfoService;
	@Autowired
	private ZcResourceInfoService zcResourceInfoService;

	@RequestMapping("/project_add.xhtml")
	public String to_add(HttpServletRequest request) {
		return "projectinfo/project_add";
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
		request.setAttribute("zc_title", "我是最好的设计师" + detailId);
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
		// 单文件
		MultipartFile file = mulreq.getFile("fileupload");
		// List<MultipartFile> fileupload=mulreq.getFiles("fileupload");
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
				Result r = validateUpload(mulreq, file);
				if (r.isSuccess()) {
					ZcProjectInfo pinfo = (ZcProjectInfo) r.getReturnValue();
					// 上传文件
					String imageType = StringUtils.substring(fileName,
							StringUtils.lastIndexOf(fileName, "."));
					Date uploadDate = Calendar.getInstance().getTime();
					String uploadTime = DateFormatUtils.format(uploadDate,
							"yyyyMMddHHmmss");
					String targetFileName = genaretorTargeFileName(uploadTime,
							imageType);
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
					rs.setSuccess(true);
					RootLogger.info("图片上传成功...");
				}
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

		return rs.toJson();
		// return zcProjectInfoService.save(zcProjectInfo);
	}

	private Result validateUpload(MultipartHttpServletRequest req,
			MultipartFile file) {
		ZcProjectInfo proinfo = new ZcProjectInfo();
		Result r = new Result();
		if (!file.isEmpty()) {
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
			ZcUserInfo info = (ZcUserInfo) ThreadLocalSession
					.getLocal_session().getAttribute(ZcContext.LOGIN_USER_KEY);
			proinfo.setUserCode(info.getUserCode());
			r.setReturnValue(proinfo);
		} else {
			r.setSuccess(false);
			r.getErrorMsgs().add("文件不能为空!!!");
		}
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
			@RequestParam("proCode") int proCode,
			@RequestParam("cartNumber") int cartNumber,
			@RequestParam("tshirtShort") String tshirtShort,
			@RequestParam("imageUrl") String imageUrl,
			@RequestParam("proName") String proName,
			@RequestParam("proUnit") double proUnit) {
		Result r = new Result();
		ZcUserInfo user = (ZcUserInfo) ThreadLocalSession.getLocal_session()
				.getAttribute(ZcContext.LOGIN_USER_KEY);
		CartInfo ci = new CartInfo();
		ci.setCartNumber(cartNumber);
		ci.setTshirtShort(tshirtShort);
		ci.setProCode(proCode);
		ci.setUserCode(user.getUserCode());
		ci.setImageUrl(imageUrl);
		ci.setProUnit(proUnit);
		ci.setProName(proName);
		// 取当前购物车
		Object obj = ThreadLocalSession.getLocal_session().getAttribute(
				ObjectUtils.toString(user.getUserCode()));
		if (obj == null) {// 购物车为空
			List<CartInfo> list = new ArrayList<CartInfo>();

			list.add(ci);
			ThreadLocalSession.getLocal_session().setAttribute(
					ObjectUtils.toString(user.getUserCode()), list);
		} else {
			List<CartInfo> list = (List<CartInfo>) obj;
			// 当前购物车中有产品
			if (list.contains(ci)) {
				// 包含该产品，数量累计
				int index = list.indexOf(ci);
				CartInfo newC = list.get(index);
				int num = newC.getCartNumber() + ci.getCartNumber();
				newC.setCartNumber(num);
				list.remove(index);
				list.add(newC);
			} else {
				list.add(ci);
			}
			ThreadLocalSession.getLocal_session().setAttribute(
					ObjectUtils.toString(user.getUserCode()), list);
		}
		r.setSuccess(true);
		// 购物车html
		StringBuffer cartHtml = new StringBuffer();
		cartHtml.append("<table style=\"width:100%;\">")
				.append("<tr>")
				.append("<td>商品</td><td>&nbsp;</td><td>单价</td><td>型号</td><td>数量</td><td>小计</td><td>操作</td>")
				.append("</tr>");
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
							+ "元</td>").append("<td>删除</td>").append("</tr>");
			b = b.add(b1.multiply(new BigDecimal(c.getCartNumber())));
		}
		cartHtml.append("<tr>")
				.append("<td colspan=\"6\" align=\"right\">共" + cartList.size()
						+ "件商品，商品总金额" + b + "元   </td>").append("</tr>");
		return cartHtml.toString();
	}

	/***
	 * 购物车html
	 * @return
	 */
	private String generateCartHtml() {
		ZcUserInfo user = (ZcUserInfo) ThreadLocalSession.getLocal_session().getAttribute(ZcContext.LOGIN_USER_KEY);
		// 购物车html
		StringBuffer cartHtml = new StringBuffer();
		cartHtml.append("<table style=\"width:100%;\">")
				.append("<tr>")
				.append("<td>商品</td><td>&nbsp;</td><td>单价</td><td>型号</td><td>数量</td><td>小计</td><td>操作</td>")
				.append("</tr>");
		List<CartInfo> cartList = (List<CartInfo>) ThreadLocalSession.getLocal_session().getAttribute(ObjectUtils.toString(user.getUserCode()));
		BigDecimal b = new BigDecimal(0);
		for (CartInfo c : cartList) {
			BigDecimal b1 = new BigDecimal(c.getProUnit());
			cartHtml.append("<tr>")
					.append("<td><img alt=\"\" src=\"" + c.getImageUrl()+ "\" width=\"100\" height=\"100\"> </td>")
					.append("<td>" + c.getProName() + "</td>")
					.append("<td>" + c.getProUnit() + "</td>")
					.append("<td>" + c.getTshirtShort() + "</td>")
					.append("<td>" + c.getCartNumber() + "</td>")
					.append("<td>" + c.getCartNumber() + "*" + c.getProUnit()+ "=" + (c.getCartNumber() * c.getProUnit())+ "元</td>").append("<td>删除</td>").append("</tr>");
			b = b.add(b1.multiply(new BigDecimal(c.getCartNumber())));
		}
		cartHtml.append("<tr>").append("<td colspan=\"6\" align=\"right\">共" + cartList.size()+ "件商品，商品总金额" + b + "元   </td>").append("</tr>");
		return cartHtml.toString();
	}

	
	@RequestMapping("/beginorders.xhtml")
	@ResponseBody
	public String beginPutOrders(HttpServletRequest request){
		String str="";
		
		Result r=new Result();
		r.setSuccess(true);
		return r.toJson();
	}
	
	public static void main(String[] args) {
		System.out.println("ddd");
	}
}
