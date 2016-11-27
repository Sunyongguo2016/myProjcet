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