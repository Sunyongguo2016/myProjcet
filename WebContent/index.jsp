<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>后台管理中心</title>
<link rel="stylesheet" href="${ctx }/css/pintuer.css">
<link rel="stylesheet" href="${ctx }/css/admin.css">
<script src="${ctx }/js/jquery.js"></script>
<script src="${ctx }/js/pintuer.js"></script>
</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				<img src="${ctx }/images/logo2_2.png" height="45" alt="" />
				&nbsp&nbsp&nbsp后台管理系统
			</h1>
		</div>
		<div class="head-l">
			<a class="buttonone" href=""> 欢迎${student.loginName }登录</a> <a class="button bg-yellow"
				href="${ctx }/loginuser/turnOut"><span class="icon-power-off"></span>
				退出登录</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<h2>
			<span class="icon-user"></span>公告设置
		</h2>
		<ul style="display: block">
			<li><a href="${ctx }/notice/list" target="right"><span
					class="icon-caret-right"></span>公告管理</a></li>
		</ul>
		<h2>
			<span class="icon-user"></span>基本设置
		</h2>
		<ul style="display: block">
			<li><a href="${ctx }/exam/list" target="right"><span
					class="icon-caret-right"></span>试卷管理</a></li>
			<li><a href="${ctx }/writing/list?parentQuestionName=Writing" target="right"><span
					class="icon-caret-right"></span>作文题管理</a></li>
			<li><a href="${ctx }/listening/list?parentQuestionName=ListeningComprehension" target="right"><span
					class="icon-caret-right"></span>听力管理</a></li>
			<li><a href="${ctx }/choosefillinblank/list?parentQuestionName=ChooseFillInBlank" target="right"><span
					class="icon-caret-right"></span>十五选十管理</a></li>
			<li><a href="${ctx }/quickreading/list?parentQuestionName=QuickReading" target="right"><span
					class="icon-caret-right"></span>快速阅读</a></li>
			<li><a href="${ctx }/reading/list?parentQuestionName=LastReading" target="right"><span
					class="icon-caret-right"></span>阅读题管理</a></li>
			<li><a href="${ctx }/translation/list?parentQuestionName=Translation" target="right"><span
					class="icon-caret-right"></span>翻译题管理</a></li>
			

		</ul>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});
	</script>
	<ul class="bread">
		<li><a href="${ctx }/" > 前台首页</a></li>

	</ul>
	<div class="admin">
		<iframe scrolling="auto" rameborder="0" src="${ctx }/notice/list"
			name="right" width="100%" height="100%"></iframe>
	</div>
	<div style="text-align: center;">
		<p>
			来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a>
		</p>
	</div>
</body>
</html>



