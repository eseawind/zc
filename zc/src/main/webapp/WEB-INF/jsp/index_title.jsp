<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <a href="index.html" class="logo"><img src="images/logonew.png"></a>
        </div>
 
        <ul class="nav-bar">
            <li class="active"><a href="index.html">首页</a></li>
            <li ><a href="#">精选设计</a></li>
            <li ><a href="#">热门设计</a></li>
            <li ><a href="#">关于我们</a></li>
            <li class="add-entity"><a href="projectinfo/project_add.do" title="发起设计"></a></li>
        </ul>
 
 
        <ul class="user">
            	<c:if test="${empty sessionScope.USER_INFO }">
	            	<li><a href="userinfo/login.html">登录</a></li>
	                <li><span>&#124;</span></li>
	                <li><a href="userinfo/register.html">注册</a></li>
            	</c:if>
            	<c:if test="${sessionScope.USER_INFO!=null }" var="userinfo" scope="session">
            		<li><a href="javascript:void(0)"><c:out value="${sessionScope.USER_INFO.userName }"></c:out> 欢迎您 </a> </li>
            		<li><span>&#124;</span></li>
            		<li><a href="userinfo/exit.html">退出</a></li>
            	</c:if>
        </ul>
            <form action="#" method="GET">
                <input type="text" placeholder="搜你想要的" name="q" class="search">
                <input class="search-submit" type="submit" value="">
            </form>
        
    </div>
</div>
</body>
</html>