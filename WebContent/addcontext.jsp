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
						<label>大题名称：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="s_title" value="" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>文章内容：</label>
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
						<label>选项E：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
					<div class="label">
						<label>选项F：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项G：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
					<div class="label">
						<label>选项H：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项I：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
					<div class="label">
						<label>选项J：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项K：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
					<div class="label">
						<label>选项L：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项M：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
					<div class="label">
						<label>选项N：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项O：</label>
					</div>
					<input type="text" class="input w50" name="views" value="" />

				</div>

				<hr/>
				
				<div class="form-group">
					<div class="label">
						<label>每小题分数：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题一答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题一解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题二答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题二解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题三答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题三解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题四答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题四解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题五答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题五解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题六答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题六解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题七答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题七解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题八答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题八解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题九答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题九解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题十答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题十解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题十一答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题十一解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题十二答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题十二解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题十三答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题十三解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题十四答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题十四解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 100px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				<div class="form-group">
					<div class="label">
						<label>小题十五答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="score"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题十五解析：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
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