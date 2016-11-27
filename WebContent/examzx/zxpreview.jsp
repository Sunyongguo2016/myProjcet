<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>专项训练预览</title>
	<link rel="shortcut icon" href="#">
	<link rel="stylesheet" href="${ctx }/css/validationEngine.jquery.css">
	<link rel="stylesheet" type="text/css" href="${ctx }/css/style.css">
	<script src="${ctx }/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx }/js/baseutil.js" type="text/javascript"></script>
	<script src="${ctx }/js/jquery.validationEngine.js"></script>
	<script src="${ctx }/js/jquery.validationEngine-zh_CN.js"></script>
	<style>
		.div-key-container{margin:5px 25px; border:dotted 1px #ddd; padding:5px;}
		.div-key-container span{font-weight:bold}
	</style>
    
	<script type="text/javascript">

		var tm_pid = "0";
		var tm_cost_seconds = 0;
		var tm_maxtime = eval("20") * 60;
		var tm_timer = null;


		$(document).ready(function() {
			tmUserPaper.initPaper();
			$(".tm_paper_section h1").click(function(){
				$(this).parent().children(".tm_paper_question").toggle();
			});
			tm_resetPosition();

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
				$("form").attr("action","http://demo.tomexam.com/user/selftest/submit.do");
				$("form").submit();
			}
		}


		function tm_resetPosition(){
			var nw = $(".tm_paper_head").width() + 45;
			$("#div_processor").css("left",nw + "px");
		}

		$(window).resize(function(){
			tm_resetPosition();
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
	
		
		var tmUserPaper = {
			initPaper : function(){
				//追加导航按钮
				var html = [];
				$(".span-quick-nav").each(function(idx, itm){
					var question_id = $(this).data("qid");
					var nid = idx + 1;
					var thetop = $(this).offset().top;

					html.push('<a href="javascript:;" id="fast_'+question_id+'"');
					html.push(' onclick="javascript:tmUserPaper.moveToQuestion('+thetop+')" ');
					html.push('>' + nid + '</a>');
				});
				$("#div_processor_fastto").html(html.join(""));
				//绑定输入提示
				tmUserPaper.bindQuickTip();
			},
			
			submitPaper : function(){
				var formcheck = $("#form_paper_detail").validationEngine('validate');
				if(formcheck){
					var wcm = window.confirm('确定要提交试卷吗？');
					if(!wcm){
						return;
					}
					
					$(".tm_btn").attr("disabled", true);
					$(".tm_btn").val('试卷提交中...');

					window.onbeforeunload = null;
					
					$("form").attr("action","http://demo.tomexam.com/user/selftest/submit.do");
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
		<div class="start">
        	<form>
        		<a href="#"><input type="button" value="开始考试"/></a>
        		<a href="#"><input type="button" value="返回"/></a>
        	</form>
        </div>
    	
		<div class="tm_container">
			<ul class="tm_breadcrumb">
				<li><a href="${ctx }/index_before.jsp">首页</a> <span class="divider">&gt;</span></li>
				<li><a href="${ctx }/examzx/specialprojectlist.jsp">专项训练</a> <span class="divider">&gt;</span></li>
				<li class="active">听力</li>
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
                                <h1>听力训练（一）</h1>
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
                                	<h1>part I Writing</h1>
                                    <h2>共*题</h2>
                                    
                                    
									
									<b>&nbsp;&nbsp;&nbsp;&nbsp;Directions:In this section, you will hear 8 short conversations and 2 long conversations. At the end of each conversation, one or more questions will be asked about what was said. Both the conversation and the questions will be spoken only once. After each question there will be pause. During the pause, you must read the four choices marked A), B), C), and D), and decide which is the best answer. Then mark the corresponding letter on Answer Sheet 1 with a single line through the centre.</b>
									<span class="span-quick-nav" data-qid="1"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>1</cite></th>
                                                <td class="tm_question_lineheight">
													
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                
                                                    
                                                        <ul>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="A" data-qid="1" name="Q-1">
																A . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="B" data-qid="1" name="Q-1">
																B . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="C" data-qid="1" name="Q-1">
																C . The man should give the speech he promised.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="D" data-qid="1" name="Q-1">
																D . The man has to go through the file quickly.</label></li>
                                                        
                                                        </ul>
                                                    
                                                    
                                                    
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
									
									
									<span class="span-quick-nav" data-qid="2"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>2</cite></th>
                                                <td class="tm_question_lineheight">
													
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                
                                                    
                                                        <ul>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="A" data-qid="2" name="Q-2">
																A . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="B" data-qid="2" name="Q-2">
																B . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="C" data-qid="2" name="Q-2">
																C . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="D" data-qid="2" name="Q-2">
																D . The man should explain the problem in detail.</label></li>
                                                        
                                                        </ul>
                                                    
                                                    
                                                    
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
									
									
									<span class="span-quick-nav" data-qid="3"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>3</cite></th>
                                                <td class="tm_question_lineheight">

												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                
                                                    
                                                        <ul>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="A" data-qid="3" name="Q-3">
																A . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="B" data-qid="3" name="Q-3">
																B . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="C" data-qid="3" name="Q-3">
																C . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="D" data-qid="3" name="Q-3">
																D . The man should explain the problem in detail.</label></li>
                                                        
                                                        </ul>
                                                    
                                                    
                                                    
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
									
									
									<span class="span-quick-nav" data-qid="4"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>4</cite></th>
                                                <td class="tm_question_lineheight">
													
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                
                                                    
                                                        <ul>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="A" data-qid="4" name="Q-4">
																A . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="B" data-qid="4" name="Q-4">
																B . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="C" data-qid="4" name="Q-4">
																C . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="D" data-qid="4" name="Q-4">
																D . The man should explain the problem in detail.</label></li>
                                                        
                                                        </ul>
                                                    
                                                    
                                                    
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
									
									
									<span class="span-quick-nav" data-qid="5"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>5</cite></th>
                                                <td class="tm_question_lineheight">
													
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                
                                                    
                                                        <ul>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="A" data-qid="5" name="Q-5">
																A . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="B" data-qid="5" name="Q-5">
																B . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="C" data-qid="5" name="Q-5">
																C . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="D" data-qid="5" name="Q-5">
																D . The man should explain the problem in detail.</label></li>
                                                        
                                                        </ul>
                                                    
                                                    
                                                    
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                    
                                </div>
                                
                            	
                                
                            </div>
                            <!-- /tm_paper_body -->
                            


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
