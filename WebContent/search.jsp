<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
	<title>搜索页面</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/css/search.css">
	<script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js"/></script>
	<!--导航栏-->
	<script src="${ctx }/js/header.js">	</script>
	<!--二级菜单-->
	<script src="${ctx }/js/nav.js"></script>
	<!--tab导航-->
	<script type="text/javascript" src="${ctx }/js/search.js"></script>
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
<body style="overflow-x: hidden">
	<!--页面信息-->
	<div class="" message="usermessage">
		<!--页面头信息-->
		<div class="" id="header"> 
			<div class="" id="logo">
				<a href="${ctx }/"><img src="${ctx }/images/logo.png"></a>
			</div>
			<div class="menu">
			<ul>
				<li class="current"><a href="${ctx }/">网站首页</a></li>
				<li><a href="${ctx }/category?type=四级">大学英语四级</a></li>
				<li><a href="${ctx }/category?type=六级">大学英语六级</a></li>
				<li><a href="${ctx }/about_us.jsp">关于我们</a></li>
			</ul>
		</div>
		
		
		<div class="login" id="login">
            <a href="${ctx }/login_use.jsp"><button>登录</button></a>&nbsp;|
			<a href="${ctx }/register.jsp"><button>注册</button></a>
        </div>
                    
         <div class="after_login" id="after_login" style="display:none;">
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
		<!--搜索-->
		<div class="search" id="">
			<div class="searchlogo">
				<a href="${ctx }/"><img src="${ctx }/images/logo.png"></a>
			</div>
			<div class="input">
				<input id="searchParam2" type="text" name="searchParam"  class="text"/>
			</div>
			<div class="searchimg">
				<a href="javascrpt:search()" onclick="searchp2();return false;"><img src="${ctx }/images/search.png"></a>
			</div>
		</div>
	</div>
	<!--分类真题模拟-->
	<!--中间信息-->
	<div class="content" id="">
		<div id="tabmenu">
		<!-- TABS -->
			<div>
				<ul id="tabs">
					<li  onclick="tabChange(this,'tabscontent')" class="current"><a href="${ctx }/exam/search?searchParam=${searchParam}&examType=真题">真题</a></li>
					<li onclick="tabChange(this,'tabscontent')" ><a href="${ctx }/exam/search?searchParam=${searchParam}&examType=模拟">模拟</a></li>
				</ul>
			</div>

			<!-- TAB 内容 -->
			<div id="tabscontent">
				<ul class="current">
				   <c:forEach items="${page.list}" var="exam">
                	<li>
						<p>
								${fn:substring(exam.examName, 0, fn:indexOf(exam.examName, searchParam))}
								<span clss="red">${searchParam}</span>
								${fn:substring(exam.examName, (fn:length(searchParam)+fn:indexOf(exam.examName, searchParam)), -1)}<br/>
							<c:forEach items="${exam.parentQuestions}" var="parentQuestion">
								<c:if test="${parentQuestion.parentQuestionName=='Writing'}">
                          	  		<span clss="red">Writing:</span>&nbsp;&nbsp;${parentQuestion.description}
                           		</c:if>
                            </c:forEach>
						</p>
						<a href="${ctx }/examzc/preview.jsp"><div id="but">浏览试卷</div></a>
						<a href="${ctx }/examzc/test.jsp"><div id="but">开始考试</div></a>		
					</li>
             	   </c:forEach>
					
				</ul>
				
			</div>
		</div>
		<!--分页-->
		<div id="pagenumber">
			
			<a href="${ctx }/exam/search?pageNum=${page.prePageNum }&searchParam=${searchParam}&examType=${examType}"><input type="submit" value="上一页"  id="button" /></a>
             <c:forEach begin="1" end="${page.totalPageNum }" var="pageNum"   >	
				<a href="${ctx }/exam/search?pageNum=${pageNum }&searchParam=${searchParam}&examType=${examType}"> <input type="submit" value="${pageNum }" id="button"/></a>
		 	 </c:forEach>             
			<a href="${ctx }/exam/search?pageNum=${page.nextPageNum}&searchParam=${searchParam}&examType=${examType}"><input type="submit" value="下一页"id="button" /></a>
		
		</div>
	</div>
    <!--页尾信息-->
	<div id="footer" class="">
		<p><a href="${ctx }/connect_us.jsp">联系我们</a> | <a href="${ctx }/talent_recruitment.jsp">人才招聘</a> | <a href="${ctx }/Teachers' cooperation.jsp">教师合作</a> | <a href="${ctx }/project_introduction.jsp">项目介绍</a></p>
        <p>版权所有：猿计划项目小组</p>
	</div>
	<script type="text/javascript">
		function searchp(){
			var p=$("#searchParam").val();
			window . location . href = "${ctx }/exam/search?searchParam="+p;
		}
		function searchp2(){
			var p=$("#searchParam2").val();
			window . location . href = "${ctx }/exam/search?searchParam="+p;
		}
	</script>
</body>
</html>