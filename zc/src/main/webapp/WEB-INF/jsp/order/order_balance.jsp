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

  <title>结算中心</title>


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

a.butLarge {
background: #0caceb;
color: #fff;
font-size: 20px;
padding: 0 33px;
line-height: 53px;
margin-left: 15px;
display: inline-block;
}
</style>
<script>

$(function(){
	var jsCenter={};
	jsCenter={
			initButtonRegister:function(){
				$("#btnJs").bind('click',function(e){
					//阻止默认事件发生,会出现 刷新页面的请求
					e.preventDefault();
					//表单验证。。
					var cm=$("input[name=usercheck]:checked");
					$.post("order/putOrder.xhtml",{addressCode:cm.val()},function(data){
						var d=$.eval2(data);
						if(d.success){
							$.alert("订单提示","下单成功");
						}else{
							$.alert("添加提示",d.errorMsgs[0]);
						}
					});
				});
				
			} 
	};
	function main(){
		//注册事件
		jsCenter.initButtonRegister();
		//register.blurInput();
	}
	
	main();
	
})

	$(document).ready(function() {
$("#usercheck").click(function(e){
	var cm=$("input[name=usercheck]:checked");
	
	//$("#namelast").html($("#username"+cm.val()).html());
	//$("#provincelast").html($("#useraddress"+cm.val()).html());
	//$("#mobilelast").html($("#usermobile"+cm.val()).html());
	//$("#ziplast").html($("#userzip"+cm.val()).html());
		});

	});
  </script>

  <script>
	
	
  </script>
</head>
<body>


   <div class="clear"></div>

  <section id="main" class="entire_width">
    <div class="container_12">
       <div class="grid_12">
       <h1 class="page_title">结算中心</h1>
       
       
       
       

       <table>
        <tr>
		    <td colspan="4" align="left" valign="middle" style="background-color: #F7F7F7;margin-top: 10px;">
		    确认收货人
		    </td>
		     <td colspan="3" align="right" valign="middle" style="background-color: #F7F7F7">
		<a href="userinfos/address.xhtml">管理我的收货人</a>
		    </td>
	      </tr>
       
         <c:forEach items="${usersinfo}" var="users" >
	       <tr style="text-align: center;">
        
        
        
        
		    <td  align="left" valign="middle" >
		      <c:choose>
		    
		     <c:when test="${users.isDefault!='0'}">
		     <input type="radio" name="usercheck" checked="checked" id="usercheck" value="<c:out value="${users.userCode}"></c:out>">	 <span id="username<c:out value="${users.userCode}"></c:out>"> <c:out value="${users.userName}"></span></c:out>
		     
		      </c:when>
		       <c:otherwise> 
		       <input type="radio" name="usercheck" id="usercheck" value="<c:out value="${users.userCode}"></c:out>">	 <span id="username<c:out value="${users.userCode}"></c:out>"> <c:out value="${users.userName}"></span></c:out>
		       
		        </c:otherwise>
		     
		     </c:choose>
		    
	
		    </td>
		    <td  align="left" valign="middle" >
		  <span id="useraddress<c:out value="${users.userCode}"></c:out>"><c:out value="${users.userProvince}"></c:out><c:out value="${users.userCity}"></c:out><c:out value="${users.userArea}"></c:out> <c:out value="${users.userAddress}"></c:out>     </span>
		    </td>
		    <td  align="left" valign="middle" >
		<span id="usermobile<c:out value="${users.userCode}"></c:out>"><c:out value="${users.userMobilephone}"></c:out></span>
		    </td>
		    <td  align="left" valign="middle" >
		<span id="userzip<c:out value="${users.userCode}"></c:out>"> <c:out value="${users.userZip}"></c:out> </span>
		    </td>
		    
		    <td  align="right" colspan="3" valign="middle" >
		&nbsp;
		    </td>
		    
	      </tr>
       
	      
	      </c:forEach>
       
        <tr>
		    <td colspan="4" align="left" valign="middle" style="background-color: #F7F7F7;margin-top: 10px;">
		    确认配送方式
		    </td>
		     <td colspan="3" align="right" valign="middle" style="background-color: #F7F7F7">
		
		    </td>
	      </tr>
       
       
	      <tr>
		     <th class="images"></th>
		     <th class="bg name">作品名字</th>
		     <th class="edit"> </th>
		     <th class="bg price">单价</th>
		     <th class="qty">数量</th>
		     <th class="bg subtotal">总价</th>
		   
	      </tr>
	      <input type="hidden" id="listcount" name="listcount" value="${fn:length(ordcart)}">
	        <c:forEach items="${ordcart}" var="ord" varStatus="status">
	      
	      <tr>
	   
		     <td class="images"><a href="projectinfo/project_${ord[0] }.html"><img src="uploadImg/${ord[2] }" width="110px" height="110px;" alt=""></a></td>
		     <td class="bg name">${ord[1] }</td>
		     <td class="edit"><a title="Edit" href="#">Edit</a></td>
		     <td class="bg price"><span id="price_item_<c:out value="${status.count}"/>">￥${ord[3] }</span></td>
		     <td class="qty"> 	
		
		
		    <c:choose>
		    
		     <c:when test="${ord[6]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			
			S:${ord[6]}
		</div></div><br>
                </c:when> 
               </c:choose>
                 <c:choose>   <c:when test="${ord[7]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			M:${ord[7]}
		</div></div><br>
                </c:when> 
                 </c:choose>
		        <c:choose>  <c:when test="${ord[8]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			L:${ord[8]}
		</div></div><br>
                </c:when> 
                 </c:choose>
                 <c:choose> <c:when test="${ord[9]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			XL:${ord[9]}
		</div></div><br>
                </c:when> 
                 </c:choose>
                 <c:choose> <c:when test="${ord[10]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
			XXL:${ord[10]}
		</div></div><br>
                </c:when> 
                  </c:choose> 
                    <c:choose> <c:when test="${ord[11]!='0'}">  
                  	
	<div class="p_number">
		
		<div class="f_l add_chose">
		XXXL:${ord[11]}
		</div></div><br>
                </c:when> 
		    </c:choose>
	



		        </td>
		     <td class="bg subtotal">
		     
		     <span class="total-font" >${ord[5]}*${ord[3]}=${ord[4]}元</span>   
		    </td>
		    
	      </tr>
	      </c:forEach>
	      <tr>
		     <td  >
			    配送方式：
		     </td><td colspan="5" align="left" >
			<input name="payment" type="radio" weight="120" value="0" checked="checked">快递，全国免运费。
		     </td>
	      </tr>
	     <!--   <tr>
		   
			 <td  align="left" valign="middle" >
	<input type="radio" checked="checked"  readonly="readonly"><span id="namelast">熊会洋</span>	
		    </td>
		    <td  align="left" valign="middle" id="provincelast">
		 这就是杭州市 
		    </td>
		    <td  align="left" valign="middle" id="mobilelast" >
		18668160707
		    </td>
		    <td  align="left" valign="middle" id="ziplast">
		310000 
		    </td>
		    
		    <td  align="left" colspan="2" valign="middle" >
		&nbsp;
		    </td>
		   
	      </tr> -->
	      
	      <tr>
	      <td colspan="6" align="right">&nbsp;<br>   <a class="butLarge" id="btnJs" style="text-decoration: none;" href="#">提交订单</a> <br>&nbsp;</td>
	      
	      </tr>
	      
       </table>
       </div><!-- .grid_12 -->

      
      <div class="clear"></div>

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


</body>
</html>
