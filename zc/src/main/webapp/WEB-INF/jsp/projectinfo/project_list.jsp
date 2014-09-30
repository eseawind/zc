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
		 var stateSeleSelect=$("#stateSeleSelect").val();
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
			
			
			if(stateSeleSelect==''||stateSeleSelect=='-1'){
				 $("#stateSele option").filter("[value='-1']").attr("selected", true);//有效！ 
					
					
			}else{
				
				 $("#stateSele option").filter("[value='"+stateSeleSelect+"']").attr("selected", true);//有效！ 
					
					
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
	      
	      
	      $("#stateSele").change(function(){
	    	  var state=$(this);
	    	  if(window.ActiveXObject){
	    		  window.location=("../projectinfo/project_list.html?currentPage=1&stateSele="+state.val()+"&proType=${proType}&proFabric=${proFabric}");  
				 }else{
					 window.location=("projectinfo/project_list.html?currentPage=1&stateSele="+state.val()+"&proType=${proType}&proFabric=${proFabric}");  
				 }
	    	
	    	  
	    	
	    	 
	      });
	      
	      
	      $("#sortdown").click(function(){
	    	  
	    	  
	    	  if(window.ActiveXObject){
	    		  window.location=("../projectinfo/project_list.html?currentPage=1&sortSele="+$("#sortSele").val()+"&sortBy=1&proType=${proType}&proFabric=${proFabric}&stateSele=${stateSele}");  
				 }else{
					 window.location=("projectinfo/project_list.html?currentPage=1&sortSele="+$("#sortSele").val()+"&sortBy=1&proType=${proType}&proFabric=${proFabric}&stateSele=${stateSele}");  
				 }
	    	
	    	  
	    	  
	    	 
		      }); 
	      
	      $("#sortup").click(function(){
	    	  
	    	  if(window.ActiveXObject){  
	    		  window.location=("../projectinfo/project_list.html?currentPage=1&sortSele="+$("#sortSele").val()+"&sortBy=0&proType=${proType}&proFabric=${proFabric}&stateSele=${stateSele}"); 
	    	  }else{
	    		  window.location=("projectinfo/project_list.html?currentPage=1&sortSele="+$("#sortSele").val()+"&sortBy=0&proType=${proType}&proFabric=${proFabric}&stateSele=${stateSele}");  
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
	
	
	
	function ajax_proLikeed(proCode) {
    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "projectinfo/beginAddLike.xhtml?proCode="+proCode,
        data: "{}",
        dataType: 'json',
        success: function(data) {
        	$("#btnLike"+data.returnValue).removeClass("like");
        	$("#btnLike"+data.returnValue).addClass("likeed");
        	$("#btnLike"+data.returnValue).attr("onclick","ajax_proLike("+data.returnValue+")");
        }
    });
}

	
	function ajax_proLike(proCode) {
	    $.ajax({
	        type: "post",
	        contentType: "application/json",
	        url: "projectinfo/beginAddLikeed.xhtml?proCode="+proCode,
	        data: "{}",
	        dataType: 'json',
	        success: function(data) {
	        	$("#btnLike"+data.returnValue).removeClass("likeed");
	        	$("#btnLike"+data.returnValue).addClass("like");
	        	$("#btnLike"+data.returnValue).attr("onclick","ajax_proLikeed("+data.returnValue+")");
	        }
	    });
	}
</script>
<style type="text/css">



</style>

</head>
<body>

  
  

  
  

  
  <section id="main">
    <div class="container_12">
    
      
       <div id="content" class="grid_12">
	      <h1 class="page_title">作品列表</h1>
	      
	      <div class="options">
		     <div class="grid-list">
			   <a class="grid" href="#"><span>img</span></a>
			   <a class="list curent" href="index.html"><span>img</span></a>
		     </div><!-- .grid-list -->
		     
		     <div class="show" style="margin-top: 17px;">
			   转到
			    <select id="currentPage" name="currentPage" >
			    
			    <c:forEach var="i" begin="1" end="${pagesize }" step="1">
			    
			      <option value="${i}">${i}</option>
			    </c:forEach>
			    
			    
				  
			     </select>
			    <input type="hidden" id="currentPageSelect" name="currentPageSelect" value="${currentPage }">
			   页
		     </div><!-- .show -->
		     
		     <div class="show" style="margin-top: 17px;">
			状态
			    <select id="stateSele" name="stateSele">
			      <option value="-1">所有项目</option>
				   <option value="4">众筹中</option>
				   <option value="5">众筹成功</option>
				 <option value="6">众筹失败</option>
			     </select>
			    <input type="hidden" id="stateSeleSelect" name="stateSeleSelect" value="${stateSele }">
			    
			    
			   
			    
			  
			   
		     </div><!-- .sort -->
		     
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
	      
	      
	    <div class="grid_product">
	    
	      <c:forEach items="${proinfos}" var="pro">
	      
	      
	        <div class="grid_3 product">
			    <div class="prev">
				  <a href="projectinfo/project_${pro[0] }.html"><img src="uploadImg/${pro[7] }" width="210px" height="210px" alt="" title="" /></a>
			    </div><!-- .prev -->
			    <h3 class="title">${pro[1] }<br>	 目标： ${pro[14] }天 ${pro[3] }件 </h3>
                
              <c:choose>  
               <c:when test="${empty pro[11]}">  
                  <div class="progress-bar" title="已售卖了0件，完成目标的0%"> 
                <span class="progress bg-red" style="width:0%;" ></span>
                	</div>
                </c:when> 
                      <c:otherwise>  
                       <div class="progress-bar" title="已售卖了${pro[12]}件，完成目标的${pro[11]}"> 
                <span class="progress bg-red" style="width:${pro[11]};" ></span>
                	</div>
                         
                       </c:otherwise> 
                      </c:choose> 
              
			    <div class="cart">
				   <div class="price" style="width: 97px;">
					  <div class="vert">
						 <div style="padding-left: 20px;padding-bottom: 12px;">￥<c:out value="${pro[5] }"></c:out></div>
						
					  </div>
				   </div>
				 
						<a href="projectinfo/project_${pro[0] }.html#pos" class="obn" title="去评论"></a>
						
						
						 <c:if test="${pro[8] =='0'}">
          
           		<a href="javascript:void(0);" title="我喜欢" class="like" id="btnLike${pro[0] }" name="btnLike${pro[0] }" onclick="ajax_proLikeed(${pro[0] });">
				</a>
              </c:if>
						<c:if test="${pro[8]>='1'}">
            
           		<a href="javascript:void(0);" title="取消喜欢" class="likeed" id="btnLike${pro[0] }" name="btnLike${pro[0] }" onclick="ajax_proLike(${pro[0] });">
				</a>
              </c:if>
						
				 <a href="projectinfo/project_${pro[0] }.html" class="bay" title="购买"></a>
				
			    </div><!-- .cart -->
		     </div><!-- .grid_3 -->
	      
	      
	      </c:forEach>
	    
		
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
