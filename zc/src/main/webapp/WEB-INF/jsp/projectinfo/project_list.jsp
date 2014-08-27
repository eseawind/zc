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

  <title>Product view</title>

 <script>
	$(document).ready(function() {
		
		 var orderStatusSelect=$("#currentPageSelect").val();
		 var sortSeleSelect=$("#sortSeleSelect").val();
		 
			if(orderStatusSelect==''||orderStatusSelect=='-1'){
				 $("#currentPage option").filter("[value='-1']").attr("selected", true);//有效！ 
					
					
			}else{
				
				 $("#currentPage option").filter("[value='"+orderStatusSelect+"']").attr("selected", true);//有效！ 
					
					
			}
			
			
			if(sortSeleSelect==''||sortSeleSelect=='0'){
				 $("#sortSele option").filter("[value='0']").attr("selected", true);//有效！ 
					
					
			}else{
				
				 $("#sortSele option").filter("[value='"+sortSeleSelect+"']").attr("selected", true);//有效！ 
					
					
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
  <script>
	$(function() {
	  $('#list_product').carouFredSel({
		prev: '#prev_c1',
		next: '#next_c1',
		auto: false
	  });
          $('#list_product2').carouFredSel({
		prev: '#prev_c2',
		next: '#next_c2',
		auto: false
	  });
	  $(window).resize();
	});
  </script>
  <script>
       $(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click');
	      });    
	      
	      //排序
	     // $("#sortSele").change(function(){
	    	//  var that=$(this);
	    	
	    	  
	    	 // var page= $("#currentPage");
	    	 // window.location=("../projectinfo/project_list.html?currentPage="+page.val());
	    	  
	     // });
	      //分页
	      $("#currentPage").change(function(){
	    	  var page=$(this);
	    	  
	    	  if(window.ActiveXObject){
	    		  window.location=("../projectinfo/project_list.html?currentPage="+page.val()+"&proType=${proType}&proFabric=${proFabric}");
				 }else{
					  window.location=("projectinfo/project_list.html?currentPage="+page.val()+"&proType=${proType}&proFabric=${proFabric}");
				 }
	    	
	    	 
	      });
	      
	      
	      $("#sortdown").click(function(){
	    	  
	    	  
	    	  if(window.ActiveXObject){
	    		  window.location=("../projectinfo/project_list.html?currentPage=1&sortSele="+$("#sortSele").val()+"&sortBy=1&proType=${proType}&proFabric=${proFabric}");  
				 }else{
					 window.location=("projectinfo/project_list.html?currentPage=1&sortSele="+$("#sortSele").val()+"&sortBy=1&proType=${proType}&proFabric=${proFabric}");  
				 }
	    	
	    	  
	    	  
	    	 
		      }); 
	      
	      $("#sortup").click(function(){
	    	  
	    	  if(window.ActiveXObject){  window.location=("../projectinfo/project_list.html?currentPage=1&sortSele="+$("#sortSele").val()+"&sortBy=0&proType=${proType}&proFabric=${proFabric}"); 
	    	  }else{
	    		  window.location=("projectinfo/project_list.html?currentPage=1&sortSele="+$("#sortSele").val()+"&sortBy=0&proType=${proType}&proFabric=${proFabric}");  
	    	  }
	    	  
	    	
		      }); 
       })
  </script>

<script type="text/javascript">
  $(document).ready(function() {
    var deliveryd = new DeliveryInfoDialog("addressd");
    deliveryd.init();
    $(".rightcontent .new").click(function(e) {
      e.preventDefault();
      deliveryd.add(function(data, di){
        location.reload();
      });
    });
  });
  
  
	
 
</script>


<script type="text/javascript">
	
	
	
	function ajax_webserviceHello(proCode) {
    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "projectinfo/beginAddLike.html?proCode="+proCode,
        data: "{}",
        dataType: 'json',
        success: function(data) {
        
        	$("#btnLike"+data.returnValue).removeClass("like");
        	$("#btnLike"+data.returnValue).addClass("likeed");
        }
    });
}

</script>
<style type="text/css">



</style>

