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
				<a href="${ctx }/">
					<img src="${ctx }/images/logo.png">
				</a>
			</div>
			<div class="menu">
				<ul>
					<li class="current"><a href="${ctx }/">网站首页</a></li>
					<li><a href="${ctx }/category?type=四级">大学英语四级</a></li>
					<li><a href="${ctx }/category?type=六级">大学英语六级</a></li>
					<li><a href="${ctx }/about_us.jsp">关于我们</a></li>
				</ul>
			</div>
			
			<div id="username">
				<p>${student.loginName }</p>
			</div>
			<div class="nav">
				<ul>
					<li onmousemove="showsub(this)" onmouseout="hidesub(this)">
						<a href="#">
							<c:if test="${empty student.url}">
	                            <img src="${ctx }/images/photo.jpg"/>
							</c:if>
							<c:if test="${!empty student.url}">
	                            ${student.url}
							</c:if>
						</a>
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
		<div id="content">
			<form action = "${ctx }/loginuser/setinfo" method = "post">
			  	<div class="xingqv"><span>兴趣爱好：</span></div>
			  	<div class="interest">
			  	 	<textarea rows="8" cols="50" name = "hobby" ></textarea>
			  	</div>
				<div class="suozaidi"><span>所在地：</span></div>
			  	<div class="address">
			  		<input type="text" value="" name = "location" >
			  	</div>
				<div class="people">
					<span>个人介绍：</span>
				</div>
			  	<div class="message">
			  		<textarea rows="10" cols="50" name = "introduce" ></textarea >
			  	</div>
			  	<input type="submit" class="button" value="提交" />
			</form>
		</div>
		
		<!--页尾信息-->
		<div id="footer">
			<p><a href="${ctx }/connect_us.jsp">联系我们</a> | <a href="${ctx }/talent_recruitment.jsp">人才招聘</a> | <a href="${ctx }/Teachers' cooperation.jsp">教师合作</a> | <a href="${ctx }/project_introduction.jsp">项目介绍</a></p>
            <p>版权所有：猿计划项目小组</p>
		</div>
	</div>

</body>
</html>