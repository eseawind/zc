<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!-- /Added by HTTrack -->
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/index_title.jsp"%>
<head>
<meta charset="UTF-8">

<meta name="description" content="">
<meta name="keywords" content="">

<title>密码找回</title>
<style type="text/css">


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
					$("#btnNext").bind('click',function(e){
						e.preventDefault();
						if(login.validate()){
							var formJson=$("#loginForm").serializeArray();
							$.post("userinfo/beginNext.html",formJson,function(data){
								var d=$.eval2(data);
								if(d.success){
									//login success;
									url="userinfo/choose_email.html?userName="+d.returnValue;
								
									if($.browser.msie) {
										url="../userinfo/choose_email.html?userName="+d.returnValue;
									}
									var href=window.location;
								
									if(/^.*reset_password.*/.test(href)){
										window.location=url;
									}else{
									window.location.reload();
										
									}
									//window.location=url;
								}else{
									$.alert("找回密码提示",d.errorMsgs[0]);
								}
							});
						}
					});
				}
		};
		
		function main(){
			login.commonBlurInput($("#userName"), "validAccount", "请输入用户名", "请输入6-20位用户名", true, 6, 20, false);
			
			login.initlogin();
		}
		
		main();
	})
	
	document.onkeydown = function (e) { 
var theEvent = window.event || e; 
var code = theEvent.keyCode || theEvent.which; 
if (code == 13) { 
$("#btnNext").click(); 
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
			<h1 class="page_title">找回登录密码</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_12">
		<ul class="steps-bar steps-bar--dark cf" >
            <li class="step step--first step--current" style="z-index:4;margin-left: -50px;">
                <span class="step__num">1.</span>
                <span>确认账号</span>
                
                <span class="arrow__background"></span>
                <span class="arrow__foreground"></span>
            </li>
            <li class="step step--pre" style="z-index:3">
                <span class="step__num">2.</span>
                <span>选择验证方式</span>
                
                <span class="arrow__background"></span>
                <span class="arrow__foreground"></span>
            </li>
            <li class="step step--pre" style="z-index:2">
                <span class="step__num">3.</span>
                <span>验证/修改</span>
                
                <span class="arrow__background"></span>
                <span class="arrow__foreground"></span>
            </li>
            <li class="step step--pre" style="z-index:1">
                <span class="step__num">4.</span>
                <span>完成</span>
                
            </li>
        </ul>
      
      
      
  
          <FORM class=registed method=post action="" id="loginForm">
           <br> <br>
               <div class="email" style="margin-left: 300px;">
                  <strong>用户名:</strong><sup class="surely">*</sup>
                  <input type="text" id="userName" name="userName" class="" placeholder="请输入6-20位用户名" value="" />
                  <span  id=validAccount class="Validform_checktip"   ></span>
                   
                </div>
            
              <div class="email" style="margin-right: 360px;line-height: 150px;">
                    <button type="button" id="btnNext" class="button blue">下一步</button>
                </div>
                 <br>
         <br> <br> <br>
            </form>
       
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
    
  
  </footer>
 
</body>
</html>
