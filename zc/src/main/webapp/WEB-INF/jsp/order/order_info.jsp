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



 .content .findBox {
margin: 12px 20px 16px;
zoom: 1;
}
.content .findBox dt {
float: left;
}
* {
margin: 0;
padding: 0;
}
.content .findBox select {
margin-right: 6px;
}
.content .findBox dd {
float: right;
}
.content .findBox input, .userCenter .findBox select {
color: #7e7e7e;
}
.incInput {
height: 26px;
border: 1px solid #e7e7e7;
padding: 0 10px;
line-height: 26px;
}

a.buthui {
background: #f2f2f2;
color: #7e7e7e;
font-size: 12px;
padding: 5px 15px 4px;
border: 1px solid #d7d7d7;
margin-left: 7px;
vertical-align: middle;
display: inline-block;
}

</style>
<script>
	$(document).ready(function() {
	
		 var orderStatusSelect=$("#orderStatusSelect").val();
		
		if(orderStatusSelect==''||orderStatusSelect=='-1'){
			 $("#orderStatus option").filter("[value='-1']").attr("selected", true);//有效！ 
				
				
		}else{
			
			 $("#orderStatus option").filter("[value='"+orderStatusSelect+"']").attr("selected", true);//有效！ 
				
				
		}
		
		 
		
			$("select").selectBox();
			


	
	});
  </script>

  <script>
	$(document).ready(function(){
	    $("#myController").jFlow({
			controller: ".control", // must be class, use . sign
			slideWrapper : "#jFlowSlider", // must be id, use # sign
			slides: "#slider",  // the div where all your sliding divs are nested in
			selectedWrapper: "jFlowSelected",  // just pure text, no sign
			width: "984px",  // this is the width for the content-slider
			height: "480px",  // this is the height for the content-slider
			duration: 400,  // time in miliseconds to transition one slide
			prev: ".slidprev", // must be class, use . sign
			next: ".slidnext", // must be class, use . sign
			auto: true	
		});
	});
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
				   <li><a href="projectinfo/project_like.xhtml">我喜欢的作品<span>(21)</span></a></li>
				 <!--  <li><a href="#">我关注的作品<span> (27)</span></a></li> --> 
				   <li><a href="projectinfo/project_publish.xhtml">我发表的作品<span>(33)</span></a></li>
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside>

	     


	
	   
       </div><!-- .sidebar -->


       <div id="content" class="grid_9">
	      <h1 class="page_title">我的订单</h1>
	      <FORM method=post action="order/order_info.xhtml" id="searchForm">
		
	      <dl class="findBox clearfix">
          <dt>
       
                    <select  id="orderStatus" name="orderStatus" style="width: 150px;">
                        <option value="-1" selected="selected">全部</option>
                                 <option value="0" >已提交</option>
                                   <option value="1" >已取消</option>
                                    <option value="2" >已支付</option>
                                    <option value="3" >生产中</option>
                                    <option value="4" >正在配送</option>
                                    <option value="5" >配送完成</option>
                                    <option value="6" >交易成功</option>

                                    
                      </select>
                      <input type="hidden" id="orderStatusSelect" name="orderStatusSelect" value="${orderStatus }">
          </dt>
          <dd>
            <input type="text" class="incInput" name="orderCode" value="${orderCode }" size="36" id="orderCode">
         <input type="submit" class="bay" value="&nbsp;&nbsp;&nbsp;&nbsp;查询&nbsp;&nbsp;&nbsp;&nbsp;">
          </dd>
        </dl>
	      </FORM>
	      

 <table border="0" cellpadding="0" cellspacing="0" class="tableStyle thback">
          <tbody><tr>
           <!--   <th>序号</th>-->
            <th>订单ID</th>
             <th>订单号</th>
               <th>下单时间</th>
            <th>订单金额</th>
           
              <th>订单状态</th>
              <th>操作</th>
           
            
          </tr>
           <c:forEach items="${ordinfos}" var="ord">
               <tr>
              <td><c:out value="${ord[0]}"></c:out></td>
              <td><c:out value="${ord[1]}"></c:out></td>
              <td><c:out value="${ord[5]}"></c:out></td>
             
              <td><c:out value="${ord[4]}"></c:out></td>
             
                 <td>
              <c:if test="${ord[3]=='0' }">
            
           		已提交
              </c:if>
                   
                
                       </td>
                       
                       
                        <td>详情    取消</td>
            </tr>
             </c:forEach> 
          
                    
                  </tbody></table>


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
