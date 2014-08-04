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
					$("#btnAdd").bind('click',function(){
						if(register.checkRegForm()){
							var formJson=$("#addForm").serializeArray();
							$.post("projectinfo/beginAdd.html",formJson,function(data){
								var d=$.eval2(data);
								if(d.success){
									$.alert("发布提示","发布成功",function(){
										url="userinfo/login.html";
										if($.browser.msie) {
											url="login.html";
										}
										window.location=url;
									});
								}else{
									$.alert("发布提示",d.errorMsgs[0]);
								}
							})
						}
					})
					
				},
				checkRegForm:function(){//验证表单
					if(!register.validateInput($("#proName"), "validName", "请输入您的作品名", "请输入10-40位作品名", true, 10, 40, false)){
						
						return false;
					}
					else if(!register.validateInput($("#proTarget"), "validTarget", "请输入您的目标", "目标不能少于100件", true, 100, 120,false)){
						return false;
					}
					else if(!register.validateInput($("#proUnit"), "validUnit", "请输入您的作品价格", "作品格式不正确", true, 100, 120,false)){
						return false;
					}
					
					return true;
				},
				blurInput:function(){
					register.commonBlurInput($("#proName"), "validName", "请输入您的作品名", "请输入10-40位作品名", true, 10, 40, false);
					register.commonBlurInput($("#proTarget"), "validTarget", "请输入您的目标", "目标不能少于100件", true, 100, 120,false);
					register.commonBlurInput($("#proUnit"), "validUnit", "请输入您的作品价格", "作品格式不正确", true, 100, 120,false);
					
					
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
		function main(){
			//注册事件
			register.initButtonRegister();
			register.blurInput();
		}
		
		main();
		
	})
</script>
</head>
<body>

<div class="incContent" style="margin-bottom:50px;">
  <div class="itMyUpBox" style="background-color:#FFF;" id="editord">
  
  
    <div class="picFile itMyPicFile" style="height:490px;">
    
        <div style="margin-left: 30px;">
          
           <FORM class=registerform method=post action="" id="addForm">
<table>
<tr>
<td colspan="3" style="height: 58px;">
 <div style="border-bottom: 1px dashed #e7e7e7;">
                <h2 style="text-align: left;">作品信息</h2>
               
            </div>
</td>
</tr>
<tr> 
	<td  style="width:80px; ">项目名称:</td>
	<td style=" width: 180px;"> <input  style="COLOR: rgb(51,51,51)" maxlength="40"  id=proName class=inputBg1  type=text name=proName value=""  > </td>
	<td style="width:170px; ">&nbsp;<DIV id=validName class=Validform_checktip  > </DIV> </td>
</tr>
<tr>
	<td>目标:</td>
	<td><INPUT style="COLOR: rgb(51,51,51);width: 60%" value="" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"   id=proTarget class=inputBg1  type=text name=proTarget> </td>
	<td>  <DIV id=validTarget class=Validform_checktip></DIV> </td>
</tr>
<tr>
	<td>单价:</td>
	<td><INPUT style="COLOR: rgb(51,51,51);width: 60%" value="" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"   id=proUnit class=inputBg1  type=text name=proUnit> </td>
	<td>  <DIV id=validUnit class=Validform_checktip></DIV> </td>
</tr>
<tr>
	<td>筹集天数:</td>
	<td><INPUT style="COLOR: rgb(51,51,51);width: 60%" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value=""   id=proDays class=inputBg1  type=text name=proDays > </td>
	<td>  <DIV id=validPhone class=Validform_checktip></DIV>  </td>
</tr>
<tr>
	<td>类别:</td>
	<td><select name="proType" id="proType" style="COLOR: rgb(51,51,51);width: 63%"  class=inputBg1  >
									<option value="0">请选择类别</option>
									<option value="1">上衣</option>
													<option value="2">短袖</option>	
														<option value="3">短袖</option>				
																	</select> </td>
	<td>  <DIV id=validPassword class=Validform_checktip></DIV>  </td>
</tr>

<tr>
	<td>面料:</td>
	<td><select name="proFabric" id="proFabric" style="COLOR: rgb(51,51,51);width: 63%"  class=inputBg1  >
									<option value="0">请选择面料</option>
									<option value="1">尼龙</option>
													<option value="2">棉</option>	
														
																	</select> </td>
	<td>  <DIV id=validPassword class=Validform_checktip></DIV>  </td>
</tr>


