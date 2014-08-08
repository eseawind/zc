<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/index_title.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
 <style type="text/css">

 </style>

<script type="text/javascript">
	$(function(){
		var emailRegex=/^[a-z0-9_\-]+(\.[_a-z0-9\-]+)*@([_a-z0-9\-]+\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$/;
		var phoneRegex=/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/;
		var register={};
		register={
				initButtonRegister:function(){
					//提交
					$("#btnAdd").bind('click',function(){
						//projectinfo/beginAdd.do
						 //表单验证
						 //提交表单
						alert("提交表单")
						 $("#addForm").get(0).submit();
					});
					
					//图片上传
					$("#fileuploada").bind('change',function(){
						var files=!!this.files?this.files:[];
						if(!files.length||!window.FileReader)return;
						if(/^image/.test(files[0].type)){
							var reader=new FileReader();
							reader.readAsDataURL(files[0]);
							reader.onloadend=function(){
								$("#bgbox").css("background-image","url("+this.result+")");
							}
						}
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
</head>
<body>
  
  <div class="clear"></div>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">发布作品</h1>
		</div><!-- .grid_12 -->
		
		
		<div class="grid_6">
		 <FORM class=registed method=post action="projectinfo/beginAdd.do" target="upload_f1_frame" name="addForm" id="addForm" 	enctype="multipart/form-data">
		
		
				<h2>作品信息</h2>
							
				
				<div class="email">
					<strong>项目名称:</strong><sup class="surely">*</sup><br/>
					<input type="text" id="proName" name="proName" class="" value="" /><DIV id=validName class=Validform_checktip  > </DIV>
				</div><!-- .email -->
							
				<div class="password">
					<strong>目标:</strong><sup class="surely">*</sup><br/>
					<input id=proTarget onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  type=text name=proTarget class="" value="" />
					<DIV id=validTarget class=Validform_checktip></DIV>
				
				</div><!-- .password -->
							
				<div class="password">
					<strong>单价:</strong><sup class="surely">*</sup><br/>
					<input id=proUnit onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"  type=text name=proUnit class="" value="" />
					 <DIV id=validUnit class=Validform_checktip></DIV>
				
				</div><!-- .password -->
				
				<div class="password">
					<strong>筹集天数:</strong><sup class="surely">*</sup><br/>
					<input id=proDays  type=text name=proDays onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" class="" value="" /> 
					<DIV id=validDays class=Validform_checktip></DIV>
				
				</div>
				
			
			<div class="password">
					<strong>类别:</strong><sup class="surely">*</sup><br/>
					<select name="proType" id="proType"  class="" >
									<option value="0">请选择类别</option>
									<option value="1">上衣</option>
													<option value="2">短袖</option>	
														<option value="3">短袖</option>				
																	</select>
					
				<DIV id=validType class=Validform_checktip></DIV> 
				</div>
				
					<div class="password">
					<strong>面料:</strong><sup class="surely">*</sup><br/>
					<select name="proFabric" id="proFabric"  class="" >
									<option value="0">请选择面料</option>
									<option value="1">尼龙</option>
													<option value="2">棉</option>			
																	</select>
					
				<DIV id=validFabric class=Validform_checktip></DIV> 
				</div>
				
				
				
					<div class="password">
					<strong>打样:</strong><sup class="surely">*</sup><br/>
					<select name="proSample" id="proSample"  class="" >
									<option value="0">请选择打样</option>
									<option value="1">是</option>
													<option value="2">否</option>			
																	</select>
					
				<DIV id=validSample class=Validform_checktip></DIV> 
				</div>
				
				
				<div class="email">
					<strong>封面图片:</strong><sup class="surely">*</sup><br/>
					
					<input type="file"  value="上传" id="fileuploada" name="fileupload"/>
					<DIV id=validName class=Validform_checktip  > </DIV>
				</div><!-- .email -->
				
				
				<div class="email">
					<strong>项目地点:</strong><sup class="surely">*</sup><br/>
					<select name="proProvince" id="proProvince" class="">
									<option >请选择省份</option>
									<option selected="selected" value="浙江省">浙江省</option>
																	
																	</select>
								<select name="proCity" id="proCity"   class="" >
									<option >请选择城市</option>
									<option selected="selected" value="杭州市">杭州市</option>
									<option value="宁波市">宁波市</option>
																	</select>
					<DIV id=validPoint class=Validform_checktip  > </DIV>
				</div>
			
			
			<div class="email">
					<strong>项目简介:</strong><sup class="surely">*</sup><br/>
					<textarea style="width:90%;height:40px;" id="proRemarks"  name="proRemarks"  maxlength="75"></textarea>
					<DIV id=validRemarks class=Validform_checktip  > </DIV>
				</div><!-- .email -->
			
				<div class="email">
					<strong>标签:</strong><sup class="surely">*</sup><br/>
					<input type="text" id="proTag" name="proTag" class="" value="" /><DIV id=validName class=Validform_checktip  > </DIV>
					<DIV id=validTag class=Validform_checktip  > </DIV>
				</div><!-- .email -->
				
				<div class="submit">										
					<button class="account" id="btnAdd">发布作品</button>
				</div><!-- .submit -->
			</form><!-- .registed -->
                </div>
                
                
                <!-- .grid_6 -->
       </div><!-- #content -->
       
		<div class="grid_6 new_customers">
			<h2>作品信息</h2>
			<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
			<div class="clear"></div>
			<button class="account">Create An Account</button>
                </div><!-- .grid_6 -->
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
