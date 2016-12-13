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
        <div>
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
                	<font style="font-size:20px;font-weight:bold;">教师合作</font>
                </div>
                <div class="wenzhang_content">
                    <p style="text-align:left;line-height:1.5em;text-indent:2em;margin:0px 0px 10px">
                      	<h3>招聘引言</h3>
							&nbsp;&nbsp;&nbsp;&nbsp;网络教育时代，您再也不用受困于三尺讲台！考试在线网作为全国知名考试门户，我们将为你提供更广阔的职业发展平台！我们真诚欢迎各行业有经验的精英教师加入我们的团队！我们相信，加入考试在线网您收获的不仅是一份额外薪水，更是一次人生的丰富体验和事业的全新开拓，在这里您将赢得更多的 掌声和声誉！还等什么？现在就和我们一起携手为网络教育事业,贡献自己的力量！考试在线网因发展需要，长期诚聘以下在线网上授课教师（可兼职）
						<h3>授课方向</h3>
							&nbsp;&nbsp;&nbsp;&nbsp;外语类：英语四六级等
						<h3>任职要求</h3>
							&nbsp;&nbsp;&nbsp;&nbsp;1、所授课程相关专业本科及以上学历；<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;2、拥有所授课程相关资质；<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;3、从事过教学、培训、实务类相关工作；<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;4、年龄25岁-55岁之间；<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;5、普通话标准，具有较强的口头表达能力和责任心，授课形象好，讲课生动，有感染力；<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;6、在各大高校及培训机构有教学经验的老师优先考虑。
						<h3>联系方式</h3>
							&nbsp;&nbsp;&nbsp;&nbsp;联系QQ：1241069301<br/>
                     </p>
                    
                 </div>   
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