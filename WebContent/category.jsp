<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
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
        <title>大学英语${examType }</title>
        <script type="text/javascript">
			var str = '${logined}';
			window.onload = function changStyle(){
				if("on" == str){
					var log = document.getElementById("login");
					log.style.display="none";
					var v = document.getElementById("after_login");
					v.style.display="block";
				}
			}
			
		</script>
    </head>
    <body>
        <!-- header-->
        <div>
            <div class="header">
                <div class="logo"> 
                	<a href="${ctx }/">
                		<img src="${ctx }/images/logo.png"/>
                	</a>
                </div>
               <div class="search">
							<input id="searchParam" type="text" name="searchParam" class="text"/>
    						<a href="javascrpt:search()" onclick="searchp();return false;"><input type="submit" name="" class="button" value="搜索"/></a>
					</div>
				<div class="login" id="login">
                   	<a href="${ctx }/login_use.jsp"><button>登录</button></a>&nbsp;|
					<a href="${ctx }/register.jsp"><button>注册</button></a>
                   </div>
                    
                   <div class="after_login" id="after_login">
                    	<div id="username">
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
                    
				</div>
				<div class="menu">
					<ul>
						<li><a href="${ctx }/">网站首页</a></li>
                      	<c:choose>
                         	 <c:when test="${examType == '四级'}">
								<li class="current"><a href="${ctx }/category?type=四级">大学英语四级</a></li>
								<li><a href="${ctx }/category?type=六级">大学英语六级</a></li>
                         	 </c:when>
                         	 <c:otherwise>
								<li ><a href="${ctx }/category?type=四级">大学英语四级</a></li>
								<li class="current"><a href="${ctx }/category?type=六级">大学英语六级</a></li>
                         	 </c:otherwise>
                     	 </c:choose>
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
               	 <li><a href="${ctx }/notice/billboard?noticeId=${n.noticeId}">
               	 <c:if test="${fn:length(n.noticeTitle) < 20}">
               	 	${n.noticeTitle }
				 </c:if>
               	 <c:if test="${fn:length(n.noticeTitle) > 20}">
					 ${fn:substring(n.noticeTitle,0,20) }...
				 </c:if>
               	 </a></li>
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
                <li><a href="${ctx}/examonline/look?examId=${exam.examId}">${exam.examName }..预览</a></li>
				</c:forEach>
              </ul>
              <p><a href="${ctx }/examonline/list?examType=${examType}">MORE>></a></p>
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
				<li><a href="${ctx }/error/collect?isCollect=0">我的错题本</a></li>
				<li><a href="${ctx }/error/collect?isCollect=1">我的收藏</a></li>
              </ul>
              <p><a href="${ctx }/error/collect">MORE>></a></p>
        </div>
        <!--footer-->
        <div class="footer">
			<center><a href="${ctx }/connect_us.jsp">联系我们</a> | <a href="${ctx }/talent_recruitment.jsp">人才招聘</a> | <a href="${ctx }/Teachers' cooperation.jsp">教师合作</a> | <a href="${ctx }/project_introduction.jsp">项目介绍</a></center>
            <center>版权所有：猿计划项目小组</center>
		</div>
		<script type="text/javascript">
		function searchp(){
			var p=$("#searchParam").val();
			window . location . href = "${ctx }/exam/search?searchParam="+p;
		}
		</script>
    </body>
</html>
