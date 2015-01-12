<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<!-- boostrap setting -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${ctx}/static/jquery-validate/validate.css" />
<link rel="stylesheet" href="${ctx}/static/boostrap3.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/static/boostrap3.2/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="${ctx}/static/css/default.css" />
<link rel="stylesheet" href="${ctx}/static/css/account.css" />

<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validate/messages_zh.js"></script>


<script type="text/javascript" src="${ctx}/static/js/account.js"></script>

<title>NOTE ● <sitemesh:title/></title>
<sitemesh:head/>
</head>

<body>

<%@ include file="/WEB-INF/layouts/header.jsp"%>
	
<div class="container">
    <div class="row">
			<%@ include file="/WEB-INF/layouts/left.jsp"%>
			<div class="main">
			<sitemesh:body/>
			</div>
    </div>
</div>

</body>

</html>