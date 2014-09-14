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

  <title>Home</title>

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
       })
       
       
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
  


</head>
<body>
 

  <div class="clear"></div>

  <div class="container_12">
    <div class="grid_12">
        <div class="slidprev"><span>Prev</span></div>
        <div class="slidnext"><span>Next</span></div>
        <div id="slider">
          <div id="slide1">
            <img src="images/ab3.jpg" alt="" title="" />
            <div class="slid_text">
           <!--   <h3 class="slid_title"><span>Breeze Theme</span></h3>
              <p><span>Breeze is the 14 stylish HTML templates,</span></p>
              <p><span>which will helps you boost sales</span></p>
              <p><span>and receive good feedback from your clients.</span></p>--> 
            </div>
          </div>

          <div id="slide2">
            <img src="images/ab1.jpg" alt="" title="" />
            <div class="slid_text">
              <!--   <h3 class="slid_title"><span>Flexibility</span></h3>
              <p><span>Every product, which you are selling,</span></p>
              <p><span>will look great with Breeze theme.</span></p>-->
            </div>
          </div>

          <div id="slide3">
            <img src="images/ab2.jpg" alt="" title="" />
            <div class="slid_text">
             <!-- <h3 class="slid_title"><span>Accuracy and Easiness</span></h3>
              <p><span>Breeze design is mere and accurate,</span></p>
              <p><span>so it will satisfy everybody.</span></p>-->
            </div>
          </div>
        </div><!-- .slider -->
        <div id="myController">
          <div class="control"><span>1</span></div>
          <div class="control"><span>2</span></div>
          <div class="control"><span>3</span></div>
        </div>


    </div><!-- .grid_12 -->
  </div><!-- .container_12 -->
 <!-- <div class="copyrights">Collect from 网站模板</div> --> 
  <div class="clear"></div>

  <section id="main" class="home">
    <div class="container_12">
      <div id="top_button">
        <div class="grid_4">
          <a href="#" class="button_block best_price">
            <img src="images/banner1.png" alt="Banner 1"/>
          </a><!-- .best_price -->
        </div><!-- .grid_4 -->

        <div class="grid_4">
          <a href="#" class="button_block new_smells">
            <img src="images/banner2.png" alt="Banner 2"/>
          </a><!-- .new smells -->
        </div><!-- .grid_4 -->

        <div class="grid_4">
          <a href="#" class="button_block only_natural">
            <img src="images/banner3.png" alt="Banner 3"/>
          </a><!-- .only_natural -->
        </div><!-- .grid_4 -->

        <div class="clear"></div>
      </div><!-- #top_button -->

      <div class="clear"></div>

      <div class="carousel">
        <div class="c_header">
          <div class="grid_10">
            <h2>最受欢迎</h2>
          </div><!-- .grid_10 -->

          <div class="grid_2">
            <a id="next_c1" class="next arows" href="javascript:void(0)"><span>下一页</span></a>
            <a id="prev_c1" class="prev arows" href="javascript:void(0)"><span>上一页</span></a>
           </div><!-- .grid_2 -->
        </div><!-- .c_header -->

        <div class="list_carousel">

        <ul id="list_product" class="list_product">
        
         <c:forEach items="${prolikeinfos }" var="prolike">
        
          <li class="">
            <div class="grid_3 product">
            
            
                <a href="projectinfo/project_${prolike[0] }.html">
                 
                 <div class="imgtag">
		<div class="tag_item">
		<img style="width:100%" src="uploadImg/${prolike[7]}">
			
		</div>
                 
			
	     </a>
	     
            
            
            
              </div><!-- .prev -->
              <h3 class="title">${prolike[1] }<br>
               	 目标： ${prolike[11] }天 ${prolike[3] }件 </h3>
              <c:choose>  
               <c:when test="${empty prolike[9]}">  
                  <div class="progress-bar" title="已售卖了0件，完成目标的0%"> 
                <span class="progress bg-red" style="width:0%;" ></span>
                	</div>
                </c:when> 
                      <c:otherwise>  
                       <div class="progress-bar" title="已售卖了${prolike[10]}件，完成目标的${prolike[9]}"> 
                <span class="progress bg-red" style="width:${prolike[9]};" ></span>
                	</div>
                         
                       </c:otherwise> 
                      </c:choose> 
              
            
              
              
              
		
	
              <div class="cart">
                <div class="price">
                <div class="vert">
                  <div class="price_new">￥<c:out value="${prolike[5]}"></c:out></div>
                </div>
                </div>
              <a href="#" class="obn"></a>
            	<a href="javascript:void(0);" title="我喜欢" class="like" id="btnLike${pro[0] }" name="btnLike${pro[0] }" onclick="ajax_webserviceHello(${prolike[0] });">
                <a href="projectinfo/project_${prolike[0]}.html" class="bay" title="加入购物车"></a>
              </div><!-- .cart -->
            </div><!-- .grid_3 -->
          </li>
