package com.zcnation.zc.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.zcnation.zc.common.Result;
import com.zcnation.zc.common.ThreadLocalSession;
import com.zcnation.zc.common.exception.NotValidateCorrectException;
import com.zcnation.zc.common.security.MD5;
import com.zcnation.zc.common.util.EmailUtils;
import com.zcnation.zc.common.util.IsSameDay;
import com.zcnation.zc.common.util.RootLogger;
import com.zcnation.zc.common.util.UrlHelp;
import com.zcnation.zc.context.ZcContext;
import com.zcnation.zc.domain.ZcResourceInfo;
import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcResourceInfoService;
import com.zcnation.zc.service.ZcUserInfoNativeService;
import com.zcnation.zc.service.ZcUserInfoService;

@Controller
@RequestMapping("/userinfo")
public class ZcUserInfoAction {
	private static final String IMAGE_DIR = "/uploadImg";
	
	@Autowired private ZcUserInfoService zcUserInfoService;
	@Autowired private ZcUserInfoNativeService zcUserInfoNativeService;
	@Autowired
	private ZcResourceInfoService zcResourceInfoService;

	@RequestMapping("/register.html")
	public String to_register(HttpServletRequest request) {
		return "userinfo/user_register";
	}
	
	
	
	
	@RequestMapping("/login.html")
	public String to_login(HttpServletRequest request) {
		return "userinfo/user_login";
	} 
	@RequestMapping("/show.xhtml")
	public String to_info(HttpServletRequest request) {
		return "userinfo/user_show";
	}
	
	@RequestMapping("/update_password.xhtml")
	public String to_update(HttpServletRequest request) {
		return "userinfo/user_update_password";
	}
	
	
	@RequestMapping("/update.xhtml")
	public String to_update_password(HttpServletRequest request) {
		return "userinfo/user_update";
	}
	
	
	@RequestMapping("/reset_password.html")
	public String to_reset_password(HttpServletRequest request) {
		return "userinfo/reset_password";
	}
	
	@RequestMapping("/choose_email.html")
	public String to_choose_email(HttpServletRequest request, String userName) {
		request.setAttribute("userName", userName);
		return "userinfo/choose_email";
	}
	
	@RequestMapping("/send_email.html")
	public String to_send_email(HttpServletRequest request, String userName) {
		request.setAttribute("userName", userName);
		return "userinfo/send_email";
	}
	
	
	
	 
	@RequestMapping("/beginRegister.html")
	@ResponseBody
	public String beginRegister(HttpServletRequest request,@ModelAttribute ZcUserInfo userinfo,@RequestParam(value="passwordagin") String passwordagin){
		      userinfo.setUserRandomCode(UUID.randomUUID().toString());
		return zcUserInfoService.save(userinfo, passwordagin, request.getRemoteAddr());
	}
	
