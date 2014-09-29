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

  <meta name="description" content="T恤众筹平台，打造属于自己的style">
  <meta name="keywords" content="小众派">

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

       function GetAbsPosition(obj)
       {
             var curleft = 0, curtop = 0;
             do {
             curleft += obj.offsetLeft;
             curtop += obj.offsetTop;
             } while (obj = obj.offsetParent);
             return [curleft,curtop];       
       }

       function ShowFloatingImage(image, width, height,obj)
       {
           var id = "trailimageid";
           var newdiv = document.getElementById(id);
           if(newdiv == null)
           {
             newdiv = document.createElement('div');
             newdiv.setAttribute('id',id);
             newdiv.setAttribute('onmouseout', "HideElement('"+id+"');");
             document.body.appendChild(newdiv);
           }
           newdiv.innerHTML = '<a href="projectinfo/project_'+obj+'.html"><img src='+image.src+ ' width='+(image.width + width)+' style="cursor: pointer;"' + ' height=' + (image.height + height) + ' /></a>';

           var absPos = GetAbsPosition(image);
           newdiv.style.position = "absolute";        
           newdiv.style.posLeft = absPos[0] - width/2;
           newdiv.style.posTop = absPos[1] - height/2;
           newdiv.style.display="block";
       }

       function HideElement(id)
       {
           var elem = document.getElementById(id);
           elem.style.display="none";
       }

  </script>
  
<style type="text/css">

</style>

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
		<img style="width:100%" src="uploadImg/${prolike[7]}" onmouseover="ShowFloatingImage(this, 50, 50,${prolike[0] });">
			
		</div>
                 
			
	     </a>
	     
            
            
            
              </div><!-- .prev -->
              <h3 class="title"><a href="projectinfo/project_${pro[0] }.html">${prolike[1] }</a><br>
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
              <a href="projectinfo/project_${pro[0] }.html#pos" class="obn" title="去评论"></a>
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
		<img style="width:100%" src="uploadImg/${pro[7]}" onmouseover="ShowFloatingImage(this, 50, 50,${pro[0] });">
			
		</div>
                 
			
	     </a>
	     
                </div>
             <!-- .prev -->
             <h3 class="title"> <a href="projectinfo/project_${pro[0] }.html">${pro[1] }</a><br>
               	 目标： ${pro[10] }天 ${pro[3] }件 </h3>
                
              <c:choose>  
               <c:when test="${empty pro[9]}">  
                  <div class="progress-bar" title="已售卖了0件，完成目标的0%"> 
                <span class="progress bg-red" style="width:0%;" ></span>
                	</div>
                </c:when> 
                      <c:otherwise>  
                       <div class="progress-bar" title="已售卖了${pro[9]}件，完成目标的${pro[8]}"> 
                <span class="progress bg-red" style="width:${pro[8]};" ></span>
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
