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

  <title>资料修改</title>


<style type="text/css">



</style>
<script type="text/javascript">
	$(function(){
		var emailRegex=/^[a-z0-9_\-]+(\.[_a-z0-9\-]+)*@([_a-z0-9\-]+\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$/;
		var phoneRegex=/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/;
		var qqreRegex=/^\d{5,10}$/;
		var register={};
		register={
				initButtonRegister:function(){
					$("#btnUpdate").bind('click',function(e){
						//阻止默认事件发生,会出现 刷新页面的请求
						e.preventDefault();
						//表单验证。。
						if(register.checkRegForm()){
						var formJson=$("#updateForm").serializeArray();
						$.post("userinfo/beginUpdate.xhtml",formJson,function(data){
							var d=$.eval2(data);
							if(d.success){
								$.alert("修改提示","修改成功");
								// window.location="../userinfo/update.xhtml";
								
							}else{
								$.alert("修改提示",d.errorMsgs[0]);
							}
						});
					
						}
					});
					
				} ,
				checkRegForm:function(){//验证表单
					if(!register.validateInput($("#userName"), "validAccount", "请输入您的用户名", "请输入6-20位用户名", true, 6, 20, false)){
						
						return false;
					}
					else if(!register.validateInput($("#email"), "validEmail", "请输入您的邮箱", "邮箱格式不正确", false, 0, 0, emailRegex)){
						return false;
					}
					else if(!register.validateInput($("#userPhone"), "validPhone", "请输入您的手机号", "手机格式不正确", false, 0, 0, phoneRegex)){
						return false;
					}else if($("#userProvince").val()=='请选择省份'||$('#userCity').val()=='请选择城市'){
						$("#validPoint").addClass("Validform_wrong").html("请选择所在区域");
						$("#validPoint").show();
						if($("#userCity").val()==0){
							$("#userCity").addClass("Validform_error");
						}
						
						if($("#userProvince").val()==0){
							$("#userProvince").addClass("Validform_error");
						}
						return false;
					}else if($("#userIntroduce").val()==''){
						$("#validIntroduce").addClass("Validform_wrong").html("请输入个人说明");
						$("#validIntroduce").show();
						$("#userIntroduce").addClass("Validform_error");
						return false;
					}
					
					return true;
				},
				blurInput:function(){
					register.commonBlurInput($("#userName"), "validAccount", "请输入您的用户名", "请输入6-20位用户名", true, 6, 20, false);
					register.commonBlurInput($("#email"), "validEmail", "请输入您的邮箱", "邮箱格式不正确", false, 0, 0, emailRegex);
					register.commonBlurInput($("#userPhone"), "validPhone", "请输入您的手机号", "手机格式不正确", false, 0, 0, phoneRegex);
					//register.commonBlurInput($("#userQq"), "validQq", "请输入您的QQ号", "QQ格式不正确", false, 0, 0, qqreRegex);

					$("#userProvince").blur(function(){
						var that=$(this);
						var city=$('#userCity');
						if(that.val()=='请选择省份'||city.val()=='请选择城市'){
							$("#validPoint").addClass("Validform_wrong").html("请选择所在区域");
							$("#validPoint").show();
							that.addClass("Validform_error");
							
							if(city.val()=='请选择城市'){
								city.addClass("Validform_error");
							}
							
							
						}else{
							$("#validPoint").hide();
							that.removeClass("Validform_error");
							if(city.val()!='请选择城市'){
								city.removeClass("Validform_error");
							}
						}
						
					});
					
					$("#userCity").blur(function(){
						var that=$(this);
						var province=$('#userProvince');
						if(that.val()=='请选择城市'||province.val()=='请选择省份'){
							$("#validPoint").addClass("Validform_wrong").html("请选择所在区域");
							$("#validPoint").show();
							that.addClass("Validform_error");
							if(province.val()=='请选择省份'){
								province.addClass("Validform_error");
							}
							
						}else{
							$("#validPoint").hide();
							that.removeClass("Validform_error");
							if(province.val()!='请选择省份'){
								province.removeClass("Validform_error");
							}
						}
						
					});
					
					$("#userIntroduce").blur(function(){
						var that=$(this);
						if(that.val()==''){
							$("#validIntroduce").addClass("Validform_wrong").html("请输入个人说明");
							$("#validIntroduce").show();
							that.addClass("Validform_error");
						}else{
							$("#validIntroduce").hide();
							that.removeClass("Validform_error");
						}
						
					});
					
					
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
<script>
	$(document).ready(function() {
		
		
		 var userProvinceValue=$("#userProvinceValue").val();
		
		if(userProvinceValue==''||userProvinceValue=='请选择省份'){
			 $("#userProvince option").filter("[value='请选择省份']").attr("selected", true);//有效！ 
				
				
		}else{
			
			 $("#userProvince option").filter("[value='"+userProvinceValue+"']").attr("selected", true);//有效！ 
				
				
		}
		
		
		
		 var userCityValue=$("#userCityValue").val();
			
			if(userCityValue==''||userCityValue=='请选择城市'){
				 $("#userCity option").filter("[value='请选择城市']").attr("selected", true);//有效！ 
					
					
			}else{
				
				 $("#userCity option").filter("[value='"+userCityValue+"']").attr("selected", true);//有效！ 
					
					
			}
			
			 var usersexValue=$("#usersexValue").val();
				
				if(usersexValue==''||usersexValue=='0'){
					$("input[type=radio][value=0]").attr("checked",'checked');//有效！ 
						
						
				}else{
					
					$("input[type=radio][value="+usersexValue+"]").attr("checked",'checked');//有效！ 
						
						
				}
			
		
		
		
		
		//$("select").selectBox();
	});
  </script>
</head>
<body>


  <div class="clear"></div>

 
 
  
  <section id="main">
    <div class="container_12">
       <div id="sidebar" class="grid_2">
	      <aside id="categories_nav">
		     <h3>个人设置</h3>

		     <nav class="left_menu">
			    <ul>
				   <li><a href="userinfo/show.xhtml">个人信息</a></li>
				    <li><a href="userinfo/update.xhtml">资料修改</a></li>
				    <li><a href="#">头像修改</a></li>
				   <li><a href="userinfos/address.xhtml">收货地址</a></li>
				   <li><a href="userinfo/update_password.xhtml">修改密码</a></li>
				    <li class="last"><a href="order/order_info.xhtml">我的订单</a></li>
				  <!--  <li class="last"><a href="#">消息中心</a></li> -->
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside><!-- #categories_nav -->

	     <aside id="categories_nav">
		     <h3>作品中心</h3>

		     <nav class="left_menu">
			    <ul>
				   <li><a href="projectinfo/project_like.xhtml">我喜欢的作品<span></span></a></li>
				 <!--  <li><a href="#">我关注的作品<span> (27)</span></a></li> --> 
				   <li><a href="projectinfo/project_publish.xhtml">我发表的作品<span></span></a></li>
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside>

	     


	
	   
       </div><!-- .sidebar -->

       <div id="content" class="grid_10">
	      <h1 class="page_title">资料修改</h1>
	        
 <FORM class=registed method=post action=""  name="updateForm" id="updateForm" >
		
				
				<div class="email">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名:</strong><sup class="surely">*</sup>
					&nbsp;<input type="text" id="userName" name="userName" class="" value="${sessionScope.USER_INFO.userName }" readonly="readonly"/><span id=validName class=Validform_checktip  > </span>
				</div><!-- .email -->
							
				<div class="password">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱:</strong><sup class="surely">*</sup>
					&nbsp;<input id=email   type=text name=email class="" value="${sessionScope.USER_INFO.email }" />
					<span id=validEmail class=Validform_checktip></span>
				
				</div><!-- .password -->
							
				<div class="password">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号:</strong><sup class="surely">*</sup>
					&nbsp;<input id=userPhone  placeholder="请输入您的手机号" onkeydown="onlyNum();"  style="ime-mode:Disabled" type=text name=userPhone class="" value="${sessionScope.USER_INFO.userPhone }" />
					 <span id=validPhone class=Validform_checktip></span>
				
				</div><!-- .password -->
				
				<div class="password">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别:</strong><sup class="surely">*</sup>
					
					
							&nbsp;<input class="" type="radio" id="userSex" name="userSex" value="1">
							<span class="" >男</span>
							<input class=""  type="radio" id="userSex"  name="userSex" value="2">
							<span class="" >女</span>
							<input class=""  type="radio"  id="userSex"  name="userSex" value="0">
							<span class="" >保密</span>
						
					
				<input type="hidden" id="usersexValue" name="usersexValue" value="${sessionScope.USER_INFO.userSex }"> 
				</div>
				
			
			
			
				
				
			
				
				<div class="email" style="line-height: 40px;">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;所在地:</strong><sup class="surely">*</sup>
					<select name="userProvince" id="userProvince" class="" style="width:120px">
									<option value="请选择省份">请选择省份</option>
									<option value="浙江省">浙江省</option>
																	
																	</select>
								<select name="userCity" id="userCity"   class=""  style="width:120px">
									<option value="请选择城市">请选择城市</option>
									<option  value="杭州市">杭州市</option>
									<option value="宁波市">宁波市</option>
																	</select>
					<span id=validPoint class=Validform_checktip  > </span>
					
					<input type="hidden" id="userProvinceValue" name="userProvinceValue" value="${sessionScope.USER_INFO.userProvince }"> 
					<input type="hidden" id="userCityValue" name="userCityValue" value="${sessionScope.USER_INFO.userCity }"> 
				</div>
			
			
			<div class="email">
					<strong>个人说明:</strong><sup class="surely">*</sup>
					&nbsp;<textarea style="width:50%;height:40px;" id="userIntroduce"  name="userIntroduce" ><c:out value="${sessionScope.USER_INFO.userIntroduce }"></c:out></textarea>
					<span id=validIntroduce class=Validform_checktip  > </span>
				</div><!-- .email -->
			
				<div class="email" style="height: 50px;" >
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ:</strong><sup class="surely">&nbsp;&nbsp;</sup>
					&nbsp;<input type="text" onkeydown="onlyNum();"  style="ime-mode:Disabled" id="userQq" name="userQq" class="" value="${sessionScope.USER_INFO.userQq }" />
					<span id=validQq class=Validform_checktip  > </span>
				</div><!-- .email -->
				
				
				<div class="submit">	
				  <button type="button" id="btnUpdate" class="button blue">资料修改</button>
													
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
