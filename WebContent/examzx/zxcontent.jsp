<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>专项训练-听力</title>
	<link rel="stylesheet" type="text/css" href="${ctx }/css/style.css">
	<script src="${ctx }/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx }/js/baseutil.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${ctx }/css/validationEngine.jquery.css">
	<script src="${ctx }/js/jquery.validationEngine.js"></script>
	<script src="${ctx }/js/jquery.validationEngine-zh_CN.js"></script>
	<style>
		.div-key-container{margin:5px 25px; border:dotted 1px #ddd; padding:5px;}
		.div-key-container span{font-weight:bold}
	</style>
    
	<script type="text/javascript">
	
		var tm_pid = "0";
		var tm_cost_seconds = 0;
		var tm_maxtime = eval("130") * 60;
		var tm_timer = null;
	
	
		$(document).ready(function() {
			tmUserpaper.initpaper();
			$(".tm_paper_section h1").click(function(){
				$(this).parent().children(".tm_paper_question").toggle();
			});
			tm_resetposition();
	
			//计时器
			tm_timer = setInterval(function(){
				tm_countdown();
			}, 1000);
	
		});
	
		function tm_countdown(){
			//记录消耗的时间
			tm_cost_seconds = tm_cost_seconds + 1;
			$("#t_timecost").val(parseInt(tm_cost_seconds/60));
	
			//倒计时牌
			var tm_msg;
			if(tm_maxtime>0){
				tm_msg = "<span class='tm_label'>"+ tm_fn_formatSeconds(tm_maxtime) + "</span>";
				if(tm_maxtime <= 30){
					var ss = '试卷提交中...';
					tm_msg += "<br/><font color='red'><b>"+ss+"</b></font>";
				}
	
				$("#div_processor_timer").html(tm_msg);
	
				if(tm_maxtime == 5*60) {
					alert('注意，还有5分钟!\n时间结束后，如您没有交卷，试卷将自动提交。');   
				}
	
				--tm_maxtime;
	
			}else{
				clearInterval(tm_timer);
				$("#div_processor_timer").html('考试时间到，试卷将自动提交!');
				$("form").attr("action","${ctx }/zxscore/score?parentQuestionId=${parentQuestion.parentQuestionId}");
				$("form").submit();
			}
		}
	
	
		function tm_resetposition(){
			var nw = $(".tm_paper_head").width() + 45;
			$("#div_processor").css("left",nw + "px");
		}
	
		$(window).resize(function(){
			tm_resetposition();
		});
		 
		$(window).scroll(function(){
			var tp = $(window).scrollTop();
			if(tp > 240){
				$("#div_processor").css("top", "20px");
			}else{
				var ntp = 240 - tp;
				$("#div_processor").css("top", ntp + "px");
			}
		});
	
		
		var tmUserpaper = {
			initpaper : function(){
				//追加导航按钮
				var html = [];
				$(".span-quick-nav").each(function(idx, itm){
					var question_id = $(this).data("qid");
					var nid = idx + 1;
					var thetop = $(this).offset().top;
	
					html.push('<a href="javascript:;" id="fast_'+question_id+'"');
					html.push(' onclick="javascript:tmUserpaper.moveToQuestion('+thetop+')" ');
					html.push('>' + nid + '</a>');
				});
				$("#div_processor_fastto").html(html.join(""));
				//绑定输入提示
				tmUserpaper.bindQuickTip();
			},
			
			submitpaper : function(){
				var formcheck = $("#form_paper_detail").validationEngine('validate');
				if(formcheck){
					var wcm = window.confirm('确定要提交试卷吗？');
					if(!wcm){
						return;
					}
					
					$(".tm_btn").attr("disabled", true);
					$(".tm_btn").val('试卷提交中...');
	
					window.onbeforeunload = null;
					
					$("form").attr("action","${ctx }/zxscore/score?parentQuestionId=${parentQuestion.parentQuestionId}");
					$("form").submit();
	
				}else{
					return false;
				}
				
			},
			
			moveToQuestion : function(thetop){
				$("html:not(:animated),body:not(:animated)").animate({ scrollTop: thetop}, 500);
			},
	
			bindQuickTip : function(){
				//选择题绑定
				$(".qk-choice").click(function(){
					var thename = $(this).attr("name");
					var theqid = $(this).data("qid");
					var chval = $('input[name='+thename+']:checked').val();
	
					if(baseutil.isNull(chval)){
						$("#fast_"+theqid).prop("class","");
					}else{
						$("#fast_"+theqid).prop("class","finished");
					}
				});
				//填空题绑定
				$(".qk-blank").keyup(function(){
					var thename = $(this).attr("name");
					var theqid = $(this).data("qid");
					if(tm_checker_blanker_filled(thename)){
						$("#fast_"+theqid).prop("class","finished");
					}else{
						$("#fast_"+theqid).prop("class","");
					}
				});
				//问答题绑定
				$(".qk-txt").keyup(function(){
					var thename = $(this).attr("name");
					var theqid = $(this).data("qid");
					var chval = $(this).val();
					
					if(baseutil.isNull(chval)){
						$("#fast_"+theqid).prop("class","");
					}else{
						$("#fast_"+theqid).prop("class","finished");
					}
				});
			}
		};
	
		//填空题的输入判断
		function tm_checker_blanker_filled(n){
			var len = $("input[name='"+n+"']").length;
			var mylen = 0;
			$("input[name='"+n+"']").each(function(){
				var chval = $(this).val();
				if(baseutil.isNull(chval)){
	
				}else{
					mylen ++;
				}
			});
			return len == mylen;
		}
	</script>
  </head>
  
<body marginwidth="0" marginheight="0">

	<div class="tm_main">
    	
		<div class="tm_container">
			<ul class="tm_breadcrumb">
				<li><a href="${ctx }/">首页</a> <span class="divider">&gt;</span></li>
				<li><a href="${ctx }/examzx/list">专项训练</a> <span class="divider">&gt;</span></li>
				<li class="active">${parentQuestion.parentQuestionName}</li>
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
                                <h1>${parentQuestion.parentQuestionName}</h1>
								<h2 style="background:#AFEEEE; padding:5px 0; font-size:14px; font-weight:bold">
									试卷信息
								</h2>
                                <h2>
									<b>考试时长</b> : 20 分钟
									&nbsp;&nbsp;
									<b>卷面总分</b> : 25
								</h2>
                            </div>

                            <div class="tm_paper_body">
								
								

                            	
                            	<div class="tm_paper_section">
                                    <c:choose>
                                    	<c:when test="${parentQuestion.parentQuestionName=='ListeningComprehensionOne'
	                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionTwo'
	                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionThree'
	                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionFour'
	                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionFive'
	                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionSix'
	                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionText'}">
	                                    
	                                    <center>
			                            <div>
											<iframe scrolling="auto" rameborder="0" src="${ctx }/AudioPlayer/index.jsp"
											name="right" width="500px" height="170px" frameborder="0"></iframe>
										</div>
										</center>
										
	                                    <c:forEach items="${parentQuestion.exam.parentQuestions }"  var="parentQuestion" >
		                                    <c:choose>
			                                    <c:when test="${parentQuestion.parentQuestionName=='ListeningComprehensionOne'
			                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionFour'}">
			                                    	<h1>${parentQuestion.parentQuestionName }</h1>
		                                   			<h2>共${fn:length(parentQuestion.questions)}题</h2>
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
					                                           
					                                        </tbody>
					                                    </table>
				                                    </c:forEach>
	                                    		</c:when>
		                                    <c:when test="${parentQuestion.parentQuestionName=='ListeningComprehensionTwo'
		                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionThree'
		                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionFive'
		                                    ||parentQuestion.parentQuestionName=='ListeningComprehensionSix'}">
		                                    	<h1>${parentQuestion.parentQuestionName }</h1>
		                                   		<h2>共${fn:length(parentQuestion.questions)}题</h2>
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
				                                            
				                                        </tbody>
				                                    </table>
			                                    </c:forEach>
	                                    	</c:when>
		                                    <c:when test="${parentQuestion.parentQuestionName=='ListeningComprehensionText'}">
		                                    	<h1>${parentQuestion.parentQuestionName }</h1>
		                                   		<h2>共${fn:length(parentQuestion.questions)}题</h2>
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
			                                    		
			                                    	</tbody>
			                                    </table>
	                                   		</c:when>
                               			</c:choose>
                               		</c:forEach>
                                	</div>
								</c:when>
                                    	
                                    	<c:when test="${parentQuestion.parentQuestionName=='Writing'}">
                                    		<h1>${parentQuestion.parentQuestionName }</h1>
		                                   	<h2>共${fn:length(parentQuestion.questions)}题</h2>
                                    		<h3>&nbsp;&nbsp;&nbsp;&nbsp;${parentQuestion.description }</h3>
											<span class="span-quick-nav" data-qid="1"></span>
		                                    ${parentQuestion.imgUrl }
											<span style="text-align:center; position:relative; top:20px; left:30px;">${parentQuestion.parentQuestionArticle}</span><br/><br/><br/>
                                    		<table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
		                                        <tbody>
		                                        	<tr>
		                                            	<td colspan="2">
		                                            		<ul>
	                                                        	<c:forEach items="${parentQuestion.questions}" var="qust">
																	<span class="span-quick-nav" data-qid="${qust.questionId}"></span>
		                                                            <li><label>
		                                                            	<textarea class="validate[required] tm_txt qk-blank" data-qid="${qust.questionId}" name="Q-${qust.questionId}" rows="20" cols="100"></textarea>
																	</label></li>
																</c:forEach>
                                                			</ul>
		                                                </td>
		                                            </tr>
		                                        </tbody>
		                                    </table>
                                    	</c:when>
                                    	
                                    	<c:when test="${parentQuestion.parentQuestionName=='Translation'}">
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
	                                                            	<li><label>
	                                                            		<textarea class="validate[required] tm_txt qk-blank" data-qid="${qust.questionId}" name="Q-${qust.questionId}" rows="20" cols="100"></textarea>
																	</label></li>
																</c:forEach>
															</ul>
		                                                </td>
		                                            </tr>
		                                        </tbody>
		                                    </table>
                                    	</c:when>
                                    	
                                    	<c:when test="${parentQuestion.parentQuestionName=='ChooseFillInBlank'}">
                                    	<h1>${parentQuestion.parentQuestionName }</h1>
		                                   	<h2>共${fn:length(parentQuestion.questions)}题</h2>
											<h3>${parentQuestion.description}</h3>
											<span class="span-quick-nav" data-qid="17"></span>
		
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
			                                            		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(${qust.questionContent}) <input type="text" name="Q-${qust.questionId}" data-qid="${qust.questionId}" class="validate[required] tm_txt qk-blank">
		                                    					<c:if test="${status.count % 4 == 0}">
		                                    						<br/><br/>
		                                    					</c:if>
		                                    				</c:forEach>
		                                    			</td>
		                                    		</tr>
		                                        </tbody>
		                                    </table>
		                                    
                                    	</c:when>
                                    	
                                    	<c:when test="${parentQuestion.parentQuestionName=='QuickReading'}">
                                    	<h1>${parentQuestion.parentQuestionName }</h1>
		                                   	<h2>共${fn:length(parentQuestion.questions)}题</h2>
                                    		<h3>${parentQuestion.description}</h3>
											<div style="width:1000px;overflow:auto">
												<h3 style="text-align:center;">${parentQuestion.parentQuestionTitle}</h3>
                                               	<p style="line-height:30px; font-size:16px; margin:0 20px 0 20px;">${parentQuestion.parentQuestionArticle}</p><br/><br/>
                                            </div>
                                            <c:forEach items="${parentQuestion.questions}" var="qust">
												<span class="span-quick-nav" data-qid="${qust.questionId}"></span>
			                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
			                                    	<thead>
			                                        	<tr>
			                                                <td class="tm_question_lineheight" style="font-size:14px; width:900px;">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${qust.questionContent}&nbsp;&nbsp;<input type="text" name="Q-${qust.questionId}" data-qid="${qust.questionId}" class="validate[required] tm_txt qk-blank" style="width:35px;">                                                
															</td>
			                                            </tr>
			                                        </thead>
			                                        <tbody>
			                                        	<tr>
			                                            	<td colspan="2"></td>
			                                            </tr>
			                                        </tbody>
			                                    </table>
		                                    </c:forEach>
                                    	</c:when>
                                    	
                                    	<c:when test="${parentQuestion.parentQuestionName=='LastReadingOne'}">
                                    	<h1>${parentQuestion.parentQuestionName }</h1>
		                                   	<h2>共${fn:length(parentQuestion.questions)}题</h2>
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
							                                        	<li><label><input type="radio" class="validate[required] qk-choice" value="${selt.selecttName}" data-qid="${qust.questionId}" name="Q-${qust.questionId}">
																		${selt.selecttName}) ${selt.selecttContent}</label></li>
						                                        	</c:forEach>			                                        
						                                        </ul>
			                                                </td>
			                                            </tr>
			                                        </tbody>
		                                        </c:forEach>
		                                    </table>
                                    	</c:when>
                                    	
                                    	<c:otherwise>
                                    	<h1>${parentQuestion.parentQuestionName }</h1>
		                                   	<h2>共${fn:length(parentQuestion.questions)}题</h2>
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
							                                        	<li><label><input type="radio" class="validate[required] qk-choice" value="${selt.selecttName}" data-qid="${qust.questionId}" name="Q-${qust.questionId}">
																		${selt.selecttName}) ${selt.selecttContent}</label></li>
						                                        	</c:forEach>			                                        
						                                        </ul>
			                                                </td>
			                                            </tr>
			                                        </tbody>
		                                        </c:forEach>
		                                    </table>
                                    	</c:otherwise>
                                    </c:choose>
                            </div>
                                
                            	
                                
                            </div>
                            <!-- /tm_paper_body -->
                            
                            <div class="tm_adm_paper_foot">
								<button class="tm_btn tm_btn_primary" type="button" onclick="tmUserpaper.submitpaper();">提交</button>
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


	<div id="div_processor" style="left: 906px; top: 20px;">
		<div id="time">
			离考试结束还有：
			<div id="div_processor_timer" style="margin-top:5px;"><span class="tm_label">0:20:00</span></div>
			<div id="div_processor_fastto"></div>
			<div>
				该大题您已使用：
				<div style="margin-top:5px;"><span  class="tm_label">0:19:29</span></div>
			</div>
			<div id="div_processor_ops">
				<button class="tm_btn tm_btn_primary" type="button" onclick="tmUserpaper.submitpaper();">提交</button>
			</div>
		</div>
	</div>
</body>
</html>
