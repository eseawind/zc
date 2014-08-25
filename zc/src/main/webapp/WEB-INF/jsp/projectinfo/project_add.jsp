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
					$("#btnAdd").bind('click',function(e){
						e.preventDefault();
						//projectinfo/beginAdd.do
						 //表单验证
						 //提交表单
						// $("#addForm").get(0).submit();
						 $("#addForm").ajaxSubmit({
							 success:function(html){
								 var d=$.eval2(html);
								 if(d.success){
									 $.alert("发布作品","发布成功",function(){
										 if(window.ActiveXObject){
											 window.location="../index.html";
										 }else{
											 window.location="index.html";
										 }
									 });
								 }else{
									 $.alert("发布作品",$.errorMsgs[0]);
								 }
							 }
						 })
					});
					
					//图片上传
					$("#fileuploada").bind('change',function(){
						if(!window.ActiveXObject){
							var files=!!this.files?this.files:[];
							if(!files.length||!window.FileReader)return;
							if(/^image/.test(files[0].type)){
								var reader=new FileReader();
								reader.readAsDataURL(files[0]);
								reader.onloadend=function(){
									//$("#bgbox").css("background-image","url("+this.result+")");
									$("#imgBox").attr("src",this.result);
									//$("#imgDivBox").css("background-image","url("+this.result+")");
								}
							}
						}else{
							var p=getPath($(this)[0]);
							//var obj=$("#imgDivBox")[0];
							//obj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = p;
							$("#imgDivBox").html('<div style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + p + '\')"></div>');
							alert($("#imgDivBox").html());
						}
					});
					
					
					
				} 
		};
		//附带不用修改浏览器安全配置的javascript代码，兼容ie， firefox全系列

		function getPath(obj)  
		{  
		  if(obj)  
		    {  
		    if (window.navigator.userAgent.indexOf("MSIE")>=1)  
		      {  
		        obj.select();  
		 
		      return document.selection.createRange().text;  
		      }  
		    else if(window.navigator.userAgent.indexOf("Firefox")>=1)  
		      {  
		      if(obj.files)  
		        {  
		        return obj.files.item(0).getAsDataURL();  
		        }  
		      return obj.value;  
		      }  
		    return obj.value;  
		    }  
		}  
		function main(){
			//注册事件
			register.initButtonRegister();
			//register.blurInput();
		}
		
		main();
		
	})
</script>
<script>
	$(document).ready(function() {
		$("select").selectBox();
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
  
	
</head>
<body>
  
  <div class="clear"></div>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">发布作品</h1>
		</div><!-- .grid_12 -->
		
		
		<div class="grid_7">
		<img id="loading" src="images/loading.gif" style="display:none;">
		 <FORM class=registed method=post action="projectinfo/beginAdd.xhtml"   name="addForm" id="addForm" 	enctype="multipart/form-data">
		
		
				<h2>作品信息</h2>
							
				
				<div class="email">
					<strong>项目名称:</strong><sup class="surely">*</sup>
					<input type="text" id="proName" name="proName" class="" value="" /><DIV id=validName class=Validform_checktip  > </DIV>
				</div><!-- .email -->
							
				<div class="password">
					<strong>目&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标:</strong><sup class="surely">*</sup>
					<input id=proTarget onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  type=text name=proTarget class="" value="" />
					<DIV id=validTarget class=Validform_checktip></DIV>
				
				</div><!-- .password -->
							
				<div class="password">
					<strong>单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价:</strong><sup class="surely">*</sup>
					<input id=proUnit onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"  type=text name=proUnit class="" value="" />
					 <DIV id=validUnit class=Validform_checktip></DIV>
				
				</div><!-- .password -->
				
				<div class="password">
					<strong>筹集天数:</strong><sup class="surely">*</sup>
					<input id=proDays  type=text name=proDays onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" class="" value="" /> 
					<DIV id=validDays class=Validform_checktip></DIV>
				
				</div>
				
			
			<div class="password">
					<strong>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</strong><sup class="surely">*</sup>
					<select name="proType" id="proType"  class=""  style="width: 120px">
									<option value="0">请选择类别</option>
									<option value="1">短袖</option>
									<option value="2">长袖</option>	
													
					</select>
					
				<DIV id=validType class=Validform_checktip></DIV> 
				</div>
				
					<div class="password">
					<strong>面&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;料:</strong><sup class="surely">*</sup>
					<select name="proFabric" id="proFabric"  class="" style="width: 120px" >
									<option value="0">请选择面料</option>
									<option value="1">尼龙</option>
													<option value="2">棉</option>			
																	</select>
					
				<DIV id=validFabric class=Validform_checktip></DIV> 
				</div>
				
				
				
					<div class="password">
					<strong>打&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;样:</strong><sup class="surely">*</sup>
					<select name="proSample" id="proSample"  class="" style="width: 120px" >
									<option value="0">请选择打样</option>
									<option value="1">是</option>
													<option value="2">否</option>			
																	</select>
					
				<DIV id=validSample class=Validform_checktip></DIV> 
				</div>
				
				
				<div class="email">
					<strong>封面图片:</strong><sup class="surely">*</sup>
					
					<input type="file"  value="上传" id="fileuploada" name="fileupload"/>
					<DIV id=validName class=Validform_checktip  > </DIV>(推荐像素：128*128)
				</div><!-- .email -->
				
				
				<div class="email">
					<strong>项目地点:</strong><sup class="surely">*</sup>
					<select name="proProvince" id="proProvince" class="" style="width: 120px">
									<option >请选择省份</option>
									<option selected="selected" value="浙江省">浙江省</option>
																	
																	</select>
								<select name="proCity" id="proCity"   class="" style="width: 120px" >
									<option >请选择城市</option>
									<option selected="selected" value="杭州市">杭州市</option>
									<option value="宁波市">宁波市</option>
																	</select>
					<DIV id=validPoint class=Validform_checktip  > </DIV>
				</div>
			
			
			<div class="email">
					<strong>项目简介:</strong><sup class="surely">*</sup>
					<textarea style="width:70%;height:40px;" id="proRemarks"  name="proRemarks"  maxlength="75"></textarea>
					<DIV id=validRemarks class=Validform_checktip  > </DIV>
				</div><!-- .email -->
			
				<div class="email">
					<strong>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签:</strong><sup class="surely">*</sup>
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
       
		<div class="grid_5 new_customers" >
			<h2>封面预览</h2>
			 <div class="itMyPicShow">
      <div class="tabBoxR ">
       <span>选择颜色</span>
      <span color="white" class="blocks" style="background:#FFF"></span>
        <span color="black" class="blocks" style="background:#000"></span><span color="gray" class="blocks" style="background:#D0D0D0"></span>
       <!--<p>预览底衫<select class="shirts"><option>短袖T恤</option></select></p>
         <ul class="nav">
          <li side="front" class="current"><a href="#">正面</a></li>
          <li side="back"><a href="#">背面</a></li>
        </ul> -->
      </div>
      <div class="bgbox" style="background: url(images/6_front.jpg) no-repeat transparent;" id="bgbox">
      <div style="width: 128px; height: 128px; margin-left: 95px; margin-top: 90px; border: 1px dashed rgb(0, 0, 0); position: absolute;background-repeat: no-repeat;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);" id="imgDivBox">
       <img style="border:0px;margin:0px;padding:0px;" id="imgBox" src="images/d.png" width="128" height="128"> 
      </div>
      </div>
      
     


    </div>
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
    
 
  </footer>
 
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
<script type="text/javascript" src="js/jquery.form.js"></script>
</body>
</html>
