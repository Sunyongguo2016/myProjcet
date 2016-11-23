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
			<form method="post" class="form-x" action="${ctx }/writing/add">
				<div class="form-group">
					<div class="label">
						<label>图片：</label>
					</div>
					<div class="field">
						<input type="text" id="url1" name="imgUrl" class="input tips"
							style="width: 25%; float: left;" value="" data-toggle="hover"
							data-place="right" data-image="" /> <input type="button"
							class="button bg-blue margin-left" id="image1" value="+ 浏览上传"
							style="float: left;">
						<div class="tipss">图片尺寸：500*500</div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>图片附带文字：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="parentQuestionArticle" value="" />
					</div>
				</div>
				<div class="clear"></div>
				<div class="form-group">
					<div class="label">
						<label>试卷名称：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="examName" value="" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>大题名称：</label>
					</div>
					<div class="field">
						<input type="text" name="parentQuestionName" class="input w50" value="Writing" readonly="true">
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>题目描述：</label>
					</div>
					<div class="field">
						<textarea class="input" name="description" style="height: 90px;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>范文：</label>
					</div>
					<div class="field">
						<textarea name="questionExplain" class="input"
							style="height: 150px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>每小题分数：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="questionScore"/>
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