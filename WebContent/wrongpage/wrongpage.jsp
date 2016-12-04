<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
        <link href="${ctx }/css/index.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="${ctx }/css/wrongpage.css">
		<script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js"/></script>
		<script src="${ctx }/js/index.js"></script>
    	<script src="${ctx }/js/nav.js"></script>
    	<script type="text/javascript" src="${ctx }/js/login.js"></script>
   		<script type="text/javascript" src="${ctx }/js/header.js"></script>
		<script src="${ctx }/js/wrongpage2.js"></script>
		<script src="${ctx }/js/wrongpage3.js"></script>
		<title>错题本</title>
	</head>
	<body>
		<div class="body">
			<div>
				<div class="header">
					<div class="logo">
						<a href="${ctx }/index_before.jsp"><img src="${ctx }/images/logo.png"/></a>
					</div>
					<div class="search">
						<input type="text" class="text"/>
    					<a href="${ctx }/search.jsp"><input type="submit" class="button" value="搜索"/></a>
					</div>
					<div class="login" style="display:none">
                    	<a href="${ctx }/login_use.jsp"><button>登录</button></a>&nbsp;|
						<a href="${ctx }/register.jsp"><button>注册</button></a>
                    </div>
                    
                    <div class="after_login" style="display:block">
                    	<div id="username">
                            <p>${student.loginName }</p>
                        </div>
                        <div class="nav" id="nav">
                            <ul>
                                <li onmousemove="showsub(this)" onmouseout="hidesub(this)"><a href="#">${student.url }</a>
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
						<li class="current"><a href="${ctx }/index_before.jsp">网站首页</a></li>
						<li><a href="${ctx }/category.jsp">大学英语四级</a></li>
						<li><a href="${ctx }/category.jsp">大学英语六级</a></li>
						<li><a href="${ctx }/arena.jsp">竞技场</a></li>
						<li><a href="${ctx }/about_us.jsp">关于我们</a></li>
					</ul>
				</div>
			</div>
    <div class="content">
			<div id="elButton">
					<h2><div id="jumpx" style="color:#33ff33"></div></h2>
				    <div id="r32">
	        		<p>变量名等多种属性的具体规定。当用户输入满足input元素的规定时，则接收输入信息，并赋给指定的变量灵活进行相应的操作、处理；否则，就通过浏览器给出具体的处理意见，并进行是单个输入处理或变量初始化操作</p>
	        		<br/>
	        		<input type="button" name="close" value="关闭" id="r33">
        	</div>
    <!-- 获取当前所需的函数 js转移到别的地方就出错，只能放在这-->
			<script>
			if (document.all||document.getElementById){
			jump=(document.getElementById)? document.getElementById("jumpx") : document.all.jumpx
			jump0()
			}
			else
			document.write(message)
			</script>

		   </div> 
    <div id="right2">
    
      <div id="r1">
      		<p>${pque.parentQuestionArticle }</p>
      		
      </div>
     	<c:forEach items="${pque.questions }" var="qs">
      <div id="r2">
      <%--    <p><span>60. The author believes that, since the signing of the Kyoto Protocol, ________. </span></p>
      --%>     <p><span>${qs.questionContent }</span></p>
          <c:forEach items="${qs.selectts }" var="se">
          <div name="r2l"> 

          <p><span> <input type="radio" name=""> ${se.selecttName }) ${se.selecttContent } </span></p>

          </div>
          </c:forEach>
          
      </div>
      </c:forEach>
      
      <div id="r3">
         <input type="submit" value="提交" class="s1">

         <input type="submit" value="解析" class="s2">
         <div id="r3r">
            <img src="${ctx }/images/save.png">
            <img src="${ctx }/images/note.png" id="bum">
            <img src="${ctx }/images/delete.png">
         </div>
      </div>
 	</div> 		
	</div>
			<div class="footer">
				<p><a href="${ctx }/about_us.jsp">联系我们</a> | <a href="${ctx }/about_us.jsp">人才招聘</a> | <a href="${ctx }/about_us.jsp">教师合作</a> | <a href="${ctx }/about_us.jsp">项目介绍</a></p>
				<p>版权所有：猿计划项目小组</p>
			</div>
		</div>
	</body>
</html>