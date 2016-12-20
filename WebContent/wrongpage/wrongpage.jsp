<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
<link href="${ctx }/css/index.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/wrongpage.css">
<script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js" /></script>
<script src="${ctx }/js/index.js"></script>
<script src="${ctx }/js/nav.js"></script>
<script type="text/javascript" src="${ctx }/js/login.js"></script>
<script type="text/javascript" src="${ctx }/js/header.js"></script>
<script src="${ctx }/js/wrongpage2.js"></script>
<script src="${ctx }/js/wrongpage3.js"></script>
<script type="text/javascript">
	//搜索
	function searchp() {
		var p = $("#searchParam").val();
		window.location.href = "${ctx }/error/collect?searchParam=" + p
				+ "&isCollect=${isCol }";
		$("[name='pagen']").each(
				function(key, value) {
					$(this).attr("href",
							$(this).attr("href") + "&searchParam='" + p + "'");
				});
	}
</script>
<title>错题本</title>
<style type="text/css">
#r2l1 {
	color: red;
	font-size: 15px;
}
</style>
<script type="text/javascript">
	var str = '${submitt}';
	window.onload = function changStyle() {
		if ("on" == str) {
			var log = document.getElementById("subm");
			log.style.display = "none";
		}
	}
	function isDelet() {
		alert("您已将此题成功从错题本中删除！");
	}
	function collected() {
		alert("收藏成功！");
	}
