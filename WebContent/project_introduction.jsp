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
    </head>
    <body>
     <!-- header-->
        <div>
            <div class="header">
                <div class="logo"> <a href="${ctx }/index_before.jsp"><img src="${ctx }/images/logo.png"/></a></div>
                <div class="search">
                <input type="text" class="text"/>
                <a href="${ctx }/search.jsp"><input type="submit" class="button" value="搜索"/></a>
                </div>
                <div class="login">
                    	<a href="${ctx }/login_use.jsp"><button>登录</button></a>&nbsp;|
						<a href="${ctx }/register.jsp"><button>注册</button></a>
                    </div>
                    
                    <div class="after_login">
                    	<div id="username">
                            <p>用户名</p>
                        </div>
                        <div class="nav" id="nav">
                            <ul>
                                <li onmousemove="showsub(this)" onmouseout="hidesub(this)"><a href="#"><img src="${ctx }/images/leftuser.jpg"></a>
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
                <li><a href="${ctx }/index_before.jsp">网站首页</a></li>
                <li><a href="${ctx }/category.jsp">大学英语四级</a></li>
                <li><a href="${ctx }/category.jsp">大学英语六级</a></li>
                <li><a href="${ctx }/arena.jsp">竞技场</a></li>
                <li class="current"><a href="${ctx }/about_us.jsp">关于我们</a></li>
                </ul>
            </div>
    	</div>
        <!--面包屑-->
        <div class="breadcrumb">
            <a href="${ctx }/index_before.jsp">首页</a>>>关于我们
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
                	<font style="font-size:20px;font-weight:bold;">项目介绍</font>
                </div>
                <div class="wenzhang_content">
                    <p style="text-align:left;line-height:1.5em;text-indent:2em;margin:0px 0px 10px">
                       	<h3>项目名称</h3>&nbsp;&nbsp;&nbsp;&nbsp;巨人英语
     					<h3>项目的提出方</h3>&nbsp;&nbsp;&nbsp;&nbsp;猿计划项目小组
						<h3>项目目标</h3>&nbsp;&nbsp;&nbsp;&nbsp;为学习英语的同学提供一个学习的平台。
						<h3>项目成员</h3>&nbsp;&nbsp;&nbsp;&nbsp;孙永国、田瑞航、童海苹、孙晓辉、李翘楚、翟佳帆
						<h3>版权声明</h3>
							&nbsp;&nbsp;&nbsp;&nbsp;1、本网站所有内容，凡注明"来源：巨人英语网"的所有文字、图片、页面的版式、和音视频资料，版权均属巨人英语网所有，任何媒体、网站或个人未 经本网协议授权不得转载、链接、转贴或以其他方式复制发布、发表。已经本网协议授权的媒体、网站，在下载使用时必须注明"稿件来源 ——考试在线网 "，违者本网将依法追究责任。<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;2、本网站（考试在线网）授权您使用的网络课程等内容，仅限您个人使用不得用于任何商业用途。对于原始内容中所注明的版权及所有权声明 ，您必须在其副本中予以保留，您不得以任何方式修改、复制、公开展示、公布或分发这些材料或以其他方式把它们用于任何公开或商业 目的，禁止以任何目的或形式把这些材料用于其他任何网站或网络计算机环境。<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;3、转载或引用本网版权所有之内容须注明"转自（或引自）巨人英语网"字样，并标明本网网址gaintenglish.com。<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;4、对于不当转载或引用本网内容而引起的民事纷争、行政处理或其他损失，本网不承担责任。<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;5、对不遵守本声明或其他违法、恶意使用本网内容者，本网保留追究其法律责任的权利。<br/>
                     </p>        
                 </div>   
             </div>
		</div>
        <!--footer-->
       <div id="footer">
  	         <p><a href="${ctx }/connect_us.jsp">联系我们</a> | <a href="${ctx }/talent_recruitment.jsp">人才招聘</a> | <a href="${ctx }/Teachers' cooperation.jsp">教师合作</a> | <a href="${ctx }/project_introduction.jsp">项目介绍</a></p>
             <p>版权所有：猿计划项目小组</p>
        </div>
	</body>
</html>