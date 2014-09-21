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

.user-fun {
width: 100%;
height: 32px;
}
.user-fun h2 {
font-size: 24px;
line-height: 32px;
color: #000;
float: left;
padding-right: 10px;
}
.user-fun .btn-base {
margin: 6px 0px;
color: #FFF;
}
.btn-red-h20 {
background-position: -223px 0px;
height: 20px;
line-height: 20px;
}
.btn-base {
display: inline-block;
zoom: 1;
padding-left: 5px;
color: #FFF;
}
.common-sprite {
background-image: url('images/icon_sprite.png');
background-repeat: no-repeat;
}
.user-fun .btn-base span {
padding: 0px 8px 0px 2px;
margin-right: 8px;
}
.btn-red-h20 span {
background-position: 100% -263px;
height: 20px;
line-height: 20px;
}
.btn-base span {
display: inline-block;
zoom: 1;
padding-right: 5px;
float: left;
}
.icon-set {
background-position: -45px -75px;
}
.icon-set, .icon-msg, .icon-info {
width: 16px;
height: 16px;
line-height: 0px;
font-size: 0px;
display: inline-block;
vertical-align: middle;
_margin-top: 3px;
}

i, em {
font-style: normal;
}
user agent stylesheeti, cite, em, var, address, dfn {
font-style: italic;
}
.user-info {
padding:20px 110px 110px 0px;
}
p {
display: block;
-webkit-margin-before: 1em;
-webkit-margin-after: 1em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
}




.hide{display:none;}
.dialogc{padding:0px;border:0px;font-size:12px;font-family:"微软雅黑",Arial;color:black;}
.dialogc .layer{margin:0px;padding:0px}
.dialogc .ui-dialog-titlebar{display:none}
.dialogc .ui-widget-content .blue{color:#0CACEB;}

*{margin: 0;padding: 0;}




.layer .close{position:absolute;right:8px;top:8px;width:14px;height:14px;display:block;background:url(images/icon.png) no-repeat 0 -166px;text-indent:-9999px;cursor:pointer;}


.layer .rightDe .number li a{position:relative;display:inline-block;width:63px;height:27px;float:right;}



.layer h5{background:#f5f5f5;height:35px;line-height:35px;color:#0caceb;font-size:14px;text-indent:12px;margin-bottom:20px;}
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
	      <h1 class="page_title" style="border-bottom: 0px;"><span style="padding-left: 20px;">喜欢的作品</span></h1>
	      
	      
	      
	      

 <table border="0" cellpadding="0" cellspacing="0" class="tableStyle thback">
          <tbody><tr>
                <th>序号</th>
            <th>作品名称</th>
            <th>日期</th>
            <th>操作</th>
            
          </tr>
             <c:forEach items="${prolikes}" var="pro" varStatus="status">
               <tr>
             <td><c:out value="${status.count}"/></td>
               <td align="left">
               
               
               <a href="projectinfo/project_<c:out value="${pro.zcProjectInfo.proCode}"></c:out>.html"><img src="uploadImg/<c:out value="${pro.zcProjectInfo.resourceInfo.resourceName}"></c:out>" width="100" height="100" style="cursor: pointer;" alt="" title="" /></a>
            
             <span style="vertical-align: top;"> <a href="projectinfo/project_<c:out value="${pro.zcProjectInfo.proCode}"></c:out>.html"> <c:out value="${pro.zcProjectInfo.proName}"></c:out></a></span>
               </td>
             
              <td><c:out value="${pro.likeTime}"></c:out></td>
             
             
              <td>
                <a href="projectinfo/project_un<c:out value="${pro.likeCode }.xhtml"></c:out>" class="blue" onclick="return confirm('确定要删除吗？');">取消喜欢</a>              </td>
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

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
