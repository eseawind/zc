<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/include.jsp" %>
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
<div id="header">
    <div class="overlay"></div>
    <div class="header-container">
        
      
        <div class="title">
            <h1 style="display: none"><a href="#">果库</a></h1>
            <a href="/selected/" class="logo"><img src="images/logonew.png"></a>
        </div>
 
        <ul class="nav-bar">
            <li class="active"><a href="../zc/index.html">首页</a></li>
            <li ><a href="#">精选项目</a></li>
            <li ><a href="#">热门项目</a></li>
            <li ><a href="#">关于我们</a></li>
            <li class="add-entity"><a href="http://localhost:9090/only/adddress.html"></a></li>
        </ul>
 
 
        <ul class="user">
            
                <li><a href="#">登录</a></li>
                <li><span>&#124;</span></li>
                <li><a href="../zc/userinfo/register.html">注册</a></li>
            
        </ul>
 
            <form action="#" method="GET">
                <input type="text" placeholder="搜你想要的" name="q" class="search">
                <input class="search-submit" type="submit" value="">
            </form>
        
    </div>
</div>
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

<a href="javascript:void(0)" target="_blank"><li>
				<div>
					<div style="margin-top: 16px;"><img alt="11111" src="images/ts.png" width="300" height="320"> </div>
					<div class="zcProject">
						<span><c:out value="${name }"></c:out> </span>
						<span style="font-size: 12px;">目标:15天  1000件 </span>
						<div class="progress-bar"><span class="progress bg-red" style="width:10%;"></span></div>
						<div class="item-rate clearfix">
							<span class="rate1"><em>0%</em><br>已达</span>
							<span class="rate2"><em>￥10</em><br>已筹资</span>
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



<!-- page end-->
<div id="footer">
    <div class="container">
        <span>浙ICP备11036615号-1 浙公网安备11010502019958</span>
 
        <div class="site-info">
            
            <a href="mailto:xhymmc@163.com" alt="Keep in touch :)">邮件反馈</a>
            <a href="#">关于我们</a>
            <a href="#">用户协议</a>
            <span>&#169; 2014 众筹</span>
        </div>
    </div>
</div>


<DIV id=RightMenu><A href="http://localhost:9191/zc#top"><IMG 
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