<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>重置密码</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/css/install.css">
    <script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js"/></script>
    <script src="${ctx }/js/header.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx }/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx }/ueditor/ueditor.all.min.js"> </script>
    <!--验证码-->
    <script src="${ctx }/js/yanzheng.js"></script>
    <script src="${ctx }/js/install.js"></script>
    <!--二级菜单-->
    <script src="${ctx }/js/nav.js"></script>
    <script src="${ctx }/js/reset.js"></script>
    <script type="text/javascript">
    function checkOldPwd(){
    	var val = document.getElementById("oldPwd").value;
    	$.get("${ctx }/loginuser/checkOldPwd",{'oldPwd':val},function(data){
    		if("yes"==data){
    			
    		} else if("no"==data){
    			alert("旧密码错误！");
    		} 
    	});
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
					<li class="current"><a href="index.html">网站首页</a></li>
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
        <!--内容-->
        <div class="content">
            <form class="form" action="${ctx }/loginuser/resetPwd" method="post" onsubmit="return check(this)">
            	<table>
            		<tr>
            			<td><label>用户名：</label></td>
            			<td><label name="username">${student.loginName }</label></td>
            		</tr>
            		<tr>
            			<td><label>旧密码：</label></td>
            			<td><input id="oldPwd" name="oldPwd" type="password" onblur="checkOldPwd();"/></td>
            		</tr>
            		<tr>
            			<td><label>新密码：</label></td>
            			<td><input id="password" name="password" type="password" placeholder="密码(不少于6个字符)"/></td>
            		</tr>
            		<tr>
            			<td><label>确认密码：</label></td>
            			<td><input name="surepassword" type="password"/></td>
            		</tr>
            		<tr>
            			<td><label>头像：</label></td>
            			<td>
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
			            initialFrameWidth:400 
			            //更多其他参数，请参考ueditor.config.js中的配置项
			        });
					</script>
            			</td>
            		</tr>
            		<tr>
            			<td class="yanzhengma">验证码：</td>
            			<td><input style="float:left;" type="text"   id="inputCode" /><div class="code" id="checkCode" onclick="createCode()" ></div><a  id="look" href="#" onclick="createCode()" class="href">看不清换一张</a></td>
            		</tr>
            	</table>
                    <input type="submit" id="submit" value="提交" onclick="validateCode();"/>
            </form>
        </div>
        
        <!--页尾信息-->
        <div id="footer" class="">
            <p><a href="${ctx }/about_us.jsp">联系我们</a> | <a href="${ctx }/about_us.jsp">人才招聘</a> | <a href="${ctx }/about_us.jsp">教师合作</a> | <a href="${ctx }/about_us.jsp">项目介绍</a></p>
            <p>版权所有：猿计划项目小组</p>
        </div>
    </div>

	<script type="text/javascript">
		window.onload=createCode;
	</script>
</body>
</html>