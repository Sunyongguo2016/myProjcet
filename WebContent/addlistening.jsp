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
			<form method="post" class="form-x" action="">
				<div class="form-group">
					<div class="label">
						<label>题号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="title"
							data-validate="required:请输入标题" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="clear"></div>
				<div class="form-group">
					<div class="label">
						<label>试卷名称：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="s_title" value="" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>音频：</label>
					</div>
					<div class="field">
						<input type="text" id="url1" name="img" class="input tips"
							style="width: 25%; float: left;" value="" data-toggle="hover"
							data-place="right" data-image="" /> <input type="button"
							class="button bg-blue margin-left" id="image1" value="+ 浏览上传"
							style="float: left;">
						<div class="tipss">图片尺寸：500*500</div>
					</div>
				</div>

				<if condition="$iscid eq 1">
				<div class="form-group">
					<div class="label">
						<label>分类：</label>
					</div>
					<div class="field">
						<select name="cid" class="input w50">
							<option value="">请选择分类</option>
							<option value="">单个问题</option>
							<option value="">多个问题</option>
							<option value="">听力填空</option>

						</select>
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
					<input type="text" class="input w50" name="views" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
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
					<input type="text" class="input w50" name="views" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
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
					<input type="text" class="input w50" name="views" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
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