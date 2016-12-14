<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
<link href="${ctx }/css/about_us2.css" type="text/css" rel="stylesheet" />
<script type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js" /></script>
<script src="${ctx }/js/index.js"></script>
<script src="${ctx }/js/about_us.js"></script>
<script src="${ctx }/js/nav.js"></script>
<script type="text/javascript" src="${ctx }/js/header.js"></script>
<script type="text/javascript">
//搜索
	function searchp(){
		var p=$("#searchParam").val();
		window.location.href = "${ctx }/error/collect?searchParam="+p+"&isCollect=${isCol }";
		 $("[name='pagen']").each(function(key,value){
			$(this).attr("href",$(this).attr("href")+"&searchParam='"+p+"'");
		} );
	}
	</script>
<title>错题本列表</title>
</head>
<body>
	<!-- header-->
	<div>
		<div class="header">
			<div class="logo">
				<a href="${ctx }/"><img src="${ctx }/images/logo.png" /></a>
			</div>
			<div class="search">
				 <input type="text" class="text" id="searchParam" name="searchParam" value="${searchParam }" /> 
				<input type="submit" class="button" value="搜索" onclick="searchp();return false;"/>
			</div>
			<div class="login" style="display:none;">
				<a href="${ctx }/login_use.jsp"><button>登录</button></a>&nbsp;| 
				<a href="${ctx }/register.jsp"><button>注册</button></a>
			</div>
			<div class="after_login" style="display:block;">
				<div id="username">
					<p>${student.loginName }</p>
				</div>
				<div class="nav" id="nav">
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
		</div>
		<div class="menu">
			<ul>
				<li class="current"><a href="${ctx }/">网站首页</a></li>
				<li><a href="${ctx }/category?type=四级">大学英语四级</a></li>
				<li><a href="${ctx }/category?type=六级">大学英语六级</a></li>
				<li><a href="${ctx }/about_us.jsp">关于我们</a></li>
			</ul>
		</div>
	</div>
	<!--面包屑-->
	<div class="breadcrumb">
		<a href="${ctx }/">首页</a>>>错题本列表
	</div>
	<!--左侧边栏-->
	<div class="left">
		<h2>错题本</h2>
		<div class="vtitle">
			<a href="${ctx }/error/collect?isCollect=0">我的错题本</a>
		</div>
		<div class="vcon" style="display: none;"></div>
		<div class="vtitle">
			<a href="${ctx }/error/collect?isCollect=1">我的收藏</a>
		</div>
		<div class="vcon" style="display: none;"></div>

		<div class="leftfoot"></div>
	</div>
	<!--右侧内容-->
	<div class="right">
		<div class="right_bread">
			<h1>我的错题本</h1>
		</div>
		<div class="right_content" style="line-height: 40px;">
			<div class="wenzhang_content">
				<ul>
					<c:forEach items="${page.list }" var="ex">
						<a href="${ctx }/error/wrongpage?examId=${ex.exam.examId}&parentQuestionId=${ex.parentQuestion.parentQuestionId }">
							<li>${ex.exam.examName}${ex.parentQuestion.parentQuestionName }
								<hr style="border: 1px dashed grey;" />
						</li>
						</a>
					</c:forEach>
				</ul>
				<p style="line-height: 1.5em"></p>
			</div>
		</div>
		<div class="page">
			<ul>
				<li><a name="pagen" href="${ctx }/error/collect?pageNum=1&isCollect=${isCol }">首页</a></li>
				<li><a name="pagen" href="${ctx }/error/collect?pageNum=${page.prePageNum }&isCollect=${isCol }">上一页</a></li>

				<c:forEach begin="1" end="${page.totalPageNum }" var="pageNum">
					<li><a name="pagen" href="${ctx }/error/collect?pageNum=${pageNum }&isCollect=${isCol }">${pageNum}</a></li>
				</c:forEach>
				<li><a name="pagen" href="${ctx }/error/collect?pageNum=${page.nextPageNum }&isCollect=${isCol }">下一页</a></li>
				<li><a name="pagen" href="${ctx }/error/collect?pageNum=${page.totalPageNum }&isCollect=${isCol }">尾页</a></li>

			</ul>
		</div>
	</div>
	<!--footer-->
	<div id="footer">
		<p><a href="${ctx }/connect_us.jsp">联系我们</a> | <a href="${ctx }/talent_recruitment.jsp">人才招聘</a> | <a href="${ctx }/Teachers' cooperation.jsp">教师合作</a> | <a href="${ctx }/project_introduction.jsp">项目介绍</a></p>
        <p>版权所有：猿计划项目小组</p>
	</div>
</body>
</html>