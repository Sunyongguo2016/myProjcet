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
                	<font style="font-size:20px;font-weight:bold;">关于我们</font>
                </div>
                <div class="wenzhang_content">
                	<h3>关于我们</h3>
                    <p style="text-align:left;line-height:2em;text-indent:2em;margin:0px 0px 10px">
                        
						巨人英语是一款基于JAVA与MYSQL开发的网络考试系统，考生可以通过浏览器直接进行操作，无需安装任何程序或插件。
						操作简单，无需专业的计算知识，也可以快速的熟悉网站基本操作。试卷涵盖近三年的真题，并附有试题解、相关知识点。
                     </p>
                     <p style="text-align:left;line-height:2em;text-indent:2em;margin:0px 0px 10px">
                       	巨人英语是由猿计划项目组设计编写而成。项目成员是一群理论和实践都很菜的技术渣渣，该项目的实用价值有待开发。
                       	如对我们的项目有何建议，欢迎反馈，可以是关于网页设计、后台设计、功能推荐……
                     </p>
                     <h3>团队理念</h3>
                     <p style="text-align:left;line-height:2em;text-indent:2em;margin:0px 0px 10px">
                     	
						一、以用户为中心创建以来，考试在线始终秉持着用户第一的理念，从而赢得了最忠诚的用户群体。<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;二、追求卓越我们追求一种品质，坚信只有我们自己都赞不绝口的东西，才能让大家也喜欢。<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;三、务实专注专著，持续的发展是考试在线最重要的精神。<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;四、团队协作团队协作是考试在线的核心竞争力。我们相互信任，相互支持，共同成长。<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;五、守信尽责我们说到做到，信守承诺，担负责任。为丰富服务内容，考试在线网站欢迎各<br/>
						       类ICP及资源拥有者与本站合作，共同向所有教育网用户推广其服务，在合作中共同发展。
                     </p>
                 </div>   
             </div>
		</div>
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