</script>
</head>
<body>
	<div class="body">
		<div>
			<div class="header">
				<div class="logo">
					<a href="${ctx }/"><img src="${ctx }/images/logo.png" /></a>
				</div>
				<div class="search">
					<input type="text" class="text" id="searchParam" name="searchParam"
						value="${searchParam }" /> <input type="submit" class="button"
						value="搜索" onclick="searchp();return false;" />
				</div>
				<div class="login" style="display: none">
					<a href="${ctx }/login_use.jsp"><button>登录</button></a>&nbsp;| <a
						href="${ctx }/register.jsp"><button>注册</button></a>
				</div>

				<div class="after_login" style="display: block">
					<div id="username">
						<p>${student.loginName }</p>
					</div>
					<div class="nav" id="nav">
						<ul>
							<li onmousemove="showsub(this)" onmouseout="hidesub(this)">
								<a href="#"> <c:if test="${empty student.url}">
										<img src="${ctx }/images/photo.jpg" />
									</c:if> <c:if test="${!empty student.url}">
		                              		${student.url}
										</c:if>
							</a>
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
		<form
			action="${ctx }/error/comment?examId=${exId }&parentQuestionId=${pque.parentQuestionId }"
			method="post">
			<div class="content">
				<div id="elButton">
					<div id="r32">
						<p>变量名等多种属性的具体规定。当用户输入满足input元素的规定时，则接收输入信息，并赋给指定的变量灵活进行相应的操作、处理；否则，就通过浏览器给出具体的处理意见，并进行是单个输入处理或变量初始化操作</p>
						<br /> <input type="button" name="close" value="关闭" id="r33">
					</div>
					<!-- 获取当前所需的函数 js转移到别的地方就出错，只能放在这-->
					<script>
						if (document.all || document.getElementById) {
							jump = (document.getElementById) ? document
									.getElementById("jumpx")
									: document.all.jumpx
							jump0()
						} else
							document.write(message)
					</script>
				</div>
				<div id="right2">

					<c:choose>
						<c:when test="${pque.parentQuestionName=='QuickReading' }">
							<div id="r1">
								<p>${pque.parentQuestionArticle } </p>
							</div>
							<c:forEach items="${pque.questions }" var="qs">
								<div id="r2">
									<p>
										<span>${qs.questionContent } </span>
									</p>
									<input type="text" name="ques${qs.questionId }" />

									<%--答案及解析 --%>
									<br>
									<c:if test="${submitt=='on' }">
										<div name="r2l" id="r2la">
											<ul>
												<c:forEach items="${anws }" var="anw">

													<c:if test="${anw.key ==qs.questionId }">

														<li id="r2l1">您的答案：${anw.value }</li>

													</c:if>
												</c:forEach>

												<li id="r2l1">正确答案：${qs.questionAnswer }</li>
												<li id="r2l2">解析：${qs.questionExplain }</li>
											</ul>
										</div>
									</c:if>
								</div>
							</c:forEach>
						</c:when>
						<c:when
							test="${pque.parentQuestionName=='LastReadingOne'||pque.parentQuestionName=='LastReadingTwo'||pque.parentQuestionName=='ChooseFillInBlank' }">
							<div id="r1">
								<p>${pque.parentQuestionArticle } </p>
							</div>
							<c:forEach items="${pque.questions }" var="qs">
								<div id="r2">
									<p>
										<span>${qs.questionContent } </span>
									</p>
									<c:forEach items="${qs.selectts }" var="se">
										<div id="r2l">
											<p>
												<span> <input type="radio" value="${se.selecttName }"
													name="ques${qs.questionId }"> ${se.selecttName }) ${se.selecttContent }  
												</span>
											</p>
										</div>
									</c:forEach>
									<%--答案及解析 --%>
									<br>
									<c:if test="${submitt == 'on' }">
										<div name="r2l" id="r2la">
											<ul>
											<c:forEach items="${anws }" var="anw">

												<c:if test="${anw.key == qs.questionId }">
													<li id="r2l1">您的答案：${anw.value }</li>
												</c:if>
											</c:forEach>
											
											<li id="r2l1">正确答案：${qs.questionAnswer }</li> 
											<li id="r2l2">解析：${qs.questionExplain }</li>
											</ul>
										</div>
									</c:if>
								</div>
							</c:forEach>
						</c:when>


						<c:when
							test="${pque.parentQuestionName=='ListeningComprehensionOne'
	                                    ||pque.parentQuestionName=='ListeningComprehensionTwo'
	                                    ||pque.parentQuestionName=='ListeningComprehensionThree'
	                                    ||pque.parentQuestionName=='ListeningComprehensionFour'
	                                    ||pque.parentQuestionName=='ListeningComprehensionFive'
	                                    ||pque.parentQuestionName=='ListeningComprehensionSix'
	                                    ||pque.parentQuestionName=='ListeningComprehensionText'}">
	                                  
	                         <center>
                            <div>
								<iframe scrolling="auto" rameborder="0" src="${ctx }/AudioPlayer/index.jsp"
								name="right" width="500px" height="170px" frameborder="0"></iframe>
							</div>
							</center>
	                                    
							<c:forEach items="${pque.exam.parentQuestions }"
								var="parentQuestion">
								<c:choose>
									<c:when
										test="${parentQuestion.parentQuestionName=='ListeningComprehensionOne'
                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionFour'}">
										<div id="r1">
											<h2>${parentQuestion.parentQuestionName }</h2>
											<h5>共${fn:length(parentQuestion.questions)}题</h5>
											<p>${parentQuestion.description}</p>
											<p>${parentQuestion.parentQuestionTitle }</p>
										</div>
										<c:forEach items="${parentQuestion.questions }" var="qs">
											<div id="r2">
												<p>
													<span>${qs.questionContent } </span>
												</p>
												<c:forEach items="${qs.selectts }" var="se">
													<div id="r2l">
														<p>
															<span> <input type="radio"
																value="${se.selecttName }" name="ques${qs.questionId }">
																${se.selecttName }) ${se.selecttContent }  
															</span>
														</p>
													</div>
												</c:forEach>
												<%--答案及解析 --%>
												<br>
												<c:if test="${submitt == 'on' }">
													<div name="r2l" id="r2la">
														<ul>
														<c:forEach items="${anws }" var="anw">

															<c:if test="${anw.key == qs.questionId }">
																<li id="r2l1">您的答案：${anw.value }</li>
															</c:if>
														</c:forEach>
														<li id="r2l1">正确答案：${qs.questionAnswer }</li>
														 <li id="r2l2">解析：${qs.questionExplain }</li>
														 </ul>
													</div>
												</c:if>
											</div>
										</c:forEach>
									</c:when>

									<c:when
										test="${parentQuestion.parentQuestionName=='ListeningComprehensionTwo'
		                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionThree'
		                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionFive'
		                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionSix'}">
										
										<div id="r1">
											<h2>${parentQuestion.parentQuestionName }</h2>
											<h5>共${fn:length(parentQuestion.questions)}题</h5>
											<p>${parentQuestion.description}</p>
											<p>${parentQuestion.parentQuestionTitle }</p>
										</div>
										
											<c:forEach items="${parentQuestion.questions }" var="qs">
												
												<div id="r2">
													<p>
														<span>${qs.questionContent } </span>
													</p>
													<c:forEach items="${qs.selectts }" var="se">
														<div id="r2l">
															<p>
																<span> <input type="radio"
																	value="${se.selecttName }" name="ques${qs.questionId }">
																	${se.selecttName }) ${se.selecttContent }  
																</span>
															</p>
														</div>
													</c:forEach>
													<%--答案及解析 --%>
													<br>
													<c:if test="${submitt == 'on' }">
														<div name="r2l" id="r2la">

															<ul>
															<c:forEach items="${anws }" var="anw">
																<c:if test="${anw.key == qs.questionId }">
																	<li id="r2l1">您的答案：${anw.value }</li>
																</c:if>
															</c:forEach>
															<li id="r2l1">正确答案：${qs.questionAnswer }</li> 
															<li id="r2l2">解析：${qs.questionExplain }</li>
															</ul>
														</div>
													</c:if>
												</div>
											</c:forEach>

										
									</c:when>
									
									
									 <c:when test="${parentQuestion.parentQuestionName=='ListeningComprehensionText'}">
		                                    <div id="r1">
												<h2>${parentQuestion.parentQuestionName }</h2>
												<h5>共${fn:length(parentQuestion.questions)}题</h5>
												<p>${parentQuestion.description}</p>
												<p>${parentQuestion.parentQuestionTitle }</p>
											</div>	
		                                    	
		                              			<table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
			                                    	<thead>
			                                        	<tr>
			                                                <td class="tm_question_lineheight">
															</td>
			                                            </tr>
			                                        </thead>
			                                        <tbody>
			                                        	<tr>
			                                            	<td colspan="2">
				                                            	<p style="line-height:30px; font-size:16px; margin:0 20px 0 20px;">${parentQuestion.parentQuestionArticle}</p><br/>
				                                            	<c:forEach items="${parentQuestion.questions}" var="qust" varStatus="status">
				                                            	<span class="span-quick-nav" data-qid="${qust.questionId}"></span>
				                                            		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(${qust.questionContent}) <input type="text" name="ques${qs.questionId }" data-qid="${qs.questionId}" 
				                                            		class="validate[required] tm_txt qk-blank"/>
			                                    					<c:if test="${status.count % 4 == 0}">
			                                    						<br/><br/>
			                                    					</c:if>
			                                    				</c:forEach>
			                                    			</td>
			                                    		</tr>
			                                    		
			                                    	</tbody>
			                                    </table>
		                              
		                              </c:when>
									
									

								</c:choose>
							</c:forEach>
						</c:when>


					</c:choose>
					<div id="r3">
						<input type="submit" id="subm" value="提交" class="s1">&nbsp;
						
						<a href="${ctx }/error/collect?isCollect=0"><input type="button" id="butt" value="返回"/></a>
						
						<div id="r3r">
							
							<a
								href="${ctx }/error/setCollect?examId=${exId }&parentQuestionId=${pque.parentQuestionId }"
								onclick="collected();"><img src="${ctx }/images/save.png"></a>
							<a
								href="${ctx }/error/delete?examId=${exId }&parentQuestionId=${pque.parentQuestionId }"
								onclick="isDelet();"><img src="${ctx }/images/delete.png"></a>
							
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="footer">
		<p>
			<a href="${ctx }/connect_us.jsp">联系我们</a> | <a
				href="${ctx }/talent_recruitment.jsp">人才招聘</a> | <a
				href="${ctx }/Teachers' cooperation.jsp">教师合作</a> | <a
				href="${ctx }/project_introduction.jsp">项目介绍</a>
		</p>
		<p>版权所有：猿计划项目小组</p>
	</div>
	</div>
</body>
</html>