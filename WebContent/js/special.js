$(function(){
	//菜单隐藏展开
	var tabs_i=0
		
	$('.vtitle a').click(function(){
		var _self = $(this);
		var j = $('.vtitle').index(_self);
		if( tabs_i == j ) return false; tabs_i = j;
		$('.vtitle em').each(function(e){
			if(e==tabs_i){
				$('em',_self).removeClass('v01').addClass('v02');
				$('.vtitle').removeClass('arrow');				
			}else{
				$(this).parent().removeClass('v02').addClass('v01');							
			}
		});
		$('.vcon').slideUp().eq(tabs_i).slideDown();
	});
})
$(function () {
        //初始化div，并注册事件
        var initDiv = function () {
            $(".vtitle").css("background", "");
            $(".vtitle").css("border-right","1px solid #ccb6a9");
			$(".vtitle").css("border-bottom","none");
			$('#haha').css('border-bottom','1px solid #ccb6a9');
			
        };
        initDiv();
        $(".vtitle a")
            .click(function () {
                initDiv();
                //当前被点击的div改变背景色
                $(this).parent("div .vtitle").css("background","#FFFFFF");
				$(this).parent("div .vtitle").css("border-right","none");
				$(this).parent("div .vtitle").css("border-bottom","none");				
				$('#haha').css('border-bottom','1px solid #ccb6a9');
                //取消当前div的mouseout和mouseover事件
                $(this).unbind("mouseout");
                 $(this).unbind("mouseover");
            });
		
    })