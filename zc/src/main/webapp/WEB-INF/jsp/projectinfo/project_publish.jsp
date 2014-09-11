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

  <title>我发表的作品</title>


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
	      <h1 class="page_title">发表的作品</h1>
	      <FORM method=post action="projectinfo/project_publish.xhtml" id="searchForm">
		
		   <table style="border-top: 0px;">
           <tr>
           <td> <input type="text" placeholder="请输入作品名称" class="incInput" name="proName" value="${proName }" size="36" id="proName"></td>
            <td> 
           
             <select  id="proShStatus" name="proShStatus" style="  height:33px;">
                        <option value="-1" selected="selected">全部</option>
                                  <option value="0">审核中</option>
                                    <option value="1">众筹中</option>
                                    <option value="2">已成功</option>
                                     <option value="3">已失败</option>
                                    
                      </select>
                    
                     </td>
                     <td>
                      <input type="hidden" id="proStatusSelect" name="proStatusSelect" value="${proShStatus }">
                        
                        <button type="submit" class="button blue">查询</button></td>
           </tr>
           </table>
		
		
		
	      </FORM>
	      

 <table border="0" cellpadding="0" cellspacing="0">
          <tbody><tr>
            <th>序号</th>
            <th >作品名称</th>
            <th>发布日期</th>
             <th>截止日期</th>
              <th>目标</th>
              <th>进度</th>
            <th>状态</th>
            
          </tr>
           <c:forEach items="${proinfos}" var="pro" varStatus="status">
               <tr>
                  <td><c:out value="${status.count}"/></td>
               <td align="left"><a href="projectinfo/project_<c:out value="${pro[0]}"></c:out>.html"> <img src="uploadImg/<c:out value="${pro[6]}"></c:out>" width="100" height="100" style="cursor: pointer;" alt="" title="" /></a>
               
             <span style="vertical-align: top;"> <a href="projectinfo/project_<c:out value="${pro[0]}"></c:out>.html">  <c:out value="${pro[1]}"></c:out></a></span>
               </td>
             
              <td><c:out value="${pro[0]}"></c:out></td>
             
              <td><c:out value="${pro[0]}"></c:out></td>
               <td><c:out value="${pro[3]}"></c:out></td>
                <td><c:out value="${pro[0]}"></c:out></td>
              <td>
              
                
                 
              <c:if test="${pro[2]=='0' }">
            
           		   审核中
              </c:if>
                   
                
                       </td>
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
