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

  <title>产品详细</title>





  <script>
	$(document).ready(function() {
		$('.jqzoom').jqzoom({
			zoomType: 'standard',
			lens:true,
			preloadImages: true,
			alwaysOn:false
		});
	});
  </script>

  <script>
	$(document).ready(function() {
		$("select").selectBox();
	});
  </script>

  <script>
	$(document).ready(function() {
		$('#wrapper_tab a').click(function() {
			if ($(this).attr('class') != $('#wrapper_tab').attr('class') ) {
				$('#wrapper_tab').attr('class',$(this).attr('class'));
			}
			return false;
		});
		var proCart={};
		proCart={
				initDelete:function(){
					$("#cartDivDialog a").each(function(){
						var that=$(this);
						that.bind('click',function(e){
							e.preventDefault();
							var t=$(this);
							var proCode=t.attr("proCode");
							var ttype=t.attr("ttype");
							//发送请求
							$.post("projectinfo/beginDelecart.xhtml",{proCode:proCode,tshirtShort:ttype},function(data){
								var d=$.eval2(data);
								if(d.success){
									///proCart.getCartHtml();
									 $.alert("购物车提示","加入成功");
								}
							});
						});
					})
				},getCartHtml:function(){
					$.post("projectinfo/getCart.xhtml",{},function(data){
						$( "#cartDivDialog" ).html("").html(data).dialog( "open" );
						proCart.initDelete();
					})
				}
			};
		//dialog
		$("#cartDivDialog").dialog({
			title:'我的购物车',
			autoOpen: false,
			height: 500,
			width: 750,
			modal: true,
			buttons:{
				"结算":function(){
					//alert("感谢购物,欢迎下次再来");
					if(!window.ActiveXObject){
						window.location="order/order.xhtml";
					}else{
						window.location="../order/order.xhtml";
					}
				}
			}
		});
		//buy
		$("#btnBuy").click(function(e){
			e.preventDefault();
			var buynum=$("#buyNumber").val();
			if(!buynum){
				$.alert("购物提示","请输入购买数量");
				return;
			}
			
			
			var cm=$("input[name=radioType]:checked");
			if(cm.length==0){
				$.alert("购物提示","请选择尺码");
				return;
			}
			//pro img
			var proImg=$("#proImg").attr("src");
			var proCode=$("#proCode").val();
			$.post("projectinfo/addCart.xhtml",{proCode:proCode,cartNumber:buynum,tshirtShort:cm.val(),imageUrl:proImg,proName:$("#proSpanName").html(),proUnit:$("#proSpanUnit").html()},function(data){
				
				var d=$.eval2(data);
				if(d.success){
					///proCart.getCartHtml();
					 $.alert("购物车提示","加入成功");
				}
				//$( "#cartDivDialog" ).html("").html(data).dialog( "open" );
				//proCart.initDelete();
			});
			//alert("购物数量："+buynum+" 尺码："+cm.val());
		});
		  $("#appraiseSub").click(function(e){
	   			e.preventDefault();
	   			
	   			
	   			
	   			
	   			var rang = $("#appraiseValue").val();
	   			if(rang==''){
					$.alert("评价提示","请选择分数");
					return;
				}
	   			
	   			var remarks = $("#remarks").val();
	   			
	   			
	   			if(remarks==""){
	   				$.alert("评价提示","请输入评价内容");
					return;
	   				
	   			}
	   			
	   			
	   			var proCode=$("#proCode").val();
	   			$.post("appraise/beginAddAppraise.xhtml",{appraiseCount:rang,remarks:remarks,proCode:proCode},function(data){
	   				var d=$.eval2(data);
	   				if(d.success){
						$.alert("评论提示","评论成功",function(){
							url="projectinfo/project_"+d.returnValue+".html";
						
							if($.browser.msie) {
								url="../projectinfo/project_"+d.returnValue+".html";
							}
							window.location=url;
						});
					}else{
						$.alert("评论提示",d.errorMsgs[0]);
					}
	   				
	   				
					
				});
	   			
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
          $('#list_banners').carouFredSel({
		prev: '#ban_prev',
		next: '#ban_next',
		scroll: 1,
		auto: false
	  });
	  $('#thumblist').carouFredSel({
		prev: '#img_prev',
		next: '#img_next',
		scroll: 1,
		auto: false,
		circular: false,
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
  </script>



</head>
<body>
<!-- -购物车  begin -->
<div id="cartDivDialog">
<!-- <table style="border: 1px solid red;width: 600px;">
	<tr>
		<td>商品</td><td>&nbsp;</td><td>单价</td><td>数量</td><td>小计</td><td>操作</td>
	</tr>
	<tr>
		<td><img alt="" src="uploadImg/${infoPro.resourceInfo.resourceName }" width="100" height="100"> </td>
		<td>这是我最好的作品了</td>
		<td>12</td>
		<td>1</td>
		<td>22*1=22元</td>
		<td>删除</td>
	</tr>
	<tr>
		<td colspan="6" align="right">共1件商品，商品总金额33元 <button style="width: 54px;">结算</button>  </td>
	</tr>
</table> -->
</div>
<!-- -购物车  end -->

  

  <div class="clear"></div>

  <section id="main">
    <div class="container_12">
     

       <div id="content" class="grid_7">
	      <h1 class="page_title"><span id="proSpanName"><c:out value="${infoPro.proName }"></c:out></span> </h1>

		<div class="product_page">
		 
        <span style="margin-left: 140px;">       
                
		<img  id="proImg" name="proImg" style="width:319px;height:319px;" src="uploadImg/${infoPro.resourceInfo.resourceName }">
		</span>  
		
		<div style="width: 564px;border-top: 1px #E0E0E0 solid; " >
					<img  id="bgbox" name="bgbox" style="width:100px;height:100px;cursor: pointer;" src="uploadImg/${infoPro.resourceInfo.resourceName }">
					<img  id="bgboxb" name="bgboxb" style="width:100px;height:100px;cursor: pointer;" src="uploadImg/${infoPro.resourceInfo1.resourceName }">
				
				
				<script type="text/javascript">
				
				$("#bgbox").bind('click',function(e){
					$("#proImg").attr("src",$("#bgbox").attr("src"));

				
				});
				
				$("#bgboxb").bind('click',function(e){
					$("#proImg").attr("src",$("#bgboxb").attr("src"));

				
				});
			</script>
				</div>
		

			<!-- .grid_4 -->

		
			<div class="clear"></div>

			<div class="grid_7" >
				<div id="wrapper_tab" class="tab1">
					<!--  <a href="#" class="tab1 tab_link">Description</a>-->
					<a href="javascript:void(0);" class="tab1 tab_link">评价</a>
					<a href="javascript:void(0);" class="tab3 tab_link">购买客户</a>

					<div class="clear"></div>

		<!-- .tab1 .tab_body -->

					<div class="tab1 tab_body">
						<!--  <h4>Customer reviews</h4>-->
						<ul class="comments">
						 <c:forEach items="${applist}" var="app">

							<li>
								<div class="autor"><c:out value="${app.zcUserInfo.userName }"></c:out></div>, <time datetime="<c:out value="${app.insertTime }"></c:out>"><c:out value="${app.insertTime }"></c:out></time>

								<div class="evaluation">
									<div class="quality">
										<strong>评价</strong>
									 <c:choose>
		    
		     <c:when test="${app.appraiseCount=='1'}">
		     	<label class="plus" ></label>
		     	<label></label>
						<label></label>
						<label></label>
					<label></label>				
									<!--  
										<a class="plus" href="javascript:void(0);"></a>
										<a class="plus" href="javascript:void(0);"></a>
										<a class="plus" href="javascript:void(0);"></a>
										<a class="plus_minus" href="javascript:void(0);"></a>
		     -->
		      </c:when>
		        
		     <c:when test="${app.appraiseCount=='2'}">
		     	<label class="plus" ></label>
		     <label class="plus" ></label>
				<label></label>
				<label></label>
					<label></label>			
							
		      </c:when>
		       <c:when test="${app.appraiseCount=='3'}">
		     	<label class="plus" ></label>
		     	<label class="plus" ></label>
			<label class="plus" ></label>
			<label></label>
				<label  ></label>				
						
		      </c:when>
		       <c:when test="${app.appraiseCount=='4'}">
		     <label class="plus" ></label>
		     	<label class="plus" ></label>
				<label class="plus" ></label>
			<label class="plus" ></label>
					<label  ></label>		
					
		      </c:when>
		       <c:when test="${app.appraiseCount=='5'}">
		      
		      
		     	<label class="plus" ></label>
		     	<label class="plus" ></label>
			<label class="plus" ></label>
				<label class="plus"  ></label>
		<label class="plus" ></label>
								
		      </c:when>
		      </c:choose>
										
										
										
									</div>
									
									
								</div><!-- .evaluation -->

								<p>${app.remarks }</p>
							</li>
							
							</c:forEach>
							
						</ul><!-- .comments -->

					<a name="pos">	<form class="add_comments">
							<h4 style="border-top: 1px solid #e0e0e0;line-height: 40px;">评论</h4>

							<div class="evaluation">
								<div class="quality" id="menu" name="menu" >
									<strong>评价</strong><sup class="surely">*</sup>
									<div style="margin-top: -80px;margin-left: 70px;">
									<label name="appraise1" id="appraise1" fmid="1" ></label>		
								<label  name="appraise2" id="appraise2" fmid="2"  ></label>		
						<label  name="appraise3" id="appraise3" fmid="3"  ></label>		
							<label  name="appraise4" id="appraise4"  fmid="4" ></label>		
								<label  name="appraise5" id="appraise5" fmid="5"  ></label>	
								<input type="hidden" id="appraiseValue" name="appraiseValue">
									</div>
								</div>
								<script type="text/javascript">
				
								
								$("#menu label").click(function(e){
									e.preventDefault();
									for (var int = 1; int < 6; int++) {
										$("#appraise"+int).removeClass("plus");
										
									}
									
									var that=$(this);
									
									var fmid=that.attr("fmid");
									$("#appraiseValue").val(fmid);
									
									for (var int = 1; int <= fmid; int++) {
										
										$("#appraise"+int).addClass("plus");
										
									}
									
									
									
								});
								
				
			</script>
								<div class="clear"></div>
							</div><!-- .evaluation -->

						<!--  	<div class="nickname">
								<strong>昵称</strong><sup class="surely">*</sup><br/>
								<input type="text" name="" class="" value="" />
							</div>--><!-- .nickname -->

							<!-- <div class="your_review">
								<strong>标题</strong><sup class="surely">*</sup><br/>
								<input type="text" name="" class="" value="" />
							</div>--><!-- .your_review -->

							<!-- <div class="clear"></div>-->

							<div class="text_review" style="margin-top: -20px;">
								<strong>内容</strong><sup class="surely">*</sup><br/>
								<textarea name="remarks"  id="remarks" cols="50" rows="10" ></textarea>
								<i>备注:1000字以内</i>
							</div><!-- .text_review -->

							<input type=submit  id="appraiseSub" name="appraiseSub" value="提交评论" />
						</form></a><!-- .add_comments -->
					<div class="clear"></div>
					</div><!-- .tab2 .tab_body -->

					<div class="tab3 tab_body">
						<!-- <h4>购买列表</h4> -->
						<table border="0" cellpadding="0" cellspacing="0" class="tableStyle thback">
          <tbody><tr>
           <!--   <th>序号</th>-->
            <th>买家</th>
             <th>价格</th>
               <th>购买数量</th>
            <th>下单时间</th>
           
              <th>款式和型号</th>
            
            
          </tr>
           <c:forEach items="${userlist}" var="user">
               <tr>
              <td><c:out value="${user[1]}"></c:out></td>
              <td><c:out value="${user[7]}"></c:out></td>
              <td><c:out value="${user[9]}"></c:out></td>
             
              <td><c:out value="${user[3]}"></c:out></td>
             
              <td>
              尺码
<c:choose>
		    
		     <c:when test="${user[10]!='0'}">  
                  	
	【S】
                </c:when> 
               </c:choose>
                 <c:choose>   <c:when test="${user[11]!='0'}">  
                  	
	【M】
                </c:when> 
                 </c:choose>
		        <c:choose>  <c:when test="${user[12]!='0'}">  
                  	
	【L】
                </c:when> 
                 </c:choose>
                 <c:choose> <c:when test="${user[13]!='0'}">  
                  	
	【XL】
                </c:when> 
                 </c:choose>
                 <c:choose> <c:when test="${user[14]!='0'}">  
                  	
	【XXL】
                </c:when> 
                  </c:choose> 
                    <c:choose> <c:when test="${user[15]!='0'}">  
                  	
	【XXXL】
                </c:when> 
		    </c:choose>
		     


</td>
            </tr>
             </c:forEach> 
          
                    
                  </tbody></table>
					<div class="clear"></div>
					</div><!-- .tab3 .tab_body -->
					<div class="clear"></div>
				</div>​<!-- #wrapper_tab -->
				<div class="clear"></div>
			</div><!-- .grid_9 -->

			
			
		</div><!-- .product_page -->
		<div class="clear"></div>

       </div><!-- #content -->
  <div id="sidebar" class="grid_5">
	      <aside id="categories_nav">
		     <h3>简介</h3>

		     <nav class="left_menu">
			   	<div class="grid_5">
				<div class="entry_content">
					<div class="review">
						<a class="plus" href="javascript:void(0);"></a>
						<a class="plus" href="javascript:void(0);"></a>
						<a class="plus" href="javascript:void(0);"></a>
						<a href="javascript:void(0);"></a>
						<a href="javascript:void(0);"></a>
						<span>1 评论</span>
						<a class="add_review" href="projectinfo/project_<c:out value="${infoPro.proCode }"></c:out>.html#pos">评论</a>
					</div>
					<!-- pro -->
					<input type="hidden" value="${infoPro.proCode }" id="proCode">
					<p><c:out value="${infoPro.proRemarks }"></c:out></p>
					<div class="ava_price">
						<div class="availability_sku">
							<div id="radio">
								<input type="radio" id="radio1" name="radioType" value="S"/><label for="radio1">S</label>
								<input type="radio" id="radio2" name="radioType" value="M"/><label for="radio2">M</label>
								<input type="radio" id="radio3" name="radioType" value="L"/><label for="radio3">L</label>
								<input type="radio" id="radio4" name="radioType" value="XL"/><label for="radio4">XL</label>
								<input type="radio" id="radio5" name="radioType" value="XXL"/><label for="radio5">XXL</label>
								<input type="radio" id="radio6" name="radioType" value="XXXL"/><label for="radio6">XXXL</label>
							</div>
							<script type="text/javascript">
							$( "#radio" ).buttonset();
							</script>
						</div><!-- .availability_sku -->

						<div class="price">
							<div class="price_new">￥<span id="proSpanUnit"><c:out value="${infoPro.proUnit }"></c:out></span> </div>
						</div><!-- .price -->
					</div><!-- .ava_price -->

					<div class="block_cart">
						<div class="obn_like">
							<div class="like"><a href="#" class="like">喜欢</a></div>
						</div>

						<div class="cart">
							<a href="javascript:void(0)" class="bay" id="btnBuy">加入购物车</a>
							<input type="text" name="" class="number" id="buyNumber" value="1" />
							<span>数量:</span>
						</div>
						<div class="clear"></div>
					</div><!-- .block_cart -->
				<div class="bdsharebuttonbox" style="float: right;"><A class=bds_more href="#" data-cmd="more"></A><A class=bds_qzone title=分享到QQ空间 href="#" data-cmd="qzone"></A><A class=bds_tsina title=分享到新浪微博 href="#" data-cmd="tsina"></A><A class=bds_tqq title=分享到腾讯微博 href="#" data-cmd="tqq"></A><A class=bds_renren title=分享到人人网 href="#" data-cmd="renren"></A><A class=bds_weixin title=分享到微信 href="#" data-cmd="weixin"></A></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
				</div><!-- .entry_content -->

			</div><!-- .grid_5 -->

		     </nav><!-- .left_menu -->
	      </aside><!-- #categories_nav -->

	     
	   
	     

       </div><!-- .sidebar -->
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
