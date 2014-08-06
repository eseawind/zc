<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/include.jsp" %>
<meta name="Keywords" content="众筹">
<meta name="Description" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>众筹T恤平台ss</title>
 <link href="css/main.css" rel="StyleSheet" />

<script type="text/javascript">
	$(function(){
		var imageRegex=/(\.*jpg$)|(\.*png$)|(\.*jpeg$)|(\.*.gif$)|(\.*.bmp)/;
		$("input[type=file]").change(function(){
			var files=!!this.files?this.files:[];
			if(!files.length||!window.FileReader)return;
			if(/^image/.test(files[0].type)){
				var reader=new FileReader();
				reader.readAsDataURL(files[0]);
				reader.onloadend=function(){
					$("#pre").css("background-image","url("+this.result+")");
				}
			}
			
			/* var that=$(this);
			var img=that[0];
			//判断ie
			if(document.all){
				img.select();
				path=document.selection.createRange().text;
				
				
			}else{
				path=URL.createObjectURL(img.files[0]);
				console.log(path)
				$("#img").attr("src",path);
			} */
		})
	})
	
</script>
</head>
<body>
<form action="upload.html" enctype="multipart/form-data" method="post">
 <table>
 <tr>
 <td>
 <div style="border: 1px solid black;width: 400px;height: 400px;">
 图片：<input type="file" name="files"/>
 </div>
 </td>
 <td>
 <div style="border: 1px solid red;width: 400px;height: 400px;background-position: center center;-webkit-box-shadow:0 0 1px 1px rgba(0,0,0,3);background-size:cover; " id="pre">
 </div>
 </td>
 </tr>
 </table>
 <input type="submit" value="提交">
 </form>
</body>
</html>