</c:forEach>
        

          

        </ul><!-- #list_product -->
        </div><!-- .list_carousel -->
      </div><!-- .carousel -->

     

      <div class="carousel">
        <div class="c_header">
          <div class="grid_10">
            <h2>最新品</h2>
          </div><!-- .grid_10 -->
 
          <div class="grid_2">
            <a id="next_c2" class="next arows" href="#"><span>Next</span></a>
            <a id="prev_c2" class="prev arows" href="#"><span>Prev</span></a>
          </div><!-- .grid_2 -->
        </div><!-- .c_header -->
 
        <div class="list_carousel">
        <ul id="list_product2" class="list_product">
        <c:forEach items="${proInfos }" var="pro">
        
        
        
        	 <li class="">
            <div class="grid_3 product">
            
          
            
            
            
      
       
                <a href="projectinfo/project_${pro[0] }.html">
                 
                 <div class="imgtag">
		<div class="tag_item">
		<img style="width:100%" src="uploadImg/${pro[7]}">
			
		</div>
                 
			
	     </a>
	     
                </div>
             <!-- .prev -->
             <h3 class="title">${pro[1] }<br>
               	 目标： ${pro[10] }天 ${pro[3] }件 </h3>
                
              <c:choose>  
               <c:when test="${empty pro[9]}">  
                  <div class="progress-bar" title="已售卖了0件，完成目标的0%"> 
                <span class="progress bg-red" style="width:0%;" ></span>
                	</div>
                </c:when> 
                      <c:otherwise>  
                       <div class="progress-bar" title="已售卖了${pro[9]}件，完成目标的${pro[11]}"> 
                <span class="progress bg-red" style="width:${pro[11]};" ></span>
                	</div>
                         
                       </c:otherwise> 
                      </c:choose> 
              
              
              <div class="cart">
                <div class="price">
                <div class="vert">
                  <div class="price_new">￥<c:out value="${pro[5] }"></c:out> </div>
                </div>
                </div>
                <a href="#" class="obn"></a>
              <a href="javascript:void(0);" title="我喜欢" class="like" id="btnLike${pro[0] }" name="btnLike${pro[0] }" onclick="ajax_webserviceHello(${pro[0] });">
                <a href="projectinfo/project_${prolike[0]}.html" class="bay" title="加入购物车"></a>
              </div><!-- .cart -->
            </div><!-- .grid_3 -->
          </li>
        </c:forEach>
         
 
        </ul><!-- #list_product2 -->
        </div><!-- .list_carousel -->
      </div><!-- .carousel -->

        <!-- .list_carousel -->
      </div><!-- .carousel -->

   <!-- #content_bottom -->
      <div class="clear"></div>

    </div><!-- .container_12 -->
  </section><!-- #main -->

  <div class="clear"></div>

  <footer>
    <div class="f_navigation">
      <div class="container_12">
        <div class="grid_3">
          <h3>联系我们</h3>
          <ul class="f_contact">
            <li>浙江省杭州市xxx接到</li>
            <li>+0571-86415126</li>
            <li>xhymmc@163.com</li>
          </ul><!-- .f_contact -->
        </div><!-- .grid_3 -->

        <div class="grid_3">
          <h3>信息中心</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="#">关于我们</a></li>
              <li><a href="#">隐私政策</a></li>
              <li><a href="#">条款和条件</a></li>
              <!-- <li><a href="#">Secure payment</a></li> -->
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->

        <div class="grid_3">
          <h3>客户服务</h3>
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
              <li><a href="#">个人中心</a></li>
              <li><a href="#"></a></li>
              <li><a href="#">我喜欢的作品</a></li>
              <li><a href="#">我的信息</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->

        <div class="clear"></div>
      </div><!-- .container_12 -->
    </div><!-- .f_navigation -->

   
  </footer>

</body>
</html>
