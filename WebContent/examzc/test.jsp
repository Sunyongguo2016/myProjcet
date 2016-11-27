<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>自我检测</title>
	<link rel="shortcut icon" href="#">
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
		var tm_maxtime = eval("20") * 60;
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
				$("form").attr("action","http://demo.tomexam.com/user/selftest/submit.do");
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
	<style type="text/css">
	h3{
		margin-left:20px;
	}
	p{
		text-indent: 2em;
	}
	ul{
		list-style-type: none;
	}
	.list{
		margin-left: 250px;
	}
	.list ul{
		border:1px solid #000;
		width:600px;
		height:100px;
	}
	.list li{
		float: left;
		width: 150px;
	}
	</style>
  </head>
  
<body marginwidth="0" marginheight="0">

	<div class="tm_main">
    	
		<div class="tm_container">
			<ul class="tm_breadcrumb">
				<li><a href="${ctx }/index_before.jsp">首页</a> <span class="divider">&gt;</span></li>
				<li><a href="${ctx }/examzc/examinationlist.jsp">自我检测</a> <span class="divider">&gt;</span></li>
				<li class="active">自测</li>
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
                                <h1>自测</h1>
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
                                    <h2>共一题</h2>
                                    
                                    
									<h3>&nbsp;&nbsp;&nbsp;&nbsp;Directions:For this part,you are allowed 30 minutes to write a short essay entitled "What Makes a Genius?" by commenting on Thomas Edison's famous remark "Genius is 1% inspiration and 99% perspiration." You should write at least 150 words but no more than 200 words.</h3>
									<span class="span-quick-nav" data-qid="1"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                        <ul>
                                                        
                                                            <li><label><textarea class="validate[required] tm_txt qk-blank" data-qid="1" name="Q-1" rows="20" cols="100"></textarea>
															</label></li>
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                    
                                </div>

                            	
                            	<div class="tm_paper_section">
                                	<h1>part II Listening Comprehension</h1>
                                    <h2>共*题</h2>
                                    
                                    
									<h3>Section A</h3>
									<h3>&nbsp;&nbsp;&nbsp;&nbsp;Directions:In this section, you will hear 8 short conversations and 2 long conversations. At the end of each conversation, one or more questions will be asked about what was said. Both the conversation and the questions will be spoken only once. After each question there will be pause. During the pause, you must read the four choices marked A), B), C), and D), and decide which is the best answer. Then mark the corresponding letter on Answer Sheet 1 with a single line through the centre.</h3>
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
																A . The man should stay at home to have a rest.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="B" data-qid="2" name="Q-2">
																B . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="C" data-qid="2" name="Q-2">
																C . The man should give the speech he promised.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="D" data-qid="2" name="Q-2">
																D . The man has to go through the file quickly.</label></li>
                                                        
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
																A . The man should stay at home to have a rest.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="B" data-qid="3" name="Q-3">
																B . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="C" data-qid="3" name="Q-3">
																C . The man should give the speech he promised.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="D" data-qid="3" name="Q-3">
																D . The man has to go through the file quickly.</label></li>
                                                        
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
																A . The man should stay at home to have a rest.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="B" data-qid="4" name="Q-4">
																B . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="C" data-qid="4" name="Q-4">
																C . The man should give the speech he promised.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="D" data-qid="4" name="Q-4">
																D . The man has to go through the file quickly.</label></li>
                                                        
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
																A . The man should stay at home to have a rest.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="B" data-qid="5" name="Q-5">
																B . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="C" data-qid="5" name="Q-5">
																C . The man should give the speech he promised.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="D" data-qid="5" name="Q-5">
																D . The man has to go through the file quickly.</label></li>
                                                        
                                                        </ul>
                                                    
                                                    
                                                    
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
									
									
									<span class="span-quick-nav" data-qid="6"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>6</cite></th>
                                                <td class="tm_question_lineheight">
													
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                
                                                    
                                                        <ul>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="A" data-qid="6" name="Q-6">
																A . The man should stay at home to have a rest.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="B" data-qid="6" name="Q-6">
																B . The man should explain the problem in detail.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="C" data-qid="6" name="Q-6">
																C . The man should give the speech he promised.</label></li>
                                                        
                                                            <li><label><input type="radio" class="validate[required] qk-choice" value="D" data-qid="6" name="Q-6">
																D . The man has to go through the file quickly.</label></li>
                                                        
                                                        </ul>
                                                    
                                                    
                                                    
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <span class="span-quick-nav" data-qid="7"></span>
                                    <span class="span-quick-nav" data-qid="8"></span>
                                    <span class="span-quick-nav" data-qid="9"></span>
                                    <span class="span-quick-nav" data-qid="10"></span>
                                    <span class="span-quick-nav" data-qid="11"></span>
                                    <span class="span-quick-nav" data-qid="12"></span>
                                    <span class="span-quick-nav" data-qid="13"></span>
                                    <span class="span-quick-nav" data-qid="14"></span>
                                    <span class="span-quick-nav" data-qid="15"></span>
                                    <span class="span-quick-nav" data-qid="16"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                        		<th valign="top" class="tm_question_lineheight"><cite>7</cite></th>
                                                <td class="tm_question_lineheight">
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                            	<ul>
                                                    <li><p>Why would an animal kill itself? It seems a strange question, and yet it is one that has (7) <input type="text" name="Q-7" data-qid="7" class="validate[required] tm_txt qk-blank">some people for a long time. The lemming（旅鼠）is one such animal. Lemmings periodically commit mass (8) <input type="text" name="Q-8" data-qid="8" class="validate[required] tm_txt qk-blank">, and no one knows just why!</p></li> 
													<li><p>The small (9) <input type="text" name="Q-9" data-qid="9" class="validate[required] tm_txt qk-blank">, which inhabit the Scandinavian mountains, sustain themselves on a diet of roots and live in nests they make underground. When their food suply is (10) <input type="text" name="Q-10" data-qid="10" class="validate[required] tm_txt qk-blank">large, the lemmings live a normal, undisturbed life.</p></li>  
													<li><p>However, when the lemmings' food suply becomes too low to suport the population, a singular (11) <input type="text" name="Q-11" data-qid="11" class="validate[required] tm_txt qk-blank">commences. The lemmings leave their nests all together at the same time, forming huge crowds. Great numbers of the lemmings begin a long and 
													  hard journey across the Scandinavian plains, a journey that may last weeks. The lemmings eat everything in their path, continuing their (12) <input type="text" name="Q-12" data-qid="12" class="validate[required] tm_txt qk-blank"> march until they reach the sea.</p></li>
													<li><p>The reason for what follows remains a mystery for zoologists and naturalists. Upon reaching the coast, the lemmings do not stop but swim by the thousands into the surf. Most (13) <input type="text" name="Q-13" data-qid="13" class="validate[required] tm_txt qk-blank"> only a short time before they tire, sink and drown.</p></li> 
													<li><p>A common theory for this unusual phenomenon is that the lemmings do not realize that the ocean is such (14) <input type="text" name="Q-14" data-qid="14" class="validate[required] tm_txt qk-blank"> water. In their cross-country journey, the animals must traverse many smaller bodies of water, such as rivers and small lakes. They may (15) <input type="text" name="Q-15" data-qid="15" class="validate[required] tm_txt qk-blank"> that the sea is just another such swimmable (16) <input type="text" name="Q-16" data-qid="16" class="validate[required] tm_txt qk-blank">. But no final answer has been found to the mystery.</p></li>
                                                </ul>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                    
                                </div>
                                
                            	<div class="tm_paper_section">
                                	<h1>part III Reading Comprehension</h1>
                                    <h2></h2>
                                    
                                    
									<h3>Section A</h3>
									<h3>Derections:...</h3>
									<span class="span-quick-nav" data-qid="17"></span>
									<span class="span-quick-nav" data-qid="18"></span>
									<span class="span-quick-nav" data-qid="19"></span>
									<span class="span-quick-nav" data-qid="20"></span>
									<span class="span-quick-nav" data-qid="21"></span>
									<span class="span-quick-nav" data-qid="22"></span>
									<span class="span-quick-nav" data-qid="23"></span>
									<span class="span-quick-nav" data-qid="24"></span>
									<span class="span-quick-nav" data-qid="25"></span>
									<span class="span-quick-nav" data-qid="26"></span>

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
                                            	<ul style="margin-bottom:20px">
                                                    
                                                    <li><p>
																"That which does not kill us makes us stronger." But parents can't handle it when teenagers put this (17) <input type="text" name="Q-17" data-qid="17" class="validate[required] tm_txt qk-blank"> into practice. Now technology has become the new field for the age-old battle between adults and their freedom-seeking kids.</p></li>
													<li><p>
														Locked indoors, unable to get on their bicycles and hang out with their friends, teens have turned to social media and their mobile phones to socialize with their peers. What they do online often (18) <input type="text" name="Q-18" data-qid="18" class="validate[required] tm_txt qk-blank">what they might otherwise do if their mobility weren't so heavily (19) <input type="text" name="Q-19" data-qid="19" class="validate[required] tm_txt qk-blank"> in the age of helicopter parenting. Social media and smart-phone aps have become so popular in recent years because teens need a place to call their own. They want the freedom to (20) <input type="text" name="Q-20" data-qid="20" class="validate[required] tm_txt qk-blank"> their identity and the world around them. Instead of (21) <input type="text" name="Q-21" data-qid="21" class="validate[required] tm_txt qk-blank"> out, they jump online.
													</p></li>
													<li><p>
														As teens have moved online, parents have projected their fears onto the Internet, imagining all the (22) <input type="text" name="Q-22" data-qid="22" class="validate[required] tm_txt qk-blank"> dangers that youth might face一from (23) <input type="text" name="Q-23" data-qid="23" class="validate[required] tm_txt qk-blank"> strangers to cruel peers to pictures or words that could haunt them on Google for the rest of their lives.
													</p></li>
													<li><p>
														Rather than helping teens develop strategies for negotiating public life and the risks of (24) <input type="text" name="Q-24" data-qid="24" class="validate[required] tm_txt qk-blank">with others, fear-full parents have focused on tracking, monitoring and blocking. These tactics（策略）don't help teens develop the skills they need to manage complex social situations, (25) <input type="text" name="Q-25" data-qid="25" class="validate[required] tm_txt qk-blank"> risks and get help when they're in trouble. "protecting" kids may feel like the right thing to do, but it (26) <input type="text" name="Q-26" data-qid="26" class="validate[required] tm_txt qk-blank"> the learning that teens need to do as they come of age in a technology-soaked world. 
													</p></li>			
												</ul>				
                                                <div class="list">
                                                	<ul>
                                                		<li>A) assess</li>
                                                		<li>B) constrained </li>
                                                		<li>C) contains</li>
                                                		<li>D) explore</li>
                                                		<li>E) influence</li>
                                                		<li>F) interacting </li>
                                                		<li>G) interpretation</li>
                                                		<li>H) magnified</li>
                                                		<li>I) mirrors</li>
                                                		<li>J) philosophy</li>
                                                		<li>K) potential</li>
                                                		<li>L) sneaking</li>
                                                		<li>M) sticking</li>
                                                		<li>N) undermines </li>
                                                		<li>O) violent </li>
                                                	</ul>
                                                </div>    
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
									
									<h3>Section B</h3>
									<div style="width:1000px;overflow:auto">
                                                	<p>
                                                		[A]A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                	</p>
                                                	<p>
                                                		[B]A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                	</p>
                                                	<p>
                                                		[C]A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                	</p>
                                                	<p>
                                                		[D]A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                	</p>
                                                	<p>
                                                		[E]A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                	</p>
                                                	<p>
                                                		[F]A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                	</p>
                                                	<p>
                                                		[G]A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                	</p>
                                                	<p>
                                                		[H]A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                	</p>
                                                	<p>
                                                		[I]A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                		A dangerous trend has developed over this past third of a century. A country that experienced
                                                	</p>
                                                </div>
									<span class="span-quick-nav" data-qid="27"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                        	<th valign="top" class="tm_question_lineheight"><cite>27</cite></th>
                                                <td class="tm_question_lineheight">
                                                In theory, free competition is supposed to reduce the margin of profits to the minimum. <input type="text" name="Q-27" data-qid="27" class="validate[required] tm_txt qk-blank">
                                                
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                


                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
									
									
									<span class="span-quick-nav" data-qid="28"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>28</cite></th>
                                                <td class="tm_question_lineheight">
													The United States is now characterized by a great division between the rich and the poor.<input type="text" name="Q-28" data-qid="28" class="validate[required] tm_txt qk-blank"> 
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                    
                                                    
                                                    
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
									
									
									<span class="span-quick-nav" data-qid="29"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>29</cite></th>
                                                <td class="tm_question_lineheight">
													America lacked the incentive to care for the majority of its citizens as it found no rival for its economic model.<input type="text" name="Q-29" data-qid="29" class="validate[required] tm_txt qk-blank">  
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                
                                                    
                                                    
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>


                                    <span class="span-quick-nav" data-qid="30"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>30</cite></th>
                                                <td class="tm_question_lineheight">
													The wealthy top have come to take privileges for granted. <input type="text" name="Q-30" data-qid="30" class="validate[required] tm_txt qk-blank">  
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                
                                                    
                                                    
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>


                                    <span class="span-quick-nav" data-qid="31"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    	<thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite>31</cite></th>
                                                <td class="tm_question_lineheight">
													Many examples show the basic laws of imperial capitalism no longer apply in present-day America. <input type="text" name="Q-31" data-qid="31" class="validate[required] tm_txt qk-blank">  
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                
                                                    
                                                    
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                    
                                </div>

                                <div class="tm_paper_section">
                                	<h1>part IV Translation</h1>
                                    <h2>共一题</h2>
                                    
                               
									<span class="span-quick-nav" data-qid="32"></span>

                                    <table border="0" cellpadding="0" cellspacing="0" class="tm_paper_question" style="table-layout:fixed;">
                                    <thead>
                                        	<tr>
                                            	<th valign="top" class="tm_question_lineheight"><cite></cite></th>
                                                <td class="tm_question_lineheight">
													2011年是中国城市化（urbanization）进程中的历史性时刻，其城市人口首次超过农村人口。在未来20年里，预计有3.5亿农村人口将移居城市。如此规模的城市发展对城市交通来说既是挑战，也是机遇。中国政府一直提倡“以人为本”的发展理念，强调人们以公交而不是私家车出行。它还号召建设“资源节约和环境友好型”社会。有了这个明确的目标，中国城市就可以更好地规划其发展，并把大量投资转向安全、清洁和经济型交通系统的发展上。  
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<tr>
                                            	<td colspan="2">
                                                        <ul>
                                                        
                                                            <li><label><textarea class="validate[required] tm_txt qk-blank" data-qid="32" name="Q-32" rows="20" cols="100"></textarea>
															</label></li>
                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                    
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
		离考试结束还有：
		<div id="div_processor_timer" style="margin-top:5px;"><span class="tm_label">0:19:29</span></div>
		<div id="div_processor_fastto"></div>
		<div>
			该大题您已使用：
		<div style="margin-top:5px;"><span  class="tm_label">0:19:29</span></div>
		</div>
		<div id="div_processor_ops">
			<button class="tm_btn tm_btn_primary" type="button" onclick="tmUserpaper.submitpaper();">提交</button>
			<button class="tm_btn tm_btn_primary" type="button" onclick="">暂停/开始</button>
			<button class="tm_btn tm_btn_primary" type="button" onclick="">返回</button>
		</div>
	</div>
</body>
</html>