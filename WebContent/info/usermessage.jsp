<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
	<title>个人信息</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/css/usermessage.css">
	<script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js"/></script>
	<script src="${ctx }/js/header.js"></script>
	<!--二级菜单-->
	<script src="${ctx }/js/nav.js"></script>
</head>
<body>
	<div class="" message="usermessage">
		<!--页面头信息-->
		<div class="" id="header"> 
			<div class="" id="logo">
				<a href="${ctx }/index_before.jsp">
					<img src="${ctx }/images/logo.png">
				</a>
			</div>
			<div class="menu">
				<ul>
					<li class="current"><a href="${ctx }/index_before.jsp">网站首页</a></li>
                    <li><a href="${ctx }/category.jsp">大学英语四级</a></li>
                    <li><a href="${ctx }/category.jsp">大学英语六级</a></li>
                    <li><a href="${ctx }/arena.jsp">竞技场</a></li>
                    <li><a href="${ctx }/about_us.jsp">关于我们</a></li>
				</ul>
			</div>
			<div class="" id="search">
				<input type="text" class="text"/>
				<a href="${ctx }/search.jsp"><img src="${ctx }/images/search.png"></a>
			</div>
			<div class="" id="username">
				<p>${student.loginName }</p>
			</div>
			<div class="nav" id="nav">
				<ul>
					<li onmousemove="showsub(this)" onmouseout="hidesub(this)"><a href="#">${student.url }</a>
						<ul>
							<li><a href="${ctx }/info/usermessage.jsp">个人信息</a></li>
                            <li><a href="${ctx }/info/install.jsp">设置</a></li>
                            <li><a href="${ctx }/loginuser/turnOut">退出登录</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!--内容-->
		<div class="" id="content">
			<div class="" id="user">
				<div class="" id="img">
					${student.url }
				</div>
				<div class="" id="name">
					<p>${student.loginName }</p>
				</div>
			</div>
			<div class="" id="message">
				<div class="" id="left">
				<table>
					<tr>
						<td>兴趣爱好：</td>
						<td>${student.hobby }</td>
					</tr>
					<tr>
						<td>所在地：</td>
						<td>${student.location }</td>
					</tr>
					<tr>
						<td>个人介绍：</td>
						<td>${student.introduce }</td>
					</tr>
				</table>
				</div>
				<div class="" id="right">
					<a href="${ctx }/loginuser/setinfo"><input type="button" value="编辑我的资料" class="buttion"></a>
				</div>
			</div>
		</div>
		
		<!--页尾信息-->
		<div id="footer" class="">
			<p><a href="${ctx }/about_us.jsp">联系我们</a> | <a href="about_us.html">人才招聘</a> | <a href="about_us.html">教师合作</a> | <a href="about_us.html">项目介绍</a></p>
			<p>版权所有：猿计划项目小组</p>
		</div>
	</div>

</body>
</html>