</head>
<body>

  
  
  <div class="clear"></div>
  
  <div class="container_12">
    <div class="grid_12">
       <div class="breadcrumbs">
	      <a href="index.html">首页</a><span>&#8250;</span><a href="projectinfo/project_list.html?proType=${proType}&proFabric=${proFabric}">  <c:choose>  
               <c:when test="${proType=='1'}">  
            	   短袖
                </c:when> 
                      <c:otherwise>  
					长袖                       </c:otherwise> 
                      </c:choose> </a>

                       <c:choose>  
               <c:when test="${proFabric=='1'}">  
            	   
                      <span>&#8250;</span><span class="current">
                     <a href="projectinfo/project_list.html?proType=${proType}&proFabric=${proFabric}">  麻布 </a></span>
                </c:when> 
              <c:when test="${proFabric=='2'}">  
               
                      <span>&#8250;</span><span class="current">
                      	 <a href="projectinfo/project_list.html?proType=${proType}&proFabric=${proFabric}">棉质 </a></span>
                </c:when> 
                  <c:when test="${proFabric=='3'}">  
               
                      <span>&#8250;</span><span class="current">
                      	 <a href="projectinfo/project_list.html?proType=${proType}&proFabric=${proFabric}">尼龙 </a></span>
                </c:when> 
                    </c:choose>
                     
       </div><!-- .breadcrumbs -->
    </div><!-- .grid_12 -->
  </div><!-- .container_12 -->
  
  <div class="clear"></div>
  
  <section id="main">
    <div class="container_12">
       <div id="sidebar" class="grid_3">
	      <aside id="categories_nav">
		     <h3>系列</h3>
		     
		     <nav class="left_menu">
			    <ul>
				   <li><a href="projectinfo/project_list.html?proType=1&proFabric=0">短袖<span>(21)</span></a></li>
				   <li class="last"><a href="projectinfo/project_list.html?proType=2&proFabric=0">长袖<span> (27)</span></a></li>
				  
				  
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside><!-- #categories_nav -->
	      
	    
	     
	      
	      <aside id="specials" class="specials">
		     <h3>作品推荐</h3>
		     
		     <ul>
			    <li>
				   <div class="prev">
					  <a href="javascript:void(0);"><img src="images/special1.png" alt="" title="" /></a>
				   </div>
				   
				   <div class="cont">
					  <a href="javascript:void(0);">Honeysuckle Flameless Luminary Refill</a>
					  <div class="prise"><span class="old">$177.00</span></div>
				   </div>   
			    </li>
			    
			    <li>
				   <div class="prev">
					  <a href="javascript:void(0);"><img src="images/special2.png" alt="" title="" /></a>
				   </div>
				   
				   <div class="cont">
					  <a href="javascript:void(0);">Honeysuckle Flameless Luminary Refill</a>
					  <div class="prise"><span class="old">$177.00</span></div>
				   </div>   
			    </li>
		     </ul>
	      </aside><!-- #specials -->
	      
	      <aside id="newsletter_signup">
		     <h3>Newsletter Signup</h3>
		     <p>Phasellus vel ultricies felis. Duis 
		     rhoncus risus eu urna pretium.</p>
		     
		     <form class="newsletter">
			    <input type="email" name="newsletter" class="your_email" value="" placeholder="Enter your email address..."/>
			    <input type="submit" id="submit" value="Subscribe" />
		     </form>
	      </aside><!-- #newsletter_signup -->
       </div><!-- .sidebar -->
      
       <div id="content" class="grid_9">
	      <h1 class="page_title">作品列表</h1>
	      
	      <div class="options">
		     <div class="grid-list">
			   <a class="grid" href="#"><span>img</span></a>
			   <a class="list curent" href="index.html"><span>img</span></a>
		     </div><!-- .grid-list -->
		     
		     <div class="show">
			   转到
			    <select id="currentPage" name="currentPage" >
			    
			    <c:forEach var="i" begin="1" end="${pagesize }" step="1">
			    
			      <option value="${i}">${i}</option>
			    </c:forEach>
			    
			    
				  
			     </select>
			    <input type="hidden" id="currentPageSelect" name="currentPageSelect" value="${currentPage }">
			   页
		     </div><!-- .show -->
		     
		     <div class="sort">
			   排序
			    <select id="sortSele" name="sortSele">
				   <option value="0">价格</option>
				   <option value="1">发布时间</option>
				
			     </select>
			    <input type="hidden" id="sortSeleSelect" name="sortSeleSelect" value="${sortSele }">
			    
			    
			      <c:choose>  
               <c:when test="${sortBy=='0'}">  
                  <a class="sort_down" id="sortdown" name="sortdown" href="javascript:void(0);" >&#8595;</a>
                </c:when> 
                      <c:otherwise>  
                       <a class="sort_up" id="sortup" name="sortup" href="javascript:void(0);" >&#8593;</a>
                       </c:otherwise> 
                      </c:choose> 
			    
			    
			  
			   
		     </div><!-- .sort -->
	      </div><!-- .options -->
	      
	      <div class="listing_product">
	      
	      
	      <c:forEach items="${proinfos}" var="pro">
	      
	      
			<div class="product_li">
				<div class="grid_3">
					<img class="sale" src="images/new.png" alt="New"/>
					<div class="prev">
						<a href="projectinfo/project_${pro[0] }.html"><img src="uploadImg/${pro[7] }" width="115px" height="189px" alt="" title="" /></a>
					</div><!-- .prev -->
				</div><!-- .grid_3 -->
				
				<div class="grid_4">
					<div class="entry_content">
					<a href="projectinfo/project_${pro[0] }.html"><h3 class="title">${pro[1] }</h3></a>  
						<!-- <div style="margin-left: 160px;margin-top: -40px;"><a href="/u/105/" class="avatar" target="_blank">
						<img src="http://imgcdn.guoku.com/avatar/small_105_18f2d4b100ffb4c38b352f7d6cb5a53f.gif" width="30" height="30"></a>
						<a href="/u/105/" class="nickname" target="_blank">
                拜拜北鼻
            </a></div> -->
						<!-- <div class="review"> -->
						<hr style="">
							<!-- <a class="plus" href="#"></a>
							<a class="plus" href="#"></a>
							<a class="plus" href="#"></a>
							<a href="#"></a>
							<a href="#"></a>
							<span>1 REVIEW(S)</span> -->
						<!--</div> -->
						<p style="line-height:20px" title="${pro[9] }">
						<c:if test="${fn:length(pro[9])>50 }">${ fn:substring(pro[9],0,50)} ...</c:if>
 <c:if test="${fn:length(pro[9])<=50 }">${  pro[9] }</c:if>
						
					</p>
						
						<a class="more"  style="margin-left: 260px;" href="projectinfo/project_${pro[0] }.html" >更多</a>
						<hr style="">
						<p style="line-height: 18px"><span>截止时间：</span>${pro[13]}</p>
						<p style="line-height: 8px"><span>剩余时间：</span>82天23小时</p>
						
						 <c:choose>  
               <c:when test="${empty pro[11]}">  
                  <div class="progress-bar" title="已售卖了0件，完成目标的0%"> 
                <span class="progress bg-red" style="width:0%;" ></span>(0%)
                	</div>
                </c:when> 
                      <c:otherwise>  
                <div class="progress-bar" title="已售卖了${pro[12]}件，完成目标的${pro[11]}"> 
                <span class="progress bg-red" style="width:${pro[11]};" ></span>(${pro[11]})
                	</div>
                         
                       </c:otherwise> 
                      </c:choose> 
						
					</div><!-- .entry_content -->
				</div><!-- .grid_4 -->
				
				<div class="grid_2">
					<div class="cart">
						<div class="price">
							<div class="price_new">￥<c:out value="${pro[5] }"></c:out> </div>
						
						</div>
						<a href="projectinfo/project_${pro[0] }.html" class="bay">购买</a>
						<a href="javascript:void(0);" class="obn"></a>
						
						
						 <c:if test="${pro[8] =='0'}">
            
           		<a href="javascript:void(0);" title="我喜欢" class="like" id="btnLike${pro[0] }" name="btnLike${pro[0] }" onclick="ajax_webserviceHello(${pro[0] });">
				
              </c:if>
						<c:if test="${pro[8]>='1'}">
            
           		<a href="javascript:void(0);" title="我喜欢" class="likeed" id="btnLike${pro[0] }" name="btnLike${pro[0] }" onclick="ajax_webserviceHello(${pro[0] });">
				
              </c:if>
						
				
				</a>
						
					</div><!-- .cart -->
				</div><!-- .grid_2 -->
				
				<div class="clear"></div>
			</div><!-- .article -->
			
			
			  </c:forEach>
		
				
			
			
			
	    
	      <div class="clear"></div>
	      </div><!-- .listing_product -->
	      
	      <div class="clear"></div>
	      
	      <div class="pagination">
		     <ul>
			    <li class="prev"><span>&#8592;</span></li>
			    <li class="curent"><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li><span>...</span></li>
			    <li><a href="#">100</a></li>
			    <li class="next"><a href="#">&#8594;</a></li>
		     </ul>
	      </div><!-- .pagination -->
	      <p class="pagination_info">Displaying 1 to 12 (of 100 products)</p>
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
