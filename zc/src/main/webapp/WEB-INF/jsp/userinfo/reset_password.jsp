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
.steps-bar{margin-bottom:30px;font-size:0;line-height:0;background:#eee;border-radius:3px;overflow:hidden;white-space:nowrap}
.steps-bar .step{position:relative;display:inline-block;*display:inline;width:245px;font-size:14px;line-height:30px;_line-height:29px;text-align:center;color:#666;*zoom:1;*vertical-align:top}
.steps-bar .step--post{color:#999}
.steps-bar .step--current{color:#fff;background:#ff8900}
.steps-bar .step--current .arrow__foreground{border-left-color:#ff8900}
.steps-bar .step--last .icon--complete{position:absolute;width:17px;height:17px;top:9px;left:88px;}
.steps-bar .step__num{font-size:18px;font-weight:700;font-family:Arial}
.steps-bar .arrow__background,.steps-bar .arrow__foreground{position:absolute;top:0;_top:-1px;right:-15px;width:0;height:0;border-width:15px 0 15px 15px;border-style:dashed dashed dashed solid;border-color:transparent transparent transparent #eee;font-size:0;line-height:0;z-index:1}
.steps-bar .arrow__background{right:-17px;top:-2px;_top:-3px;border-left-color:#FFF;border-width:17px 0 17px 17px}
.steps-bar--dark{background:#dedede}
.steps-bar--dark .arrow__foreground{border-color:transparent transparent transparent #dedede}


</style>
 

    <script type="text/javascript">
					$(function() {
						var login = {};
						login = {
							validate : function() {
								//验证用户名
								var userName = $("#userName");
								var passwd = $("#password");
								if (!userName.val()) {
									$("#validAccount").addClass(
											"Validform_wrong").html("用户名不能为空");
									$("#validAccount").show();
									userName.addClass("Validform_error");
									return false;
								} else {
									var len = userName.val().length;
									if (len<6||len>20) {
										$("#validAccount").addClass(
												"Validform_wrong").html(
												"请输入6-20位用户名");
										$("#validAccount").show();
										passwd.addClass("Validform_error");
										return false;
									} else {

										userName.removeClass("Validform_error");
										$("#validAccount").hide();
									}
									return true;
								}

								if (!passwd.val()) {
									$("#validPassword").addClass(
											"Validform_wrong").html(
											"请输入6-20位密码");
									$("#validPassword").show();
									passwd.addClass("Validform_error");
									return false;
								} else {
									var len = passwd.val().length;
									if (len<6||len>20) {
										$("#validPassword").addClass(
												"Validform_wrong").html(
												"请输入6-20位密码");
										$("#validPassword").show();
										passwd.addClass("Validform_error");
										return false;
									} else {
										passwd.removeClass("Validform_error");
										$("#validPassword").hide();
									}
									return true;
								}
							},
							commonBlurInput : function(obj, validateId,
									nullerrMsg, errMsg2, isvalidateLen, minlen,
									maxlen, regex) {
								var t = $(obj);
								t
										.blur(function() {
											var that = $(this);
											if (!that.val()) {
												$("#" + validateId + "")
														.addClass(
																"Validform_wrong")
														.html(nullerrMsg);
												$("#" + validateId + "").show();
												that
														.addClass("Validform_error");
											} else {
												if (isvalidateLen) {//验证长度
													var len = that.val().length;
													if (len<minlen||len>maxlen) {
														$("#" + validateId + "")
																.addClass(
																		"Validform_wrong")
																.html(errMsg2);
														$("#" + validateId + "")
																.show();
														that
																.addClass("Validform_error");
													} else {
														$("#" + validateId + "")
																.hide();
														that
																.removeClass("Validform_error");
													}
												} else {
													if (regex) {
														if (!regex.test(that
																.val())) {
															$(
																	"#"
																			+ validateId
																			+ "")
																	.addClass(
																			"Validform_wrong")
																	.html(
																			errMsg2);
															$(
																	"#"
																			+ validateId
																			+ "")
																	.show();
															that
																	.addClass("Validform_error");
														} else {
															$(
																	"#"
																			+ validateId
																			+ "")
																	.hide();
															that
																	.removeClass("Validform_error");
														}
													} else {
														$("#" + validateId + "")
																.hide();
														that
																.removeClass("Validform_error");
													}
												}
											}
										})
							},
							initlogin : function() {
								//登录
								$("#btnLogin")
										.bind(
												'click',
												function() {
													if (login.validate()) {
														var formJson = $(
																"#loginForm")
																.serializeArray();
														$
																.post(
																		"userinfo/beginLogin.html",
																		formJson,
																		function(
																				data) {
																			var d = $
																					.eval2(data);
																			if (d.success) {
																				//login success;
																				url = "index.html";
																				if ($.browser.msie) {
																					url = "../index.html";
																				}
																				var href = window.location;
																				if (/^.*login.*/
																						.test(href)) {
																					window.location = url;
																				} else {
																					window.location
																							.reload();

																				}
																				//window.location=url;
																			} else {
																				$
																						.alert(
																								"登录提示",
																								d.errorMsgs[0]);
																			}
																		});
													}
												});
							}
						};

						function main() {
							login.commonBlurInput($("#userName"),
									"validAccount", "请输入用户名", "请输入6-20位用户名",
									true, 6, 20, false);
							login.commonBlurInput($("#password"),
									"validPassword", "请输入密码", "请输入6-20位密码",
									true, 6, 20, false);
							login.initlogin();
						}

						main();
					})

					document.onkeydown = function(e) {
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
			<h1 class="page_title">找回登录密码</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_12">
		
        <ul class="steps-bar steps-bar--dark cf">
            <li class="step step--first step--current" style="z-index:4">
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
            <li class="step step--last step--pre" style="z-index:1">
                <span class="step__num">4.</span>
                <span>完成</span>
                
            </li>
        </ul>
       
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
