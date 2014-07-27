<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="Keywords" content="众筹">
<meta name="Description" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>众筹T恤平台ss</title>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery.kinMaxShow-1.1.min.js"></script>
<!-- <link href="css/zc_main.css" rel="StyleSheet" /> -->
<style type="text/css">
*{
	margin: 0px;
	padding: 0px;
	font-family: "Microsoft Yahei";
	font-size: 12px;
}
body{

}
#header{
 background-color: #343434;width:  100%;height: 49px;top: 0px;position: fixed;z-index: 99999;
 background: none repeat scroll 0 0 #000;
}
#header .header-container{
 margin: 0px auto; width: 100%; height: 49px; min-width: 1024px;position: relative;line-height: 49px;
}
#header .logo{
position: absolute; top: 9px; border: 0px;border-color: none;
}
#header .nav-bar{
width:500px;display: inline-block;
}
#header .nav-bar li{
display: inline-block;list-style: none;float: left;font-size: 18px;margin-top: -1px;
}
#header .nav-bar li a{
text-decoration: none;color: white;font-family: "Microsoft Yahei";font-size: 16px;width: 100%;display: inline-block;width: 105px;text-align: center;
}
#header .nav-bar li a:hover{
color: red;
}

#header .search{
PADDING-BOTTOM: 8px; OUTLINE-STYLE: none; OUTLINE-COLOR: invert; PADDING-LEFT: 5px; OUTLINE-WIDTH: 0px; WIDTH: 145px; PADDING-RIGHT: 5px; BACKGROUND: #fbfbfb; BORDER-TOP: 0px; BORDER-RIGHT: 0px; PADDING-TOP: 6px; border-radius: 3px
}
#header .login{
float: right;height: 49px;line-height: 49px;color: white;font-family: "Microsoft Yahei";font-size: 16px;text-decoration: none;
min-width: 100px;position: relative;margin-right: 20px;margin-left: 20px;
}

#header .login li{
display: inline-block;float: left;
}
#header .login li a{
color: white;font-family: "Microsoft Yahei";font-size: 16px;text-decoration: none;display: block;
}
#header .search-submit {
	BORDER-BOTTOM: 0px; BORDER-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 10px 0px 9px -32px; PADDING-LEFT: 0px; WIDTH: 30px; PADDING-RIGHT: 0px; BACKGROUND: url(images/toolkit.png) no-repeat -16px -54px; HEIGHT: 30px; VERTICAL-ALIGN: middle; BORDER-TOP: 0px; BORDER-RIGHT: 0px; PADDING-TOP: 0px
}

#content .baners{
	margin: -28px auto;
    width: 100px;height: 160px;line-height: 16px;
}
#content .baners ul{
 background: none repeat scroll 0 0 rgba(0, 0, 0, 0.5);
    border-radius: 11px;
    display: inline-block;
    padding: 3px 14px;
}
#content .baners ul li{
 background: url("images/1.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
    float: left;
    height: 16px;
    list-style: none outside none;
    margin-left: 5px;
    width: 16px;
}
#content .baners ul li:hover{
cursor: pointer;
}
#content .baners ul li .no{
 background: url("images/2.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
    float: left;
    height: 16px;
    list-style: none outside none;
    margin-left: 5px;
    width: 16px;
}

#content .indexDiv1{
cursor: pointer;background: url(images/1.jpg) 50% 0% no-repeat;height: 450px;
}
#content .indexDiv2{
cursor: pointer;background: url(images/2.jpg) 50% 0% no-repeat;height: 450px;
}
#content .indexDiv3{
cursor: pointer;background: url(images/3.jpg) 50% 0% no-repeat;height: 450px;
}
#content #tShirts .TshortsLi{
width: 100%;text-align: center;vertical-align: middle;margin: 0 auto;height: 465px;margin-top: 20px;
}
#content #tShirts .TshortsLi ul{
margin: 0 auto;position: relative;width: 1024px;display: inline-block; 
}

#content #tShirts .TshortsLi ul li{
list-style: none;float: left;overflow: hidden;width: 320px;display: inline-block;height: 450px;margin: 0 auto;margin-left: 15px;
}

#content #tShirts .TshortsLi ul li:hover{
    background: none repeat scroll 0 0 #e5e5e5;
}

#content #tShirts .TshortsLi ul a{
color: black;text-decoration: none;
}
.pageDiv{
  background: none repeat scroll 0 0 #fafafa;border: 1px solid #cfd6e0;border-radius: 6px;box-shadow: 1px 1px 8px #e0e0e0;margin: 20px auto;width: 1198px;
}
.pageDiv .TshortsLi{
width: 100%;text-align: center;vertical-align: middle;margin: 0 auto;height: 465px;margin-top: 20px;
}
.pageDiv .TshortsLi ul{
margin: 0 auto;position: relative;width: 1188px;display: inline-block; 
}
.pageDiv .TshortsLi ul a{
color: #666; 
}
.pageDiv .TshortsLi ul li{
list-style: none;float: left;overflow: hidden;width: 350px;display: inline-block;height: 450px;margin: 0 auto;margin-left: 35px;background-color: #fff;
}
.pageDiv .TshortsLi ul li:hover{
    background: none repeat scroll 0 0 #e5e5e5;
}
.zcProject{
padding: 5px 0;
padding-left: 23px;
}
.zcProject span{
	color: #666;
    display: block;
    line-height: 22px;
    margin: 0;
    text-align: left;
    font-size: 16px;font-family: "宋体";font-weight: bold;
}

