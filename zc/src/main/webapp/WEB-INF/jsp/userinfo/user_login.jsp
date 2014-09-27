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
	
	document.onkeydown = function (e) { 
var theEvent = window.event || e; 
var code = theEvent.keyCode || theEvent.which; 
if (code == 13) { 
$("#btnLogin").click(); 
} 
} 

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
			          
                </div><!-- .grid_6 -->
		
		<div class="grid_7">
		 <FORM class=registed method=post action="" id="loginForm">
		
		
				<h2>登录</h2>
							
				<p>还没有账号？立即<a href="userinfo/register.html" class="red1 underline" hidefocus="true" target="_self">注册</a></p>
							
				<div class="email">
					<strong>用户名:</strong><sup class="surely">*</sup>
					<input type="text" id="userName" name="userName" class="" placeholder="请输入6-20位用户名" value="" /><span  id=validAccount class="Validform_checktip"   ></span>
				</div><!-- .email -->
							
				<div class="password">
					<strong>密&nbsp;&nbsp;&nbsp;码:</strong><sup class="surely">*</sup>
					<input id=password  type=password name=password class="" value=""  placeholder="请输入6-20位密码"/><span class="Validform_checktip"   id=validPassword ></span>
					
				</div><!-- .password -->
				
				<div class="remember">
					<input class="niceCheck" type="checkbox" name="Remember_password" />
					<span class="rem">记住密码</span>
				</div><!-- .remember -->
				
				<div class="submit" style="margin-left:30px;">										
				
					<input type="button" value="登   录" id="btnLogin"  style="width: 266px;height: 37px;border-radius:5px 6px 7px 8px;background: url(images/btn.png);color: white;font-family: 微软雅黑;font-size: 16px;"/>
					<a class="forgot" href="userinfo/reset_password.html">忘记密码?</a>
				</div><!-- .submit -->
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
