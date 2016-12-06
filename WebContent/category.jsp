<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
        <link href="${ctx }/css/category.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript"></script>
        <script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js"/></script>
        <script src="${ctx }/js/index.js"></script>
        <script src="${ctx }/js/nav.js"></script>
        <script type="text/javascript" src="${ctx }/js/login.js"></script>
        <script type="text/javascript" src="${ctx }/js/header.js"></script>
        <title>大学英语四级</title>
    </head>
    <body>
        <!-- header-->
        <div>
            <div class="header">
                <div class="logo"> <a href="${ctx }/index_before.jsp"><img src="${ctx }/images/logo.png"/></a> </div>
               <div class="search">
						<input type="text" class="text"/>
    					<a href="${ctx }/search.jsp"><input type="submit" class="button" value="搜索"/></a>
					</div>
					<div class="login">
                    	<a href="${ctx }/login_use.jsp"><button>登录</button></a>&nbsp;|
						<a href="${ctx }/register.jsp"><button>注册</button></a>
                    </div>
                    
                    <div class="after_login">
                    	<div id="username">
                            <p>${student.loginName }</p>
                        </div>
                        <div class="nav" id="nav">
                            <ul>
                                <li onmousemove="showsub(this)" onmouseout="hidesub(this)"><a href="#"><img src="${ctx }/images/leftuser.jpg"></a>
                                    <ul>
                                        <li><a href="${ctx }/info/usermessage.jsp">个人信息</a></li>
			                            <li><a href="${ctx }/info/install.jsp">设置</a></li>
                                        <li><a href="${ctx }/index_before.jsp">退出登录</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    
				</div>
				<div class="menu">
					<ul>
						<li><a href="${ctx }/index_before.jsp">网站首页</a></li>
						<li class="current"><a href="${ctx }/category.jsp">大学英语四级</a></li>
						<li><a href="${ctx }/category.jsp">大学英语六级</a></li>
						<li><a href="${ctx }/arena.jsp">竞技场</a></li>
						<li><a href="${ctx }/about_us.jsp">关于我们</a></li>
					</ul>
				</div>
        </div>
        <!-- banner-->
        <img src="${ctx }/images/7.jpg" class="banner"/>
        <!-- 公告板 -->
        <div id="billboard">
		<h2>公告板</h2>
              <hr/>
              <ul>
              	<c:forEach items="${pageNotice.list }" var="n">
               	 <li><a href="${ctx }/billboard/billboard.jsp">${n.noticeTitle}</a></li>
				</c:forEach>
              </ul>
              <p><a href="${ctx }/notice/billboardlist">MORE>></a></p>
         </div>
        <!-- 自测题 -->
        <div id="exam">
        	<h2>自测题</h2>
              <hr/>
              <ul>
              <c:forEach items="${pageExam.list }" var="exam">
                <li><a href="${ctx }/examzc/preview.jsp">${exam.examName }..预览</a></li>
				</c:forEach>
              </ul>
              <p><a href="${ctx }/examzc/examinationlist.jsp">MORE>></a></p>
        </div>	
        <!-- 专项练习 -->
        <div id="sp">
        	<h2>专项练习</h2>
              <hr/>
              <ul>
                <li><a href="${ctx }/examzx/list?parentQuestionName=Writing&examType=${examType}">写作专项练习</a></li>
                <li><a href="${ctx }/examzx/list?parentQuestionName=ChooseFillInBlank&examType=${examType}">十五选十专项练习</a></li>
                <li><a href="${ctx }/examzx/list?parentQuestionName=QuickReading&examType=${examType}">快速阅读专项练习</a></li>
                <li><a href="${ctx }/examzx/list?parentQuestionName=LastReading&examType=${examType}">阅读专项练习</a></li>
                <li><a href="${ctx }/examzx/list?parentQuestionName=Translation&examType=${examType}">翻译专项练习</a></li>
              </ul>
              <p><a href="${ctx }/examzx/list?examType=${examType}">MORE>></a></p>
        </div>	
        <!-- 错题本 -->
        <div id="wrong">
            <h2>错题本</h2>
              <hr/>
              <ul>
                <li><a href="${ctx }/wrongpage/wrongpage.jsp">错题本内容页</a></li>
                <li><a href="${ctx }/wrongpage/wrongpage.jsp">错题本内容页</a></li>
                <li><a href="${ctx }/wrongpage/wrongpage.jsp">错题本内容页</a></li>
                <li><a href="${ctx }/wrongpage/wrongpage.jsp">错题本内容页</a></li>
                <li><a href="${ctx }/wrongpage/wrongpage.jsp">错题本内容页</a></li>
              </ul>
              <p><a href="${ctx }/error/collect">MORE>></a></p>
        </div>
        <!--footer-->
        <div class="footer">
				<center><a href="${ctx }/about_us.jsp">联系我们</a> | <a href="${ctx }/about_us.jsp">人才招聘</a> | <a href="${ctx }/about_us.jsp">教师合作</a> | <a href="${ctx }/about_us.jsp">项目介绍</a></center>
				<center>版权所有：猿计划项目小组</center>
		</div>
    </body>
</html>
