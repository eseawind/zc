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

 <script>
	$(document).ready(function() {
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
		     $(this).addClass('click')
	      });    
	      
	      //排序
	      $("#sortSele").change(function(){
	    	  var that=$(this);
	    	  alert(that.val());
	      });
	      //分页
	      $("#currentPage").change(function(){
	    	  var page=$(this);
	    	  alert(page.val());
	      })
	      
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
	      <a href="index.html">首页</a><span>&#8250;</span><a href="#">短袖</a><span>&#8250;</span><span class="current">尼龙</span>
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
				   <li><a href="#">短袖<span>(21)</span></a></li>
				   <li class="last"><a href="#">长袖<span> (27)</span></a></li>
				  
				  
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside><!-- #categories_nav -->
	      
	    
	     
	      
	      <aside id="specials" class="specials">
		     <h3>作品推荐</h3>
		     
		     <ul>
			    <li>
				   <div class="prev">
					  <a href="product_page.html"><img src="images/special1.png" alt="" title="" /></a>
				   </div>
				   
				   <div class="cont">
					  <a href="product_page.html">Honeysuckle Flameless Luminary Refill</a>
					  <div class="prise"><span class="old">$177.00</span>$75.00</div>
				   </div>   
			    </li>
			    
			    <li>
				   <div class="prev">
					  <a href="product_page.html"><img src="images/special2.png" alt="" title="" /></a>
				   </div>
				   
				   <div class="cont">
					  <a href="product_page.html">Honeysuckle Flameless Luminary Refill</a>
					  <div class="prise"><span class="old">$177.00</span>$75.00</div>
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
			   <a class="grid" href="catalog_grid.html"><span>img</span></a>
			   <a class="list curent" href="index.html"><span>img</span></a>
		     </div><!-- .grid-list -->
		     
		     <div class="show">
			   转到
			    <select id="currentPage" name="currentPage" onclick="gopage2();">
				   <option>1</option>
				   <option>2</option>
				   <option>3</option>
				   <option>4</option>
				   <option>5</option>
				   <option>6</option>
				   <option>7</option>
				   <option>8</option>
				   <option>9</option>
				   <option>10</option>
				   <option>11</option>
				   <option>12</option>
			     </select>
			    
			   页
		     </div><!-- .show -->
		     
		     <div class="sort">
			   排序
			    <select id="sortSele">
				   <option>价格</option>
				   <option>发布时间</option>
				
			     </select>
			    
			    <a class="sort_up" href="#">&#8593;</a>
			     <a class="sort_down" href="#">&#8595;</a>
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
					<a href="product_page.html"><h3 class="title">${pro[1] }</h3></a>  
						
						<div class="review">
						<hr style="">
							<!-- <a class="plus" href="#"></a>
							<a class="plus" href="#"></a>
							<a class="plus" href="#"></a>
							<a href="#"></a>
							<a href="#"></a>
							<span>1 REVIEW(S)</span> -->
						</div>
						<p>${pro[9] }</p>
						
						<a class="more" style="margin-left: 260px;" href="projectinfo/project_${pro[0] }.html">更多</a>
					</div><!-- .entry_content -->
				</div><!-- .grid_4 -->
				
				<div class="grid_2">
					<div class="cart">
						<div class="price">
							<div class="price_new">￥<c:out value="${pro[5] }"></c:out> </div>
						
						</div>
						<a href="projectinfo/project_${pro[0] }.html" class="bay">购买</a>
						<a href="javascript:void(0);" class="obn"></a>
						 <FORM  method=post action="projectinfo/beginAddLike.html"   name="likeForm" id="likeForm" >
						 <input type="hidden" value="${pro[0] }" id="proCode" name="proCode">
						
				<a href="javascript:void(0);" class="like" id="btnLike${pro[0] }" name="btnLike${pro[0] }" onclick="ajax_webserviceHello(${pro[0] });"></a>
						</FORM>
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
