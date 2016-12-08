<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http5://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
		<link href="${ctx }/css/index.css" type="text/css" rel="stylesheet" />
        <link href="${ctx }/css/box_style.css" type="text/css" rel="stylesheet" />		
		<script type="text/javascript" src="${ctx }/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${ctx }/js/jquery.tools.min.js"></script>
 		<script type="text/javascript" src="${ctx }/js/jquery.XYTipsWindow.min.2.8.js"></script>
		<script type="text/javascript" src="${ctx }/js/index.js"></script>
		<script src="${ctx }/js/nav.js"></script>
        <script type="text/javascript" src="${ctx }/js/banner.js"></script>
        <script type="text/javascript" src="${ctx }/js/login.js"></script>
        <script type="text/javascript" src="${ctx }/js/header.js"></script>
		<title>首页</title>
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
		<div class="body">
			<div>
            	<div class="header">
					<div class="logo">
						<a href="${ctx }/index_before.jsp">
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
						<li class="current"><a href="${ctx }/">网站首页</a></li>
						<li><a href="${ctx }/category?type=四级">大学英语四级</a></li>
						<li><a href="${ctx }/category?type=六级">大学英语六级</a></li>
						<li><a href="${ctx }/about_us.jsp">关于我们</a></li>
					</ul>
				</div>
			</div>
			<div class="content">
				<div class="box">
				<div class="b b1">
					<ul class="lst lst1">
						<li><img src="${ctx }/images/1.jpg" alt="" /></li>
						<li><img src="${ctx }/images/2.jpg" alt="" /></li>
						<li><img src="${ctx }/images/3.jpg" alt="" /></li>
						<li><img src="${ctx }/images/4.jpg" alt="" /></li>
						<li><img src="${ctx }/images/5.jpg" alt="" /></li>
					</ul>
				</div>
				<div class="b b2">
					<ul class="lst lst2">
						<li><img src="${ctx }/images/2.jpg" alt="" /></li>
						<li><img src="${ctx }/images/3.jpg" alt="" /></li>
						<li><img src="${ctx }/images/4.jpg" alt="" /></li>
						<li><img src="${ctx }/images/5.jpg" alt="" /></li>
						<li><img src="${ctx }/images/1.jpg" alt="" /></li>
					</ul>
				</div>
				<div class="b3">
					<ul class="lst lst3">
						<li><img src="${ctx }/images/3.jpg" alt="" /></li>
						<li><img src="${ctx }/images/4.jpg" alt="" /></li>
						<li><img src="${ctx }/images/5.jpg" alt="" /></li>
						<li><img src="${ctx }/images/1.jpg" alt="" /></li>
						<li><img src="${ctx }/images/2.jpg" alt="" /></li>
					</ul>
				</div>
				<div class="cen">
					<h3 class="cenTit">重要通知</h3>
					<p class="wrd">尊敬的家长、亲爱的学员：2017年四季教育寒季、春季的报名工作即将开始了，请注意
					报名时间和相关规定。为了使续班工作顺利进行，我们将分年级报名，恳请各位家长配合、支持、理解我们的工作。
					各位家长和学员可在11月8日之后登录四季教育官网www.sijiedu.com，查询相关课程安排和各校区招生计划。<a target="_blank" href="#">【查看更多】</a></p>
				</div>
				<span class="arr lef"></span>
				<span class="arr rig"></span>
			</div>
			<div>
			<div class="left">
			<div class="siji">
				<a href="${ctx }/category?type=四级"><img src="${ctx }/images/siji.png"/></a>
				<div>
				<h2>大学英语四级</h2>
				<hr/>
				<ul>
				<c:forEach items="${pageExamFour.list }" var="exam">
					<li><a href="${ctx}/examonline/look?examId=${exam.examId}">${exam.examName }..预览</a></li>
				</c:forEach>
				</ul>
				<p><a href="${ctx }/category?type=四级" style="font-size:7px;color:#20B2AA;">MORE>></a></p>
				</div>
			</div>
			<div class="liuji">
				<a href="category?type=六级"><img src="${ctx }/images/liuji.png"/></a>
				<div>
				<h2>大学英语六级</h2>
				<hr/>
				<ul>
					<c:forEach items="${pageExamSix.list }" var="exam">
						<li><a href="${ctx}/examonline/look?examId=${exam.examId}">${exam.examName }..预览</a></li>
					</c:forEach>
				</ul>
				<p><a href="category?type=六级" style="font-size:7px;color:#20B2AA;">MORE>></a></p>
				</div>
			</div>
			</div>
			<div class="right">
				<div>
				<h2>专项训练</h2>
				<hr/>
				<div>
					<div class="img1"><a href="${ctx }/examzx/list?parentQuestionName=QuickReading"></a></div>
					<div class="img2"><a href="${ctx }/examzx/list?parentQuestionName=LastReading"></a></div>
					<div class="img3"><a href="${ctx }/examzx/list?parentQuestionName=Writing"></a></div>
					<div class="img4"><a href="${ctx }/examzx/list"></a></div>
				</div>				
				</div>
				<div>
				<h2>竞技场</h2>
				<hr/>
				<a href="${ctx }/arena.jsp"><img src="${ctx }/images/jingji.jpg" height="180px" width="333px" /></a>
				</div>
			</div>
			</div>
			<div class="you">
				<h2>友情链接</h2>
				<hr/>
				<div>
					<img src="${ctx }/images/zaixian.jpg"/>
					<p><a href="#">在线考试官方网站</a></p>
				</div>
				<div>
					<img src="${ctx }/images/zaixian.jpg"/>
					<p><a href="#">在线考试官方网站</a></p>
				</div>
				<div>
					<img src="${ctx }/images/zaixian.jpg"/>
					<p><a href="#">在线考试官方网站</a></p>
				</div>
				<div>
					<img src="${ctx }/images/zaixian.jpg"/>
					<p><a href="#">在线考试官方网站</a></p>
				</div><div>
					<img src="${ctx }/images/zaixian.jpg"/>
					<p><a href="#">在线考试官方网站</a></p>
				</div>
				<div>
					<img src="${ctx }/images/zaixian.jpg"/>
					<p><a href="#">在线考试官方网站</a></p>
				</div>
				<div>
					<img src="${ctx }/images/zaixian.jpg"/>
					<p><a href="#">在线考试官方网站</a></p>
				</div>
				<div>
					<img src="${ctx }/images/zaixian.jpg"/>
					<p><a href="#">在线考试官方网站</a></p>
				</div>
			</div>
			</div>
			<div class="footer">
				<p><a href="${ctx }/connect_us.jsp">联系我们</a> | <a href="${ctx }/talent_recruitment.jsp">人才招聘</a> | <a href="${ctx }/Teachers' cooperation.jsp">教师合作</a> | <a href="${ctx }/project_introduction.jsp">项目介绍</a></p>
                <p>版权所有：猿计划项目小组</p>
			</div>
		</div>
		<script type="text/javascript">
		function searchp(){
			var p=$("#searchParam").val();
			window . location . href = "${ctx }/exam/search?searchParam="+p;
		}
		</script>
	</body>
</html>