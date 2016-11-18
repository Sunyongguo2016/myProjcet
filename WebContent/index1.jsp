<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http5://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="${ctx }/css/index.css" type="text/css" rel="stylesheet" />
		<link href="${ctx }/css/style1.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js"/></script>
		<script type="text/javascript" src="${ctx }/js/index.js"></script>
		<script type="text/javascript" src="${ctx }/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${ctx }/js/jquery.tools.min.js"></script>
		<script type="text/javascript" src="${ctx }/js/jquery-1.4.4.min.js"></script>
 		<script type="text/javascript" src="${ctx }/js/jquery.XYTipsWindow.min.2.8.js"></script>
		<style type="text/css">
			/* box */
			.box{width:1200px;height:338px;border:1px solid #aaa;border-bottom:4px solid #f9514e;margin:30px auto;background:url(${ctx}/images/wood.jpg) no-repeat center;position:relative;}
			.b1,.b2,.b3{position:absolute;overflow:hidden;}
			.b1{width:600px;height:338px;top:0;left:0;}
			.b2,.b3{width:280px;height:158px;right:0;}
			.b2{top:0;}
			.b3{top:180px;}
			.lst{width:2000em;position:absolute;}
			.lst li{float:left;}
			.lst1 li{width:600px;height:338px;}
			.lst2 li,.lst3 li{width:280px;height:158px;}
			.lst3 li{float:none;}
			.lst img{width:100%;}
			.cen{width:300px;height:318px;padding:10px;background:rgba(0,0,0,.4);position:absolute;top:0;left:600px;}
			.cenTit{padding-bottom:5px;border-bottom:1px solid #aaa;font-size:18px;color:#eee;font-weight:normal;}
			.wrd{padding-top:5px;border-top:1px solid #;font-size:14px;line-height:20px;color:#e1e1e1;}
			.wrd a{font-size:12px;color:#f60;}
			.cen1{width:280px;height:22px;background:rgba(0,0,0,.6);color:#fff;line-height:22px;text-align:center;position:absolute;top:158px;right:0;}
			.arr{display:inline-block;width:51px;height:45px;background:url(${ctx}/images/arr.png) no-repeat;cursor:pointer;position:absolute;bottom:10px;z-index:9;}
			.lef{background-position:0 0;left:700px;}
			.rig{background-position:-52px 0;right:380px;}
		</style>
		 <script type="text/javascript">
 $(document).ready(function() {
	
	$("#login").click(function(){
		$.XYTipsWindow({
			___title:"登录",
			___content:"iframe:${ctx }/login1.jsp",
			___width:"460",
			___height:"150",
			___showbg:true,
			___drag:"___boxTitle"

		});
	});
	
	$("#reg").click(function(){
		$.XYTipsWindow({
			___title:"注册",
			___content:"iframe:reg.html",
			___width:"460",
			___height:"450",
			___showbg:true,
			___drag:"___boxTitle"
		});
	});
	


 })
 </script>
		<title>首页</title>
	</head>
	<body>
		<div class="body">
			<div>
				<div class="header">
					<div class="logo">
						<img src="${ctx }/images/logo.png"/>
					</div>
					<div class="search">
						<input type="text" class="text"/>
    					<input type="submit" class="button" value="搜索"/>
					</div>
					<div class="login">
						<button id="login">登录</button>
						<button id="reg">注册</button>
					</div>
				</div>
				<div class="menu">
					<ul>
						<li class="current"><a href="#">网站首页</a></li>
						<li><a href="#">大学英语四级</a></li>
						<li><a href="#">大学英语六级</a></li>
						<li><a href="#">竞技场</a></li>
						<li><a href="#">联系我们</a></li>
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
				<img src="${ctx }/images/siji.png"/>
				<div>
				<h2>大学英语四级</h2>
				<hr/>
				<ul>
					<li><a href="#">[大学英语四级]2013年6月大学英语四级考试历年真题及答案解析（第3套）</a></li>
					<li><a href="#">[大学英语四级]2013年6月大学英语四级考试历年真题及答案解析（第3套）</a></li>
					<li><a href="#">[大学英语四级]2013年6月大学英语四级考试历年真题及答案解析（第3套）</a></li>
					<li><a href="#">[大学英语四级]2013年6月大学英语四级考试历年真题及答案解析（第3套）</a></li>
					<li><a href="#">[大学英语四级]2013年6月大学英语四级考试历年真题及答案解析（第3套）</a></li>
					<li><a href="#">[大学英语四级]2013年6月大学英语四级考试历年真题及答案解析（第3套）</a></li>
				</ul>
				<p><a href="#" style="font-size:7px;color:#20B2AA;">MORE>></a></p>
				</div>
			</div>
			<div class="liuji">
				<img src="${ctx }/images/liuji.png"/>
				<div>
				<h2>大学英语六级</h2>
				<hr/>
				<ul>
					<li><a href="#">[大学英语六级]2013年6月大学英语六级考试历年真题及答案解析（第3套）</a></li>
					<li><a href="#">[大学英语六级]2013年6月大学英语六级考试历年真题及答案解析（第3套）</a></li>
					<li><a href="#">[大学英语六级]2013年6月大学英语六级考试历年真题及答案解析（第3套）</a></li>
					<li><a href="#">[大学英语六级]2013年6月大学英语六级考试历年真题及答案解析（第3套）</a></li>
					<li><a href="#">[大学英语六级]2013年6月大学英语六级考试历年真题及答案解析（第3套）</a></li>
					<li><a href="#">[大学英语六级]2013年6月大学英语六级考试历年真题及答案解析（第3套）</a></li>
				</ul>
				<p><a href="#" style="font-size:7px;color:#20B2AA;">MORE>></a></p>
				</div>
			</div>
			</div>
			<div class="right">
				<div>
				<h2>专项训练</h2>
				<hr/>
				<div>
					<div class="img1"><a href="#"></a></div>
					<div class="img2"><a href="#"></a></div>
					<div class="img3"><a href="#"></a></div>
					<div class="img4"><a href="#"></a></div>
				</div>				
				</div>
				<div>
				<h2>竞技场</h2>
				<hr/>
				<img src="${ctx }/images/jingji.jpg" height="180px" width="333px" />
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
				<p><a href="#">联系我们</a> | <a href="#">人才招聘</a> | <a href="#">教师合作</a> | <a href="#">项目介绍</a></p>
				<p>版权所有：猿计划项目小组</p>
			</div>
		</div>
	</body>
</html>