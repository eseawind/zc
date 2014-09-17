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




.verify {
padding: 67px 0 56px;
}
.confirm-account-wrapper, .retrieve-result, .verify {
border: 1px solid #D4D4D4;
padding: 67px 0 58px;
background: #FFF;
}.verify .retrieve__title {
position: relative;
margin: 0 auto 14px;
padding: 8px 0 8px 110px;
width: 350px;
height: auto;
zoom: 1;
}
.verify .retrieve__title .icon {
position: absolute;
top: 50%;
left: 46px;
margin-top: -25px;
width: 50px;
}
.tip-status--large--success {
background-position: 0 -315px;
}
.tip-status--large {
width: 50px;
height: 50px;
background-position: 0 -105px;
}
.tip-status {
display: inline-block;

margin-right: 5px;
overflow: hidden;
background-position: 0 -315px;
vertical-align: -3px;
}
.icon-status-sprite, .tip-status, .tip-status--error, .tip-status--large, .tip-status--large--error, .tip-status--large--opinfo, .tip-status--large--success, .tip-status--middle, .tip-status--middle--error, .tip-status--middle--opinfo, .tip-status--middle--success, .tip-status--opinfo, .tip-status--success {
background-image: url(images/icon-status.v7418d8a5.png) ;
background-repeat: no-repeat;
}

user agent stylesheetlabel {
cursor: default;
}
Inherited from div.retrieve__title
.verify .retrieve__title {
position: relative;
margin: 0 auto 14px;
padding: 8px 0 8px 110px;
width: 350px;
height: auto;
zoom: 1;
}

.verify .retrieve__title .title {
font-size: 18px;
color: #333;
font-family: '微软雅黑';
}
.verify .retrieve__title .sub-title {
font-size: 12px;
color: #999;
font-family: '宋体';
}
a {
color: #2bb8aa;
text-decoration: none;
}
.verify .form-field {
margin: 0 auto 14px;
width: 340px;
}
.form-field {
position: relative;
padding: 8px 0 8px 110px;
zoom: 1;
}
.verify .next-step {
margin-right: 15px;
}
.btn {
color: #fff;
background-color: #2db3a6;
border-color: #0D7B71;
filter: progid:DXImageTransform.Microsoft.gradient(gradientType=0, startColorstr='#FF2EC3B4', endColorstr='#FF2DB3A6');
background-size: 100%;
background-image: -moz-linear-gradient(top,#2ec3b4,#2db3a6);
background-image: -webkit-linear-gradient(top,#2ec3b4,#2db3a6);
background-image: linear-gradient(to bottom,#2ec3b4,#2db3a6);
}
.btn, .btn-hot, .btn-normal {
display: inline-block;
vertical-align: middle;
padding: 7px 20px 6px;
font-size: 14px;
font-weight: 700;
line-height: 1.5;
font-family: SimSun,Arial;
letter-spacing: .1em;
text-align: center;
text-decoration: none;
border-width: 0 0 1px;
border-style: solid;
background-repeat: repeat-x;
-moz-border-radius: 2px;
-webkit-border-radius: 2px;
border-radius: 2px;
-moz-user-select: -moz-none;
-ms-user-select: none;
-webkit-user-select: none;
user-select: none;
cursor: pointer;
}
.verify .resend-tip {
margin: 0 auto 30px;
border: 1px solid #F5D8A7;
padding: 20px;
width: 340px;
background: #FFF6DB;

}
.verify .resend-tip__list {
font-size: 12px;
font-family: '宋体';
color: #666;
}
verify .resend-tip__list li {
list-style: disc inside;
}
.verify .resend-error-tip {
position: relative;
margin-bottom: 5px;
color: #F76120;
font-size: 12px;
}
.verify .resend-tip__list .resend-email-button {
margin: 5px 0 10px;
}
.btn-small {
padding: 3px 20px;
font-size: 12px;
font-weight: 400;
}
.btn-normal {
padding-top: 6px;
color: #333;
background-color: #dedede;
border: 1px solid #e3e3e3;
border-bottom: 1px solid #aaa;
filter: progid:DXImageTransform.Microsoft.gradient(gradientType=0, startColorstr='#FFF7F7F7', endColorstr='#FFDEDEDE');
background-size: 100%;
background-image: -moz-linear-gradient(top,#f7f7f7,#dedede);
background-image: -webkit-linear-gradient(top,#f7f7f7,#dedede);
background-image: linear-gradient(to bottom,#f7f7f7,#dedede);
}
</style>
 

   <script type="text/javascript">
	$(function(){
		var login={};
		login={
			
				initlogin:function(){
					//登录
					$("#btnNext").bind('click',function(){
						if(login.validate()){
							var formJson=$("#loginForm").serializeArray();
							$.post("userinfo/beginNext.html",formJson,function(data){
								var d=$.eval2(data);
								if(d.success){
									//login success;
									url="index.html";
									if($.browser.msie) {
										url="../index.html";
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
            <li class="step step--pre" style="z-index:4;margin-left: -50px;">
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
            <li class="step step--first step--current" style="z-index:2">
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
      
      <h3 class="retrieve-tips">您正在通过“绑定的邮箱”方式进行验证/修改</h3>
      
  <form class="verify verify--info" method="POST" action="/account/retrievepassword/verifyresult" id="yui_3_16_0_1_1410907845110_178"><span style="display:none"><input type="hidden" name="csrf" value="sff3MaLkPYPlHu1IFMQ-0We1CLDlvQ54Y-HOCt2sqybflRxLoZFG8i5Nq6aOI_BT"></span>
        <div class="email-verify-info" id="yui_3_16_0_1_1410907845110_187">
            <div class="retrieve__title">
                <label class="icon tip-status tip-status--large tip-status--large--success"></label>
                <h3 class="title">邮件已发送</h3>
                <h4 class="sub-title">请到<a href="${emailUrl }" target="_blank">xhy***@163.com</a>查阅来自美团的邮件，<br>点击邮件中的链接重设您的登录密码</h4>
            </div>
            <div class="form-field">
                <a class="btn next-step" href="${emailUrl }" target="_blank">去邮箱收信</a>
                <a href="javascript:history.go(-1)">上一步</a>
            </div>
            <div class="resend-tip">
                <h4 class="resend-tip__head">没有收到邮件？</h4>
                <ul class="resend-tip__list">
                    <li>请先检查是否在垃圾邮件中。如果还未收到，请重新发送邮件<br>
                        <div class="J-resend-error-tip resend-error-tip" style="display:none;" id="yui_3_16_0_1_1410907845110_189"><span class="tip-status tip-status--error"></span><span class="J-content"></span></div>
                        <input type="button" value="重新发送邮件" class="btn-normal btn-small resend-email-button J-resend-email-button" href="javascript:void(0);">
                    </li>
                   <!--<li>还是没收到？请选择<a href="#">其他找回方式</a></li>  --> 
                   <li>还是没收到？请联系客服</a></li>
                </ul>
            </div>
        </div>
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
