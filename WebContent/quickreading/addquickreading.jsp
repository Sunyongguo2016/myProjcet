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
			<strong><span class="icon-pencil-square-o"></span>添加内容</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="${ctx }/quickreading/add">

				<div class="clear"></div>
				<div class="form-group">
					<div class="label">
						<label>试卷名称：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="examname" value="" />
					</div>
				</div>
				
				<if condition="$iscid eq 1">

				
				<div class="form-group">
					<div class="label">
						<label>大题名称：</label>
					</div>
					<div class="field">
						<input type="text" name="parentQuestionName" class="input w50" value="QuickReading" readonly="true">
						<div class="tips"></div>
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
						<input type="text" class="input" name="parentquestiontitle" value="" />
					</div>
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
						<label>每题分数 ：</label>
					</div>
					<input type="text" class="input w50" name="questionscore" value="" />
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>文章内容：</label>
					</div>
					<div class="field">
						<textarea name="parentquestionarticle" class="input"
							style="height: 350px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr>
				<div class="form-group">
					<div class="label">
						<label>第一题 ：</label>
					</div>
					<div class="field">
						<textarea name="questioncontent1" class="input"
							style="height: 70px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer1" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain1" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第二题：</label>
					</div>
					<div class="field">
						<textarea name="questioncontent2" class="input"
							style="height: 70px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer2" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain2" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第三题：</label>
					</div>
					<div class="field">
						<textarea name="questioncontent3" class="input"
							style="height: 70px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer3" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain3" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第四题：</label>
					</div>
					<div class="field">
						<textarea name="questioncontent4" class="input"
							style="height: 70px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer4" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain4" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第五题：</label>
					</div>
					<div class="field">
						<textarea name="questioncontent5" class="input"
							style="height: 70px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer5" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain5" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第六题：</label>
					</div>
					<div class="field">
						<textarea name="questioncontent6" class="input"
							style="height: 70px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer6" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain6" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第七题：</label>
					</div>
					<div class="field">
						<textarea name="questioncontent7" class="input"
							style="height: 70px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer7" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain7" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<div class="label">
						<label>第八题：</label>
					</div>
					<div class="field">
						<textarea name="questioncontent8" class="input"
							style="height: 70px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer8" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain8" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第九题：</label>
					</div>
					<div class="field">
						<textarea name="questioncontent9" class="input"
							style="height: 70px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer9" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain9" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
					<div class="label">
						<label>第十题：</label>
					</div>
					<div class="field">
						<textarea name="questioncontent10" class="input"
							style="height: 70px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>答案 ：</label>
					</div>
					<input type="text" class="input w50" name="questionanswer10" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain10" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="clear"></div>

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