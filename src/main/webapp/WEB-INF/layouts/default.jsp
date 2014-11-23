<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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

 <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">NOTE</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">NOTE</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">主页</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
			<shiro:guest>
	            <li><a href="${ctx }/register">注册</a></li>
	            <li><a href="${ctx }/login">登录</a></li>
			</shiro:guest>
			<shiro:user>
	            <li class="dropdown">
	              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><shiro:principal property="name"/> <span class="caret"></span></a>
	              <ul class="dropdown-menu" role="menu">
	                <li class="divider"></li>
	                <li class="dropdown-header">后台管理</li>
	                <li> <a href="${ctx}/logout">退出</a></li>
	              </ul>
	            </li>
				
			</shiro:user>
            <li><a href="${ctx }/mylist">我的事项</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
	
<div class="container">
    <div class="row">
			<sitemesh:body/>
    </div>
</div>
</body>

</html>