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
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="title"
							data-validate="required:请输入标题" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>所属类型：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="s_title" value="" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>图片：</label>
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
						<label>其他属性：</label>
					</div>
					<div class="field" style="padding-top: 8px;">
						推荐 <input id="isvouch" type="checkbox" /> 置顶 <input id="istop"
							type="checkbox" />

					</div>
				</div>
				</if>

				<div class="form-group">
					<div class="label">
						<label>内容：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 250px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>

				<div class="clear"></div>


				<div class="form-group">
					<div class="label">
						<label>排序：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="sort" value="0"
							data-validate="number:排序必须为数字" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>发布时间：</label>
					</div>
					<div class="field">

						<input type="text" class="laydate-icon input w50" name="datetime"
							onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"
							value="" data-validate="required:日期不能为空"
							style="padding: 10px !important; height: auto !important; border: 1px solid #ddd !important;" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>点击次数：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="views" value=""
							data-validate="member:只能为数字" />
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