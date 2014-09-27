<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/index_title.jsp" %>
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>购物车</title>


<style type="text/css">
.button{
	width:140px;
	line-height:38px;
	text-align:center;
	font-weight:bold;
	color:#fff;
	text-shadow:1px 1px 1px #333;
	border-radius:5px;
	margin:0 20px 20px 0;
	position:relative;
	overflow:hidden;
	float:right;display:inline;
}
.button:nth-child(6n){margin-right:0;}
.button.blue{
	border:1px solid #1e7db9;
	box-shadow:0 1px 2px #8fcaee inset,0 -1px 0 #497897 inset,0 -2px 3px #8fcaee inset;
	background:-webkit-linear-gradient(top,#42a4e0,#2e88c0);
	background:-moz-linear-gradient(top,#42a4e0,#2e88c0);
	background:linear-gradient(top,#42a4e0,#2e88c0);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#42a4e0', endColorstr='#2e88c0'); /*  IE */
}

    span.emptyhint {color:#999;position:absolute;padding:3px;}


</style>
<script>
	$(document).ready(function() {
	
		 var orderStatusSelect=$("#orderStatusSelect").val();
		
		if(orderStatusSelect==''||orderStatusSelect=='-1'){
			 $("#orderStatus option").filter("[value='-1']").attr("selected", true);//有效！ 
				
				
		}else{
			
			 $("#orderStatus option").filter("[value='"+orderStatusSelect+"']").attr("selected", true);//有效！ 
				
				
		}
		
		 
		
			//$("select").selectBox();
			
		 $("#gotoBalance").click(function(){
	    	  
	    	  
	    	  if(window.ActiveXObject){
	    		  window.location=("../order/order_balance.xhtml");  
				 }else{
					 window.location=("order/order_balance.xhtml");  
				 }
	    	
	    	  
	    	  
	    	 
		      }); 
	      
		 $("#continue").click(function(){
	    	  
	    	  
	    	  if(window.ActiveXObject){
	    		  window.location=("../projectinfo/project_list.html?proType=1&proFabric=0");  
				 }else{
					 window.location=("projectinfo/project_list.html?proType=1&proFabric=0");  
				 }
	    	
	    	  
	    	  
	    	 
		      }); 
		 
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
	    initPlaceHolders();

	});
	
	
  </script>
</head>
<body>


   <div class="clear"></div>

  <section id="main" class="entire_width">
    <div class="container_12">
       <div class="grid_12">
       <h1 class="page_title">我的购物车</h1>

       <table class="cart_product">
	      <tr>
		     <th class="images"></th>
		     <th class="bg name">作品名字</th>
		     <th class="edit"> </th>
		     <th class="bg price">单价</th>
		     <th class="qty">数量</th>
		     <th class="bg subtotal">总价</th>
		     <th class="close"> </th>
	      </tr>
	      <input type="hidden" id="listcount" name="listcount" value="${fn:length(ordcart)}">
	        <c:forEach items="${ordcart}" var="ord" varStatus="status">
	      
	      <tr>
	   
		     <td class="images"><a href="projectinfo/project_${ord[0] }.html"><img src="uploadImg/${ord[2] }" alt="Product 6"></a></td>
		     <td class="bg name">${ord[1] }</td>
		     <td class="edit"><a title="Edit" href="#">Edit</a></td>
		     <td class="bg price"><span id="price_item_<c:out value="${status.count}"/>">￥${ord[3] }</span></td>
		     <td class="qty"> 	
		
		
		    <c:choose>
		    
		     <c:when test="${ord[6]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			<a class="reduce" onClick="setAmount.reduce('#qty_item_S<c:out value="${status.count}"/>','S','<c:out value="${status.count}"/>')" href="javascript:void(0)">
			-</a>
			<input type="text" name="qty_item_S<c:out value="${status.count}"/>" value="${ord[6]}" id="qty_item_S<c:out value="${status.count}"/>" onKeyUp="setAmount.modify('#qty_item_S<c:out value="${status.count}"/>','S','<c:out value="${status.count}"/>')" class="text" style="height: 15px;" />
			<a class="add" onClick="setAmount.add('#qty_item_S<c:out value="${status.count}"/>','S','<c:out value="${status.count}"/>')" href="javascript:void(0)">
			+</a>
		</div></div><br>
                </c:when> 
               </c:choose>
                 <c:choose>   <c:when test="${ord[7]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			<a class="reduce" onClick="setAmount.reduce('#qty_item_M<c:out value="${status.count}"/>','M','<c:out value="${status.count}"/>')" href="javascript:void(0)">
			-</a>
			<input type="text" name="qty_item_M<c:out value="${status.count}"/>" value="${ord[7]}" id="qty_item_M<c:out value="${status.count}"/>" onKeyUp="setAmount.modify('#qty_item_M<c:out value="${status.count}"/>','M','<c:out value="${status.count}"/>')" class="text" style="height: 15px;" />
			<a class="add" onClick="setAmount.add('#qty_item_M<c:out value="${status.count}"/>','M','<c:out value="${status.count}"/>')" href="javascript:void(0)">
			+</a>
		</div></div><br>
                </c:when> 
                 </c:choose>
		        <c:choose>  <c:when test="${ord[8]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			<a class="reduce" onClick="setAmount.reduce('#qty_item_L<c:out value="${status.count}"/>','L','<c:out value="${status.count}"/>')" href="javascript:void(0)">
			-</a>
			<input type="text" name="qty_item_L<c:out value="${status.count}"/>" value="${ord[8]}" id="qty_item_L<c:out value="${status.count}"/>" onKeyUp="setAmount.modify('#qty_item_L<c:out value="${status.count}"/>','L','<c:out value="${status.count}"/>')" class="text" style="height: 15px;" />
			<a class="add" onClick="setAmount.add('#qty_item_L<c:out value="${status.count}"/>','L','<c:out value="${status.count}"/>')" href="javascript:void(0)">
			+</a>
		</div></div><br>
                </c:when> 
                 </c:choose>
                 <c:choose> <c:when test="${ord[9]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			<a class="reduce" onClick="setAmount.reduce('#qty_item_XL<c:out value="${status.count}"/>','XL','<c:out value="${status.count}"/>')" href="javascript:void(0)">
			-</a>
			<input type="text" name="qty_item_XL<c:out value="${status.count}"/>" value="${ord[9]}" id="qty_item_XL<c:out value="${status.count}"/>" onKeyUp="setAmount.modify('#qty_item_XL<c:out value="${status.count}"/>','XL','<c:out value="${status.count}"/>')" class="text" style="height: 15px;" />
			<a class="add" onClick="setAmount.add('#qty_item_XL<c:out value="${status.count}"/>','XL','<c:out value="${status.count}"/>')" href="javascript:void(0)">
			+</a>
		</div></div><br>
                </c:when> 
                 </c:choose>
                 <c:choose> <c:when test="${ord[10]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			<a class="reduce" onClick="setAmount.reduce('#qty_item_XXL<c:out value="${status.count}"/>','XXL','<c:out value="${status.count}"/>')" href="javascript:void(0)">
			-</a>
			<input type="text" name="qty_item_XXL<c:out value="${status.count}"/>" value="${ord[10]}" id="qty_item_XXL<c:out value="${status.count}"/>" onKeyUp="setAmount.modify('#qty_item_XXL<c:out value="${status.count}"/>','XXL','<c:out value="${status.count}"/>')" class="text" style="height: 15px;" />
			<a class="add" onClick="setAmount.add('#qty_item_XXL<c:out value="${status.count}"/>','XXL','<c:out value="${status.count}"/>')" href="javascript:void(0)">
			+</a>
		</div></div><br>
                </c:when> 
                  </c:choose> 
                    <c:choose> <c:when test="${ord[11]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			<a class="reduce" onClick="setAmount.reduce('#qty_item_XXXL<c:out value="${status.count}"/>','XXXL','<c:out value="${status.count}"/>')" href="javascript:void(0)">
			-</a>
			<input type="text" name="qty_item_XXXL<c:out value="${status.count}"/>" value="${ord[11]}" id="qty_item_XXXL<c:out value="${status.count}"/>" onKeyUp="setAmount.modify('#qty_item_XXXL<c:out value="${status.count}"/>','XXXL','<c:out value="${status.count}"/>')" class="text" style="height: 15px;" />
			<a class="add" onClick="setAmount.add('#qty_item_XXXL<c:out value="${status.count}"/>','XXXL','<c:out value="${status.count}"/>')" href="javascript:void(0)">
			+</a>
		</div></div><br>
                </c:when> 
		    </c:choose>
	



		        </td>
		     <td class="bg subtotal">
		     
		     <span class="total-font" id="total_item_<c:out value="${status.count}"/>">￥ ${ord[4] }</span>   
		    </td>
		     <td class="close">
		     
		      <c:choose>
		    
		     <c:when test="${ord[6]!='0'}">  
           <a href="order/beginDeleOrder_${ord[0] }_S.xhtml" class="blue" onclick="return confirm('确定要删除吗？');">删除</a>         	
	<br>
                </c:when> 
               </c:choose>
                 <c:choose>   <c:when test="${ord[7]!='0'}">  
                  	
	  <a href="order/beginDeleOrder_${ord[0] }_M.xhtml" class="blue" onclick="return confirm('确定要删除吗？');">删除</a> <br>
                </c:when> 
                 </c:choose>
		        <c:choose>  <c:when test="${ord[8]!='0'}">  
                  	
	 <a href="order/beginDeleOrder_${ord[0] }_L.xhtml" class="blue" onclick="return confirm('确定要删除吗？');">删除</a> <br>
                </c:when> 
                 </c:choose>
                 <c:choose> <c:when test="${ord[9]!='0'}">  
     <a href="order/beginDeleOrder_${ord[0] }_XL.xhtml" class="blue" onclick="return confirm('确定要删除吗？');">删除</a> <br>
                </c:when> 
                 </c:choose>
                 <c:choose> <c:when test="${ord[10]!='0'}">  
                  	
	  <a href="order/beginDeleOrder_${ord[0] }_XXL.xhtml" class="blue" onclick="return confirm('确定要删除吗？');">删除</a> <br>
                </c:when> 
                  </c:choose> 
                    <c:choose> <c:when test="${ord[11]!='0'}">  
                  	
	  <a href="order/beginDeleOrder_${ord[0] }_XXXL.xhtml" class="blue" onclick="return confirm('确定要删除吗？');">删除</a>
                </c:when> 
		    </c:choose>
		     
		    </td>
	      </tr>
	      </c:forEach>
	      <tr>
		     <td colspan="7" class="cart_but">
			    <button class="continue" id="continue"><span>icon</span>继续购买</button>
			   <!-- <button class="update"><span>icon</span>更新购物车</button> --> 
		     </td>
	      </tr>
       </table>
       </div><!-- .grid_12 -->

       <div id="content_bottom" style="float: right">
        


        <div class="grid_6">
          <div class="bottom_block total">
	      <table class="subtotal">
		     <tr>
			    <td colspan="2">&nbsp; </td>
		     </tr>
		     <tr class="grand_total">
		   
			    <td>总数</td><td class="price">￥${totalnumber} </td>
		     </tr>
		     <tr class="grand_total">
		   
			    <td>${totalprice}总计</td><td class="price">
			 ￥${totalprice}
			</td>
		     </tr>
		     
		     <tr>
		     <td ><span class="jifen">购买商品可获得：<b id="total_points">350</b>积分</span></td>
		     </tr>
	      </table>
	    <button class="checkout" id="gotoBalance" >去结算中心</button>
           
          </div><!-- .total -->
        </div><!-- .grid_4 -->

        <div class="clear"></div>
      </div><!-- #content_bottom -->
      <div class="clear"></div>

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
