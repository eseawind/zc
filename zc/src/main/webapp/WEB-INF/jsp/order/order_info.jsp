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
				<!--    <li class="last"><a href="#">消息中心</a></li>--> 
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
	      <h1 class="page_title">我的订单</h1>
	        
	      
	      
	      <FORM method=post action="order/order_info.xhtml" id="searchForm">
		
	          
           <table style="border-top: 0px;">
           <tr>
           <td><input type="text" placeholder="请输入要查的订单号"  class="incInput" name="orderCode" value="${orderCode }" size="36" id="orderCode"></td>
            <td> 
           
             <select  id="orderStatus" name="orderStatus" style="height:33px;">
                        <option value="-1" selected="selected">全部</option>
                                 <option value="0" >已提交</option>
                                   <option value="1" >已取消</option>
                                    <option value="2" >已支付</option>
                                    <option value="3" >生产中</option>
                                    <option value="4" >正在配送</option>
                                    <option value="5" >配送完成</option>
                                    <option value="6" >交易成功</option>

                                    
                      </select>
                    
                     </td>
                     <td>
                      <input type="hidden" id="orderStatusSelect" name="orderStatusSelect" value="${orderStatus }">
                        
                        <button type="submit" class="button blue">查询</button></td>
           </tr>
           </table>
	      </FORM>
	     

 <table border="0" cellpadding="0" cellspacing="0" class="tableStyle thback" >
          <tbody><tr>
           <!--   <th>序号</th>-->
            <th>序号</th>
             <th>订单号</th>
               <th>下单时间</th>
            <th>订单金额</th>
           
              <th>订单状态</th>
              <th>操作</th>
           
            
          </tr>
           <c:forEach items="${ordinfos}" var="ord" varStatus="status">
               <tr>
              <td><c:out value="${status.count}"/></td>
              <td ><c:out value="${ord[1]}"></c:out></td>
              <td><c:out value="${ord[4]}"></c:out></td>
             
              <td><c:out value="${ord[5]}"></c:out></td>
             
                 <td>
              <c:if test="${ord[3]=='0' }">
            
           		已提交
              </c:if>
                        <c:if test="${ord[3]=='1' }">
            
           		已取消
              </c:if>
                
                       </td>
                       
                       
                        <td> <a href="order/order_${ord[0]}.xhtml">详情</a>  
                        
                          <c:if test="${ord[3]!='1' }">
            
           		 <a href="order/order_cancel${ord[0]}.xhtml" class="blue" onclick="return confirm('确定要取消该订单吗？');">取消</a>
              </c:if>
                             </td>
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

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
