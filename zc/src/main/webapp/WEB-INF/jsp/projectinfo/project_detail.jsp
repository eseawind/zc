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

  <title>订单详细</title>

<style type="text/css">


</style>

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
				    <li class="last"> <a href="order/order_info.xhtml">我的订单</a></li>
				 <!--  <li class="last"><a href="#">消息中心</a></li>-->  
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
	      <h1 class="page_title">作品详细<span style="padding-left: 530px;"> <a href="projectinfo/project_publish.xhtml" style="font-size: 12px;cursor: pointer;">返回作品列表</a></span> </h1>
	        


<div class="incPadBox" style="margin-top: 15px;">
        <h6 class="marall1" style="height: 30px;">
          <p>
            <c:if test="${zcOrdersInfo.orderStatus!='1' }">
            
           		<!--  <a href="/payments/pay_orders?order_ids=50254" class="buthui">立即支付</a>-->  
                                                                    <a href="#" class="buthui for_cancel" oid="50254">取消发布</a>
                                                       <!--   <a href="/orders/modify_order/50254" class="buthui">修改订单</a>-->  
              </c:if>
          
                                        
                                        </p>
          作品名字：${zcProjectInfo.proName }          <span class="marLet18">状态：</span>
          <span class="fontred">
    <c:if test="${zcProjectInfo.proShStatus =='0' }">
            
           		审核中
              </c:if>     
 <c:if test="${zcProjectInfo.proShStatus =='1' }">
            
           		已取消
              </c:if>      
          
        </span>
        </h6>
     <div class="orderProgress">
     
      <p style="margin-left: 60px;">
       <img  id="proImg" name="proImg" style="width:319px;height:319px;" src="uploadImg/${zcProjectInfo.resourceInfo.resourceName }" title="正面"> 
     
              <img  id="proImg" name="proImg" style="width:319px;height:319px;" src="uploadImg/${zcProjectInfo.resourceInfo1.resourceName }" title="背面"> </p></div>
     
             
     
      </div>




		<div class="incPadBox">
        <h6 class="marall1">基本信息</h6>
        <div class="orderTracking">
          <dl class="clearfix hui">
            <dd>作品名称：${zcProjectInfo.proName }   </dd>
             <dd>目标：${zcProjectInfo.proTarget } </dd>
                 <dd>单价：${zcProjectInfo.proUnit } 元</dd>
                <dd>筹集天数：${zcProjectInfo.proDays } </dd>
                   <dd>类别： <c:if test="${zcProjectInfo.proType =='1' }">
           		短袖
              </c:if>   
               <c:if test="${zcProjectInfo.proType =='2' }">
           		长袖
              </c:if>   
                </dd>
                 <dd>面料：<c:if test="${zcProjectInfo.proFabric =='1' }">
           		尼龙
              </c:if>   
               <c:if test="${zcProjectInfo.proFabric =='2' }">
           		棉布
</c:if>
</dd>
 <dd>打样：<c:if test="${zcProjectInfo.proSample =='1' }">
           		是
              </c:if>   
               <c:if test="${zcProjectInfo.proSample =='2' }">
           		否
</c:if>
</dd>
   <dd>项目地点：${zcProjectInfo.proProvince } ,${zcProjectInfo.proCity } </dd>
    <dd>作品简介：${zcProjectInfo.proRemarks } </dd>
     <dd>标签：${zcProjectInfo.proTag} </dd>
          
                                  </dl>
                              
        </div>
        
      </div>
      
      <div class="incPadBox">
        <h6 class="marall1">审核意见</h6>
        <div class="orderTracking">
          <dl class="clearfix hui">
            <dd>不错粗不粗粗粗吃醋醋醋醋</dd>
          </dl>
                  
                  </div>
      </div>
      
     
      
      
      
      
		<div class="clear"></div>

       </div><!-- #content -->

      <div class="clear"></div>

    </div><!-- .container_12 -->
  </section><!-- #main -->

  <div class="clear"></div>

  <footer>
    <div id="footer">
    <div class="container">
        <span>浙ICP备11036615号-1 浙公网安备888888888</span>

        <div class="site-info">
           

            <a href="mailto:xhymmc@163.com" alt="Keep in touch :)">邮件反馈</a>
            <a href="#">关于我们</a>
            <a href="userinfo/protocol.html">用户协议</a>
            <span>© 2014 小众派</span>
        </div>
    </div>
</div>
   
  </footer>

</body>
</html>