	@RequestMapping("/beginLogin.html")
	@ResponseBody
	public String beginLogin(HttpServletRequest request,@RequestParam(value="userName") String userName,@RequestParam(value="password") String password){
		Result r=zcUserInfoService.login(userName, password);
		IsSameDay isSameDay=new IsSameDay();
		Date dt = new Date();  
		if (r.isSuccess()) {
			System.out.println("登录成功");
			  ZcUserInfo zcUserInfo=new ZcUserInfo();
			  zcUserInfo=(ZcUserInfo)r.getReturnValue(); 
			  //System.out.println("图片路径："+zcUserInfo.getResourceInfo().getResourceName());
			  
			 
			  
			//zcUserInfoNativeService.updateLoginTimeAndUserScoreByUserCode(zcUserInfo.getUserScore()+5, zcUserInfo.getUserCode());
			  
			  if (zcUserInfo.getUserScore() == null ||zcUserInfo.getUserScore().equals("")) {
				  			

					  zcUserInfoNativeService.updateLoginTimeAndUserScoreByUserCode(1, zcUserInfo.getUserCode());
		        	  
		        
				  
				}else{
					
					 if( (isSameDay.isSameDay( zcUserInfo.getLoginTime(),dt)==0)){
						 zcUserInfoNativeService.updateLoginTimeAndUserScoreByUserCode(zcUserInfo.getUserScore()+1, zcUserInfo.getUserCode());
			        	  
			          }
			  
					
					
				}
			  
			
			ThreadLocalSession.getLocal_session().setAttribute(ZcContext.LOGIN_USER_KEY, zcUserInfoService.queryOne(zcUserInfo.getUserCode()));
		}
		
		
		return r.toJson();
	}
	@RequestMapping("/beginLogins.html")
	public ModelAndView beginLogins(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="userName") String userName,@RequestParam(value="password") String password){
		Result r=zcUserInfoService.login(userName, password);
		if (r.isSuccess()) {
			IsSameDay isSameDay=new IsSameDay();
			Date dt = new Date();  
			//System.out.println("登录成功");
			ZcUserInfo z=(ZcUserInfo)r.getReturnValue();
			//System.out.println("图片路径："+z.getResourceInfo().getResourceName());
			 if (z.getUserScore() == null ||z.getUserScore().equals("")) {
		  			
				
					  zcUserInfoNativeService.updateLoginTimeAndUserScoreByUserCode(1, z.getUserCode());
		         
				}else{
					
					 if( (isSameDay.isSameDay( z.getLoginTime(),dt)==0)){
						 zcUserInfoNativeService.updateLoginTimeAndUserScoreByUserCode(z.getUserScore()+1, z.getUserCode());
			          }
				}
			  
			
			
			
			ThreadLocalSession.getLocal_session().setAttribute(ZcContext.LOGIN_USER_KEY, (ZcUserInfo)r.getReturnValue());
			//return new ModelAndView("userinfo/user_login");
			return new ModelAndView(UrlHelp.getRedirect("../index.html", null));
		}
		response.setContentType("tex/html;charset=utf-8");
		try {
			response.getWriter().write(r.toJson());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping("/exit.html")
	public String exitLogin(HttpServletRequest request){
		ThreadLocalSession.getLocal_session().removeAttribute(ZcContext.LOGIN_USER_KEY);
		return "redirect:/index.html";
	}
	
	
	@RequestMapping("/beginSend.html")
	@ResponseBody
	public String beginSend(HttpServletRequest request,@ModelAttribute ZcUserInfo zcUserInfo,@RequestParam(value="userName") String userName){
		Result r=new Result();
	//ZcUserInfo sezcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		    zcUserInfo=zcUserInfoService.queryByUserName(userName);
		    
		     String emailUrl="";
		    
		    
		    if(zcUserInfo!=null){
		    	 String emailTmp=zcUserInfo.getEmail();
		    	 
		    	 if(emailTmp!=null){
		    		if( emailTmp.substring(emailTmp.lastIndexOf("@")+1, emailTmp.lastIndexOf(".")).toLowerCase()=="163"){
		    			emailUrl="http://mail.163.com";
		    		}else if (emailTmp.substring(emailTmp.lastIndexOf("@")+1, emailTmp.lastIndexOf(".")).toLowerCase()=="126") {
		    			emailUrl="http://mail.126.com";
					}else if (emailTmp.substring(emailTmp.lastIndexOf("@")+1, emailTmp.lastIndexOf(".")).toLowerCase()=="qq") {
		    			emailUrl="http://mail.qq.com";
					}else if (emailTmp.substring(emailTmp.lastIndexOf("@")+1, emailTmp.lastIndexOf(".")).toLowerCase()=="sina") {
		    			emailUrl="http://mail.sina.com";
					}else if (emailTmp.substring(emailTmp.lastIndexOf("@")+1, emailTmp.lastIndexOf(".")).toLowerCase()=="sohu") {
		    			emailUrl="http://mail.sohu.com";
					}else if (emailTmp.substring(emailTmp.lastIndexOf("@")+1, emailTmp.lastIndexOf(".")).toLowerCase()=="yahoo") {
		    			emailUrl="http://mail.yahoo.com";
					}else if (emailTmp.substring(emailTmp.lastIndexOf("@")+1, emailTmp.lastIndexOf(".")).toLowerCase()=="tom") {
		    			emailUrl="http://mail.tom.com";
					}else if (emailTmp.substring(emailTmp.lastIndexOf("@")+1, emailTmp.lastIndexOf(".")).toLowerCase()=="139") {
		    			emailUrl="http://mail.10086.cn";
					}else if (emailTmp.substring(emailTmp.lastIndexOf("@")+1, emailTmp.lastIndexOf(".")).toLowerCase()=="21cn") {
		    			emailUrl="http://mail.21cn.com";
					}else if (emailTmp.substring(emailTmp.lastIndexOf("@")+1, emailTmp.lastIndexOf(".")).toLowerCase()=="21cn") {
		    			emailUrl="http://mail.21cn.com";
					}else if (emailTmp.substring(emailTmp.lastIndexOf("@")+1, emailTmp.lastIndexOf(".")).toLowerCase()=="263") {
		    			emailUrl="http://mail.263.com";
					}
		    		

		    	 }
		    	
		    	
		    	  EmailUtils.sendResetPasswordEmail(zcUserInfo);  
		    	 r.setSuccess(true);
		    	 request.setAttribute("emailUrl",emailUrl);
		    	 request.setAttribute("zcUserInfo",zcUserInfo);
					//throw new NotValidateCorrectException("项目名称有重复");
			 }else{
				 r.setSuccess(false);
					r.getErrorMsgs().add("用户不存在");
					RootLogger.error("用户不存在.");
			 }
		    

		
		return r.toJson();
	}
	
	
	@RequestMapping("/beginNext.html")
	@ResponseBody
	public String beginNext(HttpServletRequest request,@ModelAttribute ZcUserInfo zcUserInfo,@RequestParam(value="userName") String userName){
		Result r=new Result();
		ZcUserInfo sezcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		System.out.println(userName);
		 ZcUserInfo userInfo=zcUserInfoService.queryByUserName(userName);
		 if(userInfo!=null){
			 r.setSuccess(true);
			 RootLogger.error("此用户存在.");
		 }else{
			 r.setSuccess(false);
				r.getErrorMsgs().add("此用户不存在");
				RootLogger.error("此用户不存在.");
		 }
		  r.setReturnValue(userName);
	
	
		
		return r.toJson();
	}
	
	
	
	@RequestMapping("/beginUpdate.xhtml")
	@ResponseBody
	public String beginUpdate(HttpServletRequest request,@ModelAttribute ZcUserInfo zcUserInfo,@RequestParam(value="userName") String userName,@RequestParam(value="userIntroduce") String userIntroduce,@RequestParam(value="email") String email,@RequestParam(value="userPhone") String userPhone){
		Result r=new Result();
		ZcUserInfo sezcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		//zcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		//zcUserInfoService.update(userName,zcUserInfo.getUserCode());
		 List<ZcUserInfo>  listemail=new ArrayList<ZcUserInfo>();
		listemail=zcUserInfoService.queryByEmailAndUserCodeNotIn(email, sezcUserInfo.getUserCode());
		 List<ZcUserInfo>  listuserphone=new ArrayList<ZcUserInfo>();
		 listuserphone=zcUserInfoService.queryByUserPhoneAndUserCodeNotIn(userPhone, sezcUserInfo.getUserCode());
		 if(listemail.size()>0){
			 	r.setSuccess(false);
				r.getErrorMsgs().add("邮箱已被使用");
				RootLogger.error("邮箱已被使用.");
		 }else if(listuserphone.size()>0){
			 r.setSuccess(false);
				r.getErrorMsgs().add("手机号码已被使用");
				RootLogger.error("手机号码已被使用.");
		 }else{

				
				//用户主键id不存在页面隐藏域中，防止被看见
				zcUserInfo.setUserIntroduce(userIntroduce.trim());
				zcUserInfo.setUserCode(sezcUserInfo.getUserCode());
				zcUserInfo.setPassword(sezcUserInfo.getPassword());
				zcUserInfo.setRegIp(sezcUserInfo.getRegIp());
				zcUserInfo.setRegTime(sezcUserInfo.getRegTime());
				zcUserInfo.setUserScore(sezcUserInfo.getUserScore());
				zcUserInfo.setUserRandomCode(sezcUserInfo.getUserRandomCode());
				zcUserInfo.setLoginTime(sezcUserInfo.getLoginTime());
				System.out.println("用户编号："+zcUserInfo.getUserCode());
				int a=zcUserInfoService.update(zcUserInfo);
				if (a>0) {
					r.setSuccess(true);
					ThreadLocalSession.getLocal_session().removeAttribute(ZcContext.LOGIN_USER_KEY);
					ThreadLocalSession.getLocal_session().setAttribute(ZcContext.LOGIN_USER_KEY, zcUserInfo);
				}
			 
		 }
		
		
		return r.toJson();
	}
	
	
	@RequestMapping("/beginUpdatePssword.xhtml")
	@ResponseBody
	public String beginUpdatePssword(HttpServletRequest request,@ModelAttribute ZcUserInfo zcUserInfo,@RequestParam(value="passwordagin") String passwordagin,@RequestParam(value="userOldPassowrd") String userOldPassowrd){
		Result r=new Result();
		//zcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		//zcUserInfoService.update(userName,zcUserInfo.getUserCode());
		
		ZcUserInfo sezcUserInfo=(ZcUserInfo)request.getSession().getAttribute(ZcContext.LOGIN_USER_KEY);
		int flag=zcUserInfoNativeService.updateByUserCode(sezcUserInfo.getUserCode(), passwordagin,userOldPassowrd);
		
		 
		  if(flag==0){
				r.setSuccess(flag==0?true:false);
				
			
		  }else{
				throw new NotValidateCorrectException("输入的旧密码不正确");

		  }
		
	
		//zcUserInfoService.gengxinByUserCode(sezcUserInfo.getUserCode());
		//用户主键id不存在页面隐藏域中，防止被看见
//		zcUserInfo.setUserCode(sezcUserInfo.getUserCode());
//		System.out.println();
//		zcUserInfo.setPassword(passwordagin);
//		zcUserInfo.setRegIp(sezcUserInfo.getRegIp());
//		zcUserInfo.setRegTime(sezcUserInfo.getRegTime());
//		System.out.println("用户编号："+zcUserInfo.getUserCode());
//		int a=zcUserInfoService.update(zcUserInfo);
//		if (a>0) {
//			r.setSuccess(true);
//			ThreadLocalSession.getLocal_session().removeAttribute(ZcContext.LOGIN_USER_KEY);
//			ThreadLocalSession.getLocal_session().setAttribute(ZcContext.LOGIN_USER_KEY, zcUserInfo);
//		}
		return r.toJson();
	}
	
	@RequestMapping("/beginModifyImage.xhtml")
	@ResponseBody
	public String beginModifyImage(HttpServletRequest request){
		Result r=new Result();
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

					ZcResourceInfo saveZr = zcResourceInfoService.saveResourceInfo(zr);
					zcUserInfoNativeService.updateUSER_IMAGE(saveZr);
					ZcUserInfo info = (ZcUserInfo) ThreadLocalSession.getLocal_session()
							.getAttribute(ZcContext.LOGIN_USER_KEY);
					info.setResourceInfo(saveZr);
					ThreadLocalSession.getLocal_session().removeAttribute(ZcContext.LOGIN_USER_KEY);
					ThreadLocalSession.getLocal_session().setAttribute(ZcContext.LOGIN_USER_KEY, info);
					// pinfo.setResourceCode(saveZr.getResourceCode());
					r.setSuccess(true);
					RootLogger.info("图片上传成功...");
				}
		} catch (IOException e) {
			r.setSuccess(false);
			r.getErrorMsgs().add(e.getMessage());
			RootLogger.error("上传图片出错.");
			RootLogger.error(e);
			throw new NotValidateCorrectException("上传项目出错");
		} finally {
			IOUtils.closeQuietly(ins);
			IOUtils.closeQuietly(fos);
		}

		return r.toJson();
	}

	private String genaretorTargeFileName(String uploadTime, String imageType) {
		ZcUserInfo info = (ZcUserInfo) ThreadLocalSession.getLocal_session()
				.getAttribute(ZcContext.LOGIN_USER_KEY);
		String str = ObjectUtils.toString(info.getUserCode()) + uploadTime;
		return MD5.getMD5Str(str)+"_HEADIMG" + imageType;
	}
}
