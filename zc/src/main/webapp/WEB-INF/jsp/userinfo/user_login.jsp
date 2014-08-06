<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/index_title.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>

<!--  <link href="../css/main.css" rel="StyleSheet" />
 <link href="../css/zc_login.css" rel="StyleSheet" /> -->
<style type="text/css">
.registerform table{
width: 550px;
}
.registerform table td{
height: 75px;text-align: right;
}
</style>
<script type="text/javascript">
	$(function(){
		var login={};
		login={
			validate:function(){
					//验证用户名
					var userName=$("#userName");
					var passwd=$("#password");
					if(!userName.val()){
						$("#validAccount").addClass("Validform_wrong").html("用户名不能为空");
						$("#validAccount").show();
						userName.addClass("Validform_error");
						return false;
					}else{
						userName.removeClass("Validform_error");	
						$("#validAccount").hide();
					} 
					if(!passwd.val()){
						$("#validPassword").addClass("Validform_wrong").html("请输入6-20位密码");
						$("#validPassword").show();
						passwd.addClass("Validform_error");
						return false;
					}else{
						var len=passwd.val().length;
						if(len<6||len>20){
							$("#validPassword").addClass("Validform_wrong").html("请输入6-20位密码");
							$("#validPassword").show();
							passwd.addClass("Validform_error");
							return false;
						}else{
							passwd.removeClass("Validform_error");
							$("#validPassword").hide();
						}
						return true;
					}
				},commonBlurInput:function(obj,validateId,nullerrMsg,errMsg2,isvalidateLen,minlen,maxlen,regex){
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
				},
				initlogin:function(){
					//登录
					$("#btnLogin").bind('click',function(){
						if(login.validate()){
							var formJson=$("#loginForm").serializeArray();
							$.post("userinfo/beginLogin.html",formJson,function(data){
								var d=$.eval2(data);
								if(d.success){
									//login success;
									url="index.html";
									if($.browser.msie) {
										url="../index.html";
									}
									window.location=url;
								}else{
									$.alert("登录提示",d.errorMsgs[0]);
								}
							});
						}
					});
				}
		};
		
		function main(){
			login.commonBlurInput($("#password"), "validPassword", "请输入密码", "请输入6-20位密码", true, 6, 20, false);
			login.initlogin();
		}
		
		main();
	})
</script>
 
</head>
<body>
<div class="layout-width mt18 clearfix">
    <div class="bag clearfix">
        <div class="relative fr  ">
            <img ondragstart="return false;" style="display:block;margin-top:85px;" src="images/about_nipic.jpg">
            <div class="absolute" style="top: 27px; left: 0px; width: 377px; font-size: 18px;">在设计师平台你可以</div>
            <ul class="absolute">
               
            </ul>
            <a href="#" title="了解更多什么是信息网？" hidefocus="true" class="absolute font-simsun about-nipic-link">了解更多"xxx？"&gt;&gt;</a>
        </div>
        <div class="fl bag-aside">
            
            
          <div style="margin-left: 30px;border-right: 1px #E5E5E5 solid;height: 100%">
           <FORM class=registerform method=post action="" id="loginForm">
<table>
<tr>
<td colspan="3">
 <div class="bag-aside-hd">
                <h2 class="fl mr15">用户登录</h2>
                <div class="fl reg-tip">还没有账号？立即<a href="userinfo/register.html" class="red1 underline" hidefocus="true" target="_self">注册</a>&gt;</div>
            </div>
</td>
</tr>
<tr>
	<td  style="width:80px; ">用户名:</td>
	<td style=" width: 180px;"> <input  style="COLOR: rgb(51,51,51)"  id=userName class=inputBg1  type=text name=userName  placeholder="请输入用户名/邮箱/手机号码" > </td>
	<td style="width:170px; ">&nbsp;<DIV id=validAccount class=Validform_checktip  > </DIV> </td>
</tr> 
<tr>
	<td>密码:</td>
	<td><INPUT style="COLOR: rgb(51,51,51)"   id=password class=inputBg1  type=password name=password  placeholder="请输入6-20位密码" > </td>
	<td>  <DIV id=validPassword class=Validform_checktip></DIV>  </td>
</tr> 
<tr>
<td>&nbsp;</td>
	<td colspan="2" style="text-align: left;"> <input type="button" value="登   录" id="btnLogin"  style="width: 266px;height: 37px;border-radius:5px 6px 7px 8px;background: url(images/btn.png);color: white;font-family: 微软雅黑;font-size: 16px;"/> </td>
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


<DIV id=RightMenu><A href="userinfo/register.html#top"><IMG 
src="images/right1.png" width=47 height=56></A><A title=产品反馈 
onclick=User.show(this); href="javascript:void(0);" rel=Dialog_Alert 
url="/Feedback/" mode="iframe" showbg="true" showborder="false" 
showtitle="false" height="500" width="750"><IMG 
src="images/right2.png" width=47 height=56></A><A title=在线客服 
href="http://wpa.qq.com/msgrd?v=3&amp;uin=361663126&amp;site=qq&amp;menu=yes" 
target=_blank><IMG src="images/right3.png" width=47 
height=56></A><A id=code class=ewm href="javascript:void(0);"><SPAN 
style="DISPLAY: none" id=code_img></SPAN><IMG 
src="images/right4.png" width=47 height=56></A></DIV>
<DIV style="DISPLAY: none" class=ui_btn_min></DIV>

</body>
</html>