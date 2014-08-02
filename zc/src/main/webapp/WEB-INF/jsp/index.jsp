<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/include.jsp" %>
<%@include file="/WEB-INF/jsp/index_title.jsp" %>
<meta name="Keywords" content="众筹">
<meta name="Description" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>众筹T恤平台ss</title>
 <link href="css/main.css" rel="StyleSheet" />

<script type="text/javascript">
	$(function(){
		$("#kinMaxShow").kinMaxShow({
			height:400,
			button:{
					showIndex:false,
					normal:{background:'url(images/demo_extend_images/button.png) no-repeat -14px 0',marginRight:'8px',border:'0',right:'44%',bottom:'20px'},
					focus:{background:'url(images/demo_extend_images/button.png) no-repeat 0 0',border:'0'}
				} 
		});
		function main(){
			var elm=$("#header");
			var startPos = $(elm).offset().top;
			$.event.add(window, "scroll", function () {
			var p = $(window).scrollTop();
				$(elm).css('position', ((p) > startPos) ? 'fixed' : 'static');
				$(elm).css('top', ((p) > startPos) ? '0px' : '');
			});
		}
		//main();
	})
</script>
</head>
<body>

<div id="content" style="width: 100%;color: red;margin: 0px auto;position: relative;">
 <div class="zcbanner">
 	<!-- 图片轮播  begin-->
 	<div id="kinMaxShow" style="position: relative;margin-top: 49px;">
	   <div><a href="#" ><img src="images/ab1.jpg"   /></a></div>
	   <div><a href="#"><img src="images/ab2.jpg"  /></a></div>
	   <div><a href="#"><img src="images/ab3.jpg"   /></a></div>
	</div>
 	<!-- 图片轮播  end -->
</div>

</div>

<!-- page begin-->
<div class="pageDiv">
<c:forEach var="name" items="${reqData }"  varStatus="idx">
<c:if test="${idx.index%3==0}">
	<div class="TshortsLi"><ul>
</c:if>

<a href="projectinfo/project_show.html" ><li>
				<div>
					<div style="margin-top: 16px;"><img alt="11111" src="images/ts.png" width="300" height="320"> </div>
					<div class="zcProject">
						<span><c:out value="${name }"></c:out> </span>
						<span style="font-size: 12px;">目标:15天  1000件 </span>
						<div class="progress-bar"><span class="progress bg-red" style="width:10%;"></span></div>
						<div class="item-rate clearfix">
							<span class="rate1"><em>0%</em><br>已达</span>
							<span class="rate2"><em>10</em><br>已筹集</span>
							<span class="rate3"><em>29天</em><br>剩余时间</span>
							
						</div>
					
					</div>
				
				</div>
				</li></a>

<!-- 恰好  换行 -->
<c:if test="${idx.index%3==2 && idx.last==false }" >
</ul></div> 
</c:if>
<!-- 不满足  最后一行 换行 -->
<c:if test="${idx.index%3!=2 && idx.last==true }" >
</ul></div> 
</c:if>

</c:forEach>



<div class="nipic-footer align-center mt40">
    <div class="layout-width layout-width990">
        <a hidefocus="true" title="关于众筹" href="#">关于众筹</a><span class="sepline">|</span><a hidefocus="true" title="网站公约" href="#">网站公约</a><span class="sepline">|</span><a hidefocus="true" title="网站声明" href="#">网站声明</a><span class="sepline">|</span><a hidefocus="true" title="帮助中心" href="#">帮助中心</a><span class="sepline">|</span><a hidefocus="true" title="联系我们" href="http://service.nipic.com/site/contact.html">联系我们</a><span class="sepline">|</span><a hidefocus="true" title="常见问题" href="#">常见问题</a><span class="sepline">
        <p class="gray mt10"><span class="font-tahoma">Copyright © 2014 NiPic.com All Rights Reserved</span>　版权所有·众筹网　增值电信业务经营许可证 ：浙B2-20140130  </p>
        <p class="gray mt10">众筹网是网络服务平台方，若您发现您的权利被侵害，请发起知识产权投诉，<span class="font-tahoma">xhymmc@163.com</span></p>
        <p class="mt10"><img height="52" ondragstart="return false;" src="images/ppaa.gif" /></p>
    </div>
</div>  

<DIV id=RightMenu><A href="index.html#top"><IMG 
src="images/right1.png" width=47 height=56></A><A title=产品反馈 
onclick=User.show(this); href="javascript:void(0);" rel=Dialog_Alert 
url="/Feedback/" mode="iframe" showbg="true" showborder="false" 
showtitle="false" height="500" width="750"><IMG 
src="images/right2.png" width=47 height=56></A><A title=在线客服 
href="http://wpa.qq.com/msgrd?v=3&amp;uin=2787064043&amp;site=qq&amp;menu=yes" 
target=_blank><IMG src="images/right3.png" width=47 
height=56></A><A id=code class=ewm href="javascript:void(0);"><SPAN 
style="DISPLAY: none" id=code_img></SPAN><IMG 
src="images/right4.png" width=47 height=56></A></DIV>
<DIV style="DISPLAY: none" class=ui_btn_min></DIV>
 
</body>
</html>