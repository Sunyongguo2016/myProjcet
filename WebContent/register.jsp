<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<title>注册</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/register.css">
<script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js" /></script>
<script src="${ctx }/js/header.js"></script>

<script src="${ctx }/js/yanzheng.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx }/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx }/ueditor/ueditor.all.min.js"> </script>
<style type = "text/css">
	  #userTip{
	    display:none;
	  }
</style>
<script type="text/javascript">
function checkExist(){
	var val = document.getElementById("username1").value;
	$.get("${ctx }/loginuser/checkname",{'username':val},function(data){
		var tip = document.getElementById("userTip");
		if("exist"==data){
			tip.innerHTML="用户名不可重复";
			tip.style.color = "red";
		} else if(""==data) {
			tip.innerHTML="用户名可用";
			tip.style.color = "green";
		}
	});
}
function checkPwd(){
	var pwd = document.getElementById("pass").value;
	var repwd = docuemnt.getElementById("repassword").value;
	var repwdTip = document.getElementById("repwdTip");
	if(pwd == repwd){
		repwdTip.innerHTML = "密码和确认密码一致";
		repwdTip.style.color = "green";
	} else {
		repwdTip.innerHTML = "密码和确认密码不一致";
		repwdTip.style.color = "red";
	}
}
</script>		
</head>
<body>
	<div class="" message="usermessage">
		<!--页面头信息-->
		<div class="" id="header">
			<div class="" id="logo">
				<img src="${ctx }/images/logo.png">
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
				<input type="text" class="text" /> <a href="#"><img
					src="${ctx }/images/search.png"></a>
			</div>
		</div>
	</div>
	<!--内容-->
	<div class="" id="content">
		<!-- Begin Form -->
		<form action="${ctx }/loginuser/regist" method="post" id="my-form">
			<div class="username">
				<label>用户名：</label>
				<input id="username1" name="username" type="text" value="" onblur="checkExist();"/>
				<span id="userTip" style="display:inline" ></span>
			</div>
			<div class="password">
				<label>密&nbsp;码：</label><input id="pass" name="password"
					type="password" />
			</div>
			<div class="repassword">
				<label>确认密码:</label><input id="repassword" name="surepassword"
					type="password" onblur="checkPwd();"/>
					<span id = "repwdTip" style="display:inline"></span>
			</div>
	 	<div class="img" float="left">
				<label>上传头像：</label> 
					    <!-- 加载编辑器的容器 -->
			    	<script id="container" name="noticeContent" type="text/plain">
        				${notice.noticeContent}
   					 </script>
					<!-- 实例化编辑器 -->
					<script type="text/javascript">
					UE.getEditor('container',{
			            //这里可以选择自己需要的工具按钮名称
			            toolbars:[['fullscreen', 'cleardoc', 'simpleupload','attachment']],
			            //focus时自动清空初始化时的内容
			            autoClearinitialContent:true,
			            //关闭字数统计
			            wordCount:true,
			            //关闭elementPath
			            elementPathEnabled:true,
			            //默认的编辑区域宽高
			            initialFrameHeight:100,
			            initialFrameWidth:300 
			            //更多其他参数，请参考ueditor.config.js中的配置项
			        });
					</script>
			</div>
				
			<div class="">
				<table border="0" cellspacing="5" cellpadding="5">
					<tr>
						<td class="yanzhengma">验证码：</td>
						<td><input style="float: left;" type="text" id="inputCode" /></td>
						<td></td>
					</tr>
					<tr>
						<td>
							<div class="code" id="checkCode" onclick="createCode()"></div>
						</td>
						<td><a href="#" onclick="createCode()" class="href">看不清换一张</a></td>
					</tr>

					<tr>
						<td><a href=""><input id="Button1"
								onclick="validateCode();" type="submit" value="确定" /></a></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div id="submitreset" >
				<a href="${ctx }/index_before.jsp"><button type="submit"
						id="submit">提交</button></a>
			</div>
		</form>
		<!-- End Form -->
	</div>

	<!--页尾信息-->
	<div id="footer" class="">
		<p>
			<a href="${ctx }/about_us.jsp">联系我们</a> | <a
				href="${ctx }/about_us.jsp">人才招聘</a> | <a
				href="${ctx }/about_us.jsp">教师合作</a> | <a
				href="${ctx }/about_us.jsp">项目介绍</a>
		</p>
		<p>版权所有：猿计划项目小组</p>
	</div>
	</div>

</body>
</html>