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
	<form method="post" action="" id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 内容列表</strong> <a href=""
					style="float: right; display: none;">添加字段</a>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
					<li><a class="button border-main icon-plus-square-o"
						href="${ctx }/exam/addpage.jsp"> 添加试卷</a></li>
					<li>搜索：</li>

					<li><input type="text" placeholder="请输入搜索关键字" id="searchParam" name="searchParam" value="${searchParam }" 
						class="input" style="width: 250px; line-height: 17px; display: inline-block" />
						<a href="javascrpt:searchp()"
						class="button border-main icon-search" 
						 onclick="searchp();return false;">	搜索</a></li>
				</ul>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th width="100" style="text-align: left; padding-left: 20px;">ID</th>

					<th>试卷类型</th>
					<th>试卷日期</th>
					<th>名称</th>
					<th>音频</th>

					<th width="310">操作</th>
				</tr>
				<volist name="list" id="vo">
				
				<c:forEach items="${page.list }" var="pa">
					<tr>
						<td style="text-align: left; padding-left: 20px;">
						<input type="checkbox" name="id[]" value="" /> ${pa.examId }</td>

						<td>${pa.examType }</td>
						<td>${pa.examTime}</td>
						<td>${pa.examName }</td>
						<td>${pa.examUrl }</td>

						<td>
							<div class="button-group">
								<a class="button border-main"
									href="${ctx }/exam/edit?examId=${pa.examId }"><span
									class="icon-edit"></span> 修改</a> <a class="button border-red"
									href="#"
									onclick="return del(1,1,1)"><span class="icon-trash-o"></span>
									删除</a>
							</div>
						</td>
					</tr>
				</c:forEach>
					<tr>
						<td style="text-align: left; padding: 19px 0; padding-left: 20px;"><input
						type="checkbox" id="checkall" /> 全选</td>
						<td colspan="7" style="text-align: left; padding-left: 20px;"><a
						href="javascript:void(0)" class="button border-red icon-trash-o"
						style="padding: 5px 15px;" onclick="DelSelect()"> 删除</a>
					</tr>
					<tr>
						<td colspan="8">
					<div class="pagelist">
				 
						<a href="${ctx }/exam/list?pageNum=1">首页</a>
						<a href="${ctx }/exam/list?pageNum=${page.prePageNum }">上一页</a>
						<c:forEach begin="1" end="${page.totalPageNum }" var="pageNum">
					 	<c:choose>
				   			<c:when test="${page.currentPageNum == pageNum}">  
				         		<span class="current">${page.currentPageNum}</span>
				   			</c:when>
				   			<c:otherwise> 
				    		<a name="pagen" href="${ctx }/exam/list?pageNum=${pageNum }">${pageNum }</a>
				   			</c:otherwise>
						</c:choose>	
					    </c:forEach>
					    <a href="${ctx }/exam/list?pageNum=${page.nextPageNum }">下一页</a>
						<a href="${ctx }/exam/list?pageNum=${page.totalPageNum }">尾页</a>
					</div>
					</td>
						
						
				</tr>
			</table>
		</div>
	</form>
	<script type="text/javascript">
	//搜索
	function searchp(){
		var p=$("#searchParam").val();
		window . location . href = "${ctx }/exam/list?searchParam="+p;
		$("[name='pagen']").each(function(key,value){
			$(this).attr("href",$(this).attr("href")+"&searchParam='"+p+"'");
		});
	}

		//单个删除
		function del(id, mid, iscid) {
			if (confirm("您确定要删除吗?")) {

			}
		}

		//全选
		$("#checkall").click(function() {
			$("input[name='id[]']").each(function() {
				if (this.checked) {
					this.checked = false;
				} else {
					this.checked = true;
				}
			});
		})

		//批量删除
		function DelSelect() {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
				var t = confirm("您确认要删除选中的内容吗？");
				if (t == false)
					return false;
				$("#listform").submit();
			} else {
				alert("请选择您要删除的内容!");
				return false;
			}
		}

		
	</script>
</body>
</html>