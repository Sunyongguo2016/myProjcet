<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
        <link href="${ctx }/css/about_us.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js"/></script>
        <script src="${ctx }/js/index.js"></script>
        <script src="${ctx }/js/about_us.js"></script>
        <script src="${ctx }/js/nav.js"></script>
        <script type="text/javascript" src="${ctx }/js/header.js"></script>
        <title>关于我们</title>
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
                <div class="logo"> <a href="${ctx }/"><img src="${ctx }/images/logo.png"/></a></div>
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
                <li><a href="${ctx }/">网站首页</a></li>
				<li><a href="${ctx }/category?type=四级">大学英语四级</a></li>
				<li><a href="${ctx }/category?type=六级">大学英语六级</a></li>
				<li class="current"><a href="${ctx }/about_us.jsp">关于我们</a></li>
                </ul>
            </div>
    	</div>
    	<div id="content">
        <!--面包屑-->
        <div class="breadcrumb">
            <a href="${ctx }/">首页</a>>><a href="${ctx}/about_us.jsp">关于我们</a>
        </div>
        <!--左侧边栏-->
         <div class="left">
            <h2>关于我们</h2>
            <div class="vtitle"><a href="${ctx }/connect_us.jsp">联系我们</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/talent_recruitment.jsp">人才招聘</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/Teachers' cooperation.jsp">教师合作</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/project_introduction.jsp">项目介绍</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="leftfoot"></div>
        </div>
        <!--右侧内容-->
        <div class="right">
        	<div class="right_bread">
                <h1>关于我们</h1>
            </div>
            <div class="right_content" style="line-height:30px;">
                <div class="title_h1">
                	<font style="font-size:20px;font-weight:bold;">人才招聘</font>
                </div>
                <div class="wenzhang_content">
                    <p style="text-align:left;line-height:2em;margin:0px 0px 10px">
                       	<h3>岗位</h3>&nbsp;&nbsp;&nbsp;&nbsp;网站编辑
						<h3>职责</h3>							
						&nbsp;&nbsp;&nbsp;&nbsp;1、相关计算机专业，年龄不限，学历不限，有写手经验优先。<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;2、文字功底扎实，写作能力强，有撰写软文和求职经验相关文章的经验（需提供材料证明）。<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;3、能随时接受编辑主管给的写作任务，并按时按质完成。<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;4、具备较强的创新意识，可随时配合网站撰写不同的文章。<br/>	
						<h3>待遇</h3>&nbsp;&nbsp;&nbsp;&nbsp;绩效薪资，多劳多得，具体面议。<br/>
						<h3>联系方式</h3>&nbsp;&nbsp;&nbsp;&nbsp;孙永国：13578590321（合则邀请，勿电勿访，否则一律取消应聘资格。）
                     </p>
                 </div>   
             </div>
		</div>
		</div>
        <!--footer-->
        <div id="footer" >
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