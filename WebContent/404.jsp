<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="${ctx }/css/style_error.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<div class="main">
		<div class="agileits_main_grid">
			<div class="agileits_main_grid_left">
				<h1>404 错误页面</h1>
			</div>
			<div class="agileits_main_grid_right">
				<a href="">请重新操作</a>
			</div>
			<div class="clear"> </div>
		</div>
		<div class="w3l_main_grid">
			<img src="${ctx }/images/404.png" alt=" " class="img-responsive" />
		</div>
		<div class="w3ls_main_grid_bottom">
			<h2 style="color:#fff">对不起，发生了一些错误，请重试！</h2>
			<div class="clear"> </div>
		</div>
	</div>
</body>
</html>