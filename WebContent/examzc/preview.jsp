<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>试卷预览</title>
		<link rel="stylesheet" href="${ctx }/css/validationEngine.jquery.css">
		<link rel="stylesheet" type="text/css" href="${ctx }/css/style.css">
		<script src="${ctx }/js/jquery.js" type="text/javascript"></script>
		<style>
			.div-key-container{margin:5px 25px; border:dotted 1px #ddd; padding:5px;}
			.div-key-container span{font-weight:bold}
			.after_tested{
				background-color:#008B8B;
				color:#fff;
			}
		</style>
	</head>
  
<body marginwidth="0" marginheight="0">

	<div class="tm_main">
		<div class="start">
        	<form>
        		<a href="${ctx }/examonline/exam?examId=${exam.examId}"><input type="button" value="开始考试"/></a>
        		<a href="${ctx }/examonline/list?examType=${exam.examType}"><input type="button" value="返回"/></a>
        	</form>
        	<c:if test="${tested=='on'}">
        	<div class="after_tested">
			您该次考试客观题得分为：
			<div style="font-size:30px;color:red;">${mark}分</div>
			</div>
			</c:if>
        </div>
    	
		<div class="tm_container">
			<ul class="tm_breadcrumb">
				<li><a href="${ctx }/">首页</a> <span class="divider">&gt;</span></li>
				<li><a href="${ctx }/examonline/list?examType=${exam.examType}">在线自测</a> <span class="divider">&gt;</span></li>
				<li class="active">试卷预览</li>
			</ul>
		</div>
        
        <div class="tm_container">

			<table border="0" width="100%" cellpadding="0" style="min-width:860px;">
				<tbody><tr>
					<!-- left -->
					<td valign="top">
						<form method="post" id="form_paper_detail">
                    	<div class="tm_paper">
                            <div class="tm_paper_head">
                                <h1>${exam.examName}</h1>
								<h2 style="background:#AFEEEE; padding:5px 0; font-size:14px; font-weight:bold">
									试卷信息
								</h2>
                                <h2>
									<b>考试时长</b> : 130 分钟
									&nbsp;&nbsp;
									<b>卷面总分</b> : 710分
								</h2>
                            </div>

                            <div class="tm_paper_body">
                            	<c:forEach items="${exam.parentQuestions }" var="parentQuestion">
                            	<c:choose>
                            	<c:when test="${parentQuestion.parentQuestionName=='Writing'}">
                            	<div class="tm_paper_section">
                                	<h1>${parentQuestion.parentQuestionName }</h1>
                            		<h2>共${fn:length(parentQuestion.questions)}题</h2>
                            		
                            		<h3>&nbsp;&nbsp;&nbsp;&nbsp;${parentQuestion.description}</h3>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">            
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                            		${parentQuestion.imgUrl}
                                                        <ul>
                                                        	<c:forEach items="${parentQuestion.questions}" var="qust">
															<span class="span-quick-nav" data-qid="${qust.questionId}"></span>
                                                            <li><label><textarea class="validate[required] tm_txt qk-blank" data-qid="${qust.questionId}" 
                                                            name="Q-${qust.questionId}" rows="20" cols="100" disabled="true"></textarea>
															</label></li>
															</c:forEach>
                                                		</ul>
                                                </td>
                                            </tr>
                                            <c:if test="${tested=='on'}">
                                            <tr class="after_tested">
                                            	<td colspan="2">
                                            	<ul>
                                            		<c:forEach items="${parentQuestion.questions}" var="qust">
                                            		
                                            			<b>范文：</b>
                                            			<li><label>${qust.questionExplain}</label></li>
                                            		</c:forEach>
                                            	</ul>
                                            	
                                            	</td>
                                            </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    </div>
                                    </c:when>
                                    
                                    <c:when test="${parentQuestion.parentQuestionName=='ListeningComprehensionOne'
                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionTwo'
                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionThree'
                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionFour'
                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionFive'
                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionSix'
                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionText'}">
                                    <div class="tm_paper_section">
                                	<h1>${parentQuestion.parentQuestionName }</h1>
                                    <h2>共${fn:length(parentQuestion.questions)}题</h2>
                                    <c:choose>
                                    <c:when test="${parentQuestion.parentQuestionName=='ListeningComprehensionOne'
                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionFour'}">
									<h3>&nbsp;&nbsp;&nbsp;&nbsp;${parentQuestion.description}</h3>
									<h3>${parentQuestionTitle}</h3>
									
									<c:forEach items="${parentQuestion.questions }" var="question">
									<span class="span-quick-nav" data-qid="${question.questionId}"></span>
                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>${question.questionContent}</cite></th>
                                                <td class="tm_question_lineheight">
													
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                
                                                    
                                                        <ul>
                                                        	<c:forEach items="${question.selectts }" var="select">
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="${select.selecttName}" 
                                                            data-qid="${question.questionId}" name="Q-${question.questionId}" disabled="true"/>
																${select.selecttName} ${select.selecttContent}</label></li>
                                    						</c:forEach>
                                                        </ul>
                                                </td>
                                            </tr>
                                            <c:if test="${tested=='on'}">
                                            <tr class="after_tested">
                                            	<td colspan="2">
                                            		<ul>
                                            			<c:forEach items="${an}" var="an">
                                            			<c:if test="${an.key ==question.questionId }">
                                            			<li><label style="color:yellow;"><b>您的答案：</b>${an.value}</label></li>
                                            			</c:if>
                                            			</c:forEach>
                                            			<li><label style="color:red;"><b>答案：</b>${question.questionAnswer}</label></li>
                                            			<li><label><b>解析：</b>${question.questionExplain}</label></li>
                                            		</ul>
                                            	</td>
                                            </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    </c:forEach>
                                    </c:when>
                                    <c:when test="${parentQuestion.parentQuestionName=='ListeningComprehensionTwo'
                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionThree'
                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionFive'
                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionSix'}">
                                    <h3>${parentQuestionTitle}</h3>
									
									<c:forEach items="${parentQuestion.questions }" var="question">
									<span class="span-quick-nav" data-qid="${question.questionId}"></span>
                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>${question.questionContent}</cite></th>
                                                <td class="tm_question_lineheight">
													
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                        <ul>
                                                        	<c:forEach items="${question.selectts }" var="select">
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="${select.selecttName}" 
                                                            data-qid="${question.questionId}" name="Q-${question.questionId}" disabled="true"/>
																${select.selecttName} ${select.selecttContent}</label></li>
                                    						</c:forEach>
                                                        </ul>
                                                </td>
                                            </tr>
                                            <c:if test="${tested=='on'}">
                                            <tr class="after_tested">
                                            	<td colspan="2">
                                            		<ul>
                                            			<c:forEach items="${an}" var="an">
                                            			<c:if test="${an.key ==question.questionId }">
                                            			<li><label style="color:yellow;"><b>您的答案：</b>${an.value}</label></li>
                                            			</c:if>
                                            			</c:forEach>
                                            			<li><label style="color:red;"><b>答案：</b>${question.questionAnswer}</label></li>
                                            			<li><label><b>解析：</b>${question.questionExplain}</label></li>
                                            		</ul>
                                            	</td>
                                            </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    </c:forEach>
                                    </c:when>
                                    <c:when test="${parentQuestion.parentQuestionName=='ListeningComprehensionText'}">
                                    <b>&nbsp;&nbsp;&nbsp;&nbsp;${parentQuestion.description}</b>
		
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
			                                            		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(${qust.questionContent}) <input type="text" name="Q-${qust.questionId}" data-qid="${qust.questionId}" 
			                                            		class="validate[required] tm_txt qk-blank" disabled="true"/>
		                                    					<c:if test="${status.count % 4 == 0}">
		                                    						<br/><br/>
		                                    					</c:if>
		                                    				</c:forEach>
		                                    			</td>
		                                    		</tr>
		                                    		<c:if test="${tested=='on'}">
		                                    		<tr class="after_tested">
		                                            	<td colspan="2">
		                                            		<ul>
		                                            			<c:forEach items="${parentQuestion.questions}" var="qust" varStatus="status">
		                                            			
		                                            			<li><label>(${qust.questionContent})</label></li>
		                                            			<c:forEach items="${an}" var="an">
		                                            			<c:if test="${an.key ==qust.questionId }">
		                                            			<li><label style="color:yellow;"><b>您的答案：</b>${an.value}</label></li>
		                                            			</c:if>
		                                            			</c:forEach>
		                                            			<li><label style="color:red;"><b>答案：</b>${qust.questionAnswer}</label></li>
		                                            			<li><label><b>解析：</b>${qust.questionExplain}</label></li>
		                                            			</c:forEach>
		                                            		</ul>
		                                            	</td>
		                                            </tr>
		                                            </c:if>
		                                    	</tbody>
		                                    </table>
                                    </c:when>
                                    </c:choose>
                                </div>
                                    </c:when>
                                    <c:when test="${parentQuestion.parentQuestionName=='ChooseFillInBlank'
                                    ||parentQuestion.parentQuestionName=='QuickReading'
                                    ||parentQuestion.parentQuestionName=='LastReadingOne'
                                    ||parentQuestion.parentQuestionName=='LastReadingTwo'}">
                                    <div class="tm_paper_section">
                                    <h1>${parentQuestion.parentQuestionName }</h1>
                                    <h2>共${fn:length(parentQuestion.questions)}题</h2>
                                    <c:choose>
                                    <c:when test="${parentQuestion.parentQuestionName=='ChooseFillInBlank'}">
											<h3>${parentQuestion.description}</h3>
		
		                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
		                                    	<thead>
		                                        	<tr>
		                                                <td class="tm_question_lineheight"></td>
		                                            </tr>
		                                        </thead>
		                                        <tbody>
		                                        	<tr>
		                                            	<td colspan="2">
		                                            		<ul style="margin-bottom:20px">
		                                            			<li>
		                                            				<p style="line-height:30px; font-size:16px; margin:0 20px 0 20px;">${parentQuestion.parentQuestionArticle}</p>
		                                            			</li>
		                                            		</ul>
		                                            		 <div class="list">
			                                                	<ul style="border:1px solid #000; width:600px; height:100px; margin-left:200px; margin-bottom:30px">
			                                                		<c:forEach items="${parentQuestion.questions}" begin="0" end="0" var="qust">
				                                                		<c:forEach items="${qust.selectts}" var="selt" varStatus="status">
			                                                				<li style="float: left; width: 100px; margin:5px 20px 5px 0;">${selt.selecttName}) ${selt.selecttContent}</li>
			                                                				<c:if test="${status.count % 5 == 0}">
					                                    						<br/><br/>
					                                    					</c:if>
			                                                			</c:forEach>
			                                                		</c:forEach>
			                                                	</ul>
			                                                </div>    
		                                                </td>
		                                            </tr>
		                                            <tr>
		                                            	<td colspan="2">
			                                            	<c:forEach items="${parentQuestion.questions}" var="qust" varStatus="status">
			                                            		<span class="span-quick-nav" data-qid="${qust.questionId}"></span>
			                                            		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(${qust.questionContent}) <input type="text" name="Q-${qust.questionId}" data-qid="${qust.questionId}" 
			                                            		class="validate[required] tm_txt qk-blank" disabled="true" style="width:100px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                    					<c:if test="${status.count % 5 == 0}">
		                                    						<br/><br/>
		                                    					</c:if>
		                                    				</c:forEach>
		                                    			</td>
		                                    		</tr>
		                                    		<c:if test="${tested=='on'}">
		                                    		<tr class="after_tested">
	                                            	<td colspan="2">
	                                            		<ul>
	                                            			<c:forEach items="${parentQuestion.questions}" var="qust" varStatus="status">
	                                            			
	                                            			<li><label>(${qust.questionContent})</label></li>
	                                            			<c:forEach items="${an}" var="an">
	                                            			<c:if test="${an.key ==qust.questionId }">
	                                            			<li><label style="color:yellow;"><b>您的答案：</b>${an.value}</label></li>
	                                            			</c:if>
	                                            			</c:forEach>
	                                            			<li><label style="color:red;"><b>答案：</b>${qust.questionAnswer}</label></li>
	                                            			<li><label><b>解析：</b>${qust.questionExplain}</label></li>
	                                            			</c:forEach>
	                                            		</ul>
	                                            	</td>
	                                               </tr>
	                                               </c:if>
		                                        </tbody>
		                                    </table>
		                                    
                                    	</c:when>
                                    	<c:when test="${parentQuestion.parentQuestionName=='QuickReading'}">
                                    		<h3>${parentQuestion.description}</h3>
											<div style="width:1000px;overflow:auto">
												<h3 style="text-align:center;">${parentQuestion.parentQuestionTitle}</h3>
                                               	<p style="line-height:30px; font-size:16px; margin:0 20px 0 20px;">${parentQuestion.parentQuestionArticle}</p>
                                            </div>
                                            <c:forEach items="${parentQuestion.questions}" var="qust">
												<span class="span-quick-nav" data-qid="${qust.questionId}"></span>
			                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
			                                    	<thead>
			                                        	<tr>
			                                                <td class="tm_question_lineheight" style="font-size:14px; width:900px;">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${qust.questionContent}&nbsp;&nbsp;<input type="text" name="Q-${qust.questionId}" data-qid="${qust.questionId}" 
																class="validate[required] tm_txt qk-blank" disabled="true" style="width:35px;"/>                                                
															</td>
			                                            </tr>
			                                        </thead>
			                                        <tbody>
			                                        	<c:if test="${tested=='on'}">
			                                        	<tr class="after_tested">
			                                            	<td colspan="2">
			                                            	<ul>
			                                            		<c:forEach items="${an}" var="an">
		                                            			<c:if test="${an.key ==qust.questionId }">
		                                            			<li><label style="color:yellow;"><b>您的答案：</b>${an.value}</label></li>
		                                            			</c:if>
		                                            			</c:forEach>
					                                            		<li><label style="color:red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>答案：</b>${qust.questionAnswer}</label></li>
																<li><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>解析：</b>${qust.questionExplain}</label></li>
															</ul>
			                                            	</td>
			                                            </tr>
			                                            </c:if>
			                                        </tbody>
			                                    </table>
		                                    </c:forEach>
                                    	</c:when>
                                    	
                                    	<c:when test="${parentQuestion.parentQuestionName=='LastReadingOne'}">
                                    		<h3>${parentQuestion.description}</h3>
											<div style="width:1000px;overflow:auto">
                                               	<p style="line-height:30px; font-size:16px; margin:0 20px 0 20px;">${parentQuestion.parentQuestionArticle}</p>
                                            </div>
                                            		
		                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
		                                    	<c:forEach items="${parentQuestion.questions}" var="qust">
		                                    	<span class="span-quick-nav" data-qid="${qust.questionId}"></span>
			                                    	<thead>
			                                        	<tr>
			                                            	<th valign="top" style="width:1000px; text-align:left;"><cite style=" font-style:normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${qust.questionContent}</cite></th>
			                                                <td class="tm_question_lineheight"></td>
			                                            </tr>
			                                        </thead>
			                                        <tbody>
			                                        	<tr>
			                                            	<td colspan="2">                                                    
						                                        <ul>
						                                        	<c:forEach items="${qust.selectts}" var="selt">
							                                        	<li><label><input type="radio" class="validate[required] qk-choice" value="${selt.selecttName}" 
							                                        	data-qid="${qust.questionId}" name="Q-${qust.questionId}" disabled="true"/>
																		${selt.selecttName}) ${selt.selecttContent}</label></li>
						                                        	</c:forEach>			                                        
						                                        </ul>
			                                                </td>
			                                            </tr>
			                                            <c:if test="${tested=='on'}">
			                                            <tr class="after_tested">
			                                            	<td colspan="2">
			                                            		<ul>
			                                            			<c:forEach items="${an}" var="an">
			                                            			<c:if test="${an.key ==qust.questionId }">
			                                            			<li><label style="color:yellow;"><b>您的答案：</b>${an.value}</label></li>
			                                            			</c:if>
			                                            			</c:forEach>
			                                            			<li><label style="color:red;"><b>答案：</b>${qust.questionAnswer}</label></li>
			                                            			<li><label><b>解析：</b>${qust.questionExplain}</label></li>
			                                            		</ul>
			                                            	</td>
			                                            </tr>
			                                            </c:if>
			                                        </tbody>
		                                        </c:forEach>
		                                    </table>
                                    	</c:when>
                                    	
                                    	<c:otherwise>
											<div style="width:1000px;overflow:auto">
                                               	<p style="line-height:30px; font-size:16px; margin:0 20px 0 20px;">${parentQuestion.parentQuestionArticle}</p>
                                            </div>
                                            		
		                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
		                                    	<c:forEach items="${parentQuestion.questions}" var="qust">
		                                    	<span class="span-quick-nav" data-qid="${qust.questionId}"></span>
			                                    	<thead>
			                                        	<tr>
			                                            	<th valign="top" style="width:1000px; text-align:left;"><cite style=" font-style:normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${qust.questionContent}</cite></th>
			                                                <td class="tm_question_lineheight"></td>
			                                            </tr>
			                                        </thead>
			                                        <tbody>
			                                        	<tr>
			                                            	<td colspan="2">                                                    
						                                        <ul>
						                                        	<c:forEach items="${qust.selectts}" var="selt">
							                                        	<li><label><input type="radio" class="validate[required] qk-choice" value="${selt.selecttName}" 
							                                        	data-qid="${qust.questionId}" name="Q-${qust.questionId}" disabled="true"/>
																		${selt.selecttName}) ${selt.selecttContent}</label></li>
						                                        	</c:forEach>			                                        
						                                        </ul>
			                                                </td>
			                                            </tr>
			                                            <c:if test="${tested=='on'}">
			                                           <tr class="after_tested">
			                                            	<td colspan="2">
			                                            		<ul>
			                                            			<c:forEach items="${an}" var="an">
			                                            			<c:if test="${an.key ==qust.questionId }">
			                                            			<li><label style="color:yellow;"><b>您的答案：</b>${an.value}</label></li>
			                                            			</c:if>
			                                            			</c:forEach>
			                                            			<li><label style="color:red;"><b>答案：</b>${qust.questionAnswer}</label></li>
			                                            			<li><label><b>解析：</b>${qust.questionExplain}</label></li>
			                                            		</ul>
			                                            	</td>
			                                            </tr>
			                                            </c:if> 
			                                        </tbody>
		                                        </c:forEach>
		                                    </table>
                                    	</c:otherwise>
                                    	</c:choose>
                                    </div>
                                	</c:when>
                                	<c:when test="${parentQuestion.parentQuestionName=='Translation'}">
                                	<div class="tm_paper_section">
                                	<h1>${parentQuestion.parentQuestionName }</h1>
                            		<h2>共${fn:length(parentQuestion.questions)}题</h2>
                                    		<h3>&nbsp;&nbsp;&nbsp;&nbsp;${parentQuestion.description }</h3>
		                                    <p style="text-indent:2em;line-height:20px; font-size:14px; margin:0 20px 0 20px;">${parentQuestion.parentQuestionArticle}</p>
		                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
		                                        <tbody>
		                                        	<tr>
		                                            	<td colspan="2">
		                                                        <ul>
		                                                        	<c:forEach items="${parentQuestion.questions}" var="qust">
																	<span class="span-quick-nav" data-qid="${qust.questionId}"></span>
		                                                            <li><label><textarea class="validate[required] tm_txt qk-blank" data-qid="${qust.questionId}" 
		                                                            name="Q-${qust.questionId}" rows="20" cols="100" disabled="true"></textarea>
																	</label></li>
																	</c:forEach>
		                                                		</ul>
		                                                </td>
		                                            </tr>
		                                            <c:if test="${tested=='on'}">
		                                            <tr class="after_tested">
                                            			<td colspan="2">
		                                            	
		                                            	<ul>
		                                            	
		                                            		<c:forEach items="${parentQuestion.questions}" var="qust">
		                                            			
		                                            			<b>范文：</b>
		                                            			<li><label>${qust.questionExplain}</label></li>
		                                            		</c:forEach>
		                                            	</ul>
		                                            	</td>
		                                            </tr>
		                                            </c:if>
		                                        </tbody>
		                                    </table>
	                                    </div>
                                    	</c:when>
                                    </c:choose>
                            	</c:forEach>
                        </div>
                        </div>

						<input type="hidden" id="t_timecost" name="t_timecost" value="0">
						<input type="hidden" id="t_duration" name="t_duration" value="20">
						
						</form>

					</td><!-- /left -->

					<td width="10">&nbsp;</td>

					<!--  right-->
					<td width="220" valign="top">
						
					</td>
					<!--  /right-->
				</tr>
			</tbody></table>
        </div>
    </div>
</body>
</html>
