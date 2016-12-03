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
					<div class="login">
                    	<a href="${ctx }/login_use.jsp"><button>登录</button></a>&nbsp;|
						<a href="${ctx }/register.jsp"><button>注册</button></a>
                    </div>
                    
                    <div class="after_login">
                    	<div id="username">
                            <p>${student.loginName }</p>
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
        <p>Global warming may or may not be the great environmental crisis of the 21st century, but regardless of whether it is or isn’t –we won’t do much about it.  We will argue over it and may even, as a nation, make some fairly solemn-sounding commitments to avoid it. But the more dramatic and meaningful these commitments seem, the less likely they are to be observed. </p><p>Al Gore calls global warming an “inconvenient truth,” as if merely recognizing it could put us on a path to a solution. But the real truth is that we don’t know enough to relieve global warming, and –without major technological breakthroughs—we can’t do much about it. </p><p>From 2003 to 2050, the world’s population is projected to grow from 6.4 billion to 9.1 billion, a 42% increase. If energy use per person and technology remain the same, total energy use and greenhouse gas emissions (mainly, CO2) will be 42% higher in 2050. but that’s too low, because societies that grow richer use more energy. We need economic growth unless we condemn the world’s poor to their present poverty and freeze everyone else‘s living standards. With modest growth, energy use and greenhouse emissions more than double by 2050. </p><p>No government will adopt rigid restrictions on economic growth and personal freedom (limits on electricity usage, driving and travel) that might cut back global warming. Still, politicians want to show they’re “doing something.” Consider the Kyoto Protocol (京都议定书). It allowed countries that joined to punish those that didn’t. But it hasn’t reduced CO2 emissions (up about 25% since 1990), and many signatories (签字国) didn’t adopt tough enough policies to hit their 2008-2012 targets. </p><p>The practical conclusion is that if global warming is a potential disaster, the only solution is new technology. Only an aggressive research and development program might find ways of breaking dependence on fossil fuels or dealing with it. </p><p>The trouble with the global warming debate is that it has become a moral problem when it’s really an engineering one. The inconvenient truth is that if we don’t solve the engineering problem, we’re helpless.</p>
      </div>
      <div id="r2">
          <p><span>60. The author believes that, since the signing of the Kyoto Protocol, ________. </span></p>
          <div id="r2l"> 

          <p><span> <input type="radio" name=""> A) politicians have started to do something to better the situation </span></p>

          </div>
          <div id="r2l"> 

          <p><span> <input type="radio" name=""> B) few nations have adopted real tough measures to limit energy use  </span></p>

          </div>
          <div id="r2l"> 

          <p><span> <input type="radio" name=""> C) reductions in energy consumption have greatly cut back global warming  </span></p>

          </div>
           <div id="r2l"> 

          <p><span> <input type="radio" name=""> D) international cooperation has contributed to solving environmental problems</span></p>

          </div>
      </div>
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