<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/index_title.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>

<script type="text/javascript">
	$(function(){
		var emailRegex=/^[a-z0-9_\-]+(\.[_a-z0-9\-]+)*@([_a-z0-9\-]+\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$/;
		var phoneRegex=/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/;
		var register={};
		register={
				initButtonRegister:function(){
					$("#btnRegister").bind('click',function(e){
						e.preventDefault();
						if(register.checkRegForm()){
							var formJson=$("#regForm").serializeArray();
							
							$.post("userinfo/beginRegister.html",formJson,function(data){
								var d=$.eval2(data);
								if(d.success){
									$.alert("注册提示","注册成功",function(){
										url="userinfo/login.html";
										if($.browser.msie) {
											url="login.html";
										}
										window.location=url;
									});
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


</style>
</head>
<body>
 
  
   <div class="clear"></div>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">登录</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_5">
			<h2></h2>
			<p style="margin-left: 100px;margin-top: 30px;">人在路上，创意在身上</p>
			<div class="clear"></div>
			          <div style="margin-left: 300px;"> --众筹网</div>
			          
			          <hr style="margin-top: 50px;">
			          <div  style="margin-left:120px;">
      <p style="line-height: 30px;">您也可以使用合作网站账号登录</p>
      <p style="margin-top:20px;"><a href="javascript:void(0);"><img src="images/connect_weibo_logo.png"></a></p>
      <p style="margin-top:20px;"><a href="javascript:void(0);"><img src="images/connect_renren_logo.png"></a></p>
      <p style="margin-top:20px;"><a href="javascript:void(0);"><img src="images/connect_tqq_logo.png"></a></p>
    </div>
			          
                </div>
		
		<div class="grid_7">
		 <FORM class=registed method=post action="" id="regForm">
		
		
			
				<h2>注册</h2>
							
				<p>已有账号？立即<a href="userinfo/login.html" class="red1 underline" hidefocus="true" target="_self">登录</a></p>
							
				<div class="email">
					<strong>用户&nbsp;&nbsp;&nbsp;名:</strong><sup class="surely">*</sup>
					<input type="text" id="userName"  placeholder="请输入您的用户名" name="userName" class="" value="" /><span id=validAccount class=Validform_checktip  > </span>
				</div><!-- .email -->
							
							
				<div class="password">
					<strong>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</strong><sup class="surely">*</sup>
					<input id=email  type=text name=email  placeholder="请输入您的邮箱" class="" value="" /><span id=validEmail class=Validform_checktip></span>
				
				</div><!-- .password -->
							
				<div class="password">
					<strong>手机号码:</strong><sup class="surely">*</sup>
					<input id=userPhone placeholder="请输入您的手机号" onkeydown="onlyNum();"  style="ime-mode:Disabled"  type=text name=userPhone class="" value="" /> <span id=validPhone class=Validform_checktip></span> 
				
				</div><!-- .password -->
				
				<div class="password">
					<strong>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</strong><sup class="surely">*</sup>
					<input id=password  placeholder="请输入密码" type=password name=password class="" value="" /> <span id=validPassword class=Validform_checktip></span>
				
				</div>
				
				<div class="password">
					<strong>确认密码:</strong><sup class="surely">*</sup>
					<input id=passwordagin  type=password name=passwordagin class="" value="" /> <span id=validpasswordAgain class=Validform_checktip></span>
				
				</div>
				
				
				<div class="submit">										
					<SPAN style="CURSOR: pointer ;margin-left:10px;" 
  id=reg><IMG id=btnRegister src="images/ty.gif" 
  width=251 height=40></SPAN>
				</div><!-- .submit --><!-- .submit -->
			</form><!-- .registed -->
                </div><!-- .grid_6 -->
       </div><!-- #content -->
       
      <div class="clear"></div>
    </div><!-- .container_12 -->
  </section><!-- #main -->
  
  <div class="clear"></div>
    
  <footer>
    <div id="footer">
    <div class="container">
        <span>浙ICP备11036615号-1 浙公网安备888888888</span>

        <div class="site-info">
           

            <a href="mailto:xhymmc@163.com" alt="Keep in touch :)">邮件反馈</a>
            <a href="#">关于我们</a>
            <a href="userinfo/protocol.html">用户协议</a>
            <span>© 2014 小众派</span>
        </div>
    </div>
</div>
  
  </footer>
 

</body>
</html>
