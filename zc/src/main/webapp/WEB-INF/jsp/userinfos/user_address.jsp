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
<script type="text/javascript">
	$(function(){
		var register={};
		register={
				initButtonRegister:function(){
					$("#btnAdd").bind('click',function(e){
						//阻止默认事件发生,会出现 刷新页面的请求
						e.preventDefault();
						//表单验证。。
						var formJson=$("#addForm").serializeArray();
						$.post("userinfos/beginAdd.html",formJson,function(data){
							var d=$.eval2(data);
							if(d.success){
								$.alert("添加提示","添加成功");
							}else{
								$.alert("添加提示",d.errorMsgs[0]);
							}
						});
					});
					
				} 
		};
		function main(){
			//注册事件
			register.initButtonRegister();
			//register.blurInput();
		}
		
		main();
		
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
				    <li><a href="order/order_info.xhtml">我的订单</a></li>
				   <li class="last"><a href="#">消息中心</a></li>
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
	      <h1 class="page_title" style="border-bottom: 0px;"><span style="padding-left:20px;">收货地址</span><span style="padding-left:520px;"><a href="userinfos/address_add.xhtml" style="font-size: 12px;cursor: pointer;">添加常用收货人</a></span></h1>
	      
	      
	      
	    
 <table border="0" cellpadding="0" cellspacing="0" class="tableStyle thback">
          <tbody><tr >
            <th>序号</th>
            <th>姓名</th>
            <th>联系电话</th>
            <th>详细地址</th>
            <th>邮编</th>
            <th>E-mail</th>
            <th>操作</th>
          </tr>
             <c:forEach items="${userInfos}" var="user" varStatus="status">
               <tr>
              <td><c:out value="${status.count}"/></td>
              <td><c:out value="${user.userName}"></c:out></td>
              <td><c:out value="${user.userMobilephone}"></c:out></td>
              <td>
         <c:out value="${user.userProvince}"></c:out><c:out value="${user.userCity}"></c:out><c:out value="${user.userArea}"></c:out><c:out value="${user.userAddress}"></c:out>            </td>
              <td>   <c:out value="${user.userZip}"></c:out>   </td>
              <td><c:out value="${user.userEmail}"></c:out> </td>
              <td>
                <a href="userinfos/address_<c:out value="${user.userCode }.xhtml"></c:out>" class="blue" onclick="return confirm('确定要删除吗？');">删除</a>              </td>
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
