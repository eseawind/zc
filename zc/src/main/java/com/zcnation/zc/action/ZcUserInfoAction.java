package com.zcnation.zc.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zcnation.zc.domain.ZcUserInfo;
import com.zcnation.zc.service.ZcUserInfoService;

@Controller
@RequestMapping("/userinfo")
public class ZcUserInfoAction {
	
	@Autowired private ZcUserInfoService zcUserInfoService;

	@RequestMapping("/register.html")
	public String to_register(HttpServletRequest request) {
		return "userinfo/user_register";
	}
	
	@RequestMapping("/beginRegister.html")
	@ResponseBody
	public String beginRegister(HttpServletRequest request,@ModelAttribute ZcUserInfo userinfo,@RequestParam(value="passwordagin") String passwordagin){
		//后台验证
		validate(userinfo,passwordagin);
		String json="";
		ZcUserInfo dbuser=zcUserInfoService.queryUserInfoByEmail(userinfo.getEmail());
		if (dbuser!=null) {
			throw new RuntimeException("该邮箱已注册");
		}else{
			dbuser=zcUserInfoService.queryUserInfoByPhone(userinfo);
			if (dbuser!=null) {
				throw new RuntimeException("用户手机已注册");
			}else{
				String regIp=request.getRemoteAddr();
				userinfo.setRegIp(regIp);
				json=zcUserInfoService.save(userinfo);
			}
		}
		return json;
	}
	/****
	 * 用户注册验证
	 * @param userinfo
	 */
	private void validate(ZcUserInfo userinfo,String passwordagin) {
		String emailRegex="^[a-z0-9_\\-]+(\\.[_a-z0-9\\-]+)*@([_a-z0-9\\-]+\\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$";
		String phoneRegex="^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$";
		if (StringUtils.isBlank(userinfo.getEmail())) {
			throw new RuntimeException("邮箱不能为空");
		}else{
			if (!userinfo.getEmail().matches(emailRegex)) {
				throw new RuntimeException("邮箱格式不正确");
			}
		}
		if (StringUtils.isBlank(userinfo.getUserPhone())) {
			throw new RuntimeException("手机不能为空");
		}else{
			if (!userinfo.getUserPhone().matches(phoneRegex)) {
				throw new RuntimeException("手机格式不正确");
			}
		}
		if (StringUtils.isBlank(userinfo.getPassword())) {
			throw new RuntimeException("密码不能为空");
		}else {
			if (StringUtils.length(userinfo.getPassword())<6) {
				throw new RuntimeException("密码必须6个字符");
			}
			if (!StringUtils.equals(userinfo.getPassword(), passwordagin)) {
				throw new RuntimeException("两次密码输入不一致");
			}
		}
		if (StringUtils.isBlank(userinfo.getUserNname())) {
			throw new RuntimeException("昵称不能为空");
		}
	}

}
