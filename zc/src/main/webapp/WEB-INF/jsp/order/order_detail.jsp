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
				    <li class="last"><a href="order/order_info.xhtml">我的订单</a></li>
				  <!--  <li class="last"><a href="#">消息中心</a></li> -->
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
	      <h1 class="page_title">订单详细<span style="padding-left: 500px;"> <a href="order/order_info.xhtml" style="font-size: 12px;cursor: pointer;">返回订单列表</a></span> </h1>
	        


<div class="incPadBox" style="margin-top: 15px;">
        <h6 class="marall1" style="height: 30px;">
          <p>
            <c:if test="${zcOrdersInfo.orderStatus!='1' }">
            
           		<!--   <a href="/payments/pay_orders?order_ids=50254" class="buthui">立即支付</a> -->
                                                                    <a href="#" class="buthui for_cancel" oid="50254">取消订单</a>
                                                        <!--   <a href="/orders/modify_order/50254" class="buthui">修改订单</a> -->
              </c:if>
          
                                        
                                        </p>
          订单号：${zcOrdersInfo.orderCode }          <span class="marLet18">状态：</span>
          <span class="fontred">
    <c:if test="${zcOrdersInfo.orderStatus =='0' }">
            
           		已提交
              </c:if>     
 <c:if test="${zcOrdersInfo.orderStatus =='1' }">
            
           		已取消
              </c:if>      
          
        </span>
        </h6>
     <div class="orderProgress">
     
      <p>
                订单有 828.00 元需要支付，请在生产日期之前完成支付！具体的支付方式和生产时间，后续会有工作人员与您沟通。 <p>
                <p>逾期未完成支付，订单会自动取消。 </p></div>
     
             
     
      </div>


<div class="incPadBox">
        <h6 class="marall1">订单跟踪</h6>
        <div class="orderTracking">
          <dl class="clearfix borbotdas hui">
                                      <dt>2014-08-24 18:19:17</dt>
              <dd>客户&nbsp;&nbsp;&nbsp;客户提交了订单</dd>
                            <dt>2014-08-24 18:21:08</dt>
              <dd>客户&nbsp;&nbsp;&nbsp;修改订单商品</dd>
                        </dl>
                    <dl class="clearfix">
                      </dl>
                  </div>
      </div>

		<div class="incPadBox">
        <h6 class="marall1">收货人信息</h6>
        <div class="orderTracking">
          <dl class="clearfix hui">
            <dd>收货人：${zcOrdersInfo.userName }   </dd>
            <dd>联系电话：${zcOrdersInfo.userMobilephone }&nbsp;&nbsp;&nbsp;</dd>
                          <dd>收货地址：
                ${zcOrdersInfo.userProvince }&nbsp;${zcOrdersInfo.userCity }&nbsp;${zcOrdersInfo.userArea }&nbsp;${zcOrdersInfo.userAddress }              </dd>
                                                  <dd>Email：${zcOrdersInfo.userEmail }</dd>
                                  </dl>
        </div>
      </div>
      
      <div class="incPadBox">
        <h6 class="marall1">配送及支付</h6>
        <div class="orderTracking">
          <dl class="clearfix hui">
            <dd>配送方式：
              邮寄                              ，配送费用 0.00 元
                                        </dd>
          </dl>
                    <dl class="clearfix hui">
            <dd>
              支付方式：线下支付<!--  在线支付   -->                       </dd>
          </dl>
                  </div>
      </div>
      
      
      <div class="incPadBox">
        <h6 class="marall1">商品信息</h6>
                 
                <table cellpadding="0" cellspacing="0" class="tableStyle thback">
          <tbody><tr ><th>商品</th><th>单价</th><th>数量</th><th>小计</th></tr>
                   
                   
                   
                     <c:forEach items="${ordcart}" var="ord" varStatus="status">
                     
                      <tr class="hui deepBlue">
              <td>
                <div class="comBox" style="margin-top: 5px;">
                <a href="projectinfo/project_${ord[0] }.html"><img src="uploadImg/${ord[2] }" width="66px" height="66px;" alt=""></a>
                  <h4><a href="#"></a></h4>
                  <p>${ord[1] }</p>
                </div>
              </td>
              <td><span id="price_item_<c:out value="${status.count}"/>">￥${ord[3] }</span></td>
              <td>
                <div class="number">
                
                  <c:choose>
		    
		     <c:when test="${ord[6]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			
			  <span>S:${ord[6]}</span>
		</div></div><br>
                </c:when> 
               </c:choose>
                 <c:choose>   <c:when test="${ord[7]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			  <span>M:${ord[7]}</span>
		</div></div><br>
                </c:when> 
                 </c:choose>
		        <c:choose>  <c:when test="${ord[8]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			  <span>L:${ord[8]}</span>
		</div></div><br>
                </c:when> 
                 </c:choose>
                 <c:choose> <c:when test="${ord[9]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			  <span>XL:${ord[9]}</span>
		</div></div><br>
                </c:when> 
                 </c:choose>
                 <c:choose> <c:when test="${ord[10]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
		  <span>	XXL:${ord[10]}</span>
		</div></div><br>
                </c:when> 
                  </c:choose> 
                    <c:choose> <c:when test="${ord[11]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
		  <span>XXXL:${ord[11]}</span>
		</div></div><br>
                </c:when> 
		    </c:choose>
                
                                  
                                    </div>
              </td>
              <td>
               
                
                 <div class="number">
                                      <span>${ord[5]}*${ord[3]}=${ord[4]}</span>元
                                       
                                    </div>
           
              </td>
            </tr>
            
	      </c:forEach>
                   
            
            
                    </tbody></table>
        <div class="total">商品总金额<strong>${ totalprice}</strong>元<span>+
          </span>运费<strong>0.00</strong>元<span>-</span>优惠
          <strong>0.00</strong>元<span>=</span><strong>${ totalprice}</strong>元
                                   
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
