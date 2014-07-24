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
<link href="css/zc_main.css" rel="StyleSheet" />
</head>
<body>
<div id="header">
    <div class="header-container">
        <div class="title">
            <img src="images/logonew.png" class="logo">
        </div>
        <ul class="nav-bar">
            <li class="active"><a href="../zhongchou/index.html">首页</a></li>
            <li ><a href="#">精选项目</a></li>
            <li ><a href="#">热门项目</a></li>
            <li ><a href="#">关于我们</a></li>
            <li class="add-entity"><a href="../zhongchou/adddress.html"></a></li>
        </ul>
        <ul class="user">
                <li><a href="#" onClick="changeidv()">登录</a></li>
                <li><span>&#124;</span></li>
                <li><a href="#" onClick="changeidv1()">注册</a></li>
            
        </ul>
            <form action="#" method="GET">
                <input type="text" placeholder="搜你想要的" name="q" class="search">
                <input class="search-submit" type="submit" value="">
            </form>
    </div>
</div>
<div id="content" style="width: 500px;height: 30px;color: red;border: 1px solid red;margin: 70px auto;">
这里是网站内容ddddddddddddddddddd
<c:out value="&lt要显示的数据对象（未使用转义字符）&gt" escapeXml="true" default="默认值"></c:out>
</div>

<!-- bottom -->
<div class="bottom">
	 	<div style="height:30px;"></div> 
	 	<div style="padding-top:15px;min-width:1000px;">
		<a href="http://www.xiaoxiong.com/" target="_blank">关于小熊</a> |  <a href="javascript:void(0)" target="_blank">服务协议</a> | <a href="javascript:void(0)" target="_blank">隐私权保护</a>  | <a href="javascript:void(0)" target="_blank">客服中心</a>  
	</div>
	<div style="margin-top:15px;min-width:1000px;">Copyright ? 1998 - 2014 xiaoxiong. All Rights Reserved</div>
	 	<div style="margin-top:15px;margin-bottom:15px;min-width:1000px;">
		<a href="http://www.xiaoxiong.com/" target="_blank">小熊公司</a> <a href="javascript:void(0)" target="_blank">版权所有</a>
	</div>
		 	<div style="height:30px;"></div>
</div>
</body>
</html>