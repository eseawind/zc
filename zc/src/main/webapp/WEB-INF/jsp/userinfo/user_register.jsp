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
.registerform table{
width: 550px;
}
.registerform table td{
height: 55px;text-align: right;
}

</style>
</head>
<body>
 
  
  <div class="clear"></div>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">注册</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_6 new_customers">
			<h2>New Customers</h2>
			<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
			<div class="clear"></div>
			<button class="account">Create An Account</button>
                </div><!-- .grid_6 -->
		
		<div class="grid_6">
		 <FORM class=registed method=post action="" id="loginForm">
		
		
				<h2>注册</h2>
							
				<p>已有账号？立即<a href="userinfo/login.html" class="red1 underline" hidefocus="true" target="_self">登录</a></p>
							
				<div class="email">
					<strong>用户名:</strong><sup class="surely">*</sup><br/>
					<input type="text" id="userName" name="userName" class="" value="" /><DIV id=validAccount class=Validform_checktip  > </DIV>
				</div><!-- .email -->
							
				<div class="password">
					<strong>邮箱:</strong><sup class="surely">*</sup><br/>
					<input id=email  type=text name=email class="" value="" /><DIV id=validEmail class=Validform_checktip></DIV>
				
				</div><!-- .password -->
							
				<div class="password">
					<strong>手机号:</strong><sup class="surely">*</sup><br/>
					<input id=userPhone  type=text name=userPhone class="" value="" /> <DIV id=validPhone class=Validform_checktip></DIV> 
				
				</div><!-- .password -->
				
				<div class="password">
					<strong>密码:</strong><sup class="surely">*</sup><br/>
					<input id=password  type=password name=password class="" value="" /> <DIV id=validPassword class=Validform_checktip></DIV>
				
				</div>
				
				<div class="password">
					<strong>确认密码:</strong><sup class="surely">*</sup><br/>
					<input id=passwordagin  type=password name=passwordagin class="" value="" /> <DIV id=validpasswordAgain class=Validform_checktip></DIV>
				
				</div>
				
				
				<div class="remember">
					<input class="niceCheck" type="checkbox" name="Remember_password" />
					<span class="rem">记住密码</span>
				</div><!-- .remember -->
				
				<div class="submit">										
					<SPAN style="CURSOR: pointer ;margin-left:10px;" 
  id=reg><IMG id=btnRegister src="images/ty.gif" 
  width=251 height=40></SPAN>
				</div><!-- .submit -->
			</form><!-- .registed -->
                </div><!-- .grid_6 -->
       </div><!-- #content -->
       
      <div class="clear"></div>
    </div><!-- .container_12 -->
  </section><!-- #main -->
  
  <div class="clear"></div>
    
  <footer>
    <div class="f_navigation">
      <div class="container_12">
        <div class="grid_3">
          <h3>Contact Us</h3>
          <ul class="f_contact">
            <li>49 Archdale, 2B Charlestone</li>
            <li>+777 (100) 1234</li>
            <li>mail@example.com</li>
          </ul><!-- .f_contact -->
        </div><!-- .grid_3 -->
      
        <div class="grid_3">
          <h3>Information</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="#">About As</a></li>
              <li><a href="#">Privacy Policy</a></li>
              <li><a href="#">Terms & Conditions</a></li>
              <li><a href="#">Secure payment</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->
        
        <div class="grid_3">
          <h3>Costumer Servise</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="contact_us.html">Contact As</a></li>
              <li><a href="#">Return</a></li>
              <li><a href="#">FAQ</a></li>
              <li><a href="#">Site Map</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->
        
        <div class="grid_3">
          <h3>My Account</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="#">My Account</a></li>
              <li><a href="#">Order History</a></li>
              <li><a href="#">Wish List</a></li>
              <li><a href="#">Newsletter</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->
        
        <div class="clear"></div>
      </div><!-- .container_12 -->
    </div><!-- .f_navigation -->
    
    <div class="f_info">
      <div class="container_12">
        <div class="grid_6">
          <p class="copyright">Copyright &copy; 2014.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
        </div><!-- .grid_6 -->
        
        <div class="grid_6">
          <div class="soc">
            <a class="google" href="#"></a>
            <a class="twitter" href="#"></a>
            <a class="facebook" href="#"></a>
          </div><!-- .soc -->
        </div><!-- .grid_6 -->
        
        <div class="clear"></div>
      </div><!-- .container_12 -->
    </div><!-- .f_info -->
  </footer>
 
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
