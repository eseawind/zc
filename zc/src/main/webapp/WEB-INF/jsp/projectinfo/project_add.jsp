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
	
</script>
</head>
<body>
<div class="main clearfix">
	<div class="wrap clearfix">
		
		<!--content static-->
		<div class="content fl">
			
			<!--project start-->
			<div class="project-box">
				<div class="radius-hd">
					<div class="radius-hl common-sprite"></div>
					<div class="radius-hc w705"></div>
					<div class="radius-hr common-sprite"></div>
				</div>
				<div class="radius-bd project-con w713">

					<form wx-validator="" wx-validator-ajax="" action="/project-save" method="post" name="HwForm">

					<div class="tit-wrap">
						<h3>项目信息</h3>
					</div>					
					<div class="project-edit">
						<div class="form-item clearfix">
							<label>项目名称：</label>
							<input name="name" type="text" class="inp-w310" wx-validator-rule="required|maxLength" wx-validator-param="|40" wx-validator-placeholder="名称不可超过40个字" wx-validator-name-maxlength="名称不可超过40个字" value="" maxlength="40">
						</div>
						<div class="form-item clearfix">
							<label>筹资数量：</label>
							<input name="limit_qty" type="text" wx-validator-rule="required|digits|min" wx-validator-param="||500" wx-validator-placeholder="不少于500元" autocomplete="off" value=""><span class="input-notes" style="margin-left:5px">元</span><span id="wx-validator-limit_price-digits" class="error-text hidden">请填写数字</span><span id="wx-validator-limit_price-required" class="error-text hidden">不能为空</span><span id="wx-validator-limit_price-min" class="error-text hidden">不少于500元</span>
						</div>
						<div class="form-item clearfix">
							<label>筹集天数：</label>
							<input name="deal_days" type="text" wx-validator-rule="required|digits|range" wx-validator-param="||10-90" wx-validator-placeholder="10~90天" value=""><span class="input-notes" style="margin-left:5px">天</span><span id="wx-validator-deal_days-required" class="error-text hidden">不能为空</span><span id="wx-validator-deal_days-digits" class="error-text hidden">请填写数字</span><span id="wx-validator-deal_days-range" class="error-text hidden">10~90天</span>
						</div>
						<div class="form-item clearfix">
							<label>类别：</label>
							<div id="Js-select-cate" class="option-sort">
								<select name="category" class="fl" wx-validator-error-value="请选择类别">
									<option>请选择省份</option>
																	
																	</select>
						</div>
						<div class="form-item clearfix">
							<label>项目地点：</label>
							<div class="option-box">
								<select name="province" class="fl" wx-validator-error-value="请选择省份">
									<option>请选择省份</option>
																	
																	</select>
								<select name="city" class="fl" wx-validator-error-value="请选择城市">
									<option>请选择城市</option>
																	</select>
        						<span id="wx-validator-province-error" class="error-text" style="display:none">请选择省份</span>
        						<span id="wx-validator-city-error" class="error-text" style="display:none">请选择城市</span>
							</div>
						</div>
						
						
						<div class="form-item clearfix">
							<label>项目简介：</label>
							<textarea style="width:60%;height:30px" name="brief" wx-validator-rule="required|maxLength" wx-validator-param="|75" wx-validator-placeholder="不超过75个字" maxlength="75"></textarea>
							<span id="wx-validator-brief-maxLength" class="error-text hidden">不能超过75个汉字</span>
						</div>
						
						<div class="form-item clearfix">
							<label>标签：</label>
							<input type="text" id="Js-tag" name="tags" class="inp-w310" wx-validator-placeholder="请使用空格或逗号分隔不同标签" value="">
						</div>

						<input type="hidden" name="image" value="">
						<input type="hidden" name="savenext" value="1">
						<input type="hidden" name="id" value="">
						
						<div class="action tr">
							<a type="submit" href="javascript:void(0);" wx-validator-submit-error="您填写的部分内容不符合规范" id="savenext" class="btn-base btn-red-h48 common-sprite">
								<span class="common-sprite">下一步</span>
							</a>
						</div>
					</div>
					</form>
				</div>
				<div class="radius-ft">
					<div class="radius-fl common-sprite"></div>
					<div class="radius-fc w705"></div>
					<div class="radius-fr common-sprite"></div>
				</div>
			</div>
			
			<!--project end-->
			
		</div>
		<!--content end-->
		
	</div>
</div>
</body>
</html>