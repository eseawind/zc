<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="Keywords" content="众筹">
<meta name="Description" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>众筹T恤平台</title>
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
background-color: #F8F8F8;
}
#header{
 background-color: #343434;width:  100%;height: 49px;top: 0px;position: fixed;z-index: 99999;
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
#header .login li a,span{
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
width: 100%;text-align: center;vertical-align: middle;margin: 0 auto;height: 365px;margin-top: 20px;
}
#content #tShirts .TshortsLi ul{
margin: 0 auto;position: relative;width: 1024px;display: inline-block; 
}

#content #tShirts .TshortsLi ul li{
border:1px solid red;list-style: none;float: left;overflow: hidden;width: 320px;display: inline-block;height: 360px;margin: 0 auto;margin-left: 15px;
}

#content #tShirts .TshortsLi ul li:hover{
    background: none repeat scroll 0 0 #e5e5e5;
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
<div style="width: 100%;position: relative;">
	<div id="tShirts" style="width: 1024px;margin: 20px auto;text-align: center;">
		<div class="TshortsLi">
			<ul>
				<a href="javascript:void(0)" target="_blank"><li>
				<div>
					<div><img alt="" src=""> </div>
				</div>
				
				
				</li></a>
				<a href="javascript:void(0)" target="_blank"><li>&nbsp;</li></a>
				<a href="javascript:void(0)" target="_blank"><li>&nbsp;</li></a>
			</ul>
		</div>
		<div class="TshortsLi">
			<ul>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
			</ul>
		</div>
		<div class="TshortsLi">
			<ul>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
			</ul>
		</div>
		<div class="TshortsLi">
			<ul>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
			</ul>
		</div>
		<div class="TshortsLi">
			<ul>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
			</ul>
		</div>
		<div class="TshortsLi">
			<ul>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
			</ul>
		</div>
	</div>
</div>
</div>
 

<div style="height: 40px;background: gray;">这里是底部</div>
</body>
</html>