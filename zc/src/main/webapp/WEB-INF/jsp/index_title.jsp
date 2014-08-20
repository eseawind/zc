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
<title>T恤众筹平台</title>
</head>

<body>
 <div class="container_12">
    <div id="top">
      <div class="grid_3">
        <div class="phone_top">
           客服电话 0571-86854235
        </div><!-- .phone_top -->
      </div><!-- .grid_3 -->

      <div class="grid_6">
        <div class="welcome">
         亲， 你可以<a href="userinfo/login.html">登录</a> 或 <a href="userinfo/register.html">注册</a>.
        </div><!-- .welcome -->
      </div><!-- .grid_6 -->

      <div class="grid_3">
        <div class="valuta">
          <ul>
            <li class="curent"><a href="#">EN</a></li>
            <li><a href="#">&#8364;</a></li>
            <li><a href="#">&#163;</a></li>
          </ul>
        </div><!-- .valuta -->

        <div class="lang">
          <ul>
            <li class="curent"><a href="#">英文</a></li>
            <li><a href="#">中文</a></li>
            <li><a href="#">繁体</a></li>
          </ul>
        </div><!-- .lang -->
      </div><!-- .grid_3 -->
    </div><!-- #top -->

    <div class="clear"></div>

    <header id="branding">
      <div class="grid_3">
        <hgroup>
          <h1 id="site_logo" ><a href="index.html" title=""><img src="images/logo.png" alt="设计师网上设计平台"/></a></h1>
          <h2 id="site_description">设计师网上设计平台</h2>
        </hgroup>
      </div><!-- .grid_3 -->

      <div class="grid_3">
        <form class="search">
          <input type="text" name="search" class="entry_form" value="" placeholder="发现更多的作品..."/>
	</form>
      </div><!-- .grid_3 -->

     <div class="grid_6">
      <!--     <ul id="cart_nav">
          <li>
            <a class="cart_li" href="#">Cart <span>$0.00</span></a>
            <ul class="cart_cont">
              <li class="no_border"><p>Recently added item(s)</p></li>
              <li>
                <a href="product_page.html" class="prev_cart"><div class="cart_vert"><img src="images/cart_img.png" alt="" title="" /></div></a>
                <div class="cont_cart">
                  <h4>Caldrea Linen and Room Spray</h4>
                  <div class="price">1 x $399.00</div>
                </div>
                <a title="close" class="close" href="#"></a>
                <div class="clear"></div>
              </li>
              
              <li>
                <a href="product_page.html" class="prev_cart"><div class="cart_vert"><img src="images/produkt_slid1.png" alt="" title="" /></div></a>
                <div class="cont_cart">
                  <h4>Caldrea Linen and Room Spray</h4>
                  <div class="price">1 x $399.00</div>
                </div>
                <a title="close" class="close" href="#"></a>
                <div class="clear"></div>
              </li>
	      <li class="no_border">
		<a href="shopping_cart.html" class="view_cart">View shopping cart</a>
		<a href="checkout.html" class="checkout">Procced to Checkout</a>
	      </li>
            </ul>
          </li>
        </ul>-->

        <nav class="private">
          <ul>
          
          
          
            <li><a href="projectinfo/project_add.xhtml">发布作品</a></li>
		<li class="separator">|</li>
            <li><a href="userinfo/show.xhtml">个人中心</a></li>
		<li class="separator">|</li>
		
		<c:if test="${empty sessionScope.USER_INFO }">
	            	  <li><a href="userinfo/login.html">登录</a></li>
		<li class="separator">|</li>
            <li><a href="userinfo/register.html">注册</a></li>
            	</c:if>
            	<c:if test="${sessionScope.USER_INFO!=null }" var="userinfo" scope="session">
            	
            	  <li><a href="userinfo/show.xhtml"><c:out value="${sessionScope.USER_INFO.userName }"></c:out></a></li>
		<li class="separator">|</li>
           <li><a href="userinfo/exit.html">退出</a></li>
            	</c:if>
		
		
          
          </ul>
        </nav><!-- .private -->
      </div>
       <!-- .grid_6 -->
    </header><!-- #branding -->
  </div><!-- .container_12 -->

  <div class="clear"></div>

  <div id="block_nav_primary">
    <div class="container_12">
      <div class="grid_12">
        <nav class="primary">
          <ul>
            <li class="curent"><a href="index.html">首页</a></li>
            <li><a href="projectinfo/project_list.html">短袖</a>
            <ul class="sub">
                <li><a href="projectinfo/project_list.html">麻布</a></li>
                <li><a href="projectinfo/project_list.html">棉质</a></li>
                <li><a href="projectinfo/project_list.html">尼龙</a></li>
                <!-- <li><a href="projectinfo/project_list.html">其它</a></li>--> 
              </ul>
            
            </li>
            <li><a href="catalog_grid.html">长袖</a>
            
             <ul class="sub">
                <li><a href="projectinfo/project_list.html">麻布</a></li>
                <li><a href="projectinfo/project_list.html">棉质</a></li>
                <li><a href="projectinfo/project_list.html">尼龙</a></li>
              <!--   <li><a href="catalog_grid.html">其它</a></li>--> 
              </ul>
            </li>
           <!-- <li>
              <a href="catalog_grid.html">背包</a>
              <ul class="sub">
                <li><a href="catalog_grid.html">双肩包</a></li>
                <li><a href="catalog_grid.html">单肩包</a></li>
                <li><a href="catalog_grid.html">其它</a></li>
              </ul>
            </li> --> 
           <!--   <li><a href="catalog_grid.html">Electric</a></li>
            <li><a href="catalog_grid.html">For cars</a></li>
	    <li>
              <a href="#">All pages</a>
              <ul class="sub">
                <li><a href="index.html">Home</a></li>
                <li><a href="text_page.html">Typography and basic styles</a></li>
		<li><a href="catalog_grid.html">Catalog (grid view)</a></li>
		<li><a href="catalog_list.html">Catalog (list type view)</a></li>
		<li><a href="product_page.html">Product view</a></li>
		<li><a href="shopping_cart.html">Shoping cart</a></li>
		<li><a href="checkout.html">Proceed to checkout</a></li>
		<li><a href="compare.html">Products comparison</a></li>
		<li><a href="login.html">Login</a></li>
		<li><a href="contact_us.html">Contact us</a></li>
		<li><a href="404.html">404</a></li>
		<li><a href="blog.html">Blog posts</a></li>
		<li><a href="blog_post.html">Blog post view</a></li>
              </ul>
            </li>-->
          </ul>
        </nav><!-- .primary -->
      </div><!-- .grid_12 -->
    </div><!-- .container_12 -->
  </div><!-- .block_nav_primary -->
</body>
</html>