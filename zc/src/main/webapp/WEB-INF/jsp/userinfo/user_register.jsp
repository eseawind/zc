<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<script type="text/javascript">
	$(function(){
		var emailRegex=/^[a-z0-9_\-]+(\.[_a-z0-9\-]+)*@([_a-z0-9\-]+\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$/;
		var phoneRegex=/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/;
		var register={
				initButtonRegister:function(){
					$("#btnRegister").bind('click',function(){
						if(register.checkRegForm()){
							var formJson=$("#regForm").serializeArray();
							$.post("beginRegister.html",formJson,function(data){
								var d=$.eval2(data);
								if(d.success){
									alert("注册成功");
								}else{
									alert("注册失败");
								}
							})
						}
					})
					
				},
				checkRegForm:function(){//验证表单
					var email=$("input[name=email]").val();
					var password=$("input[name=password]").val();
					var agpassword=$("input[name=passwordagin]").val();
					var ncname=$("input[name=userNname]").val();
					var phone=$("input[name=userPhone]").val();
					if(!emailRegex.test(email)){
						alert("邮箱验证不通过");
						return false;
					}
					if(!phoneRegex.test(phone)){
						alert("手机格式不正确");
						return false;
					}
					if(!password){
						alert("密码不能为空");
						return false;
					}
					if(agpassword!=password){
						alert("两次密码输入不一致");
						return false;
					}
					if(!ncname){
						alert("必须输入昵称");
						return false;
					}
					return true;
				}
		}
		function main(){
			//注册事件
			register.initButtonRegister();
		}
		
		main();
		
	})
</script>
</head>
<body>
<form action="" id="regForm">
用户注册：<br>
<div>注册邮箱：<input type="text" name="email"> </div>
<div>手机号码：<input type="text" name="userPhone"> </div>
<div>密码：<input type="password" name="password"> </div>
<div>再次输入密码：<input type="password" name="passwordagin"> </div>
<div>昵称：<input type="text" name="userNname"> </div>
<input type="button" value="注册" id="btnRegister" />
</form>
</body>
</html>