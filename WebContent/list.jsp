<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html lang="zh-cn">
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
	<form method="post" action="" id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> åå®¹åè¡¨</strong> <a href=""
					style="float: right; display: none;"> æ·»å å­æ®µ</a>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
					<li><a class="button border-main icon-plus-square-o"
						href="${ctx }/add.jsp"> æ·»å åå®¹</a></li>
					<li>æç´¢ï¼</li>
					<li>é¦é¡µ <select name="s_ishome" class="input"
						onchange="changesearch()"
						style="width: 60px; line-height: 17px; display: inline-block">
							<option value="">éæ©</option>
							<option value="1">æ¯</option>
							<option value="0">å¦</option>
					</select> &nbsp;&nbsp; æ¨è <select name="s_isvouch" class="input"
						onchange="changesearch()"
						style="width: 60px; line-height: 17px; display: inline-block">
							<option value="">éæ©</option>
							<option value="1">æ¯</option>
							<option value="0">å¦</option>
					</select> &nbsp;&nbsp; ç½®é¡¶ <select name="s_istop" class="input"
						onchange="changesearch()"
						style="width: 60px; line-height: 17px; display: inline-block">
							<option value="">éæ©</option>
							<option value="1">æ¯</option>
							<option value="0">å¦</option>
					</select>
					</li>
					<if condition="$iscid eq 1">
					<li><select name="cid" class="input"
						style="width: 200px; line-height: 17px;" onchange="changesearch()">
							<option value="">è¯·éæ©åç±»</option>
							<option value="">äº§ååç±»</option>
							<option value="">äº§ååç±»</option>
							<option value="">äº§ååç±»</option>
							<option value="">äº§ååç±»</option>
					</select></li>
					</if>
					<li><input type="text" placeholder="è¯·è¾å¥æç´¢å³é®å­"
						name="keywords" class="input"
						style="width: 250px; line-height: 17px; display: inline-block" />
						<a href="javascript:void(0)"
						class="button border-main icon-search" onclick="changesearch()">
							æç´¢</a></li>
				</ul>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th width="100" style="text-align: left; padding-left: 20px;">ID</th>
					<th width="10%">æåº</th>
					<th>å¾ç</th>
					<th>åç§°</th>
					<th>å±æ§</th>
					<th>åç±»åç§°</th>
					<th width="10%">æ´æ°æ¶é´</th>
					<th width="310">æä½</th>
				</tr>
				<volist name="list" id="vo">
				<tr>
					<td style="text-align: left; padding-left: 20px;"><input
						type="checkbox" name="id[]" value="" /> 1</td>
					<td><input type="text" name="sort[1]" value="1"
						style="width: 50px; text-align: center; border: 1px solid #ddd; padding: 7px 0;" /></td>
					<td width="10%"><img src="images/11.jpg" alt="" width="70"
						height="50" /></td>
					<td>è¿æ¯ä¸å¥MUIåå°ç²¾ç¾ç®¡çç³»ç»ï¼æè°¢æ¨çæ¯æ</td>
					<td><font color="#00CC99">é¦é¡µ</font></td>
					<td>äº§ååç±»</td>
					<td>2016-07-01</td>
					<td><div class="button-group">
							<a class="button border-main" href="${ctx }/add.jsp"><span
								class="icon-edit"></span> ä¿®æ¹</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1,1)"><span
								class="icon-trash-o"></span> å é¤</a>
						</div></td>
				</tr>
				<tr>
					<td style="text-align: left; padding-left: 20px;"><input
						type="checkbox" name="id[]" value="" /> 1</td>
					<td><input type="text" name="sort[1]" value="1"
						style="width: 50px; text-align: center; border: 1px solid #ddd; padding: 7px 0;" /></td>
					<td width="10%"><img src="images/11.jpg" alt="" width="70"
						height="50" /></td>
					<td>è¿æ¯ä¸å¥MUIåå°ç²¾ç¾ç®¡çç³»ç»ï¼æè°¢æ¨çæ¯æ</td>
					<td><font color="#00CC99">é¦é¡µ</font></td>
					<td>äº§ååç±»</td>
					<td>2016-07-01</td>
					<td><div class="button-group">
							<a class="button border-main" href="${ctx }/add.jsp"><span
								class="icon-edit"></span> ä¿®æ¹</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1,1)"><span
								class="icon-trash-o"></span> å é¤</a>
						</div></td>
				</tr>
				<tr>
					<td style="text-align: left; padding-left: 20px;"><input
						type="checkbox" name="id[]" value="" /> 1</td>
					<td><input type="text" name="sort[1]" value="1"
						style="width: 50px; text-align: center; border: 1px solid #ddd; padding: 7px 0;" /></td>
					<td width="10%"><img src="images/11.jpg" alt="" width="70"
						height="50" /></td>
					<td>è¿æ¯ä¸å¥MUIåå°ç²¾ç¾ç®¡çç³»ç»ï¼æè°¢æ¨çæ¯æ</td>
					<td><font color="#00CC99">é¦é¡µ</font></td>
					<td>äº§ååç±»</td>
					<td>2016-07-01</td>
					<td><div class="button-group">
							<a class="button border-main" href="${ctx }/add.jsp"><span
								class="icon-edit"></span> ä¿®æ¹</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1,1)"><span
								class="icon-trash-o"></span> å é¤</a>
						</div></td>
				</tr>
				<tr>
					<td style="text-align: left; padding-left: 20px;"><input
						type="checkbox" name="id[]" value="" /> 1</td>
					<td><input type="text" name="sort[1]" value="1"
						style="width: 50px; text-align: center; border: 1px solid #ddd; padding: 7px 0;" /></td>
					<td width="10%"><img src="images/11.jpg" alt="" width="70"
						height="50" /></td>
					<td>è¿æ¯ä¸å¥MUIåå°ç²¾ç¾ç®¡çç³»ç»ï¼æè°¢æ¨çæ¯æ</td>
					<td><font color="#00CC99">é¦é¡µ</font></td>
					<td>äº§ååç±»</td>
					<td>2016-07-01</td>
					<td><div class="button-group">
							<a class="button border-main" href="${ctx }/add.jsp"><span
								class="icon-edit"></span> ä¿®æ¹</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1,1)"><span
								class="icon-trash-o"></span> å é¤</a>
						</div></td>
				</tr>
				<tr>
					<td style="text-align: left; padding-left: 20px;"><input
						type="checkbox" name="id[]" value="" /> 1</td>
					<td><input type="text" name="sort[1]" value="1"
						style="width: 50px; text-align: center; border: 1px solid #ddd; padding: 7px 0;" /></td>
					<td width="10%"><img src="images/11.jpg" alt="" width="70"
						height="50" /></td>
					<td>è¿æ¯ä¸å¥MUIåå°ç²¾ç¾ç®¡çç³»ç»ï¼æè°¢æ¨çæ¯æ</td>
					<td><font color="#00CC99">é¦é¡µ</font></td>
					<td>äº§ååç±»</td>
					<td>2016-07-01</td>
					<td><div class="button-group">
							<a class="button border-main" href="${ctx }/add.jsp"><span
								class="icon-edit"></span> ä¿®æ¹</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1,1)"><span
								class="icon-trash-o"></span> å é¤</a>
						</div></td>
				</tr>
				<tr>
					<td style="text-align: left; padding-left: 20px;"><input
						type="checkbox" name="id[]" value="" /> 1</td>
					<td><input type="text" name="sort[1]" value="1"
						style="width: 50px; text-align: center; border: 1px solid #ddd; padding: 7px 0;" /></td>
					<td width="10%"><img src="images/11.jpg" alt="" width="70"
						height="50" /></td>
					<td>è¿æ¯ä¸å¥MUIåå°ç²¾ç¾ç®¡çç³»ç»ï¼æè°¢æ¨çæ¯æ</td>
					<td><font color="#00CC99">é¦é¡µ</font></td>
					<td>äº§ååç±»</td>
					<td>2016-07-01</td>
					<td><div class="button-group">
							<a class="button border-main" href="${ctx }/add.jsp"><span
								class="icon-edit"></span> ä¿®æ¹</a> <a class="button border-red"
								href="javascript:void(0)" onclick="return del(1,1,1)"><span
								class="icon-trash-o"></span> å é¤</a>
						</div></td>
				</tr>
				<tr>
					<td style="text-align: left; padding: 19px 0; padding-left: 20px;"><input
						type="checkbox" id="checkall" /> å¨é</td>
					<td colspan="7" style="text-align: left; padding-left: 20px;"><a
						href="javascript:void(0)" class="button border-red icon-trash-o"
						style="padding: 5px 15px;" onclick="DelSelect()"> å é¤</a> <a
						href="javascript:void(0)"
						style="padding: 5px 15px; margin: 0 10px;"
						class="button border-blue icon-edit" onclick="sorts()"> æåº</a>
						æä½ï¼ <select name="ishome"
						style="padding: 5px 15px; border: 1px solid #ddd;"
						onchange="changeishome(this)">
							<option value="">é¦é¡µ</option>
							<option value="1">æ¯</option>
							<option value="0">å¦</option>
					</select> <select name="isvouch"
						style="padding: 5px 15px; border: 1px solid #ddd;"
						onchange="changeisvouch(this)">
							<option value="">æ¨è</option>
							<option value="1">æ¯</option>
							<option value="0">å¦</option>
					</select> <select name="istop"
						style="padding: 5px 15px; border: 1px solid #ddd;"
						onchange="changeistop(this)">
							<option value="">ç½®é¡¶</option>
							<option value="1">æ¯</option>
							<option value="0">å¦</option>
					</select> &nbsp;&nbsp;&nbsp; ç§»å¨å°ï¼ <select name="movecid"
						style="padding: 5px 15px; border: 1px solid #ddd;"
						onchange="changecate(this)">
							<option value="">è¯·éæ©åç±»</option>
							<option value="">äº§ååç±»</option>
							<option value="">äº§ååç±»</option>
							<option value="">äº§ååç±»</option>
							<option value="">äº§ååç±»</option>
					</select> <select name="copynum"
						style="padding: 5px 15px; border: 1px solid #ddd;"
						onchange="changecopy(this)">
							<option value="">è¯·éæ©å¤å¶</option>
							<option value="5">å¤å¶5æ¡</option>
							<option value="10">å¤å¶10æ¡</option>
							<option value="15">å¤å¶15æ¡</option>
							<option value="20">å¤å¶20æ¡</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="8"><div class="pagelist">
							<a href="">ä¸ä¸é¡µ</a> <span class="current">1</span><a href="">2</a><a
								href="">3</a><a href="">ä¸ä¸é¡µ</a><a href="">å°¾é¡µ</a>
						</div></td>
				</tr>
			</table>
		</div>
	</form>
	<script type="text/javascript">
		//æç´¢
		function changesearch() {

		}

		//åä¸ªå é¤
		function del(id, mid, iscid) {
			if (confirm("æ¨ç¡®å®è¦å é¤å?")) {

			}
		}

		//å¨é
		$("#checkall").click(function() {
			$("input[name='id[]']").each(function() {
				if (this.checked) {
					this.checked = false;
				} else {
					this.checked = true;
				}
			});
		})

		//æ¹éå é¤
		function DelSelect() {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
				var t = confirm("æ¨ç¡®è®¤è¦å é¤éä¸­çåå®¹åï¼");
				if (t == false)
					return false;
				$("#listform").submit();
			} else {
				alert("è¯·éæ©æ¨è¦å é¤çåå®¹!");
				return false;
			}
		}

		//æ¹éæåº
		function sorts() {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("è¯·éæ©è¦æä½çåå®¹!");
				return false;
			}
		}

		//æ¹éé¦é¡µæ¾ç¤º
		function changeishome(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("è¯·éæ©è¦æä½çåå®¹!");

				return false;
			}
		}

		//æ¹éæ¨è
		function changeisvouch(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("è¯·éæ©è¦æä½çåå®¹!");

				return false;
			}
		}

		//æ¹éç½®é¡¶
		function changeistop(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("è¯·éæ©è¦æä½çåå®¹!");

				return false;
			}
		}

		//æ¹éç§»å¨
		function changecate(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("è¯·éæ©è¦æä½çåå®¹!");

				return false;
			}
		}

		//æ¹éå¤å¶
		function changecopy(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
				var i = 0;
				$("input[name='id[]']").each(function() {
					if (this.checked == true) {
						i++;
					}
				});
				if (i > 1) {
					alert("åªè½éæ©ä¸æ¡ä¿¡æ¯!");
					$(o).find("option:first").prop("selected", "selected");
				} else {

					$("#listform").submit();
				}
			} else {
				alert("è¯·éæ©è¦å¤å¶çåå®¹!");
				$(o).find("option:first").prop("selected", "selected");
				return false;
			}
		}
	</script>
</body>
</html>