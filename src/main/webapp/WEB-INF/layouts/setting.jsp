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
<link rel="stylesheet" href="${ctx}/static/css/note.css" />
<link rel="stylesheet" href="${ctx}/static/css/setting.css" />

<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/static/boostrap3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validate/messages_zh.js"></script>

<script src="${ctx}/static/jcrop/js/jquery.Jcrop.min.js"></script>
<link rel="stylesheet" href="${ctx}/static/jcrop/css/jquery.Jcrop.css" type="text/css" />

<title>NOTE ● <sitemesh:title/></title>
<sitemesh:head/>
</head>

<body class="s_mian_bg">
	<div class="s_mian">
		<div class="main_left">
			<div class="list-group">
			  <a class="list-group-item" href="${ctx}/set/index">我的信息</a>
			  <a class="list-group-item" href="${ctx}/set/photo">头像</a>
			  <a class="list-group-item" href="${ctx}/set/bgurl">url</a>
			  <a class="list-group-item">真操蛋</a>
			  <a class="list-group-item">不操蛋</a>
			</div>
		</div>
		
		<div class="main_right">
		<sitemesh:body/>
		</div>
		
		<div class="clear"></div>
	</div>


</body>

</html>