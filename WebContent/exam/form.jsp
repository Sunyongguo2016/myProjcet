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
<script type="text/javascript" charset="utf-8" src="${ctx }/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx }/ueditor/ueditor.all.min.js"> </script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>增加内容</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="${ctx }/exam/edit?">
				<input type="hidden" name="examId" value="${ex.examId }" />
				<div class="form-group">
					<div class="label">
						<label>试卷类型：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${ex.examType }" name="type"
							data-validate="required:请输入试卷类型" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>试卷时间：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${ex.examTime }" name="time"
							data-validate="required:请输入试卷时间" />
						<div class="tips"></div>
					</div>
				</div>


				<div class="clear"></div>
				<div class="form-group">
					<div class="label">
						<label>试卷名称：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="name" value="${ex.examName }" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>音频地址：</label>
					</div>
					<div class="field">
					    <!-- 加载编辑器的容器 -->
			    	<script id="container" name="examUrl" type="text/plain">
        				
   					 </script>
					<!-- 实例化编辑器 -->
					<script type="text/javascript">
					UE.getEditor('container',{
			            //这里可以选择自己需要的工具按钮名称,
			            toolbars:[['fullscreen', 'attachment']],
			            //focus时自动清空初始化时的内容
			            autoClearinitialContent:true,
			            //关闭字数统计
			            wordCount:true,
			            //关闭elementPath
			            elementPathEnabled:true,
			            //默认的编辑区域宽高
			            initialFrameHeight:100,
			            initialFrameWidth:500 
			            //更多其他参数，请参考ueditor.config.js中的配置项
			        });
					</script>
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