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

  <title>用户中心-修改密码</title>



<script type="text/javascript">
	$(function(){
		var emailRegex=/^[a-z0-9_\-]+(\.[_a-z0-9\-]+)*@([_a-z0-9\-]+\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$/;
		var phoneRegex=/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/;
		var register={};
		register={
				initButtonRegister:function(){
					$("#btnUpdate").bind('click',function(e){
						//阻止默认事件发生,会出现 刷新页面的请求
						e.preventDefault();
						if(register.checkRegForm()){
							var formJson=$("#updateForm").serializeArray();
							
							$.post("userinfo/beginUpdatePssword.xhtml",formJson,function(data){
								
								var d=$.eval2(data);
							
								if(d.success){
									$.alert("修改提示","修改成功");
								}else{
									$.alert("修改提示",d.errorMsgs[0]);
								}
							})
						}
					})
					
				},
				checkRegForm:function(){//验证表单
					if(!register.validateInput($("#userOldPassowrd"), "validOldPassowrd", "请输入您的旧密码", "请输入6-20位旧密码", true, 6, 20, false)){
						
						return false;
					}

					else if(!register.validateInput($("#password"), "validPassword", "请输入新密码", "请输入6-20位新密码", true, 6, 20, false)){
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
					register.commonBlurInput($("#userOldPassowrd"), "validOldPassowrd", "请输入您的旧密码", "请输入6-20位旧密码", true, 6, 20, false);
					register.commonBlurInput($("#password"), "validPassword", "请输入新密码", "请输入6-20位新密码", true, 6, 20, false);
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


       <div id="content" class="grid_9">
	      <h1 class="page_title">修改密码</h1>
	      
	      
	      
	      
	      
	      
 <FORM class=registed method=post action=""  name="updateForm" id="updateForm" >
		
				
				<div class="email">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;旧密码:</strong><sup class="surely">*</sup>
					&nbsp;<input type="password" placeholder="请输入您的旧密码" id="userOldPassowrd" name="userOldPassowrd" class="" value="" />
					<span id=validOldPassowrd class=Validform_checktip style="margin-right: 100px;"  > </span>
				</div><!-- .email -->
							
							<div class="password">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码:</strong><sup class="surely">*</sup>
					<input id=password placeholder="请输入新密码"  type=password name=password class="" value="" />
					
					 <span id=validPassword class=Validform_checktip style="margin-right: 135px;"></span>
				
				</div>
				
				<div class="password">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认密码:</strong><sup class="surely">*</sup>
					<input id=passwordagin  type=password name=passwordagin class="" value="" /> 
					<span id=validpasswordAgain class=Validform_checktip style="margin-right: 100px;"></span>
				
				</div>
							
				<div class="submit">										
					 
                        <button type="submit" class="button blue" id="btnUpdate">保存</button>
				</div><!-- .submit -->
			</form>
		<div class="clear"></div>

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
