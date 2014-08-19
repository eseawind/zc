<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var jsCenter={};
	jsCenter={
			cartInfos:function(){
				$.post("projectinfo/getCart.xhtml",{},function(data){
					$( "#jsCenterDivDialog" ).html("").html(data).dialog( "open" );
					jsCenter.initDelete();
				})
			},initDelete:function(){
				$("#jsCenterDivDialog a").each(function(){
					var that=$(this);
					that.bind('click',function(e){
						e.preventDefault();
						var t=$(this);
						var proCode=t.attr("proCode");
						var ttype=t.attr("ttype");
						//发送请求
						$.post("projectinfo/beginDelecart.xhtml",{proCode:proCode,tshirtShort:ttype},function(data){
							var d=$.eval2(data);
							if(d.success){
								proCart.getCartHtml();
							}
						});
					});
				})
			},
			jsButton:function(){
				$("#btnJs").bind('click',function(){
					//下单之前，判断选择收货地址
					$.post("putOrder.xhtml",{},function(data){
						var d=$.eval2(data);
						if(d.success){
							$.alert("订单提示","下单成功!!");
						}
					})
				})
			}
	}
	
	function main(){
		jsCenter.jsButton();
	}
	
	main();
	
})

</script>
</head>
<body>
这里是结算中心页面
<div id="jsCenterDivDialog"></div>
<button id="btnJs">结算</button>


</body>
</html>