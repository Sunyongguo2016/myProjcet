$(function() {
	var $t, leftX, newWidth;

	$('.menu ul').append('<div class="block"></div>');
	var $block = $('.block');

	$block.width($(".current").width()).css('left', $('.current a').position().left).data('rightLeft', $block.position().left).data('rightWidth', $block.width());

	$('.menu ul li').find('a').hover(function() {
		$t = $(this);
		leftX = $t.position().left;
		newWidth = $t.parent().width();

		$block.stop().animate({
			left: leftX,
			width: newWidth
		},300);
	}, function() {
		$block.stop().animate({
			left: $block.data('rightLeft'),
			width: $block.data('rightWidth')
		},300)
	})
})

$(function(){

    $(".b").scrollable({
		size:1,
		items:".b ul",
		loop:true,
		next:".lef",
		prev:".rig",
		clickable:false,
		circular:true
	});  
	  
    $(".b3").scrollable({
		size:1,
		items:".b3 ul",
		loop:true,
		next:".lef",
		prev:".rig",
		vertical:true,
		clickable:false,
		circular:true
	});  
	  
})