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


  <script>
	$(document).ready(function() {
		$('.jqzoom').jqzoom({
			zoomType: 'standard',
			lens:true,
			preloadImages: true,
			alwaysOn:false
		});
	});
  </script>

  <script>
	$(document).ready(function() {
		$("select").selectBox();
	});
  </script>

  <script>
	$(document).ready(function() {
		$('#wrapper_tab a').click(function() {
			if ($(this).attr('class') != $('#wrapper_tab').attr('class') ) {
				$('#wrapper_tab').attr('class',$(this).attr('class'));
			}
			return false;
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
          $('#list_banners').carouFredSel({
		prev: '#ban_prev',
		next: '#ban_next',
		scroll: 1,
		auto: false
	  });
	  $('#thumblist').carouFredSel({
		prev: '#img_prev',
		next: '#img_next',
		scroll: 1,
		auto: false,
		circular: false,
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
				    <li><a href="order/order_info.xhtml">我的订单</a></li>
				   <li class="last"><a href="#">消息中心</a></li>
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
	      <h1 class="page_title">个人信息</h1>

		<div class="product_page">
			<div class="grid_4 img_slidinfo" id="products" >
				
				<div class="preview slides_container">
					<form method=post action="userinfo/beginModifyImage.xhtml"   name="addForm" id="addForm" 	enctype="multipart/form-data" >
					<div class="prev_bginfo">
						<a href="#"  rel='gal1' title="">
						<c:if test="${sessionScope.USER_INFO!=null }">
						
						
						<img src="uploadImg/${sessionScope.USER_INFO.resourceInfo.resourceName }" style="width: 200px;height: 200px;"  id="imgBox"  title="" alt=""/>
						</c:if>
						
							
						</a>
					</div>
					
					<a id="modifyImage">修改头像</a> &nbsp;&nbsp;&nbsp;&nbsp;
					<a id="saveImage">保存</a>
					<script type="text/javascript">
					 
						$(function(){
							$("#modifyImage").click(function(e){
								e.preventDefault();
								$("#fileuploada").trigger("click");
							})
							//图片上传
							$("#fileuploada").bind('change',function(){
								if(!window.ActiveXObject){
									var files=!!this.files?this.files:[];
									if(!files.length||!window.FileReader)return;
									if(/^image/.test(files[0].type)){
										var reader=new FileReader();
										reader.readAsDataURL(files[0]);
										reader.onloadend=function(){
											$("#fileRealPath").val(this.result);
											//$("#bgbox").css("background-image","url("+this.result+")");
											$("#imgBox").attr("src",this.result);
											//$("#imgDivBox").css("background-image","url("+this.result+")");
										}
									}
								}else{
									var p=getPath($(this)[0]);
									$("#fileRealPath").val(p);
									//var obj=$("#imgDivBox")[0];
									//obj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = p;
									$("#imgDivBox").html('<div style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + p + '\')"></div>');
									alert($("#imgDivBox").html());
								}
							});
							$("#saveImage").click(function(e){
								if(!$("#fileRealPath").val()){
									$.alert("修改图像","请选择头像");
									return;
								}
								$("#addForm").ajaxSubmit({
									 success:function(html){
										 var d=$.eval2(html);
										 if(d.success){
											 $.alert("修改图像","修改成功",function(){
												//window.href.reload();
											 });
										 }else{
											 $.alert("修改图像",$.errorMsgs[0]);
										 }
									 }
								 })
							})
							
						})
						function getPath(obj)  
					{  
					  if(obj)  
					    {  
					    if (window.navigator.userAgent.indexOf("MSIE")>=1)  
					      {  
					        obj.select();  
					 
					      return document.selection.createRange().text;  
					      }  
					    else if(window.navigator.userAgent.indexOf("Firefox")>=1)  
					      {  
					      if(obj.files)  
					        {  
					        return obj.files.item(0).getAsDataURL();
					    	  //return window.URL.createObjectURL(obj.files[0]);
					        }  
					      return obj.value;  
					      }  
					    return obj.value;  
					    }  
					} 
					</script>	
					<input type="hidden" id="fileRealPath">
				<input type="file"  value="上传" id="fileuploada" name="fileupload" style="display:none; "/></form>
				</div><!-- .prev -->
		</div><!-- .grid_4 -->

			<div class="grid_5" >
				<div class="entry_content">
					<div class="user-fun">
					<h2><c:if test="${sessionScope.USER_INFO!=null }"><c:out value="${sessionScope.USER_INFO.userName }"></c:out></c:if></h2> 
					<a href="userinfo/update.xhtml" class="btn-red-h20 btn-base common-sprite">
						<span class="common-sprite"><i class="common-sprite icon-set"></i>个人设置</span>
					</a>
					<a href="javascript:void(0);" class="btn-red-h20 btn-base common-sprite">
						<span class="common-sprite"><i class="common-sprite icon-info"></i>消息中心</span>
					</a>
					
				</div>
				
				<div class="user-info">
				<p></p>
					<p>${sessionScope.USER_INFO.userIntroduce }</p>
					<p>积分：${sessionScope.USER_INFO.userScore }  <a style="cursor: pointer;" href="javascript:void(0);">如何获取积分？</a></p>
					<!-- <p>加入时间：25天前</p> -->
					<p>所在地区：${sessionScope.USER_INFO.userProvince },${sessionScope.USER_INFO.userCity }</p>
					<p>上次登录时间：${sessionScope.USER_INFO.loginTime}</p>
										
									</div>
				
					
					

				<!-- .soc -->
				</div><!-- .entry_content -->

			</div><!-- .grid_5 -->

			<div class="clear"></div>

			

			<div class="clear"></div>

			
		</div><!-- .product_page -->
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

<script type="text/javascript" src="js/jquery.form.js"></script>
</body>
</html>
