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
			<form method="post" class="form-x" action="${ctx }/reading/add">

				<div class="clear"></div>
				<div class="form-group">
					<div class="label">
						<label>试卷名称：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="examname" value="" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="label" >
						<label>大题名称 ：</label>
					</div>
					<div class="field">
						<select name="parentQuestionName"  style="width:200px; height:40px;">
						<option>LastReadingOne </option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea name="description" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="parentquestiontitle1" value="" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>每题分数 ：</label>
					</div>
					<input type="text" class="input w50" name="questionscore" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>开始题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questionfrom"/>
						<div class="tips"></div>
					</div>
				</div>
				<hr/>
				
				<div class="form-group">
					<div class="label">
						<label>结束题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questionto"/>
						<div class="tips"></div>
					</div>
				</div>
				
				
				<div class="form-group">
					<div class="label">
						<label>文章内容(1)：</label>
					</div>
					<div class="field">
						<textarea name="parentquestionarticle1" class="input"
							style="height: 350px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>

				<div class="clear"></div>



				<hr>
				<div class="form-group">
					<div class="label">
						<label>选择题1：</label>
					</div>
					<div class="field">
						<textarea type="text" class="input" name="question56"
							style="height: 80px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent56" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent56" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent56" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent56" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer56" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain56" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				
				<hr>
				<div class="form-group">
					<div class="label">
						<label>选择题2：</label>
					</div>
					<div class="field">
						<textarea type="text" class="input" name="question57"
							style="height: 80px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent57" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent57" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent57" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent57" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer57" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain57" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				<div class="form-group">
					<div class="label">
						<label>选择题3：</label>
					</div>
					<div class="field">
						<textarea type="text" class="input" name="question58"
							style="height: 80px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent58" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent58" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent58" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent58" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer58" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain58" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>

				<hr>
				<div class="form-group">
					<div class="label">
						<label>选择题4：</label>
					</div>
					<div class="field">
						<textarea type="text" class="input" name="question59"
							style="height: 80px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent59" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent59" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent59" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent59" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer59" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain59" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				<div class="form-group">
					<div class="label">
						<label>选择题5：</label>
					</div>
					<div class="field">
						<textarea type="text" class="input" name="question60"
							style="height: 80px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent60" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent60" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent60" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent60" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer60" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain60" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				
				<div class="form-group">
					<div class="label" >
						<label>大题名称 ：</label>
					</div>
					<div class="field">
						<select name="parentquestionname2"  style="width:200px; height:40px;">
						<option>LastReadingTwo</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="parentquestiontitle2" value="" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>开始题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questionfrom2"/>
						<div class="tips"></div>
					</div>
				</div>
				<hr/>
				
				<div class="form-group">
					<div class="label">
						<label>结束题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="输入题号(整数)" name="questionto2"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>内容(2)：</label>
					</div>
					<div class="field">
						<textarea name="parentquestionarticle2" class="input"
							style="height: 350px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>

				<div class="clear"></div>



				<hr>
				<div class="form-group">
					<div class="label">
						<label>选择题1：</label>
					</div>
					<div class="field">
						<textarea type="text" class="input" name="question61"
							style="height: 80px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent61" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent61" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent61" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent61" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer61" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain61" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				<div class="form-group">
					<div class="label">
						<label>选择题2：</label>
					</div>
					<div class="field">
						<textarea type="text" class="input" name="question62"
							style="height: 80px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent62" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent62" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent62" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent62" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer62" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain62" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				<div class="form-group">
					<div class="label">
						<label>选择题3：</label>
					</div>
					<div class="field">
						<textarea type="text" class="input" name="question63"
							style="height: 80px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent63" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent63" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent63" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent63" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer63" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain63" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>

				<hr>
				<div class="form-group">
					<div class="label">
						<label>选择题4：</label>
					</div>
					<div class="field">
						<textarea type="text" class="input" name="question64"
							style="height: 80px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent64" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent64" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent64" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent64" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer64" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain64" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>

				<hr>
				<div class="form-group">
					<div class="label">
						<label>选择题5：</label>
					</div>
					<div class="field">
						<textarea type="text" class="input" name="question65"
							style="height: 80px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="aselecttcontent65" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="bselecttcontent65" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="cselecttcontent65" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="dselecttcontent65" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer65" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain65" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>

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