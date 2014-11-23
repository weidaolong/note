<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员注册</title>
</head>
<body>

<div class="col-sm-12">
<form action="${ctx }/user/save" method="post" class="form-horizontal" role="form">
	 
	 
 <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
    <div class="col-sm-5">
      <input name="userMail" type="email" class="form-control"  placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-5">
      <input name="passwd" type="password" class="form-control"  placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">昵称</label>
    <div class="col-sm-5">
      <input name="userName" type="text" class="form-control" placeholder="Text input">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-5">
      <button type="submit" class="btn btn-default">注册</button>
    </div>
  </div>
  
  
</form>
</div>

</body>
</html>