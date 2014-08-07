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

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css/jquery.jqzoom.css" type="text/css">

  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jflow.plus.js" ></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
  <script src="js/checkbox.js"></script>
  <script src="js/radio.js"></script>
  <script src="js/selectBox.js"></script>
  <script src="js/jquery.jqzoom-core.js" ></script>

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


  <div class="clear"></div>

  <div class="container_12">
    <div class="grid_12">
       <div class="breadcrumbs">
	      <a href="index.html">首页</a><span>&#8250;</span><a href="#">长袖</a><span>&#8250;</span><span class="current">长袖</span>
       </div><!-- .breadcrumbs -->
    </div><!-- .grid_12 -->
  </div><!-- .container_12 -->

  <div class="clear"></div>

  <section id="main">
    <div class="container_12">
       <div id="sidebar" class="grid_3">
	      <aside id="categories_nav">
		     <h3>类别</h3>

		     <nav class="left_menu">
			    <ul>
				   <li><a href="#">上衣<span>(21)</span></a></li>
				   <li><a href="#">长袖<span> (27)</span></a></li>
				   <li><a href="#">裤子<span>(33)</span></a></li>
				   <li class="last"><a href="#">其它<span>(135)</span></a></li>
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside><!-- #categories_nav -->

	      <aside id="specials" class="specials">
		     <h3>推荐</h3>

		     <ul>
			    <li>
				   <div class="prev">
					  <a href="#"><img src="images/special1.png" alt="" title="" /></a>
				   </div>

				   <div class="cont">
					  <a href="#">xxxxx长袖</a>
					  <div class="prise"><span class="old">$177.00</span>$75.00</div>
				   </div>
			    </li>

			     <li>
				   <div class="prev">
					  <a href="#"><img src="images/special2.png" alt="" title="" /></a>
				   </div>

				   <div class="cont">
					  <a href="#">我我我我我我</a>
					  <div class="prise"><span class="old">$177.00</span>$75.00</div>
				   </div>
			    </li>
		     </ul>
	      </aside><!-- #specials -->

	      <aside id="newsletter_signup">
		     <h3>kkkk</h3>
		     <p>hjkhjkjhkjkkl.</p>

		     <form class="newsletter">
			    <input type="email" name="newsletter" class="your_email" value="" placeholder="Enter your email address..."/>
			    <input type="submit" id="submit" value="Subscribe" />
		     </form>
	      </aside><!-- #newsletter_signup -->

	      <aside id="banners">
		<a id="ban_next" class="next arows" href="#"><span>Next</span></a>
		<a id="ban_prev" class="prev arows" href="#"><span>Prev</span></a>

		<h3>Banners</h3>

		<div class="list_carousel">
			<ul id="list_banners">
				<li class="banner"><a href="#">
					<div class="prev">
						<img src="images/banner.png" alt="" title="" />
					</div><!-- .prev -->

					<h2>New smells</h2>

					<p>in the next series</p>
 			        </a></li>

				<li class="banner"><a href="#">
					<div class="prev">
						<img src="images/banner.png" alt="" title="" />
					</div><!-- .prev -->

					<h2>New smells</h2>

					<p>in the next series</p>
 			        </a></li>

				<li class="banner"><a href="#">
					<div class="prev">
						<img src="images/banner.png" alt="" title="" />
					</div><!-- .prev -->

					<h2>New smells</h2>

					<p>in the next series</p>
 			        </a></li>

			</ul>
		</div><!-- .list_carousel -->
	      </aside><!-- #banners -->

	      <aside id="tags">
		     <h3>标签</h3>
		     <a class="t1" href="#">长袖</a>
		     <a class="t2" href="#">特色</a>
		     <a class="t3" href="#">仅有</a>
		     <a class="t4" href="#">特殊t</a>
		     <a class="t5" href="#">chicago</a>
		     <a class="t6" href="#">christmas</a>
		     <a class="t7" href="#">mars</a>
		     <a class="t8" href="#">church</a>
		     <a class="t9" href="#">city</a>
		     <a class="t10" href="#">居家</a>
		     <a class="t11" href="#">color</a>
		     <a class="t12" href="#">concert</a>
		     <a class="t13" href="#">dance</a>
		     <a class="t14" href="#">day</a>
		     <a class="t15" href="#">dog</a>
		     <a class="t16" href="#">england</a>
		     <a class="t17" href="#">europe</a>
	      </aside><!-- #community_poll -->
       </div><!-- .sidebar -->

       <div id="content" class="grid_9">
	      <h1 class="page_title">少时诵诗书</h1>

		<div class="product_page">
			<div class="grid_4 img_slid" id="products">
				<img class="sale" src="images/sale.png" alt="Sale"/>
				<div class="preview slides_container">
					<div class="prev_bg">
						<a href="images/ts.png" class="jqzoom" rel='gal1' title="">
							<img src="images/ts.png"  title="" alt=""/>
						</a>
					</div>
				</div><!-- .prev -->

				<ul class="pagination clearfix" id="thumblist">
					<li><a class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './images/ts.png',largeimage: './images/ts.png'}"><img src='images/ts.png' alt=""></a></li>

				</ul>

				<div class="next_prev">
					<a id="img_prev" class="arows" href="#"><span>Prev</span></a>
					<a id="img_next" class="arows" href="#"><span>Next</span></a>
				</div><!-- . -->
			</div><!-- .grid_4 -->

			<div class="grid_5">
				<div class="entry_content">
					<div class="review">
						<a class="plus" href="#"></a>
						<a class="plus" href="#"></a>
						<a class="plus" href="#"></a>
						<a href="#"></a>
						<a href="#"></a>
						<span>1 评论</span>
						<a class="add_review" href="#">评论</a>
					</div>
					<p>Xssssssssssssssssssssssss1</p>
					<div class="ava_price">
						<div class="availability_sku">
							<div class="availability">
								Availability: <span>In stock</span>
							</div>
							<div class="sku">
								SKU: <span>Candles OV</span>
							</div>
						</div><!-- .availability_sku -->

						<div class="price">
							<div class="price_new">$550.00</div>
							<div class="price_old">$725.00</div>
						</div><!-- .price -->
					</div><!-- .ava_price -->

					<div class="block_cart">
						<div class="obn_like">
							<div class="obn"><a href="#" class="obn">Add to Compare</a></div>
							<div class="like"><a href="#" class="like">喜欢</a></div>
						</div>

						<div class="cart">
							<a href="#" class="bay">购买</a>
							<input type="text" name="" class="number" value="1" />
							<span>数量:</span>
						</div>
						<div class="clear"></div>
					</div><!-- .block_cart -->
					<div class="soc">
						<img src="images/soc.png" alt="Soc"/>
					</div><!-- .soc -->
				</div><!-- .entry_content -->

			</div><!-- .grid_5 -->

			<div class="clear"></div>

			<div class="grid_9" >
				<div id="wrapper_tab" class="tab1">
					<!--  <a href="#" class="tab1 tab_link">Description</a>-->
					<a href="#" class="tab1 tab_link">评价</a>
					<a href="#" class="tab3 tab_link">购买客户</a>

					<div class="clear"></div>

				<!-- 	<div class="tab1 tab_body">
						<h4>Tables Style</h4>
						<p>Suspendisse at placerat turpis. Duis luctus erat vel magna pharetra aliquet. Maecenas tincidunt feugiat ultricies. Phasellus et dui risus. Vestibulum adipiscing, eros quis lobortis dictum. Etiam mollis volutpat odio, id euismod justo gravida a. Aliquam erat volutpat. Phasellus faucibus venenatis lorem, vitae commodo elit pretium et. Duis rhoncus lobortis congue. Vestibulum et purus dui, vel porta lectus. Sed vulputate pulvinar adipiscing.</p>
						<ul>
							<li>She was walking to the mall.</li>
							<li>Ted might eat the cake.</li>
							<li>You must go right now.</li>
							<li>Words were spoken.</li>
							<li>The teacher is writing a report.</li>
						</ul>

						<p>Here are some verb phrase examples where the verb phrase is the predicate of a sentence. In this case, the verb phrase consists of the main verb plus any auxiliary, or helping, verbs. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.</p>
						<ol>
							<li>Shipping & Delivery.</li>
							<li>Privacy & Security.</li>
							<li>Returns & Replacements.</li>
							<li>Payment, Pricing & Promotions.</li>
							<li>Viewing Orders.</li>
						</ol>

						<p>Next are some verb phrase examples of verb phrases where the phrase has a single function which means it can act like an adverb or an adjective. The phrase would include the verb and any modifiers, complements, or objects. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec posuere odio. Proin vel ultrices erat. </p>

						<table>
							<tr>
								<th class="bg">First Column</th><th>Second Column</th><th class="bg">Third Column</th><th>Fourth Column</th>
							</tr>
							<tr>
								<td class="bg">One</td><td>no</td><td class="bg">yes</td><td>yes, all</td>
							</tr>
							<tr>
								<td class="bg">Two</td><td>0</td><td class="bg">1</td><td>all</td>
							</tr>
							<tr>
								<td class="bg">Three</td><td>$399</td><td class="bg">$599</td><td>$799</td>
							</tr>
							<tr>
								<td class="bg">Four</td><td><a href="#">Call action</a></td><td class="bg"><a href="#">Call action</a></td><td><a href="#">Call action</a></td>
							</tr>
						</table>
					<div class="clear"></div>
					</div> --><!-- .tab1 .tab_body -->

					<div class="tab1 tab_body">
						<h4>Customer reviews</h4>
						<ul class="comments">
						

							<li>
								<div class="autor">Mike Example</div>, <time datetime="2012-11-03">03.11.2012</time>

								<div class="evaluation">
									<div class="quality">
										<strong>Quality</strong>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus_minus" href="#"></a>
									</div>
									<div class="price">
										<strong>Price</strong>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a href="#"></a>
									</div>
									<div class="clear"></div>
								</div><!-- .evaluation -->

								<p>ddqdqorta lectus.dqdsdfsd.</p>
							</li>
						</ul><!-- .comments -->

						<form class="add_comments">
							<h4>评论</h4>

							<div class="evaluation">
								<div class="quality">
									<strong>数量</strong><sup class="surely">*</sup>
									<input class="niceRadio" type="radio" name="quality" value="1" /><span class="eva_num">1</span>
									<input class="niceRadio" type="radio" name="quality" value="2" /><span class="eva_num">2</span>
									<input class="niceRadio" type="radio" name="quality" value="3" /><span class="eva_num">3</span>
									<input class="niceRadio" type="radio" name="quality" value="4" /><span class="eva_num">4</span>
									<input class="niceRadio" type="radio" name="quality" value="5" /><span class="eva_num">5</span>
								</div>
								<div class="price">
									<strong>价格</strong><sup class="surely">*</sup>
									<input class="niceRadio" type="radio" name="price" value="1" /><span class="eva_num">1</span>
									<input class="niceRadio" type="radio" name="price" value="2" /><span class="eva_num">2</span>
									<input class="niceRadio" type="radio" name="price" value="3" /><span class="eva_num">3</span>
									<input class="niceRadio" type="radio" name="price" value="4" /><span class="eva_num">4</span>
									<input class="niceRadio" type="radio" name="price" value="5" /><span class="eva_num">5</span>
								</div>
								<div class="clear"></div>
							</div><!-- .evaluation -->

							<div class="nickname">
								<strong>昵称</strong><sup class="surely">*</sup><br/>
								<input type="text" name="" class="" value="" />
							</div><!-- .nickname -->

							<div class="your_review">
								<strong>标题</strong><sup class="surely">*</sup><br/>
								<input type="text" name="" class="" value="" />
							</div><!-- .your_review -->

							<div class="clear"></div>

							<div class="text_review">
								<strong>内容</strong><sup class="surely">*</sup><br/>
								<textarea name="text"></textarea>
								<i>Note: HTML is not translated!</i>
							</div><!-- .text_review -->

							<input type="submit" value="提交评论" />
						</form><!-- .add_comments -->
					<div class="clear"></div>
					</div><!-- .tab2 .tab_body -->

					<div class="tab3 tab_body">
						<h4>购买列表</h4>
					<div class="clear"></div>
					</div><!-- .tab3 .tab_body -->
					<div class="clear"></div>
				</div>​<!-- #wrapper_tab -->
				<div class="clear"></div>
			</div><!-- .grid_9 -->

			<div class="clear"></div>

			<div class="related">
				<div class="c_header">
					<div class="grid_7">
						<h2>相似推荐</h2>
					</div><!-- .grid_7 -->

					<div class="grid_2">
						<a id="next_c1" class="next arows" href="#"><span>Next</span></a>
						<a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
					</div><!-- .grid_2 -->
				</div><!-- .c_header -->

				<div class="list_carousel">

				<ul id="list_product" class="list_product">
					<li class="">
						<div class="grid_3 product">
							<img class="sale" src="images/sale.png" alt="Sale"/>
							<div class="prev">
								<a href="product_page.html"><img src="images/product_1.png" alt="" title="" /></a>
							</div><!-- .prev -->
							<h3 class="title">我我我我</h3>
							<div class="cart">
								<div class="price">
									<div class="vert">
										<div class="price_new">$550.00</div>
										<div class="price_old">$725.00</div>
									</div>
								</div>
								<a href="#" class="obn"></a>
								<a href="#" class="like"></a>
								<a href="#" class="bay"></a>
							</div><!-- .cart -->
						</div><!-- .grid_3 -->
					</li>

					<li class="">
						<div class="grid_3 product">
							<div class="prev">
								<a href="product_page.html"><img src="images/product_2.png" alt="" title="" /></a>
							</div><!-- .prev -->
							<h3 class="title">灌灌灌灌</h3>
							<div class="cart">
								<div class="price">
									<div class="vert">
										<div class="price_new">$550.00</div>
										<div class="price_old">$725.00</div>
									</div>
								</div>
								<a href="#" class="obn"></a>
								<a href="#" class="like"></a>
								<a href="#" class="bay"></a>
							</div><!-- .cart -->
						</div><!-- .grid_3 -->
					</li>

					<li class="">
						<div class="grid_3 product">
							<div class="prev">
								<a href="product_page.html"><img src="images/product_3.png" alt="" title="" /></a>
							</div><!-- .prev -->
							<h3 class="title">Febreze Air Effects New Zealand Springs</h3>
							<div class="cart">
								<div class="price">
									<div class="vert">
										<div class="price_new">$550.00</div>
										<div class="price_old">$725.00</div>
									</div>
								</div>
								<a href="#" class="obn"></a>
								<a href="#" class="like"></a>
								<a href="#" class="bay"></a>
							</div><!-- .cart -->
						</div><!-- .grid_3 -->
					</li>

					<li class="">
						<div class="grid_3 product">
							<div class="prev">
								<a href="product_page.html"><img src="images/product_4.png" alt="" title="" /></a>
							</div><!-- .prev -->
							<h3 class="title">Febreze Air Effects New Zealand Springs</h3>
							<div class="cart">
								<div class="price">
									<div class="vert">
										<div class="price_new">$550.00</div>
										<div class="price_old">$725.00</div>
									</div>
								</div>
								<a href="#" class="obn"></a>
								<a href="#" class="like"></a>
								<a href="#" class="bay"></a>
							</div><!-- .cart -->
						</div><!-- .grid_3 -->
					</li>
			        </ul><!-- #list_product -->
				</div><!-- .list_carousel -->
			</div><!-- .carousel -->
		</div><!-- .product_page -->
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
