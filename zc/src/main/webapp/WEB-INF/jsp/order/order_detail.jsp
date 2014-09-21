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
				    <li><a href="order/order_info.xhtml">我的订单</a></li>
				   <li class="last"><a href="#">消息中心</a></li>
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
            
           		  <a href="/payments/pay_orders?order_ids=50254" class="buthui">立即支付</a>
                                                                    <a href="#" class="buthui for_cancel" oid="50254">取消订单</a>
                                                          <a href="/orders/modify_order/50254" class="buthui">修改订单</a>
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
                      <tr class="hui deepBlue">
              <td>
                <div class="comBox" style="margin-top: 5px;">
                  <a href="/stores/buy/6281"><img src="http://pic.teeker.com/p/20140405/6281_567_front_172917_70x70.jpg" width="66" height="66"></a>
                  <h4><a href="#"></a></h4>
                  <p>A01-圆领短袖纯棉T恤-女款牙白</p>
                </div>
              </td>
              <td>69.00元</td>
              <td>
                <div class="number">
                                      <span>W-XL:5</span>
                                        <span>W-M:7</span>
                                    </div>
              </td>
              <td>
               
                
                 <div class="number">
                                      <span>12*69.00=828</span>元
                                       
                                    </div>
           
              </td>
            </tr>
            
            
            
                    </tbody></table>
        <div class="total">商品总金额<strong>828.00</strong>元<span>+
          </span>运费<strong>0.00</strong>元<span>-</span>优惠
          <strong>0.00</strong>元<span>=</span><strong>828.00</strong>元
                                   
                              </div>
      </div>
      
      
      
      
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

  </footer>

</body>
</html>
