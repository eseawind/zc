<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/index_title.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>用户登录</title>
<!-- 图片预览 -->
<script type="text/javascript" src="js/imgPreview/CJL.0.1.min.js"></script>
<script type="text/javascript" src="js/imgPreview/QuickUpload.js"></script>
<script type="text/javascript" src="js/imgPreview/ImagePreviewd.js"></script>
 <style type="text/css">
.option-box select {
/* width: 100px; */
/* height: 26px; */
/* line-height: 26px; */
/* border: 1px solid #9c9c9c; */
/* border-radius: 3px; */
/* color: #555; */
/* margin-right: 5px; */
}
.fl {
float: left;
}
 </style>

<script type="text/javascript">
	$(function(){
		var targetRegex=/^([1-4][0-9][0-9]|500)$/;
		var daysRegex=/^(([1-9])|(1\d)|(2\d)|(3[0]))$/;
		var register={};
		register={
				initButtonRegister:function(){
					//提交
					$("#btnAdd").bind('click',function(e){
						e.preventDefault();
						if(register.checkRegForm()){
						
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
									
									 $.alert("发布作品",d.errorMsgs[0]);
								 }
							 }
						 })
						}
					});
					var ip = new ImagePreview( $$("fileuploada"), $$("imgBox"), {
						maxWidth: 128, maxHeight: 128
					});
					ip.img.src = ImagePreview.TRANSPARENT;
					//ip.file.onchange = function(){ ip.preview(); };
					
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
						}else{ //ie
							ip.preview();
							/**var p=getPath($(this)[0]);
							//var obj=$("#imgDivBox")[0];
							//obj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = p;
							$("#imgDivBox").html('<div style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + p + '\')"></div>');
							alert($("#imgDivBox").html());**/
						}
					});
					
					
					
				} ,
				checkRegForm:function(){//验证表单
					if(!register.validateInput($("#proName"), "validName", "请输入您的作品名称", "请输入6-20位作品名称", true, 6, 20, false)){
						
						return false;
					}else if(!register.validateInput($("#proTarget"), "validTarget", "请输入您的目标", "请输入100~500以内", false, 0, 0, targetRegex)){
						
						return false;
					}else if(!register.validateInput($("#proDays"), "validDays", "请输入您的筹集天数", "请输入10~30天以内", false, 0, 0, daysRegex)){
							return false;
					}else if($("#proUnit").val()==''){
						$("#validUnit").addClass("Validform_wrong").html("请输入单价");
						$("#validUnit").show();
						$("#proUnit").addClass("Validform_error");
						return false;
					}else if($("#proType").val()==0){
						$("#validType").addClass("Validform_wrong").html("请选择类别");
						$("#validType").show();
						$("#proType").addClass("Validform_error");
						return false;
					}else if($("#proFabric").val()==0){
						$("#validFabric").addClass("Validform_wrong").html("请选择面料");
						$("#validFabric").show();
						$("#proFabric").addClass("Validform_error");
						return false;
					}else if($("#proSample").val()==0){
						$("#validSample").addClass("Validform_wrong").html("请选择打样");
						$("#validSample").show();
						$("#proSample").addClass("Validform_error");
						return false;
					}else if($("#proCity").val()==0||$('#proProvince').val()==0){
						$("#validPoint").addClass("Validform_wrong").html("请选择项目地点");
						$("#validPoint").show();
						if($("#proCity").val()==0){
							$("#proCity").addClass("Validform_error");
						}
						
						if($("#proProvince").val()==0){
							$("#proProvince").addClass("Validform_error");
						}
						return false;
					}else if($("#proRemarks").val()==''){
						$("#validRemarks").addClass("Validform_wrong").html("请输入作品简介");
						$("#validRemarks").show();
						$("#validRemarks").addClass("Validform_error");
						return false;
					}
					return true;
				},
				blurInput:function(){
					register.commonBlurInput($("#proName"), "validName", "请输入您的作品名称", "请输入6-20位作品名称", true, 6, 20, false);
					register.commonBlurInput($("#proTarget"), "validTarget", "请输入您的目标", "请输入100~500以内", false, 0, 0, targetRegex);
					register.commonBlurInput($("#proDays"), "validDays", "请输入您的筹集天数", "请输入10~30天以内", false, 0, 0, daysRegex);
					
					
					$("#proType").click(function(){
						var that=$(this);
						if(that.val()==0){
							$("#validType").addClass("Validform_wrong").html("请选择类别");
							$("#validType").show();
							that.addClass("Validform_error");
						}else{
							$("#validType").hide();
							that.removeClass("Validform_error");
						}
						
					});
					
					$("#proFabric").blur(function(){
						var that=$(this);
						if(that.val()==0){
							$("#validFabric").addClass("Validform_wrong").html("请选择面料");
							$("#validFabric").show();
							that.addClass("Validform_error");
						}else{
							$("#validFabric").hide();
							that.removeClass("Validform_error");
						}
						
					});
					
					$("#proSample").blur(function(){
						var that=$(this);
						if(that.val()==0){
							$("#validSample").addClass("Validform_wrong").html("请选择打样");
							$("#validSample").show();
							that.addClass("Validform_error");
						}else{
							$("#validSample").hide();
							that.removeClass("Validform_error");
						}
						
					});
					
					
					
					
					$("#proProvince").blur(function(){
						var that=$(this);
						var city=$('#proCity');
						
						if(that.val()=='0'||city.val()=='0'){
							$("#validPoint").addClass("Validform_wrong").html("请选择项目地点");
							$("#validPoint").show();
							that.addClass("Validform_error");
						}else{
							$("#validPoint").hide();
							that.removeClass("Validform_error");
						}
						
					});
					
					$("#proCity").blur(function(){
						var that=$(this);
						var province=$('#proProvince');
						if(that.val()=='0'||province.val()=='0'){
							$("#validPoint").addClass("Validform_wrong").html("请选择项目地点");
							$("#validPoint").show();
							that.addClass("Validform_error");
						}else{
							$("#validPoint").hide();
							that.removeClass("Validform_error");
						}
						
						if(province.val()!='0'){
							province.removeClass("Validform_error");
						}
						
						
					});
					
				
					$("#proUnit").blur(function(){
						var that=$(this);
						if(that.val()==''){
							$("#validUnit").addClass("Validform_wrong").html("请输入单价");
							$("#validUnit").show();
							that.addClass("Validform_error");
						}else{
							$("#validUnit").hide();
							that.removeClass("Validform_error");
						}
						
					});

					$("#proRemarks").blur(function(){
						var that=$(this);
						if(that.val()==''){
							$("#validRemarks").addClass("Validform_wrong").html("请输入作品简介");
							$("#validRemarks").show();
							that.addClass("Validform_error");
						}else{
							$("#validRemarks").hide();
							that.removeClass("Validform_error");
						}
						
					});
					
					
				},
				/**
				* obj:注册blur事件对象
				* validateId:验证信息id
				* errmsg1：错误信息1
				* errmsg2：错误信息2
 				**/
				commonBlurInput:function(obj,validateId,nullerrMsg,errMsg2,isvalidateLen,minlen,maxlen,regex){
					var t=$(obj);
					t.blur(function(){
						var that=$(this);
						if(!that.val()){
							$("#"+validateId+"").addClass("Validform_wrong").html(nullerrMsg);
							$("#"+validateId+"").show();
							that.addClass("Validform_error");
						}else{
							if(isvalidateLen){//验证长度
								var len=that.val().length;
								if(len<minlen||len>maxlen){
									$("#"+validateId+"").addClass("Validform_wrong").html(errMsg2);
									$("#"+validateId+"").show();
									that.addClass("Validform_error");
								}else{
									$("#"+validateId+"").hide();
									that.removeClass("Validform_error");
								}
							}else{
								if(regex){
									if(!regex.test(that.val())){
										$("#"+validateId+"").addClass("Validform_wrong").html(errMsg2);
										$("#"+validateId+"").show();
										that.addClass("Validform_error");
									}else{
										$("#"+validateId+"").hide();
										that.removeClass("Validform_error");
									}
								}else{
									$("#"+validateId+"").hide();
									that.removeClass("Validform_error");
								}
							}
						}
					})
				},validateInput:function(obj,validateId,nullerrMsg,errMsg2,isvalidateLen,minlen,maxlen,regex){
					var that=$(obj);
					if(!that.val()){
						$("#"+validateId+"").addClass("Validform_wrong").html(nullerrMsg);
						$("#"+validateId+"").show();
						that.addClass("Validform_error");
						return false;
					}else{
						if(isvalidateLen){//验证长度
							var len=that.val().length;
							if(len<minlen||len>maxlen){
								$("#"+validateId+"").addClass("Validform_wrong").html(errMsg2);
								$("#"+validateId+"").show();
								that.addClass("Validform_error");
								return false;
							}else{
								$("#"+validateId+"").hide();
								that.removeClass("Validform_error");
								return true;
							}
						}else{
							if(regex){
								if(!regex.test(that.val())){
									$("#"+validateId+"").addClass("Validform_wrong").html(errMsg2);
									$("#"+validateId+"").show();
									that.addClass("Validform_error");
									return false;
								}else{
									$("#"+validateId+"").hide();
									that.removeClass("Validform_error");
									return true;
								}
							}else{
								$("#"+validateId+"").hide();
								that.removeClass("Validform_error");
								return true;
							}
						}
					}
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
			register.blurInput();
		}
		
		main();
		
	})