.progress-bar { padding-left: 23px;
	width: 270px;
	height: 5px;
	line-height: 0px;
	font-size: 0px;
	background: #F2F2F2;
	overflow: hidden;
}

.progress {
	height: 3px;
	line-height: 0px;
	font-size: 0px;
	display: block;
}
.item-rate {
	padding: 8px 12px 0px;
	line-height: 18px;
	color: #A4A4A4;
	position: relative;
}

.item-rate em {
	color: #555;
}

.item-rate em.red {
	color: #ED5E58;
}

.rate1 {
	display: block;
	float: left;
	text-align: left;
	width: 50px;
}

.rate2 {
	display: block;
	float: left;
	text-align: center;
	width: 76px;
}

.rate3 {
	display: block;
	float: right;
	text-align: right;
	width: 70px;
}



.bottom{
margin: 0px auto;min-width: 960px;width: 800px;text-align: center;color: #666666;margin-top: -4px;font-size: 16px;font-family: "微软雅黑";
}
.bottom p{
font-size: 16px;font-family: "微软雅黑";
}
.bottom a{
color: #666666;font-size: 16px;font-family: "微软雅黑";text-decoration: none;padding-left: 10px;padding-right: 10px;
}
.bottom a:hover{
color: #fff;
}

.footer {
    background: none repeat scroll 0 0 #000;
    font-size: 12px;
    padding: 20px 0;
    width: 100%;
}
.foot_main {
    margin: auto;
    width: 967px;
}
.footer p {
    line-height: 25px;
    text-align: left;
}
.footer span {
    margin-left: 10px;color: #666;
}
.footer a {
    color: #666;
    text-decoration: none;
}
.footlogo {
    display: inline;
    float: left;
    height: 50px;
    margin-right: 10px;
    width: 50px;
}
.tz_wm a {
    margin-right: 10px;
    padding-left: 10px;
}
.tz_wm a:hover {
    color: #fff;
}
</style>
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
    <div class="header-container">
        <div style="float: left;width: 100px;height: 49px;line-height: 49px;width: 200px;text-align: center;vertical-align: middle;">
           	&nbsp;<img alt="" src="images/logonew.png" class="logo" >
        </div>
        <div style="float: left;height: 49px;line-height: 49px;top: 0px; ">
	        <ul class="nav-bar">
	            <li ><a href="../zhongchou/index.html">首页 </a></li>
	            <li ><a href="#">最潮设计 </a></li>
	            <li ><a href="#">最热设计 </a></li>
	            <li ><a href="#">关于我们</a></li>
	        </ul>
	        
        </div>
         <div class="login" >
        	<ul >
        		<li><a href="#">登&nbsp;录</a></li>
        		<li><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span></li>
        		<li><a href="#">注&nbsp;册</a></li>
        	</ul>
        </div>
        <div style="float: right;height: 49px;line-height: 49px; ">
        	<span><input type="text" placeholder="搜你想要的" name="q" class="search"><input class="search-submit" type="submit" value=""> </span>
        	
        </div>
       
    </div>
</div>
<div id="content" style="width: 100%;color: red;margin: 0px auto;position: relative;">
 <div class="zcbanner">
 	<!-- 图片轮播  begin-->
 	<div id="kinMaxShow" style="position: relative;margin-top: 49px;">
	   <div><a href="index.html" target="_blank"><img src="images/ab1.jpg"   /></a></div>
	   <div><a href="index.html" target="_blank"><img src="images/ab2.jpg"  /></a></div>
	   <div><a href="index.html" target="_blank"><img src="images/ab3.jpg"   /></a></div>
	</div>
 	<!-- 图片轮播  end -->
</div>

</div>

<!-- page begin-->
<!-- <div class="pageDiv">  
<div class="TshortsLi">
			<ul>
				<a href="javascript:void(0)" target="_blank"><li>
				<div>
					<div style="margin-top: 16px;"><img alt="" src="images/ts.png" width="300" height="320"> </div>
					<div class="zcProject">
						<span>我就是最好的设计师</span>
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
				<a href="javascript:void(0)" target="_blank"><li>
				<div>
					<div style="margin-top: 16px;"><img alt="" src="images/ts.png" width="300" height="320"> </div>
					<div class="zcProject">
						<span>我就是最好的设计师</span>
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
				<a href="javascript:void(0)" target="_blank"><li>
				<div>
					<div style="margin-top: 16px;"><img alt="" src="images/ts.png" width="300" height="320"> </div>
					<div class="zcProject">
						<span>我就是最好的设计师</span>
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
			</ul>
</div>
</div> -->
<!-- page end-->
<div class="pageDiv">
<c:forEach var="name" items="${reqData }"  varStatus="idx">
<c:if test="${idx.index%3==0}">
	<div class="TshortsLi"><ul>
</c:if>

<a href="javascript:void(0)" target="_blank"><li>
				<div>
					<div style="margin-top: 16px;"><img alt="" src="images/ts.png" width="300" height="320"> </div>
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
</div>
<div class="footer">
  <div class="foot_main">
    <p class="tz_wm"><a href="about.html">关于我们</a>|<a href="join.html">加入我们</a>|<a href="contact.html">联系我们</a></p>
    <p><span>Copyright &copy; 2013-2014 <a href="http://www.xxxcdfdf.cn">www.xxxcdfdf.cn</a> All Rights Reserved</span><span>版权所有：杭州XXXX网络科技有限公司：备232323121号</span></p>
  </div>
</div>
 
</body>
</html>