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
<script type="text/javascript" charset="utf-8" src="${ctx }/ueditor/ueditor.all.js"> </script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>修改内容</strong>
		</div>
		
		
		<div class="body-content">
			<c:if test="${action=='edit' }">
			<form action="${ctx }/notice/edit" class="form-x" method="post">
			</c:if>
			
			<c:if test="${action!='edit' }">
			<form action="${ctx }/notice/add" class="form-x" method="post">
			</c:if>
				<div class="form-group">
		        <div class="label">
		          <label>公告id：</label>
		        </div>
		        <div class="field">
		          <input type="text" class="input w50" value="${notice.noticeId }" readonly="true" name="noticeId" />
		          <div class="tips"></div>
		        </div>
		      </div>
			
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="noticeTitle" value="${notice.noticeTitle }" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>类型：</label>
					</div>
					<div class="field">
						 <select name="noticeType" style="width:100px; height:40px;">
						  <option value ="考试流程">考试流程</option>
						  <option value ="报名流程">报名流程</option>
						  <option value="成绩查询">成绩查询</option>
						  <option value="考试技巧">考试技巧</option>
						</select>
						<!-- <input type="text" class="input w50"  name="type" value="" 
							data-validate="required:请输入类型" />
							 -->
						<div class="tips"></div>
					</div>
				</div>

				<if condition="$iscid eq 1">

				<div class="clear"></div>
				
				<div class="form-group">
					<div class="label">
						<label>在线编辑器：</label>
					</div>
					<div class="field">
					    <!-- 加载编辑器的容器 -->
			    	<script id="container" name="noticeContent" type="text/plain">
        				${notice.noticeContent}
   					 </script>
					<!-- 实例化编辑器 -->
					<script type="text/javascript">
					UE.getEditor('container',{
			            //这里可以选择自己需要的工具按钮名称
			            toolbars:[['fullscreen', 'bold','italic','underline','paragraph','insertorderedlist', 'insertunorderedlist','link' ,'unlink' ,'date','cleardoc', 'simpleupload','attachment']],
			            //focus时自动清空初始化时的内容
			            autoClearinitialContent:true,
			            //关闭字数统计
			            wordCount:true,
			            //关闭elementPath
			            elementPathEnabled:true,
			            //默认的编辑区域宽高
			            initialFrameHeight:300,
			            initialFrameWidth:800 
			            //更多其他参数，请参考ueditor.config.js中的配置项
			        });
					</script>
						<div class="tips"></div>
					</div>
				</div>

				<div class="clear"></div>

				<div class="form-group">
					<div class="label">
						<label>发布时间：</label>
					</div>
					<div class="field">
					
						<input type='text'  name="" id="getBookTime" readonly="true"
							value="自动获得" 
							style="padding: 10px !important; height: auto !important; border: 1px solid #ddd !important;" />
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