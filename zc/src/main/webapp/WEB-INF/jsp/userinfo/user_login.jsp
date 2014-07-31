<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>

<!--  <link href="../css/main.css" rel="StyleSheet" />
 <link href="../css/zc_login.css" rel="StyleSheet" /> -->
 <style type="text/css">

 </style>

<script type="text/javascript">
	$(function(){
		var getInfoObj=function(){
			return 	$(this).parents("div").next().find(".info");
		}
	
	$("[datatype]").focusin(function(){
		if(this.timeout){clearTimeout(this.timeout);}
		var infoObj=getInfoObj.call(this);
		if(infoObj.siblings(".Validform_right").length!=0){
			return;	
		}
		infoObj.show().siblings().hide();
		
	}).focusout(function(){
		var infoObj=getInfoObj.call(this);
		this.timeout=setTimeout(function(){
		
			infoObj.hide().siblings(".Validform_wrong,.Validform_loading").show();
		},0);
		
	});
		
		var emailRegex=/^[a-z0-9_\-]+(\.[_a-z0-9\-]+)*@([_a-z0-9\-]+\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$/;
		var phoneRegex=/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/;
		var register={
				initButtonRegister:function(){
					$("#btnRegister").bind('click',function(){
						if(register.checkRegForm()){
							var formJson=$("#regForm").serializeArray();
							$.post("beginRegister.html",formJson,function(data){
								var d=$.eval2(data);
								if(d.success){
									alert("注册成功");
								}else{
									alert("注册失败");
								}
							})
						}
					})
					
				},
				checkRegForm:function(){//验证表单
					var email=$("input[name=email]").val();
					var password=$("input[name=password]").val();
					var agpassword=$("input[name=passwordagin]").val();
					var ncname=$("input[name=userNname]").val();
					var phone=$("input[name=userPhone]").val();
					if(!emailRegex.test(email)){
						
						
						$("#valid11").addClass("Validform_wrong");
						$("#valid11").html("邮箱验证不通过");
						$("#email").addClass("Validform_error");
						$("#valid11").show();
						return false;
					}
					if(!phoneRegex.test(phone)){
						alert("手机格式不正确");
						return false;
					}
					if(!password){
						alert("密码不能为空");
						return false;
					}
					if(agpassword!=password){
						alert("两次密码输入不一致");
						return false;
					}
					if(!ncname){
						alert("必须输入昵称");
						return false;
					}
					return true;
				}
		}
		
		jQuery("#email").focus(function(){
			$("#email").removeClass("Validform_error");
			$("#valid11").hide();
		});
		jQuery("#valid11").click(function(){
			$("#valid11").hide();
			$("#email").focus();
		});
		$("#email").blur(function(){
			if(this.value==""){
				$("#valid11").addClass("Validform_wrong");
				$("#email").addClass("Validform_error");
				$("#valid11").html("邮箱不能为空");
				
				$("#valid11").show();
			}else{
				$("#valid11").removeClass("Validform_wrong");
				$("#email").removeClass("Validform_error");
				$("#valid11").hide();
			}
		});
		function main(){
			//注册事件
			register.initButtonRegister();
		}
		
		main();
		
	})
</script>
</head>
<body>
<%@include file="/WEB-INF/jsp/index_title.jsp" %>
<div class="layout-width mt18 clearfix">
    <div class="bag clearfix">
        <div class="relative fr about-nipic">
            <img ondragstart="return false;" style="display:block;margin-top:85px;" src="images/about_nipic.jpg">
            <div class="absolute" style="top: 27px; left: 0px; width: 377px; font-size: 18px;">在众筹网你可以</div>
            <ul class="absolute">
               
            </ul>
            <a href="#" title="了解更多什么是信息网？" hidefocus="true" class="absolute font-simsun about-nipic-link">了解更多"xxx？"&gt;&gt;</a>
        </div>
        <div class="fl bag-aside">
            <div class="bag-aside-hd">
                <h2 class="fl mr15">用户登录</h2>
                <div class="fl reg-tip">还没有账号？去<a href="../userinfo/register.html" class="red1 underline" hidefocus="true" target="_self">注册</a>&gt;</div>
            </div>
            
          
           <FORM class=registerform method=post action="" id="regForm">

<UL>
 <LI>
  <P><FONT id=registResult color=red></FONT></P>
  <P style="margin-left:10px;margin-top: 20px;">登录名 </P>
  <DIV style="POSITION: relative;margin-left:10px;">
  <DIV 
  style="POSITION: absolute; LINE-HEIGHT: 30px; WIDTH: 200px; HEIGHT: 30px; COLOR: #999; TOP: 5px; LEFT: 10px" 
  id=usernametishi></DIV><INPUT style="COLOR: rgb(51,51,51)" 
  id=userNname class=inputBg1  type=text name=userNname 
  datatype="userNname" nullmsg="账号不能为空" ajaxurl="check_uname.htm" 
  autocomplete="off"></DIV>
  <DIV>
  <DIV id=valid1 class=Validform_checktip></DIV>
  <DIV class=info>用户名可以是昵称、邮箱或者手机号<SPAN class=dec><S class=dec1>◆</S><S 
  class=dec2>◆</S></SPAN></DIV></DIV>
  <DIV 
  style="DISPLAY: none; FLOAT: left; HEIGHT: 20px; _padding-top: 10px"></DIV>
  <DIV class=clear></DIV></LI>
  <LI>
 
  <P style="margin-left:10px;margin-top: 20px;">密码 </P><!--<p>-->
  <DIV style="margin-left:10px;"><INPUT 
  onkeydown="if(event.keyCode==32||event.keyCode==188||event.keyCode==222){return false;}" 
  id=password class=inputBg0 onpaste="return false" maxLength=20 type=password 
  name=password datatype="username_pwd" nullmsg="密码不能为空！" plugin="passwordStrength"> 
  </DIV>
  <DIV style="FLOAT: left">
  <DIV id=checkPwdAndName class=Validform_checktip></DIV>
  <DIV class=info>在输入密码时请保证您的电脑是安全的<SPAN class=dec><S class=dec1>◆</S><S 
  class=dec2>◆</S></SPAN></DIV></DIV>
  <DIV class=clear></DIV></LI>
    <LI id=pt_yzm>
  <P style="margin-left:10px;margin-top: 20px;">验证码 </P>
  <DIV id=tupianyzm>
  <DIV style="margin-left:10px;"><INPUT 
  style="OUTLINE-STYLE: none; OUTLINE-COLOR: invert; PADDING-LEFT: 2px; OUTLINE-WIDTH: medium; WIDTH: 137px; FLOAT: left; HEIGHT: 30px" 
  id=captcha class=inputBg0 maxLength=5 size=8 type=text name=j_captcha 
  datatype="*" nullmsg="验证码不能为空" ajaxurl="check_valid_code.htm" 
  autocomplete="off" errormsg="验证码错误"> </DIV>
  <DIV style="POSITION: relative">
  <DIV style="POSITION: absolute; TOP: 0px; LEFT: 280px" 
  class=Validform_checktip></DIV>
  <DIV style="POSITION: absolute; TOP: 0px; LEFT: 280px" id=yzm 
  class=info>填写图片中的字符不区分大小写<SPAN class=dec><S class=dec1>◆</S><S 
  class=dec2>◆</S></SPAN></DIV></DIV></DIV>
  
  <DIV style="FLOAT: left" id=tpyzm><SPAN><IMG 
  style="PADDING-LEFT: 5px; DISPLAY: inline-block; VERTICAL-ALIGN: middle; _position: relative; _top: 5px" 
  id=captchaImage alt=captcha src=""> <A 
  style="POSITION: absolute; MARGIN: 0px 0px 0px 5px; COLOR: rgb(41,83,166)" 
  id=_captchaImage tabIndex=-1 href="javascript:void(0)">换一张</A> </SPAN></DIV>
  
  
  <DIV class=clear></DIV></LI>
   
  <LI style="PADDING-TOP: 30px">
  
  <input type="submit" value="登录" style="CURSOR: pointer ;margin-left:10px;" >
  
 
  </LI>
  </DIV>
  <DIV>
  </UL></FORM>
</div>
    </div>
</div>

 <div class="nipic-footer align-center mt40">
    <div class="layout-width layout-width990">
        <a hidefocus="true" title="关于众筹" href="#">关于众筹</a><span class="sepline">|</span><a hidefocus="true" title="网站公约" href="#">网站公约</a><span class="sepline">|</span><a hidefocus="true" title="网站声明" href="#">网站声明</a><span class="sepline">|</span><a hidefocus="true" title="帮助中心" href="#">帮助中心</a><span class="sepline">|</span><a hidefocus="true" title="联系我们" href="http://service.nipic.com/site/contact.html">联系我们</a><span class="sepline">|</span><a hidefocus="true" title="常见问题" href="#">常见问题</a><span class="sepline">
        <p class="gray mt10"><span class="font-tahoma">Copyright © 2014 NiPic.com All Rights Reserved</span>　版权所有·众筹网　增值电信业务经营许可证 ：浙B2-20140130  </p>
        <p class="gray mt10">众筹网是网络服务平台方，若您发现您的权利被侵害，请发起知识产权投诉，<span class="font-tahoma">xhymmc@163.com</span></p>
        <p class="mt10"><img height="52" ondragstart="return false;" src="../images/ppaa.gif" /></p>
    </div>
</div>  


<DIV id=RightMenu><A href="../userinfo/register.html#top"><IMG 
src="../images/right1.png" width=47 height=56></A><A title=产品反馈 
onclick=User.show(this); href="javascript:void(0);" rel=Dialog_Alert 
url="/Feedback/" mode="iframe" showbg="true" showborder="false" 
showtitle="false" height="500" width="750"><IMG 
src="../images/right2.png" width=47 height=56></A><A title=在线客服 
href="http://wpa.qq.com/msgrd?v=3&amp;uin=2787064043&amp;site=qq&amp;menu=yes" 
target=_blank><IMG src="../images/right3.png" width=47 
height=56></A><A id=code class=ewm href="javascript:void(0);"><SPAN 
style="DISPLAY: none" id=code_img></SPAN><IMG 
src="../images/right4.png" width=47 height=56></A></DIV>
<DIV style="DISPLAY: none" class=ui_btn_min></DIV>

</body>
</html>