<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
</head>
<body style="overflow-x: hidden">
	<!--页面信息-->
	<div class="" message="usermessage">
		<!--页面头信息-->
		<div class="" id="header"> 
			<div class="" id="logo">
				<a href="${ctx }/index_before.jsp"><img src="${ctx }/images/logo.png"></a>
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
		<div class="" id="search">
			<input type="text" class="text"/>
			<a href="${ctx }/search.jsp"><img src="${ctx }/images/search.png"></a>
		</div>
		<div class="" id="username">
			<p>用户名</p>
		</div>
		<div class="nav" id="nav">
			<ul>
				<li onmousemove="showsub(this)" onmouseout="hidesub(this)"><a href="#"><img src="${ctx }/images/123.png"></a>
					<ul>
						<li><a href="${ctx }/info/usermessage.jsp">个人信息</a></li>
						<li><a href="${ctx }/info/install.jsp">设置</a></li>
						<li><a href="${ctx }/index_before.jsp">退出登录</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!--搜索-->
		<div class="search" id="">
			<div class="searchlogo">
				<a href="${ctx }/index_before.jsp"><img src="${ctx }/images/logo.png"></a>
			</div>
			<div class="input">
            	<input type="text">
			</div>
			<div class="searchimg">
				<a href="${ctx }/search.jsp"><img src="${ctx }/images/search.png"></a>
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
					<li  onclick="tabChange(this,'tabscontent')" class="current"><a href="#">真题</a></li>
					<li onclick="tabChange(this,'tabscontent')"><a href="#">模拟</a></li>
					<li onclick="tabChange(this,'tabscontent')"><a href="#">专项</a></li>
				</ul>
			</div>

			<!-- TAB 内容 -->
			<div id="tabscontent">
				<ul class="current">
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">真题</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<a href="${ctx }/examzc/preview.jsp"><div id="but">浏览试卷</div></a>
						<a href="${ctx }/examzc/test.jsp"><div id="but">开始考试</div></a>						
					</li>
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">真题</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<a href="${ctx }/examzc/preview.jsp"><div id="but">浏览试卷</div></a>
						<a href="${ctx }/examzc/test.jsp"><div id="but">开始考试</div></a>		
					</li>
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">真题</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<a href="${ctx }/examzc/preview.jsp"><div id="but">浏览试卷</div></a>
						<a href="${ctx }/examzc/test.jsp"><div id="but">开始考试</div></a>		
					</li>
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">真题</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<a href="${ctx }/examzc/preview.jsp"><div id="but">浏览试卷</div></a>
						<a href="${ctx }/examzc/test.jsp"><div id="but">开始考试</div></a>		
					</li>
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">真题</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<div id="but">
							<a href="${ctx }/examzc/preview.jsp">浏览试卷</a>
						</div>
						<div id="but">
							<a href="${ctx }/examzc/test.jsp">开始考试</a>
						</div>
					</li>
				</ul>
				<ul id="simulate" class="hidden">
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">模拟</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<div id="but">
							<a href="">浏览试卷</a>
						</div>
						<div id="but">
							<a href="">开始考试</a>
						</div>
					</li>
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">模拟</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<div id="but">
							<a href="">浏览试卷</a>
						</div>
						<div id="but">
							<a href="">开始考试</a>
						</div>
					</li>
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">模拟</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<div id="but">
							<a href="">浏览试卷</a>
						</div>
						<div id="but">
							<a href="">开始考试</a>
						</div>
					</li>
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">模拟</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<div id="but">
							<a href="">浏览试卷</a>
						</div>
						<div id="but">
							<a href="">开始考试</a>
						</div>
					</li>
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">模拟</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<div id="but">
							<a href="">浏览试卷</a>
						</div>
						<div id="but">
							<a href="">开始考试</a>
						</div>
					</li>
				</ul>
				<ul id="specialproject" class="hidden">
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">专项</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<div id="but">
							<a href="">浏览试卷</a>
						</div>
						<div id="but">
							<a href="">开始考试</a>
						</div>
					</li>
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">专项</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<div id="but">
							<a href="">浏览试卷</a>
						</div>
						<div id="but">
							<a href="">开始考试</a>
						</div>
					</li>
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">专项</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<div id="but">
							<a href="">浏览试卷</a>
						</div>
						<div id="but">
							<a href="">开始考试</a>
						</div>
					</li>
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">专项</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<div id="but">
							<a href="">浏览试卷</a>
						</div>
						<div id="but">
							<a href="">开始考试</a>
						</div>
					</li>
					<li>
						<p>
							<span clss="red">[大学英语六级]2013年6月</span>大学英语六级考试历年<span clss="red">专项</span>及答案解析（第3套）<br/>
							Directions: For this part, you are allowed 30 minutes to write an essay commenting on Einstein's remark "I have no special talents, I am only passionately curious." You should give an example or two to illustrate your point of mew. You should write at least 150 words but no more than 200 words....
						</p>
						<div id="but">
							<a href="">浏览试卷</a>
						</div>
						<div id="but">
							<a href="">开始考试</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!--分页-->
		<div id="pagenumber">
			<a href="#"><input type="submit" value="上一页"  id="button" /></a>
			<a href="#"><input type="submit" value="1" id="button"/></a>
			<a href="#"><input type="submit" value="2" id="button"/></a>
			<a href="#"><input type="submit" value="3" id="button"/></a>
			<a href="#"><input type="submit" value="4" id="button"/></a>
			<a href="#"><input type="submit" value="下一页"id="button" /></a>
		</div>
	</div>
    <!--页尾信息-->
	<div id="footer" class="">
		<p><a href="${ctx }/about_us.jsp">联系我们</a> | <a href="${ctx }/about_us.jsp">人才招聘</a> | <a href="${ctx }/about_us.jsp">教师合作</a> | <a href="${ctx }/about_us.jsp">项目介绍</a></p>
		<p>版权所有：猿计划项目小组</p>
	</div>
</body>
</html>