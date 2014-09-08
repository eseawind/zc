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

  <title>Product view</title>


<style type="text/css">



</style>
<script type="text/javascript">
$(function(){
	var emailRegex=/^[a-z0-9_\-]+(\.[_a-z0-9\-]+)*@([_a-z0-9\-]+\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$/;
	var phoneRegex=/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/;
	var register={};
	register={
			initButtonRegister:function(){
				$("#btnAdd").bind('click',function(e){
					//阻止默认事件发生,会出现 刷新页面的请求
					e.preventDefault();
					//表单验证。。
					var formJson=$("#addForm").serializeArray();
					$.post("userinfos/beginAdd.html",formJson,function(data){
						var d=$.eval2(data);
						if(d.success){
							$.alert("添加提示","添加成功");
							 if(window.ActiveXObject){
								 window.location="../userinfos/address.xhtml";
							 }else{
								 window.location="userinfos/address.xhtml";
							 }
						}else{
							$.alert("添加提示",d.errorMsgs[0]);
						}
					});
				});
				
				
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
				register.commonBlurInput($("#userName"), "validName", "请输入收货人姓名", "请输入2-20字符收货人姓名", true, 2, 20, false);
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

</head>
<body>


  <div class="clear"></div>

 
 
  
  <section id="main">
    <div class="container_12">
       <div id="sidebar" class="grid_3">
	      <aside id="categories_nav">
		     <h3>个人设置</h3>

		     <nav class="left_menu">
			    <ul>
				   <li><a href="userinfo/show.xhtml">个人信息</a></li>
				    <li><a href="userinfo/update.xhtml">资料修改</a></li>
				    <li><a href="#">头像修改</a></li>
				   <li><a href="userinfos/address.xhtml">收货地址</a></li>
				   <li><a href="userinfo/update_password.xhtml">修改密码</a></li>
				    <li><a href="order/order_info.xhtml">我的订单</a></li>
				   <li class="last"><a href="#">消息中心</a></li>
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside><!-- #categories_nav -->

	     <aside id="categories_nav">
		     <h3>作品中心</h3>

		     <nav class="left_menu">
			    <ul>
				   <li><a href="projectinfo/project_like.xhtml">我喜欢的作品<span>(21)</span></a></li>
				 <!--  <li><a href="#">我关注的作品<span> (27)</span></a></li> --> 
				   <li><a href="projectinfo/project_publish.xhtml">我发表的作品<span>(33)</span></a></li>
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside>

	     


	
	   
       </div><!-- .sidebar -->

       <div id="content" class="grid_9">
	      <h1 class="page_title">使用新收货地址<span style="padding-left: 380px;"> <a href="userinfos/address.xhtml" style="font-size: 12px;cursor: pointer;">返回收货人列表</a></span> </h1>
	        

		<FORM  class=registed method=post action="" id="addForm">
				
							
				<div class="email">
					<strong>收货人姓名:</strong><sup class="surely">*</sup>
					&nbsp;<input id=userName style="COLOR: rgb(51,51,51)" class=inputBg1   type=text name=userName class="" value="" />
					<span id=validName class=Validform_checktip></span>
				
				</div><!-- .password -->
							
				<div class="password">
					<strong >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地区:</strong><sup class="surely">*</sup>
					&nbsp;<select name="userProvince" id="userProvince" style="width: 150px;" class="">
									<option >请选择省份</option>
									<option selected="selected" value="浙江省">浙江省</option>
																	
																	</select>
								<select name="userCity" id="userCity"  style="width: 150px;"  class="" >
									<option >请选择城市</option>
									<option selected="selected" value="杭州市">杭州市</option>
									<option value="宁波市">宁波市</option>
																	</select>
																	
																	<select name="userArea" id="userArea"  style="width: 150px;"  class="" >
									<option >请选择城市区域</option>
									<option selected="selected" value="海曙区">海曙区</option>
									<option value="上城区">上城区</option>
																	</select>
					<span id=validPoint class=Validform_checktip  > </span>
				
				</div><!-- .password -->
				
				<div class="password">
					<strong>&nbsp;&nbsp;&nbsp;详细地址:</strong><sup class="surely">*</sup>
					
					
							&nbsp;<input id=userAddress   type=text name=userAddress class="" value="" />
					<span id=validAddress class=Validform_checktip></span>
				</div>
				
			
			
			
				
				
			
				
				<div class="email">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮编:</strong><sup class="surely">*</sup>
					<input id=userZip maxlength="6"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  type=text name=userZip class="" value="" />
					<span id=validZip class=Validform_checktip></span>
				</div>
			
			
				<div class="email">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;手机号码:</strong><sup class="surely">*</sup>
					<input id=userMobilephone onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"   type=text name=userMobilephone class="" value="" />
					<span id=validMobilephone class=Validform_checktip></span>
				</div>
				
				<div class="email">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;固定电话:</strong><sup class="surely">*</sup>
					<input id=userTelephone   type=text name=userTelephone class="" value="" />
					<span id=validTelephone class=Validform_checktip></span>
				
				</div>
				
				<div class="email">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱:</strong><sup class="surely">*</sup>
					<input id=userEmail   type=text name=userEmail class="" value="" />
					<span id=validEmail class=Validform_checktip></span>
				
				</div>
				<div class="submit">	
				  <button href="javascript:void(0)" id=btnAdd class="button blue">保存</button>
													
					<!--<button class="account" id="btnAdd">发布作品</button>-->
				</div>
													
					<!--  <button class="account" id="btnUpdate">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>-->
				<!-- .submit -->
			</form>
		<div class="clear"></div>

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
