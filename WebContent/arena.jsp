<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
        <link href="${ctx }/css/arena.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js"/></script>
        <script src="${ctx }/js/index.js"></script>
        <script src="${ctx }/js/nav.js"></script>
        <script type="text/javascript" src="${ctx }/js/login.js"></script>
        <script type="text/javascript" src="${ctx }/js/header.js"></script>
        <title>竞技场</title>
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
						<input type="text" class="text"/>
    					<a href="${ctx }/search.jsp"><input type="submit" class="button" value="搜索"/></a>
					</div>
					<div class="login" id="login">
                    	<a href="${ctx }/login_ues.jsp"><button>登录</button></a>&nbsp;|
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
						<li><a href="${ctx }/index_before.jsp">网站首页</a></li>
						<li><a href="${ctx }/category.jsp">大学英语四级</a></li>
						<li><a href="${ctx }/category.jsp">大学英语六级</a></li>
						<li class="current"><a href="${ctx }/arena.jsp">竞技场</a></li>
						<li><a href="${ctx }/about_us.jsp">关于我们</a></li>
					</ul>
				</div>
        </div>
		<!--左侧user-->
        <div class="left">
        	<img src="${ctx }/images/leftuser.jpg" width="150px" height="150px"/>
            <span class="leftuser">用户名</span>
        </div>
        <!--中间题目-->
        <div class="center">
        	<div class="center_top">
            	<img src="${ctx }/images/leftuser.jpg" width="60px"  height="60px" />
                <span> vs</span>
                <img src="${ctx }/images/rightuser.jpg" width="60px"  height="60px" />
            </div>
            <div class="center_bottom">
            	<p> Some tin cans have lost their labels. 
                3 contain soup, 4 contain beans, and 1 contains peas.  
                If you pick a can at random, in which one of the following are both statements true?</p>
                <input type="radio" name="option" value="A" />A. You have an even chance of picking beans.     
    			You have a greater than even chance of picking soup.<br/>
                <input type="radio" name="option" value="B" />B. You have an even chance of picking soup.    
     			You have a less than even chance of picking peas.<br/>
                <input type="radio" name="option" value="C" />C. You have a less than even chance of picking peas.   
     			You have an even chance of picking soup. <br/>
                <input type="radio" name="option" value="D" />D. You have an even chance of picking beans.   
     			You have a less than even chance of picking soup.<br/>
                <input type="submit" value="下一题" class="button"/>
            </div>
		</div> 
        <!--右侧user-->
        <div class="right">
        	<img src="${ctx }/images/rightuser.jpg"  width="150px" height="150px" />
            <span class="rightuser">用户名</span>
        </div> 
        <!--footer-->
        <div id="footer">
  	         <p><a href="${ctx }/about_us.jsp">联系我们</a> | <a href="${ctx }/about_us.jsp">人才招聘</a> | <a href="${ctx }/about_us.jsp">教师合作</a> | <a href="${ctx }/about_us.jsp">项目介绍</a></p>
             <p>版权所有：猿计划项目小组</p>
        </div>   
	</body>
</head>