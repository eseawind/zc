<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/index_title.jsp" %>
<head>
  <meta charset="UTF-8">
 
  <meta name="description" content="">
  <meta name="keywords" content="">
 
  <title>Login</title>
 

 
  <script>
	$(document).ready(function() {
		$("select").selectBox();
	});
  </script>
 
  <script>
	$(document).ready(function(){
		$("#myController").jFlow({
			controller: ".control", // must be class, use . sign
			slideWrapper : "#jFlowSlider", // must be id, use # sign
			slides: "#slider",  // the div where all your sliding divs are nested in
			selectedWrapper: "jFlowSelected",  // just pure text, no sign
			width: "984px",  // this is the width for the content-slider
			height: "480px",  // this is the height for the content-slider
			duration: 400,  // time in miliseconds to transition one slide
			prev: ".slidprev", // must be class, use . sign
			next: ".slidnext", // must be class, use . sign
			auto: true	
		});
	});
  </script>
  <script>
	$(function() {
	  $('#list_product').carouFredSel({
		prev: '#prev_c1',
		next: '#next_c1',
		auto: false
	  });
          $('#list_product2').carouFredSel({
		prev: '#prev_c2',
		next: '#next_c2',
		auto: false
	  });
	  $('#list_banners').carouFredSel({
		prev: '#ban_prev',
		next: '#ban_next',
		scroll: 1,
		auto: false
	  });
	  $(window).resize();
	});
  </script>
  <script>
       $(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });             
       })
  </script>
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
						var len=userName.val().length;
						if(len<6||len>20){
							$("#validAccount").addClass("Validform_wrong").html("请输入6-20位用户名");
							$("#validAccount").show();
							passwd.addClass("Validform_error");
							return false;
						}else{
						
						userName.removeClass("Validform_error");	
						$("#validAccount").hide();
						}
						return true;
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
									var href=window.location;
									if(/^.*login.*/.test(href)){
										window.location=url;
									}else{
									window.location.reload();
										
									}
									//window.location=url;
								}else{
									$.alert("登录提示",d.errorMsgs[0]);
								}
							});
						}
					});
				}
		};
		
		function main(){
			login.commonBlurInput($("#userName"), "validAccount", "请输入用户名", "请输入6-20位用户名", true, 6, 20, false);
			login.commonBlurInput($("#password"), "validPassword", "请输入密码", "请输入6-20位密码", true, 6, 20, false);
			login.initlogin();
		}
		
		main();
	})
</script>
</head>
<body>
  
  
  <div class="clear"></div>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">登录</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_6 new_customers">
			<h2>New Customers</h2>
			<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
			<div class="clear"></div>
			<button class="account" id="btnRegNewUsers" onclick="javascript:window.location='userinfo/register.html'">Create An Account</button> 
                </div><!-- .grid_6 -->
		
		<div class="grid_6">
		 <FORM class=registed method=post action="" id="loginForm">
		
		
				<h2>登录</h2>
							
				<p>还没有账号？立即<a href="userinfo/register.html" class="red1 underline" hidefocus="true" target="_self">注册</a></p>
							
				<div class="email">
					<strong>用户名:</strong><sup class="surely">*</sup><br/>
					<input type="text" id="userName" name="userName" class="" value="" /><DIV id=validAccount class=Validform_checktip  >
				</div><!-- .email -->
							
				<div class="password">
					<strong>密码:</strong><sup class="surely">*</sup><br/>
					<input id=password  type=password name=password class="" value="" /><DIV id=validPassword class=Validform_checktip></DIV>
					<a class="forgot" href="#">忘记密码?</a>
				</div><!-- .password -->
				
				<div class="remember">
					<input class="niceCheck" type="checkbox" name="Remember_password" />
					<span class="rem">记住密码</span>
				</div><!-- .remember -->
				
				<div class="submit">										
					<input type="button" value="登   录" id="btnLogin"  style="width: 266px;height: 37px;border-radius:5px 6px 7px 8px;background: url(images/btn.png);color: white;font-family: 微软雅黑;font-size: 16px;"/>
					
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
