<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑头像</title>
<script type="text/javascript">
	$(function($) {
			$('#target').Jcrop();
	});
	
</script>
</head>
<body>
	<form action="save_photo" enctype="multipart/form-data" method="post">
		<input type="file" name="file" /> <input type="submit" value="提交">
	</form>
	<!-- ${src} -->
	<img alt="" src="${ctx}/user/view?img=Koala.jpg" id="target" width="400px;" height="300px;">
<input type='button' value='保存选中区域' id='btn_save_region' class='SUBMIT'/>
        <input type='button' value='保存全图' id='btn_save_all' class='SUBMIT'/>
</body>
</html>