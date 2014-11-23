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

<body>

<%@ include file="/WEB-INF/layouts/header.jsp"%>
	
<div id="leftbar" class="span2">
	<h1>综合演示</h1>
	<div class="submenu">
		<a id="account-tab"href="${ctx}/account/user/">帐号管理</a>
	</div>
	<h1>独立演示</h1>
	<div class="submenu">
		<a id="web-tab" href="${ctx}/story/web">Web演示</a>
		<a id="webservice-tab"href="${ctx}/story/webservice">WebService演示</a>
		<a id="hystrix-tab" href="${ctx}/hystrix">Hystrix演示</a>
		<a id="jmx-tab" href="${ctx}/story/jmx">JMX演示</a>
		<a id="log-tab" href="${ctx}/story/log">日志高级演示</a>
		<a id="monitor-tab" href="${ctx}/story/monitor">性能监控演示</a>
	</div>
	<h1>演示说明</h1>
	<div class="submenu">
		<a id="persistence-tab" href="${ctx}/story/persistence">持久化高级演示</a>
		<a id="jms-tab" href="${ctx}/story/jms">JMS演示</a>
		<a id="reids-tab" href="${ctx}/story/redis">Redis演示</a>
		<a id="cache-tab" href="${ctx}/story/cache">Cache演示</a>
		<a id="schedule-tab" href="${ctx}/story/schedule">定时任务演示</a>
		<a id="security-tab" href="${ctx}/story/security">安全高级演示</a>
		<a id="utilizes-tab"href="${ctx}/story/utilizes">工具类演示</a>
		<a id="executablewar-tab"href="${ctx}/story/executablewar">可运行war包演示</a>
	</div>
</div>


</body>

</html>