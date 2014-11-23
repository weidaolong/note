<%@page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
<div class="normal_form">
	<%
	String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	if(error != null){
	%>
		<div class="alert alert-error input-medium controls">
			<button class="close" data-dismiss="alert">×</button>登录失败，请重试.
		</div>
	<%
	}
	%>
	
	
	<form class="form-signin" role="form" method="post">
	      <h2 class="form-signin-heading">登录</h2>
	      <input type="text" class="form-control" placeholder="登录名" name="username" required="" autofocus="">
	      <input type="password" class="form-control" placeholder="密码"  name="password" required="">
	      <div class="checkbox">
	        <label>
	          <input type="checkbox" value="remember-me"> 记住
	        </label>
	      </div>
	      <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
	</form>
</div>

</body>
</html>