<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
            <li class="active"><a href="index.html">首页</a></li>
            <li ><a href="#">精选项目</a></li>
            <li ><a href="#">热门项目</a></li>
            <li ><a href="#">关于我们</a></li>
            <li class="add-entity"><a href="http://localhost:9090/only/adddress.html"></a></li>
        </ul>
 
 
        <ul class="user">
            
                <li><a href="userinfo/login.html">登录</a></li>
                <li><span>&#124;</span></li>
                <li><a href="userinfo/register.html">注册</a></li>
            
        </ul>
 
            <form action="#" method="GET">
                <input type="text" placeholder="搜你想要的" name="q" class="search">
                <input class="search-submit" type="submit" value="">
            </form>
        
    </div>
</div>
</body>
</html>