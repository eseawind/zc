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

.user-fun {
width: 100%;
height: 32px;
}
.user-fun h2 {
font-size: 24px;
line-height: 32px;
color: #000;
float: left;
padding-right: 10px;
}
.user-fun .btn-base {
margin: 6px 0px;
color: #FFF;
}
.btn-red-h20 {
background-position: -223px 0px;
height: 20px;
line-height: 20px;
}
.btn-base {
display: inline-block;
zoom: 1;
padding-left: 5px;
color: #FFF;
}
.common-sprite {
background-image: url('images/icon_sprite.png');
background-repeat: no-repeat;
}
.user-fun .btn-base span {
padding: 0px 8px 0px 2px;
margin-right: 8px;
}
.btn-red-h20 span {
background-position: 100% -263px;
height: 20px;
line-height: 20px;
}
.btn-base span {
display: inline-block;
zoom: 1;
padding-right: 5px;
float: left;
}
.icon-set {
background-position: -45px -75px;
}
.icon-set, .icon-msg, .icon-info {
width: 16px;
height: 16px;
line-height: 0px;
font-size: 0px;
display: inline-block;
vertical-align: middle;
_margin-top: 3px;
}

i, em {
font-style: normal;
}
user agent stylesheeti, cite, em, var, address, dfn {
font-style: italic;
}
.user-info {
padding:20px 110px 110px 0px;
}
p {
display: block;
-webkit-margin-before: 1em;
-webkit-margin-after: 1em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
}




</style>
<script type="text/javascript">
	$(function(){
		var register={};
		register={
				initButtonRegister:function(){
					$("#btnUpdate").bind('click',function(e){
						//阻止默认事件发生,会出现 刷新页面的请求
						e.preventDefault();
						//表单验证。。
						var formJson=$("#updateForm").serializeArray();
						$.post("userinfo/beginUpdate.xhtml",formJson,function(data){
							var d=$.eval2(data);
							if(d.success){
								$.alert("修改提示","修改成功");
							}else{
								$.alert("修改提示",d.errorMsgs[0]);
							}
						});
					});
					
				} 
		};
		function main(){
			//注册事件
			register.initButtonRegister();
			//register.blurInput();
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
				   <li><a href="#">收货地址</a></li>
				   <li><a href="#">修盖密码</a></li>
				   <li class="last"><a href="#">消息中心</a></li>
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside><!-- #categories_nav -->

	     <aside id="categories_nav">
		     <h3>作品中心</h3>

		     <nav class="left_menu">
			    <ul>
				   <li><a href="#">我喜欢的作品<span>(21)</span></a></li>
				   <li><a href="#">我关注的作品<span> (27)</span></a></li>
				   <li><a href="#">我发表的作品<span>(33)</span></a></li>
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside>

	     


	
	   
       </div><!-- .sidebar -->

       <div id="content" class="grid_9">
	      <h1 class="page_title">资料修改</h1>

		 <FORM class=registed method=post action=""  name="updateForm" id="updateForm" >
		
				
				<div class="email">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名:</strong><sup class="surely">*</sup>
					&nbsp;<input type="text" id="userName" name="userName" class="" value="${sessionScope.USER_INFO.userName }" readonly="readonly"/><DIV id=validName class=Validform_checktip  > </DIV>
				</div><!-- .email -->
							
				<div class="password">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱:</strong><sup class="surely">*</sup>
					&nbsp;<input id=email   type=text name=email class="" value="${sessionScope.USER_INFO.email }" />
					<DIV id=validEmail class=Validform_checktip></DIV>
				
				</div><!-- .password -->
							
				<div class="password">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号:</strong><sup class="surely">*</sup>
					&nbsp;<input id=userPhone onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"  type=text name=userPhone class="" value="${sessionScope.USER_INFO.userPhone }" />
					 <DIV id=validPhone class=Validform_checktip></DIV>
				
				</div><!-- .password -->
				
				<div class="password">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别:</strong><sup class="surely">*</sup>
					
					
							&nbsp;<input class="" type="radio" name="sex" value="1">
							<span class="" >男</span>
							<input class=""  type="radio" checked="checked" name="sex" value="2">
							<span class="" >女</span>
							<input class=""  type="radio" name="sex" value="0">
							<span class="" >保密</span>
						
					
				
				</div>
				
			
			
			
				
				
			
				
				<div class="email">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;所在地:</strong><sup class="surely">*</sup>
					<select name="proProvince" id="proProvince" class="">
									<option >请选择省份</option>
									<option selected="selected" value="浙江省">浙江省</option>
																	
																	</select>
								<select name="proCity" id="proCity"   class="" >
									<option >请选择城市</option>
									<option selected="selected" value="杭州市">杭州市</option>
									<option value="宁波市">宁波市</option>
																	</select>
					<DIV id=validPoint class=Validform_checktip  > </DIV>
				</div>
			
			
			<div class="email">
					<strong>个人说明:</strong><sup class="surely">*</sup>
					&nbsp;<textarea style="width:70%;height:40px;" id="userIntroduce"  name="userIntroduce"  maxlength="75"><c:out value="${sessionScope.USER_INFO.userIntroduce }"></c:out> </textarea>
					<DIV id=validIntroduce class=Validform_checktip  > </DIV>
				</div><!-- .email -->
			
				<div class="email">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ:</strong><sup class="surely">&nbsp;*</sup>
					&nbsp;<input type="text" id="userQq" name="userQq" class="" value="${sessionScope.USER_INFO.userQq }" /><DIV id=validName class=Validform_checktip  > </DIV>
					<DIV id=validQq class=Validform_checktip  > </DIV>
				</div><!-- .email -->
				
				<div class="submit">										
					<button class="account" id="btnUpdate">&nbsp;&nbsp;保存&nbsp;&nbsp;</button>
				</div><!-- .submit -->
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