</script>
<script>
	$(document).ready(function() {
		
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
		
		
		<div class="grid_7" >
		<img id="loading" src="images/loading.gif" style="display:none;">
		 <FORM class=registed method=post action="projectinfo/beginAdd.xhtml"   name="addForm" id="addForm" 	enctype="multipart/form-data">
		
		
				<h2>作品信息</h2>
							
				
				<div class="email">
					<strong>项目名称:</strong><sup class="surely">*</sup>
					<input type="text" id="proName" name="proName" class="" value=""  placeholder="请输入6-20位作品名称"   /><span id=validName class=Validform_checktip  > </span>
				</div><!-- .email -->
							
				<div class="password">
					<strong>目&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标:</strong><sup class="surely">*</sup>
					<input id=proTarget placeholder="请输入100~500以内"  onkeydown="onlyNum();"  style="ime-mode:Disabled"  type=text name=proTarget class="" value="" />
					<span id=validTarget class=Validform_checktip></span>
				
				</div><!-- .password -->
							
				<div class="password">
					<strong>单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价:</strong><sup class="surely">*</sup>
					<input id=proUnit placeholder="请参考建议价格" onkeyup="validatePices(this);" onblur="validatePices(this);" style="ime-mode:Disabled"  type=text name=proUnit class="" value="" />
					 <span id=validUnit class=Validform_checktip> </span>
				
				</div><!-- .password -->
				
				<div class="password">
					<strong>筹集天数:</strong><sup class="surely">*</sup>
					<input id=proDays     placeholder="请输入10~30以内" type=text name=proDays onkeydown="onlyNum();"  style="ime-mode:Disabled" class="" value="" /> 
					 <span id=validDays class=Validform_checktip></span>
				
				</div>
				
			
			<div class="password" style="line-height: 40px;">
					<strong>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</strong><sup class="surely">*</sup>
					<select name="proType" id="proType"  class=""  style="width: 120px">
									<option value="0">请选择类别</option>
									<option value="1">短袖</option>
									<option value="2">长袖</option>	
													
					</select>
					
				 <span id=validType class=Validform_checktip></span> 
				</div>
				
					<div class="password"  style="line-height: 40px;">
					<strong>面&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;料:</strong><sup class="surely">*</sup>
					<select name="proFabric" id="proFabric"  class="" style="width: 120px" >
									<option value="0">请选择面料</option>
									<option value="1">尼龙</option>
													<option value="2">棉</option>			
																	</select>
					
				 <span id=validFabric class=Validform_checktip></span> 
				</div>
				
				
				
					<div class="password"  style="line-height: 40px;">
					<strong>打&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;样:</strong><sup class="surely">*</sup>
					<select name="proSample" id="proSample"  class="" style="width: 120px" >
									<option value="0">请选择打样</option>
									<option value="1">是</option>
													<option value="2">否</option>			
																	</select>
					
				 <span id=validSample class=Validform_checktip></span> 
				</div>
				
				
				<div class="email">
					<strong>封面图片:</strong><sup class="surely">*</sup>
					
					<input type="file"  value="上传" id="fileuploada" name="fileupload"/>
					<span id=validName class=Validform_checktip  > </span>(推荐像素：128*128)
				</div><!-- .email -->
				
				
				<div class="email"  style="line-height: 40px;">
					<strong>项目地点:</strong><sup class="surely">*</sup>
					<select name="proProvince" id="proProvince" class="" style="width: 120px">
									<option  value="0">请选择省份</option>
									<option  value="浙江省">浙江省</option>
																	
																	</select>
								<select name="proCity" id="proCity"   class="" style="width: 120px" >
									<option value="0">请选择城市</option>
									<option  value="杭州市">杭州市</option>
									<option value="宁波市">宁波市</option>
																	</select>
					 <span id=validPoint class=Validform_checktip  > </span>
				</div>
			
			
			<div class="email" >
					<strong>项目简介:</strong><sup class="surely">*</sup>
					<textarea style="width:50%;height:60px;" id="proRemarks"  name="proRemarks"  maxlength="800"></textarea>
					<span id=validRemarks class=Validform_checktip  > </span>
				</div><!-- .email -->
			
				<div class="email" style="height: 60px;" >
					<strong>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签:</strong>&nbsp;&nbsp;&nbsp;<!-- <sup class="surely">*</sup> -->
					<input type="text" id="proTag" name="proTag" class="" value="" /><DIV id=validName class=Validform_checktip  > </DIV>
					<DIV id=validTag class=Validform_checktip  > </DIV>
				</div><!-- .email -->
				
				<div class="submit">	
				  <button type="button" id="btnAdd" class="button blue">发布作品</button>
													
					<!--<button class="account" id="btnAdd">发布作品</button>-->
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
      
      <div class="tabBoxR ">
       <span>友情提示</span>
          <br>
      </div>
        1.ssss的范德萨发是的范德萨范德萨发送到<br>
         2.zxjkhzvdsjfhsdkf的粉红色的<br>
          3.的时间发动机是粉红色的和福克斯的合肥市接口的<br>
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
