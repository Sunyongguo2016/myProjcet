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
			<form method="post" class="form-x" action="${ctx }/choosefillinblank/add">

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
					<div class="label">
						<label>大题名称：</label>
					</div>
					<div class="field">
						<input type="text" name="parentquestionname" class="input w50" value="ChooseFillInBlank" readonly="true">
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
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>文章内容：</label>
					</div>
					<div class="field">
						<textarea name="parentquestionarticle" class="input"
							style="height: 250px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>

				<div class="clear"></div>

				<div class="form-group">
					<div class="label">
						<label>选项A：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent1" value="" />
					<div class="label">
						<label>选项B：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent2" value="" />
				</div>
				<div class="form-group">
					<div class="label">
						<label>选项C：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent3" value="" />
					<div class="label">
						<label>选项D：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent4" value="" />
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项E：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent5" value="" />
					<div class="label">
						<label>选项F：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent6" value="" />
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项G：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent7" value="" />
					<div class="label">
						<label>选项H：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent8" value="" />
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项I：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent9" value="" />
					<div class="label">
						<label>选项J：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent10" value="" />
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项K：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent11" value="" />
					<div class="label">
						<label>选项L：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent12" value="" />
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项M：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent13" value="" />
					<div class="label">
						<label>选项N：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent14" value="" />
				</div>

				<div class="form-group">
					<div class="label">
						<label>选项O：</label>
					</div>
					<input type="text" class="input w50" name="selecttcontent15" value="" />

				</div>

				<hr/>
				
				<div class="form-group">
					<div class="label">
						<label>每小题分数：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="questionscore"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<hr/>
				
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
				
				<hr/>
				
				<div class="form-group">
					<div class="label">
						<label>小题一答案：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="questionanswer1"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题一解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain1" class="input"
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
						<input type="text" class="input w50" value="" name="questionanswer2"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题二解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain2" class="input"
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
						<input type="text" class="input w50" value="" name="questionanswer3"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题三解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain3" class="input"
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
						<input type="text" class="input w50" value="" name="questionanswer4"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题四解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain4" class="input"
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
						<input type="text" class="input w50" value="" name="questionanswer5"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题五解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain5" class="input"
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
						<input type="text" class="input w50" value="" name="questionanswer6"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题六解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain6" class="input"
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
						<input type="text" class="input w50" value="" name="questionanswer7"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题七解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain7" class="input"
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
						<input type="text" class="input w50" value="" name="questionanswer8"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题八解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain8" class="input"
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
						<input type="text" class="input w50" value="" name="questionanswer9"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题九解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain9" class="input"
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
						<input type="text" class="input w50" value="" name="questionanswer10"/>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>小题十解析：</label>
					</div>
					<div class="field">
						<textarea name="questionexplain10" class="input"
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