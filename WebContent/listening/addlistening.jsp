<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="${ctx }/css/pintuer.css">
<link rel="stylesheet" href="${ctx }/css/admin.css">
<script src="${ctx }/js/jquery.js"></script>
<script src="${ctx }/js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>增加内容</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="${ctx }/listening/add">
				
				<div class="form-group">
					<div class="label">
						<label>试卷名称：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="examname" value="" />
					</div>
				</div>
				<hr>
				
				<div class="clear"></div>
				<if condition="$iscid eq 1">
				<div class="form-group">
					<div class="label">
						<label>大题名称一：</label>
					</div>
					<div class="field">
						<select name="parentquestionnameone" class="input w50">
							<option value ="ListeningComprehensionOne">ListeningComprehensionOne</option>
						  	<option value ="ListeningComprehensionTwo">ListeningComprehensionTwo</option>
						  	<option value ="ListeningComprehensionThree">ListeningComprehensionThree</option>
						 	 <option value ="ListeningComprehensionFour">ListeningComprehensionFour</option>
						 	 <option value ="ListeningComprehensionFive">ListeningComprehensionFive</option>
						  	<option value ="ListeningComprehensionSix">ListeningComprehensionSix</option>
						 	 <option value ="ListeningComprehensionText">ListeningComprehensionText</option>
						</select>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea name="descriptionone" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="parentquestiontitleone" value="" />
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>每小题分数：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="questionscoreone"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>开始题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questionfromone"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>结束题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questiontoone"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题1：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent1" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent1" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent1" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent1" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer1" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain1" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题2：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent2" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent2" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent2" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent2" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer2" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain2" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题3：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent3" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent3" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent3" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent3" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer3" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain3" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				<div class="form-group">
					<div class="label">
						<label>选择题4：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent4" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent4" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent4" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent4" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer4" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain4" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题5：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent5" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent5" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent5" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent5" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer5" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain5" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				
				<div class="form-group">
					<div class="label">
						<label>选择题6：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent6" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent6" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent6" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent6" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer6" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain6" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题7：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent7" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent7" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent7" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent7" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer7" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain7" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				<div class="form-group">
					<div class="label">
						<label>选择题8：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent8" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent8" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent8" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent8" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer8" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain8" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				
				<!-- 第二道听力题参数获取 -->
				<!-- 第二道听力题参数获取 -->
				<!-- 第二道听力题参数获取 -->
				
				<div class="form-group">
					<div class="label">
						<label>大题名称二：</label>
					</div>
					<div class="field">
						<select name="parentquestionnametwo" class="input w50">
						  	<option value ="ListeningComprehensionTwo">ListeningComprehensionTwo</option>
							<option value ="ListeningComprehensionOne">ListeningComprehensionOne</option>
						  	<option value ="ListeningComprehensionThree">ListeningComprehensionThree</option>
						 	 <option value ="ListeningComprehensionFour">ListeningComprehensionFour</option>
						 	 <option value ="ListeningComprehensionFive">ListeningComprehensionFive</option>
						  	<option value ="ListeningComprehensionSix">ListeningComprehensionSix</option>
						 	 <option value ="ListeningComprehensionText">ListeningComprehensionText</option>
						</select>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea name="descriptiontwo" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="parentquestiontitletwo" value="" />
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>每小题分数：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="questionscoretwo"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>开始题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questionfromtwo"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>结束题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questiontotwo"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题1：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent9" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent9" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent9" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent9" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer9" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain9" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题2：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent10" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent10" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent10" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent10" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer10" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain10" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题3：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent11" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent11" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent11" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent11" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer11" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain11" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				<div class="form-group">
					<div class="label">
						<label>选择题4：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent12" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent12" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent12" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent12" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer12" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain12" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				<!-- 第三道听力题参数获取 -->
				<!-- 第三道听力题参数获取 -->
				<!-- 第三道听力题参数获取 -->
				
				<div class="form-group">
					<div class="label">
						<label>大题名称三：</label>
					</div>
					<div class="field">
						<select name="parentquestionnamethree" class="input w50">
						  	<option value ="ListeningComprehensionThree">ListeningComprehensionThree</option>
							<option value ="ListeningComprehensionOne">ListeningComprehensionOne</option>
						  	<option value ="ListeningComprehensionTwo">ListeningComprehensionTwo</option>
						 	 <option value ="ListeningComprehensionFour">ListeningComprehensionFour</option>
						 	 <option value ="ListeningComprehensionFive">ListeningComprehensionFive</option>
						  	<option value ="ListeningComprehensionSix">ListeningComprehensionSix</option>
						 	 <option value ="ListeningComprehensionText">ListeningComprehensionText</option>
						</select>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea name="descriptionthree" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="parentquestiontitlethree" value="" />
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>每小题分数：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="questionscorethree"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>开始题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questionfromthree"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>结束题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questiontothree"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题1：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent13" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent13" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent13" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent13" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer13" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain13" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题2：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent14" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent14" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent14" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent14" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer14" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain14" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题3：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent15" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent15" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent15" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent15" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer15" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain15" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				<div class="form-group">
					<div class="label">
						<label>选择题4：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent16" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent16" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent16" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent16" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer16" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain16" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				<!-- 第四道听力题参数获取 -->
				<!-- 第四道听力题参数获取 -->
				<!-- 第四道听力题参数获取 -->
				
				<div class="form-group">
					<div class="label">
						<label>大题名称四：</label>
					</div>
					<div class="field">
						<select name="parentquestionnamefour" class="input w50">
						 	 <option value ="ListeningComprehensionFour">ListeningComprehensionFour</option>
							<option value ="ListeningComprehensionOne">ListeningComprehensionOne</option>
						  	<option value ="ListeningComprehensionTwo">ListeningComprehensionTwo</option>
						  	<option value ="ListeningComprehensionThree">ListeningComprehensionThree</option>
						 	 <option value ="ListeningComprehensionFive">ListeningComprehensionFive</option>
						  	<option value ="ListeningComprehensionSix">ListeningComprehensionSix</option>
						 	 <option value ="ListeningComprehensionText">ListeningComprehensionText</option>
						</select>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea name="descriptionfour" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="parentquestiontitlefour" value="" />
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>每小题分数：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="questionscorefour"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>开始题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questionfromfour"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>结束题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questiontofour"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题1：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent17" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent17" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent17" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent17" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer17" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain17" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题2：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent18" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent18" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent18" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent18" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer18" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain18" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题3：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent19" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent19" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent19" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent19" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer19" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain19" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				<div class="form-group">
					<div class="label">
						<label>选择题4：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent20" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent20" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent20" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent20" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer20" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain20" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				<!-- 第五道听力题参数获取 -->
				<!-- 第五道听力题参数获取 -->
				<!-- 第五道听力题参数获取 -->
				
				<div class="form-group">
					<div class="label">
						<label>大题名称五：</label>
					</div>
					<div class="field">
						<select name="parentquestionnamefive" class="input w50">
						 	 <option value ="ListeningComprehensionFive">ListeningComprehensionFive</option>
							<option value ="ListeningComprehensionOne">ListeningComprehensionOne</option>
						  	<option value ="ListeningComprehensionTwo">ListeningComprehensionTwo</option>
						  	<option value ="ListeningComprehensionThree">ListeningComprehensionThree</option>
						 	 <option value ="ListeningComprehensionFour">ListeningComprehensionFour</option>
						  	<option value ="ListeningComprehensionSix">ListeningComprehensionSix</option>
						 	 <option value ="ListeningComprehensionText">ListeningComprehensionText</option>
						</select>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea name="descriptionfive" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="parentquestiontitlefive" value="" />
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>每小题分数：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="questionscorefive"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>开始题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questionfromfive"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>结束题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questiontofive"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题1：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent21" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent21" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent21" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent21" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer21" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain21" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题2：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent22" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent22" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent22" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent22" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer22" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain22" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题3：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent23" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent23" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent23" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent23" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer23" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain23" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				<div class="form-group">
					<div class="label">
						<label>选择题4：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent24" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent24" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent24" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent24" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer24" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain24" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				

				<!-- 第六道听力题参数获取 -->
				<!-- 第六道听力题参数获取 -->
				<!-- 第六道听力题参数获取 -->
				
				<div class="form-group">
					<div class="label">
						<label>大题名称六：</label>
					</div>
					<div class="field">
						<select name="parentquestionnamesix" class="input w50">
						  	<option value ="ListeningComprehensionSix">ListeningComprehensionSix</option>
							<option value ="ListeningComprehensionOne">ListeningComprehensionOne</option>
						  	<option value ="ListeningComprehensionTwo">ListeningComprehensionTwo</option>
						  	<option value ="ListeningComprehensionThree">ListeningComprehensionThree</option>
						 	 <option value ="ListeningComprehensionFour">ListeningComprehensionFour</option>
						 	 <option value ="ListeningComprehensionFive">ListeningComprehensionFive</option>
						 	 <option value ="ListeningComprehensionText">ListeningComprehensionText</option>
						</select>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea name="descriptionsix" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="parentquestiontitlesix" value="" />
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>每小题分数：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="questionscoresix"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>开始题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questionfromsix"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>结束题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questiontosix"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题1：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent25" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent25" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent25" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent25" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer25" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain25" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题2：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent26" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent26" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent26" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent26" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer26" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain26" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>选择题3：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent27" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent27" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent27" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent27" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer27" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain27" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				<div class="form-group">
					<div class="label">
						<label>选择题4：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent28" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent28" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent28" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent28" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer28" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain28" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				<!-- 第七道听力题参数获取 -->
				<!-- 第七道听力题参数获取 -->
				<!-- 第七道听力题参数获取 -->
				
				<div class="form-group">
					<div class="label">
						<label>大题名称文本：</label>
					</div>
					<div class="field">
						<select name="parentquestionnametext" class="input w50">
						 	 <option value ="ListeningComprehensionText">ListeningComprehensionText</option>
							<option value ="ListeningComprehensionOne">ListeningComprehensionOne</option>
						  	<option value ="ListeningComprehensionTwo">ListeningComprehensionTwo</option>
						  	<option value ="ListeningComprehensionThree">ListeningComprehensionThree</option>
						 	 <option value ="ListeningComprehensionFour">ListeningComprehensionFour</option>
						 	 <option value ="ListeningComprehensionFive">ListeningComprehensionFive</option>
						  	<option value ="ListeningComprehensionSix">ListeningComprehensionSix</option>
						</select>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea name="descriptiontext" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>文章：</label>
					</div>
					<div class="field">
						<textarea name="parentquestionarticle" class="input"
							style="height: 250px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="parentquestiontitletext" value="" />
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>每小题分数：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="questionscoretext"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>开始题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="0" name="questionfromtext"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>结束题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="0" name="questiontotext"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第一题：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="textquestionanswer1" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="textquestionexplain1" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				
				<div class="form-group">
					<div class="label">
						<label>第二题：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="textquestionanswer2" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="textquestionexplain2" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第三题：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="textquestionanswer3" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="textquestionexplain3" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第四题：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="textquestionanswer4" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="textquestionexplain4" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				
				<div class="form-group">
					<div class="label">
						<label>第五题：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="textquestionanswer5" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="textquestionexplain5" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第六题：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="textquestionanswer6" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="textquestionexplain6" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第七题：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="textquestionanswer7" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="textquestionexplain7" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第八题：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="textquestionanswer8" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="textquestionexplain8" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第九题：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="textquestionanswer9" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="textquestionexplain9" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第十题：</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>答案：</label>
					</div>
					<input type="text" class="input w50" name="textquestionanswer10" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="textquestionexplain10" class="input"
							style="height: 80px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>