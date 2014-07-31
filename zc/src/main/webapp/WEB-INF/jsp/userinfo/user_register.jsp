<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/index_title.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>

 <!-- <link href="../css/main.css" rel="StyleSheet" />
 <link href="../css/zc_register.css" rel="StyleSheet" /> -->
<script type="text/javascript">
	$(function(){
		var emailRegex=/^[a-z0-9_\-]+(\.[_a-z0-9\-]+)*@([_a-z0-9\-]+\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$/;
		var phoneRegex=/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/;
		var register={};
		register={
				initButtonRegister:function(){
					$("#btnRegister").bind('click',function(){
						if(register.checkRegForm()){
							var formJson=$("#regForm").serializeArray();
							$.post("userinfo/beginRegister.html",formJson,function(data){
								var d=$.eval2(data);
								if(d.success){
									$.alert("注册提示","注册成功");
								}else{
									$.alert("注册提示",d.errorMsgs[0]);
								}
							})
						}
					})
					
				},
				checkRegForm:function(){//验证表单
					if(!register.validateInput($("#userName"), "validAccount", "请输入您的用户名", "请输入6-20位用户名", true, 6, 20, false)){
						return false;
					}
					else if(!register.validateInput($("#email"), "validEmail", "请输入您的邮箱", "邮箱格式不正确", false, 0, 0, emailRegex)){
						return false;
					}
					else if(!register.validateInput($("#userPhone"), "validPhone", "请输入您的手机号", "手机格式不正确", false, 0, 0, phoneRegex)){
						return false;
					}
					else if(!register.validateInput($("#password"), "validPassword", "请输入密码", "请输入6-20位密码", true, 6, 20, false)){
						return false;
					}else if($("#passwordagin").val()!=$("#password").val()){
						$("#validpasswordAgain").addClass("Validform_wrong").html("两次密码输入不一致");
						$("#validpasswordAgain").show();
						$("#passwordagin").addClass("Validform_error");
						return false;
					}
					return true;
				},
				blurInput:function(){
					register.commonBlurInput($("#userName"), "validAccount", "请输入您的用户名", "请输入6-20位用户名", true, 6, 20, false);
					register.commonBlurInput($("#email"), "validEmail", "请输入您的邮箱", "邮箱格式不正确", false, 0, 0, emailRegex);
					register.commonBlurInput($("#userPhone"), "validPhone", "请输入您的手机号", "手机格式不正确", false, 0, 0, phoneRegex);
					register.commonBlurInput($("#password"), "validPassword", "请输入密码", "请输入6-20位密码", true, 6, 20, false);
					$("#passwordagin").blur(function(){
						var that=$(this);
						if(that.val()!=$("#password").val()){
							$("#validpasswordAgain").addClass("Validform_wrong").html("两次密码输入不一致");
							$("#validpasswordAgain").show();
							that.addClass("Validform_error");
						}else{
							$("#validpasswordAgain").hide();
							that.removeClass("Validform_error");
						}
						
					})
				},
				/**
				* obj:注册blur事件对象
				* validateId:验证信息id
				* errmsg1：错误信息1
				* errmsg2：错误信息2
 				**/
				commonBlurInput:function(obj,validateId,nullerrMsg,errMsg2,isvalidateLen,minlen,maxlen,regex){
					var t=$(obj);
					t.blur(function(){
						var that=$(this);
						if(!that.val()){
							$("#"+validateId+"").addClass("Validform_wrong").html(nullerrMsg);
							$("#"+validateId+"").show();
							that.addClass("Validform_error");
						}else{
							if(isvalidateLen){//验证长度
								var len=that.val().length;
								if(len<minlen||len>maxlen){
									$("#"+validateId+"").addClass("Validform_wrong").html(errMsg2);
									$("#"+validateId+"").show();
									that.addClass("Validform_error");
								}else{
									$("#"+validateId+"").hide();
									that.removeClass("Validform_error");
								}
							}else{
								if(regex){
									if(!regex.test(that.val())){
										$("#"+validateId+"").addClass("Validform_wrong").html(errMsg2);
										$("#"+validateId+"").show();
										that.addClass("Validform_error");
									}else{
										$("#"+validateId+"").hide();
										that.removeClass("Validform_error");
									}
								}else{
									$("#"+validateId+"").hide();
									that.removeClass("Validform_error");
								}
							}
						}
					})
				},validateInput:function(obj,validateId,nullerrMsg,errMsg2,isvalidateLen,minlen,maxlen,regex){
					var that=$(obj);
					if(!that.val()){
						$("#"+validateId+"").addClass("Validform_wrong").html(nullerrMsg);
						$("#"+validateId+"").show();
						that.addClass("Validform_error");
						return false;
					}else{
						if(isvalidateLen){//验证长度
							var len=that.val().length;
							if(len<minlen||len>maxlen){
								$("#"+validateId+"").addClass("Validform_wrong").html(errMsg2);
								$("#"+validateId+"").show();
								that.addClass("Validform_error");
								return false;
							}else{
								$("#"+validateId+"").hide();
								that.removeClass("Validform_error");
								return true;
							}
						}else{
							if(regex){
								if(!regex.test(that.val())){
									$("#"+validateId+"").addClass("Validform_wrong").html(errMsg2);
									$("#"+validateId+"").show();
									that.addClass("Validform_error");
									return false;
								}else{
									$("#"+validateId+"").hide();
									that.removeClass("Validform_error");
									return true;
								}
							}else{
								$("#"+validateId+"").hide();
								that.removeClass("Validform_error");
								return true;
							}
						}
					}
				}
		};
		function main(){
			//注册事件
			register.initButtonRegister();
			register.blurInput();
		}
		
		main();
		
	})
</script>
<style type="text/css">
.registerform table{
width: 550px;
}
.registerform table td{
height: 55px;text-align: right;
}

</style>
</head>
<body>

<div class="layout-width mt18 clearfix" >
    <div class="bag clearfix">
        <div class="relative fr ">
            <img ondragstart="return false;" style="display:block;margin-top:85px;" src="images/about_nipic.jpg">
            <div class="absolute" style="top: 27px; left: 0px; width: 377px; font-size: 18px;">在设计师平台你可以</div>
            
            <a href="http://service.nipic.com/site/aboutus.html" title="了解更多什么是信息网？" hidefocus="true" class="absolute font-simsun about-nipic-link">了解更多"xxx？"&gt;&gt;</a>
        </div>
        <div class="fl bag-aside">
           
            <div style="margin-left: 30px;">
          
           <FORM class=registerform method=post action="" id="regForm">
<table>
<tr>
<td colspan="3">
 <div class="bag-aside-hd">
                <h2 class="fl mr15">注册新用户</h2>
                <div class="fl reg-tip">已有帐号？去<a href="userinfo/login.html" class="red1 underline" hidefocus="true" target="_self">登录</a>&gt;</div>
            </div>
</td>
</tr>
<tr>
	<td  style="width:80px; ">用户名:</td>
	<td style=" width: 180px;"> <input  style="COLOR: rgb(51,51,51)"  id=userName class=inputBg1  type=text name=userName  placeholder="请输入6-20位用户名" > </td>
	<td style="width:170px; ">&nbsp;<DIV id=validAccount class=Validform_checktip  > </DIV> </td>
</tr>
<tr>
	<td>邮箱:</td>
	<td><INPUT style="COLOR: rgb(51,51,51)"  id=email class=inputBg1  type=text name=email placeholder="请输入您的邮箱"  > </td>
	<td>  <DIV id=validEmail class=Validform_checktip></DIV> </td>
</tr>
<tr>
	<td>手机号:</td>
	<td><INPUT style="COLOR: rgb(51,51,51)"   id=userPhone class=inputBg1  type=text name=userPhone  placeholder="请输入您的手机号" > </td>
	<td>  <DIV id=validPhone class=Validform_checktip></DIV>  </td>
</tr>
<tr>
	<td>密码:</td>
	<td><INPUT style="COLOR: rgb(51,51,51)"   id=password class=inputBg1  type=password name=password  placeholder="请输入6-20位密码" > </td>
	<td>  <DIV id=validPassword class=Validform_checktip></DIV>  </td>
</tr>
<tr>
	<td>确认密码:</td>
	<td> <INPUT style="COLOR: rgb(51,51,51)"   id=passwordagin class=inputBg1  type=password name=passwordagin  placeholder="请再次输入密码" > </td>
	<td> <DIV id=validpasswordAgain class=Validform_checktip></DIV>   </td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="2" style="text-align: left;">
<INPUT 
  style="POSITION: relative; VERTICAL-ALIGN: middle; MARGIN-RIGHT: 5px; _top: -2px" 
  CHECKED type=checkbox name=tiaokuan datatype="xieyi">我已阅读并同意<A 
  style="COLOR: #003399" tabIndex=-1 
  href="#" target=_blank>《xx网用户注册协议》</A><B 
  style="PADDING-LEFT: 40px; DISPLAY: none; COLOR: #999; FONT-WEIGHT: normal" 
  id=xieyitishi><IMG style="VERTICAL-ALIGN: middle" 
  src="images/tan.gif" width=18 
  height=19>&nbsp;&nbsp;请接受服务条款</B></SPAN> </H4>
</td>
</tr>
<tr>
<td>&nbsp;</td>
	<td colspan="2" style="text-align: left;"><SPAN style="CURSOR: pointer ;margin-left:10px;" 
  id=reg><IMG id=btnRegister src="images/ty.gif" 
  width=251 height=40></SPAN> </td>
</tr>
</table>
 </FORM></div>
</div>
    </div>
</div>


<div class="nipic-footer align-center mt40">
    <div class="layout-width layout-width990">
        <a hidefocus="true" title="关于众筹" href="#">关于众筹</a><span class="sepline">|</span><a hidefocus="true" title="网站公约" href="#">网站公约</a><span class="sepline">|</span><a hidefocus="true" title="网站声明" href="#">网站声明</a><span class="sepline">|</span><a hidefocus="true" title="帮助中心" href="#">帮助中心</a><span class="sepline">|</span><a hidefocus="true" title="联系我们" href="http://service.nipic.com/site/contact.html">联系我们</a><span class="sepline">|</span><a hidefocus="true" title="常见问题" href="#">常见问题</a><span class="sepline">
        <p class="gray mt10"><span class="font-tahoma">Copyright © 2014 NiPic.com All Rights Reserved</span>　版权所有·众筹网　增值电信业务经营许可证 ：浙B2-20140130  </p>
        <p class="gray mt10">众筹网是网络服务平台方，若您发现您的权利被侵害，请发起知识产权投诉，<span class="font-tahoma">xhymmc@163.com</span></p>
        <p class="mt10"><img height="52" ondragstart="return false;" src="images/ppaa.gif" /></p>
    </div>
</div>  

<DIV id=RightMenu><A href="userinfo/register.html#header"><IMG 
src="images/right1.png" width=47 height=56></A><A title=产品反馈 
onclick=User.show(this); href="javascript:void(0);" rel=Dialog_Alert 
url="/Feedback/" mode="iframe" showbg="true" showborder="false" 
showtitle="false" height="500" width="750"><IMG 
src="images/right2.png" width=47 height=56></A><A title=在线客服 
href="http://wpa.qq.com/msgrd?v=3&amp;uin=2787064043&amp;site=qq&amp;menu=yes" 
target=_blank><IMG src="images/right3.png" width=47 
height=56></A><A id=code class=ewm href="javascript:void(0);"><SPAN 
style="DISPLAY: none" id=code_img></SPAN><IMG 
src="images/right4.png" width=47 height=56></A></DIV>
<DIV style="DISPLAY: none" class=ui_btn_min></DIV>

</body>
</html>