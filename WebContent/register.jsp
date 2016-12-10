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
<script src="${ctx }/js/reg.js"></script>
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
			alert("用户名不可重复");
		} 
		if(val == ""){
			alert("用户名不可为空");
		} else if(val.length<5||form.username.value.length>100){
			alert("输入用户名长度不对！");
		}
		
	});
}
function checkPwd(){
	var pwd = document.getElementById("password").value;
	if(pwd.length<6 || pwd.lengtth>100){
		alert("密码长度不对！")
	}
}
<!-- 导航栏滑动 -->
$(function() {
	var $t, leftX, newWidth;

	$('.menu ul').append('<div class="block"></div>');
	var $block = $('.block');

	$block.width($(".current").width()).css('left', $('.current a').position().left).data('rightLeft', $block.position().left).data('rightWidth', $block.width());

	$('.menu ul li').find('a').hover(function() {
		$t = $(this);
		leftX = $t.position().left;
		newWidth = $t.parent().width();

		$block.stop().animate({
			left: leftX,
			width: newWidth
		},300);
	}, function() {
		$block.stop().animate({
			left: $block.data('rightLeft'),
			width: $block.data('rightWidth')
		},300)
	})
})
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
					<li class="current"><a href="${ctx }/">网站首页</a></li>
						<li><a href="${ctx }/category?type=四级">大学英语四级</a></li>
						<li><a href="${ctx }/category?type=六级">大学英语六级</a></li>
						<li><a href="${ctx }/about_us.jsp">关于我们</a></li>
				</ul>
			</div>
			<div class="" id="search">
				<input type="text" class="text" /> <a href=""><img
					src="${ctx }/images/search.png"></a>
			</div>
		</div>
	</div>
	<!--内容-->
	<div class="" id="content" >
		<!-- Begin Form -->
		<form action="${ctx }/loginuser/regist" method="post" id="my-form" onsubmit="return check(this)">
			
			<div class="username">
				<label>用户名：</label>
				<input id="username1" name="username" type="text" value="" placeholder="用户名(不少于5个字符)" onblur="checkExist();"/>
				
			</div>
			<div class="password">
				<label>密&nbsp;码：</label><input id="pass" name="password"
					type="password" placeholder="密码(不少于6个字符)" />
			</div>
			<div class="repassword">
				<label>确认密码:</label><input id="repassword" name="surepassword"
					type="password" />
					
			</div>
	 		<div class="img">
				<label>上传头像：</label>
					<div class="edit">
						 <!-- 加载编辑器的容器 -->
			    	<script id="container" name="content" type="text/plain">
        				
   					 </script>
					<!-- 实例化编辑器 -->
					<script type="text/javascript">
					UE.getEditor('container',{
			            //这里可以选择自己需要的工具按钮名称,
			            toolbars:[['fullscreen','simpleupload']],
			           
			            //focus时自动清空初始化时的内容
			            autoClearinitialContent:true,
			            //关闭字数统计
			            wordCount:true,
			            //关闭elementPath
			            elementPathEnabled:true,
			            //默认的编辑区域宽高
			            initialFrameHeight:230,
			            initialFrameWidth:300 ,
			            scaleEnabled:true 
			            //更多其他参数，请参考ueditor.config.js中的配置项
			        });
					</script>
					</div> 
					   
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
				<input onclick="validateCode();" type="submit"
						id="submit" value="提交"/>
			</div>
		</form>
		<!-- End Form -->
	</div>

	<!--页尾信息-->
	<div id="footer" class="">
		<p><a href="${ctx }/connect_us.jsp">联系我们</a> | <a href="${ctx }/talent_recruitment.jsp">人才招聘</a> | <a href="${ctx }/Teachers' cooperation.jsp">教师合作</a> | <a href="${ctx }/project_introduction.jsp">项目介绍</a></p>
        <p>版权所有：猿计划项目小组</p>
	</div>
	</div>
	<script type="text/javascript">
		window.onload=createCode;
	</script>

</body>
</html>