<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
       	<link href="${ctx }/css/special.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript"></script>
        <script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js"/></script>
        <script src="${ctx }/js/header.js"></script>
        <script src="${ctx }/js/special.js"></script> 
        <script src="${ctx }/js/nav.js"></script>
        <script type="text/javascript" src="${ctx }/js/login.js"></script>
        <script type="text/javascript" src="${ctx }/js/header.js"></script>       
        <title>专项练习</title>
        <script type="text/javascript">
        
        </script>
    </head>
    <body>
     	<!-- header-->
        <div>
            <div class="header">
                <div class="logo"> <img src="${ctx }/images/logo.png"/> </div>
                <div class="search">
						<input type="text" class="text"/>
    					<a href="${ctx }/search.jsp"><input type="submit" class="button" value="搜索"/></a>
					</div>
					<div class="login">
                    	<button id="login">登录</button>&nbsp;|
						<a href="${ctx }/register.jsp"><button>注册</button></a>
                    </div>
                    
                    <div class="after_login">
                    	<div id="username">
                            <p>用户名</p>
                        </div>
                        <div class="nav" id="nav">
                            <ul>
                                <li onmousemove="showsub(this)" onmouseout="hidesub(this)"><a href="#"><img src="${ctx }/images/leftuser.jpg"></a>
                                    <ul>
                                        <li><a href="${ctx }/usermessage.jsp">个人信息</a></li>
			                            <li><a href="${ctx }/install.jsp">设置</a></li>
                                        <li><a href="${ctx }/index_before.jsp">退出登录</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    
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
    	</div>
        <!--面包屑-->
        <div class="breadcrumb">
            <a href="${ctx }/index_before.jsp">首页 </a>>>
            <a href="${ctx }/category.jsp">大学英语四级 </a>>> 专项练习
        </div>
        <!--左侧边栏-->
        <div class="left">
        	<h2>专项练习</h2>
            <div class="vtitle"><a href="${ctx }/examzx/list">全部</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/examzx/list?parentQuestionName=Writing">作文</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/examzx/list?parentQuestionName=ChooseFillInBlank">十五选十</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/examzx/list?parentQuestionName=QuickReading">快速阅读</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/examzx/list?parentQuestionName=LastReading">阅读</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/examzx/list?parentQuestionName=Translation">翻译</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="leftfoot"></div>
        </div>
        <!--右侧内容-->
        <div class="right">
            <table>
                <tr class="title">
                    <td>专项标题</td>
                    <td>类型</td>
                    <td>试卷预览</td>
                    <td>进入训练</td>
                </tr>
                <c:forEach items="${page.list}" var="zx">
                 	<tr>              
	                    <td>${zx.exam.examName}</td>
	                    <td>${zx.parentQuestionName}</td>	               
	                    <td><a href="${ctx }/examzx/preview?parentQuestionId=${zx.parentQuestionId}">查看试卷</a></td>
	                    <td><a href="${ctx }/examzx/test?parentQuestionId=${zx.parentQuestionId}"><input type="button" value="进入练习" /></a></td>
                	</tr>
                </c:forEach>
           
                <tr>
                    <td colspan="5">
                       <div class="pagecss">  
                            <span class="page"><a href="${ctx }/examzx/list?pageNum=1&parentQuestionName=${pqType}">首页</a></span>
                            <span class="page"><a href="${ctx }/examzx/list?pageNum=${page.prePageNum }&parentQuestionName=${pqType}">上一页</a></span>
                            <c:forEach begin="1" end="${page.totalPageNum }" var="pageNum"   >	
								   <span class="page"><a href="${ctx }/examzx/list?pageNum=${pageNum }&parentQuestionName=${pqType}">${pageNum }</a></span>
							</c:forEach>             
                            <span class="page" ><a href="${ctx }/examzx/list?pageNum=${page.nextPageNum} &parentQuestionName=${pqType}" >下一页</a></span>
                            <span class="page"><a href="${ctx }/examzx/list?pageNum=${page.totalPageNum }&parentQuestionName=${pqType}">尾页</a></span>                       
                        </div>                         
                    </td>
                </tr>
            </table>
        </div>
         <!--footer-->
            <div id="footer">
                    <p><a href="${ctx }/about_us.jsp">联系我们</a> | <a href="${ctx }/about_us.jsp">人才招聘</a> | <a href="${ctx }/about_us.jsp">教师合作</a> | <a href="${ctx }/about_us.jsp">项目介绍</a></p>
                    <p>版权所有：猿计划项目小组</p>
            </div>
	</body>
	
</html>
