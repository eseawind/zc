(function(){
	var Regexs = {  
            email: (/^[0-9a-z][0-9a-z\-\_\.]+@([0-9a-z][0-9a-z\-]*\.)+[a-z]{2,}$/i),//邮箱  
            phone: (/^0[0-9]{2,3}[2-9][0-9]{6,7}$/),//座机手机号码  
            ydphpne: (/^((13[4-9])|(15[012789])|147|182|187|188)[0-9]{8}$/),//移动手机号码  
            allphpne: (/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/),//所有手机号码  
            ltphpne: (/^((13[0-2])|(15[56])|(186)|(145))[0-9]{8}$/),//联通手机号码  
            dxphpne: (/^((133)|(153)|(180)|(189))[0-9]{8}$/),//电信手机号码  
            url: (/^http:\/\/([0-9a-z][0-9a-z\-]*\.)+[a-z]{2,}(:\d+)?\/[0-9a-z%\-_\/\.]+/i),//网址  
            num: (/[^0-9]/),//数字  
            cnum: (/[^0-9a-zA-Z_.-]/),  
            photo: (/\.jpg$|\.jpeg$|\.gif$/i),//图片格式  
            row: (/\n/ig)  
	};
	
	$.extend({
		eval2 : function(data) {
			if(arguments.length==2){
				var status=arguments[1];
				if(status==300){
					alert("用户未登录")
					return;
				}
			}
			try{
			data=eval("("+data+")");
			}catch(e){ }
			/***if(data){
				if(typeof data.success){
					if(data.success==false){
						var match=/: (?!java)(.*)/;
						var rest=match.exec(data.errorMsgs[0]);
						if(rest!=null){
							//error2(rest[1]);
							alert(rest[1]);
						}else{
							//error2(data.errorMsg[0]);
							alert(data.errorMsgs[0]);
						}
						
					}
				}
			}else{
				alert("服务器内部错误")
			}***/
			return data;
		},
		//依赖于jQueryUI
		alert:function(title,msg,callback){
			if($("#_validateMessageDialog").length==0){//不存在,创建该div
				var div=$("<div title='"+title+"' id='_validateMessageDialog'>"+msg+"</div>");
				$("body").append(div);
				$( "#_validateMessageDialog" ).dialog({
					modal: true,
					show: "blind",
					buttons: {
						"确定": function() {
							$( this ).dialog( "close" );
							if(callback){
								if(typeof callback=="function"){
									callback();
								}
							}
						}
					}
				});
			}else{
				$( "#_validateMessageDialog" ).attr("title",title);
				$( "#_validateMessageDialog" ).html(msg);
				$( "#_validateMessageDialog" ).dialog("open");
			}
		},
		confirm:function(msg,fn1,fn2){
			if($("#_validateMessageDialog").length==0){//不存在,创建该div
				var div=$("<div title='提示信息' id='_validateMessageDialog'>"+msg+"</div>");
				$("body").append(div);
				$( "#_validateMessageDialog" ).dialog({
					modal: true,
					show: "blind",
					buttons: {
						"确定": function() {
							$( this ).dialog( "close" );
							if(fn1){
								if(typeof fn1=="function"){
									fn1();
								}
							}
						},"取消":function(){
							$(this).dialog("close");
							if(fn2){
								if(typeof fn2=="function"){
									fn2();
								}
							}
						}
					}
				});
			}else{
				$( "#_validateMessageDialog" ).html(msg);
				$( "#_validateMessageDialog" ).dialog("open");
			}
		}
	});
	
	$.ajaxSetup({
		error : function(jqXHR, textStatus, errorThrown) {
			if(jqXHR.status==300){
				//alert(errorThrown);
				//_dologin(jqXHR.responseText);
				alert("用户未登录");
			}else{
				$.eval2(jqXHR.responseText,jqXHR.status);
			}
		}
	})
})()