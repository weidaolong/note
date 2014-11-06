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

	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">NOTE</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">主页</a></li>
					<li><a href="#about">关于</a></li>
					<li><a href="#contact">联系</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
		  <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview</a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<sitemesh:body/>
		</div>
     </div>
    </div>
</body>

</html>