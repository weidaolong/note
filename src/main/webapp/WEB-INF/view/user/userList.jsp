<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/taglibs.jsp"%>
<html>
<head>
<title>任务管理</title>
<script type="text/javascript">
		var config={
				searchParams : '${searchParams}',
				pageNo : '0'
		}
		
		
		function loadUser(id){
			$.ajax({
				  type: "GET",
				  url: "${ctx}/user/load/"+id,
				  dataType: "json",
				   success: function(msg){
					  alert(msg.userName+msg.id);
				   }
			});
		}
	
	</script>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success">
			<button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<a href="${ctx}/user/create">新建</a>

	<button class="btn" onclick="loadUser()">加载数据</button>
	<div class="row">
		<div class="span4 offset7">
			<form class="form-search" action="user" method="get">
				<label>名称：</label> <input type="text" name="userName"
					class="input-medium" value="${param.userName}">
				<button type="submit" class="btn" id="search_btn">搜索</button>
			</form>
		</div>
	</div>

	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>任务</th>
				<th>管理</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userList.content}" var="user">
				<tr>
					<td><a href="${ctx}/user/update/${user.id}">${user.userName}</a></td>
					<td><a href="${ctx}/user/delete/${user.id}">删除</a><button class="btn" onclick="loadUser('${user.id}')">加载</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<tags:pagination paginationSize="10" page="${userList }"></tags:pagination>
</body>
</html>
