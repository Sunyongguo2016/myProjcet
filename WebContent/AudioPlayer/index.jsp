<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="css/audioplayer.css" />
		<script>
			/*
				VIEWPORT BUG FIX
				iOS viewport scaling bug fix, by @mathias, @cheeaun and @jdalton
			*/
			(function(doc){var addEvent='addEventListener',type='gesturestart',qsa='querySelectorAll',scales=[1,1],meta=qsa in doc?doc[qsa]('meta[name=viewport]'):[];function fix(){meta.content='width=device-width,minimum-scale='+scales[0]+',maximum-scale='+scales[1];doc.removeEventListener(type,fix,true);}if((meta=meta[meta.length-1])&&addEvent in doc){fix();scales=[.25,1.6];doc[addEvent](type,fix,true);}}(document));
		</script>
	</head>
	<body>
		<div id="wrapper" style="margin-top:100px;">
			<audio preload="auto" controls>
				<source src="${url }">
			</audio>
			<script src="js/jquery.js"></script>
			<script src="js/audioplayer.js"></script>
			<script>$( function() { $( 'audio' ).audioPlayer(); } );</script>																																																																					`
		</div>
	</body>
</html>