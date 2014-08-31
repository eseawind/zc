/* �������?��ͷ�� www.datouwang.com */
$(function(){
	$(".tag_item").each(function(i, target){
		$(target).mouseenter(function(e){
			//stop current animation.
			$(target).stop();
			$(target).find(".taglist").stop(false, true);
			$(target).parent().addClass("curr");
			$(".tag_item").not($(target)).addClass("not_curr");
			$(target).find(".taglist").animate({
				width: "248px"
			}, "normal");
			$(target).animate({
				width: "192px",
				height: "141px",
				top: "-20px",
				left: "-24px"
			}, "normal");
		});
		$(target).mouseleave(function(e){
			//stop current animation.
			$(target).stop();
			$(target).find(".taglist").stop(false, true);
			$(target).parent().removeClass("curr");
			$(".tag_item").not(target).removeClass("not_curr");
			$(target).find(".taglist").animate({
				width: "46px"
			}, "normal");
			$(target).animate({
				width: "210px",
				height: "210px",
				top: "0",
				left: "0"
			}, "normal");
		});
	})
});