<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkName(){
	var username=$('input[name="userName"]').val();
	$.ajax({
		  type: "GET",
		  url: "${ctx}/user/checkUserName?username="+username,
		  dataType: "text",
		   success: function(msg){
			  alert(msg);
		   }
	});
}

</script>

</head>
<body>


<form action="${ctx}/user/create" enctype="multipart/form-data"  method="post">

	用户名<input type="text" name="userName" value="${user.userName }"  onchange="checkName()">
	<input type="hidden" name="id" value="${user.id }">
	<input type="file" name="file" />  
	<input type="submit" value="提交">
</form>

</body>
</html>