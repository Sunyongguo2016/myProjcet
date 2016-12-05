<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
        <link href="${ctx }/css/footer.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="${ctx }/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="${ctx }/css/loginMy.css"/>
		<script type="text/javascript" src="${ctx }/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="${ctx }/js/jquery.tools.min.js"></script>
        <script type="text/javascript" src="${ctx }/js/jquery.XYTipsWindow.min.2.8.js"></script>
        <script type="text/javascript" src="${ctx }/js/index.js"></script>
        <script src="${ctx }/js/nav.js"></script>
        <script type="text/javascript" src="${ctx }/js/banner.js"></script>
        <script type="text/javascript" src="${ctx }/js/login.js"></script>
        <script type="text/javascript" src="${ctx }/js/header.js"></script>       
		<script type="text/javascript" src="${ctx }/js/loginMy.js"></script>
        <title>登录</title>   
		<style>
            html,body{width:100%;}
        </style>  
        
        <script type="text/javascript">
        
		</script>
    </head>
	<body>    
        <div>
            <div class="header">
                <div class="logo">
                    <img src="${ctx }/images/logo.png"/>
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
        <div class="main">
            <div class="center">
                <form action="${ctx }/loginuser/login" id="formOne" method="post"onsubmit="return check(this)" >
                    <i class="fa fa-user Cone">  | </i>
                    <input type="text" name="uer" id="user" placeholder="用户名(不少于5个字符)"/>
                    <span id="user_pass"></span>
                    <br/>
                    <i class="fa fa-key Cone">  | </i>
                    <input type="password" name="pwd" id="pwd" placeholder="密码(不少于6个字符)" />
                    <span id="pwd_pass"></span>
                    <br/>
                    <input type="submit" value="Sign in" id="submit" name="submit"/>
                    <br/>
                    <span style="margin-left:300px; color:#000000; font-size:10px;">还没注册？<a href="${ctx }/register.jsp" style="font-size:10px;">点我注册</a></span>
                    <br/>
                </form>
            </div>
		</div>
        <div class="footer">
            <p><a href="${ctx }/about_us.jsp">联系我们</a> | <a href="${ctx }/about_us.jsp">人才招聘</a> | <a href="${ctx }/about_us.jsp">教师合作</a> | <a href="${ctx }/about_us.jsp">项目介绍</a></p>
            <p>版权所有：猿计划项目小组</p>
        </div>
	</body>
</html>