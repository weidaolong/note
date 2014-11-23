<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
</head>
<body>
<div class="row">
  <div class="col-xs-6 col-md-3">
      <img src="${ctx }/static/note/picture/default_photo.png" alt="...">
      <div class="caption">
        <a title="上传一张靓照做头像吧 ^_^" href="${ctx }/photo/upload/${user.id}" class="subBtn">更新头像</a>
      </div>
  </div>
  <div class="col-xs-6 col-md-3">
     用户名:${user.userName }
  </div>
  <div class="col-xs-6 col-md-3">
     邮箱:${user.userMail }
  </div>
  <div class="col-xs-6 col-md-3">
     创建日期:${user.createDate }
  </div>
  
</div>
</body>
</html>