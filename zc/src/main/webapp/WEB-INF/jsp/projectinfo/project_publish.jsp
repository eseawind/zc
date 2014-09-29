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

<script>
	$(document).ready(function() {
		 var proStatusSelect=$("#proStatusSelect").val();
		if(proStatusSelect==''||proStatusSelect=='-1'){
			 $("#proShStatus option").filter("[value='-1']").attr("selected", true);//有效！ 
		}else{
			 $("#proShStatus option").filter("[value='"+proStatusSelect+"']").attr("selected", true);//有效！ 
		}
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
				    <li  class="last"><a href="order/order_info.xhtml">我的订单</a></li>
				  <!-- <li class="last"><a href="#">消息中心</a></li> --> 
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
	      <h1 class="page_title">发表的作品</h1>
	      <FORM method=post action="projectinfo/project_publish.xhtml" id="searchForm">
		
		   <table style="border-top: 0px;">
           <tr>
           <td> <input type="text" placeholder="请输入作品名称" class="incInput" name="proName" value="${proName }" size="36" id="proName"></td>
            <td> 
           
             <select  id="proShStatus" name="proShStatus" style="height:33px;">
                        <option value="-1" selected="selected">全部</option>
                                  <option value="0">审核中</option>
                                  <option value="1">取消发布</option>
                                     <option value="2">审核成功</option>
                                     <option value="3">审核失败</option>
                                    <option value="4">众筹中</option>
                                    <option value="5">众筹成功</option>
                                     <option value="6">众筹失败</option>
                                    
                      </select>
                    
                     </td>
                     <td>
                      <input type="hidden" id="proStatusSelect" name="proStatusSelect" value="${proShStatus }">
                        
                        <button type="submit" class="button blue">查询</button></td>
           </tr>
           </table>
		
		
		
	      </FORM>
	      

<table border="0" cellpadding="0" cellspacing="0" class="tableStyle thback"  style="width: 100%">
          <tbody><tr>
            <th>序号</th>
            <th >作品名称</th>
            <th>发布日期</th>
             <th>截止日期</th>
              <th>目标</th>
              <th>天数</th>
            <th>状态</th>
              <th>操作</th>
          </tr>
           <c:forEach items="${proinfos}" var="pro" varStatus="status">
               <tr>
                  <td><c:out value="${status.count}"/></td>
               <td align="left"><a href="projectinfo/project_<c:out value="${pro[0]}"></c:out>.xhtml"> <img src="uploadImg/<c:out value="${pro[6]}"></c:out>" width="100" height="100" style="cursor: pointer;" alt="" title="" /></a>
               
             <span style="vertical-align: top;line-height: 30px;"> <a href="projectinfo/project_<c:out value="${pro[0]}"></c:out>.xhtml">  <c:out value="${pro[1]}"></c:out></a></span>
               </td>
             
              <td><c:out value="${pro[7]}"></c:out></td>
             
              <td><c:out value="${pro[8]}"></c:out></td>
               <td><c:out value="${pro[3]}"></c:out></td>
                <td><c:out value="${pro[9]}"></c:out></td>
              <td>
              
                
                 
              <c:if test="${pro[2]=='0' }">
            
           		   审核中
              </c:if>
                   
                  <c:if test="${pro[2]=='1' }">
            
           		 已取消
              </c:if>
              <c:if test="${pro[2]=='2' }">
            
           		审核成功
              </c:if>
                   
                       </td>
                        <td><a href="projectinfo/project_<c:out value="${pro[0]}"></c:out>.xhtml">详情</a>  
                         <a href="projectinfo/project_cancel${pro[0]}.xhtml" class="blue" onclick="return confirm('确定要取消该作品吗？');">取消</a></td>
                       
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
