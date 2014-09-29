<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据库备份与恢复</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">数据库备份</div>
		<div class="panel-body">
			<button type="button" class="btn btn-default">执行备份</button>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">数据库恢复</div>
		<div class="panel-body">
			<button type="button" class="btn btn-default">执行备份</button>
		</div>
	</div>

</body>
</html>