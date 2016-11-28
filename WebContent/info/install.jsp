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
    <script src="${ctx }/js/install.js"></script>
    <!--验证码-->
    <script src="${ctx }/js/yanzheng.js"></script>
    <!--二级菜单-->
    <script src="${ctx }/js/nav.js"></script>
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

            <div id="search">
                <input type="text" class="text"/>
                <a href="search.html"><img src="${ctx }/images/search.png"></a>
            </div>
            <div id="username">
                <p>用户名</p>
            </div>
            <div class="nav" id="nav">
                <ul>
                    <li onmousemove="showsub(this)" onmouseout="hidesub(this)"><a href="#"><img src="${ctx }/images/123.png"></a>
                        <ul>
                            <li><a href="${ctx }/usermessage.jsp">个人信息</a></li>
                            <li><a href="${ctx }/install.jsp">设置</a></li>
                            <li><a href="${ctx }/index_before.jsp">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
        <!--内容-->
        <div class="" id="content">
            <!-- Begin Form -->
            <form id="my-form">
                <div class="username"><label>用户名：</label><div class="username1"><p>田瑞航</p></div></div>
                <div class="alter"><label>旧密码：</label><input id="alter" name="" type="text"></div>
                <div class="password"><label>新密码：</label><input id="pass" name="password" type="password"/></div>
                <div class="repassword"><label>确认密码：</label><input id="surepass" name="surepassword" type="password"/></div>
                <div class="img"><label>头&nbsp;&nbsp;像：</label>
                <img src="${ctx }/images/123.png" height="90px" width="90px" style="border: 1px solid #ffffff;border-radius: 50%;"><input id="file" name="file" multiple type="file"/></div>
                <div class="">
                    <table border="0" cellspacing="5" cellpadding="5" >
                         <tr>
                            <td class="yanzhengma">验证码：</td><td><input  style="float:left;" type="text"   id="inputCode" /></td><td></td>
                        </tr>
                        <tr>
                           <td> <div class="code" id="checkCode" onclick="createCode()" ></div></td>
                            <td><a  href="#" onclick="createCode()" class="href">看不清换一张</a></td>
                        </tr>
                       
                        <tr><td><input id="Button1"  onclick="validateCode();" type="button" value="确定" /></td><td></td>
                        </tr>
                    </table>
                </div>
                <div id="submitreset">
                    <button type="submit" id="submit">提交</button>
                </div>
            </form>
            <!-- End Form -->
        </div>
        
        <!--页尾信息-->
        <div id="footer" class="">
            <p><a href="${ctx }/about_us.jsp">联系我们</a> | <a href="${ctx }/about_us.jsp">人才招聘</a> | <a href="${ctx }/about_us.jsp">教师合作</a> | <a href="${ctx }/about_us.jsp">项目介绍</a></p>
            <p>版权所有：猿计划项目小组</p>
        </div>
    </div>

</body>
</html>