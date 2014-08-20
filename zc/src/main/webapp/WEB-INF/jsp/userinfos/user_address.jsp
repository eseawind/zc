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
       <div id="sidebar" class="grid_3">
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
				   <li><a href="projectinfo/project_like.xhtml">我喜欢的作品<span>(21)</span></a></li>
				 <!--  <li><a href="#">我关注的作品<span> (27)</span></a></li> --> 
				   <li><a href="projectinfo/project_publish.xhtml">我发表的作品<span>(33)</span></a></li>
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside>

	     


	
	   
       </div><!-- .sidebar -->

       <div id="content" class="grid_9">
	      <h1 class="page_title">收货地址</h1>
	      
	      
	      
	        <div class="rightcontent">
      <div class="incPadBox">
        <dl class="findBox clearfix">
          <dt><a class="buthui new" href="#" >添加常用收货人</a></dt>
        </dl>
        

 
<div style="display: none; z-index: 1002; outline: 0px; height: auto; width: 803px; top: 0px; left: 273px;">
<div ><span >&nbsp;</span><a href="#"  role="button"><span>close</span></a>
</div><div id="addressd" scrolltop="0" scrollleft="0" style="display: block; width: auto; min-height: 150px; height: auto;">
  <span></span>
  <h5 align="center"><strong>使用新收货地址</strong></h5>
   <FORM class=added method=post action="" id="addForm">
		
  				<div  style="line-height: 50px;">
					<strong>收货人姓名:</strong><sup class="surely">*</sup>
					&nbsp;<input id=userName style="COLOR: rgb(51,51,51)" class=inputBg1   type=text name=userName class="" value="" />
					<DIV id=validName class=Validform_checktip></DIV>
				
				</div>
				
				
				<div  style="line-height:50px;">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地区:</strong><sup class="surely">*</sup>
					&nbsp;<select name="userProvince" id="userProvince" style="width: 150px;" class="">
									<option >请选择省份</option>
									<option selected="selected" value="浙江省">浙江省</option>
																	
																	</select>
								<select name="userCity" id="userCity"  style="width: 150px;"  class="" >
									<option >请选择城市</option>
									<option selected="selected" value="杭州市">杭州市</option>
									<option value="宁波市">宁波市</option>
																	</select>
																	
																	<select name="userArea" id="userArea"  style="width: 150px;"  class="" >
									<option >请选择城市区域</option>
									<option selected="selected" value="海曙区">海曙区</option>
									<option value="上城区">上城区</option>
																	</select>
					<DIV id=validPoint class=Validform_checktip  > </DIV>
				
				</div>
				
				
				<div style="line-height: 50px;">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;详细地址:</strong><sup class="surely">*</sup>
					&nbsp;<input id=userAddress   type=text name=userAddress class="" value="" />
					<DIV id=validAddress class=Validform_checktip></DIV>
				
				</div>
				
				<div  style="line-height: 50px;">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮编:</strong><sup class="surely">*</sup>
					&nbsp;<input id=userZip maxlength="6"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  type=text name=userZip class="" value="" />
					<DIV id=validZip class=Validform_checktip></DIV>
				
				</div>
				
				
				<div style="line-height: 50px;">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;手机号码:</strong><sup class="surely">*</sup>
					&nbsp;<input id=userMobilephone onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"   type=text name=userMobilephone class="" value="" />
					<DIV id=validMobilephone class=Validform_checktip></DIV>
				
				</div>
				
				<div style="line-height: 50px;">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;固定电话:</strong><sup class="surely">*</sup>
					&nbsp;<input id=userTelephone   type=text name=userTelephone class="" value="" />
					<DIV id=validTelephone class=Validform_checktip></DIV>
				
				</div>
				
				
				
				
				<div  style="line-height: 50px;">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱:</strong><sup class="surely">*</sup>
					&nbsp;<input id=userEmail   type=text name=userEmail class="" value="" />
					<DIV id=validEmail class=Validform_checktip></DIV>
				
				</div>
				
				<div class="submit">										
					<SPAN style="CURSOR: pointer ;margin-left:10px;" 
  id=reg>
  <a href="javascript:void(0)" id=btnAdd class="bay">保存</a>
  
  </SPAN>
				</div>
				</FORM>
</div></div>
</div></div>
	      

 <table border="0" cellpadding="0" cellspacing="0" class="tableStyle thback">
          <tbody><tr>
            <th>序号</th>
            <th>姓名</th>
            <th>联系电话</th>
            <th>详细地址</th>
            <th>邮编</th>
            <th>E-mail</th>
            <th>操作</th>
          </tr>
             <c:forEach items="${userInfos}" var="user">
               <tr>
              <td><c:out value="${user.userCode }"></c:out></td>
              <td><c:out value="${user.userName}"></c:out></td>
              <td><c:out value="${user.userMobilephone}"></c:out></td>
              <td>
          <c:out value="${user.userAddress}"></c:out>            </td>
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
