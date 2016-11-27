<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>    
<!DOCTYPE html>
<html>
<head>
	<title>编辑个人信息</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/css/usermessgeEdge.css">
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
				<img src="${ctx }/images/logo.png">
			</div>
			<div class="menu">
				<ul>
					<li class="current"><a href="index.html">网站首页</a></li>
					<li><a href="${ctx }/categroy.jsp">大学英语四级</a></li>
					<li><a href="${ctx }/category.jsp">大学英语六级</a></li>
					<li><a href="${ctx }/arena.jsp">竞技场</a></li>
					<li><a href="${ctx }/about_us.jsp">关于我们</a></li>
				</ul>
			</div>
			<div id="search">
				<input type="text" class="text"/>
				<a href="${ctx }/search.jsp"><img src="${ctx }/images/search.png"></a>
			</div>
			<div id="username">
				<p>${stu.loginName }</p>
			</div>
			<div class="nav">
				<ul>
					<li onmousemove="showsub(this)" onmouseout="hidesub(this)"><a href="#"><img src="${ctx }/images/123.png"></a>
						<ul>
							<li><a href="${ctx }/usermessage.jsp">个人信息</a></li>
                            <li><a href="${ctx }/install.jsp">设置</a></li>
                            <li><a href="${ctx }/index.jsp">退出登录</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!--内容-->
		<div id="content">
			<form action = "${ctx }/loginuser/setinfo" method = "post">
			  	<div class="xingqv"><span>兴趣爱好：</span></div>
			  	<div class="interest">
			  	 	<textarea rows="8" cols="50" name = "hobby"></textarea>
			  	</div>
				<div class="suozaidi"><span>所在地：</span></div>
			  	<div class="address">
			  		<input type="text" value="" name = "location">
			  	</div>
				<div class="people">
					<span>个人介绍：</span>
				</div>
			  	<div class="message">
			  		<textarea rows="10" cols="50" name = "introduce"></textarea >
			  	</div>
			  	<input type="submit" class="button" value="提交" />
			</form>
		</div>
		
		<!--页尾信息-->
		<div id="footer">
			<p><a href="${ctx }/about_us.jsp">联系我们</a> | <a href="${ctx }/about_us.jsp">人才招聘</a> | <a href="${ctx }/about_us.jsp">教师合作</a> | <a href="${ctx }/about_us.jsp">项目介绍</a></p>
			<p>版权所有：猿计划项目小组</p>
		</div>
	</div>

</body>
</html>