<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
<link href="${ctx }/css/examinationlist.css" type="text/css" rel="stylesheet" />
<script type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js"/></script>
<script src="${ctx }/js/index.js"></script>
<script src="${ctx }/js/examinationlist.js"></script>    
<script src="${ctx }/js/nav.js"></script>
<script type="text/javascript" src="${ctx }/js/login.js"></script>
<script type="text/javascript" src="${ctx }/js/header.js"></script>    
<title>自测列表</title>
<style type="text/css">
.current{
	font-weight:900;
}
</style>
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
            <div class="logo"> <img src="${ctx }/images/logo.png"/> </div>
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
                                <li onmousemove="showsub(this)" onmouseout="hidesub(this)">${student.url }</a>
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
                         	 <c:when test="${examType == '四级'}">
      						 	 <li ><a href="${ctx }/category?type=四级">大学英语四级</a></li>
								<li class="current"><a href="${ctx }/category?type=六级">大学英语六级</a></li>
   							 </c:when>
                         	 <c:otherwise>
								<li ><a href="${ctx }/category?type=四级">大学英语四级</a></li>
								<li ><a href="${ctx }/category?type=六级">大学英语六级</a></li>
                         	 </c:otherwise>
                     	 </c:choose>
						<li><a href="${ctx }/about_us.jsp">关于我们</a></li>
					</ul>
				</div>
     </div>
    <!--面包屑-->
    <div class="breadcrumb">
        <a href="${ctx }/">首页</a>>>
        <a href="${ctx }/category?type=${examType}">${examType}</a>>>在线测试
    </div>
    <!--左侧边栏-->
    <div class="left">
        <h2>试卷选择</h2>
        <div class="vtitle"><a href="${ctx }/examonline/list?examType=${examType}">全部试卷</a></div>
            <div class="vcon" style="display: none;">
        </div>
        <div class="vtitle"><a href="${ctx }/examonline/list?examTime=2016&examType=${examType}">2016年试卷</a></div>
            <div class="vcon" style="display: none;">
        </div>
        <div class="vtitle"><a href="${ctx }/examonline/list?examTime=2015&examType=${examType}">2015年试卷</a></div>
            <div class="vcon" style="display: none;">
        </div>
        <div class="vtitle"><a href="${ctx}/examonline/list?examTime=2014&examType=${examType}">2014年试卷</a></div>
            <div class="vcon" style="display: none;">
        </div>
        <div class="leftfoot"></div>
    </div>
    <!--右侧内容-->
    <div class="right">
        <table>
            <tr class="title">
                <td>试卷标题</td>
                <td>年份</td>
                <td>类型</td>
                <td>试卷预览</td>
                <td>进入考试</td>
            </tr>
            <tr>
            	<c:forEach items="${page.list }" var="exam">
            	<tr>
                <td><a href="${ctx }/examonline/look?examId=${exam.examId}">${exam.examName }</a></td>
                <td>${exam.examTime }年</td>
                <td>${exam.examType }</td>
                <td><a href="${ctx }/examonline/look?examId=${exam.examId}"><input type="button" value="查看试卷" /></a></td>
                <td><a href="${ctx }/examonline/exam?examId=${exam.examId}"><input type="button" value="进入考试" /></a></td>
                </tr>
                </c:forEach>
            </tr>           
            <tr>
                <td colspan="5">
                    <div class="pagecss">
                        <span class="page"><a href="${ctx }/examonline/list?pageNum=1&examTime=${examTime }&examType=${examType}">首页</a></span>
                        <span class="page"><a href="${ctx }/examonline/list?pageNum=${page.prePageNum}&examTime=${examTime }&examType=${examType}">上一页</a></span>
                        <c:forEach begin="1" end="${page.totalPageNum }" var="pageNum">
			        	<c:choose> 
			        	<c:when test="${page.currentPageNum == pageNum}">
                        <span class="current"><a href="#">${page.currentPageNum }</a></span>
                        </c:when>
                        <c:otherwise>
                        <a name="pagen" href="${ctx }/examonline/list?pageNum=${pageNum }&examTime=${examTime }&examType=${examType}">${pageNum }</a>
                        </c:otherwise>
                        </c:choose>
                        </c:forEach>
                        <span class="page"><a href="${ctx }/examonline/list?pageNum=${page.nextPageNum }&examTime=${examTime }&examType=${examType}">下一页</a></span>
                        <span class="page"><a href="${ctx }/examonline/list?pageNum=${page.totalPageNum }&examTime=${examTime }&examType=${examType}">尾页</a></span>
                    </div>
                </td>
            </tr>
        </table>
    </div>
     <!--footer-->
        <div id="footer">
             <p><a href="${ctx }/connect_us.jsp">联系我们</a> | <a href="${ctx }/talent_recruitment.jsp">人才招聘</a> | <a href="${ctx }/Teachers' cooperation.jsp">教师合作</a> | <a href="${ctx }/project_introduction.jsp">项目介绍</a></p>
             <p>版权所有：猿计划项目小组</p>
        </div>
        <script type="text/javascript">
		function searchp(){
			var p=$("#searchParam").val();
			window . location . href = "${ctx }/exam/search?searchParam="+p;
		}
		</script>
</body>
</html>