<tr>
	<td>打样:</td>
	<td><select name="proSample" id="proSample" style="COLOR: rgb(51,51,51);width: 63%"  class=inputBg1  >
									<option value="0">请选择打样</option>
									<option value="1">是</option>
													<option value="2">否</option>	
														
																	</select> </td>
	<td>  <DIV id=validPassword class=Validform_checktip></DIV>  </td>
</tr>
<tr>
	<td>项目地点:</td>
	<td>	<select name="proProvince" id="proProvince"  style="COLOR: rgb(51,51,51);width: 63%"  class=inputBg1 >
									<option >请选择省份</option>
									<option >浙江省</option>
																	
																	</select>
								<select name="proCity" id="proCity"   style="COLOR: rgb(51,51,51);width: 63%"  class=inputBg1 >
									<option >请选择城市</option>
									<option >杭州市</option>
									<option >宁波市</option>
																	</select> </td>
	<td> <DIV id=validpasswordAgain class=Validform_checktip></DIV>   </td>
</tr>


<tr>
	<td>项目简介:</td>
	<td><textarea style="width:100%;height:40px;COLOR: rgb(51,51,51)" class=inputBg1 id="proRemarks"  name="proRemarks"  maxlength="75"></textarea>
						</td>
	<td>  <DIV id=validPhone class=Validform_checktip></DIV>  </td>
</tr>

<tr>
	<td>标签:</td>
	<td><input type="text"  style="COLOR: rgb(51,51,51)" class=inputBg1  id="proTag" name="proTag" value="">
						</td>
	<td>  <DIV id=validPhone class=Validform_checktip></DIV>  </td>
</tr>

<tr>
	<td colspan="3" align="right"><a class="btn btn-primary" id="btnAdd" href="#">发布作品</a></td>
	
</tr>

<tr>
	<td colspan="3" >&nbsp;<br><br></td>
	
</tr>
</table>
 </FORM></div>
    
   
  
    </div>
    
    
    
    
    
    
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
      <div class="bgbox" style="background: url(images/6_front.jpg) no-repeat transparent;"><div style="width: 152px; height: 231px; margin-left: 84px; margin-top: 52px; border: 1px dashed rgb(0, 0, 0); position: absolute;"><img style="border:0px;margin:0px;padding:0px;width:152px;height:152px;" src="images/d.png"></div></div>
      
     


    </div>
  </div>
</div>




<div class="nipic-footer align-center mt40">
    <div class="layout-width layout-width990">
        <a hidefocus="true" title="关于众筹" href="#">关于众筹</a><span class="sepline">|</span><a hidefocus="true" title="网站公约" href="#">网站公约</a><span class="sepline">|</span><a hidefocus="true" title="网站声明" href="#">网站声明</a><span class="sepline">|</span><a hidefocus="true" title="帮助中心" href="#">帮助中心</a><span class="sepline">|</span><a hidefocus="true" title="联系我们" href="http://service.nipic.com/site/contact.html">联系我们</a><span class="sepline">|</span><a hidefocus="true" title="常见问题" href="#">常见问题</a><span class="sepline">
        <p class="gray mt10"><span class="font-tahoma">Copyright © 2014 NiPic.com All Rights Reserved</span>　版权所有·众筹网　增值电信业务经营许可证 ：浙B2-20140130  </p>
        <p class="gray mt10">众筹网是网络服务平台方，若您发现您的权利被侵害，请发起知识产权投诉，<span class="font-tahoma">xhymmc@163.com</span></p>
        <p class="mt10"><img height="52" ondragstart="return false;" src="images/ppaa.gif" /></p>
    </div>
</div>  

<DIV id=RightMenu><A href="projectinfo/project_add.html#top"><IMG 
src="images/right1.png" width=47 height=56></A><A title=产品反馈 
onclick=User.show(this); href="javascript:void(0);" rel=Dialog_Alert 
url="/Feedback/" mode="iframe" showbg="true" showborder="false" 
showtitle="false" height="500" width="750"><IMG 
src="images/right2.png" width=47 height=56></A><A title=在线客服 
href="http://wpa.qq.com/msgrd?v=3&amp;uin=2787064043&amp;site=qq&amp;menu=yes" 
target=_blank><IMG src="images/right3.png" width=47 
height=56></A><A id=code class=ewm href="javascript:void(0);"><SPAN 
style="DISPLAY: none" id=code_img></SPAN><IMG 
src="images/right4.png" width=47 height=56></A></DIV>
<DIV style="DISPLAY: none" class=ui_btn_min></DIV>



</body>
</html>