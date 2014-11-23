<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑头像</title>

<script type="text/javascript">
	var getPhotoPathOnServer = function() {
		return "${ctx}/upload/userHead/"
	}

	var getPostURL = function() {
		return "${ctx}/user/save_photo1";
	}
</script>

</head>
<body>




	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
		width="560" height="340" id="PhotoUpload">
		<param name="movie" value="PhotoUpload.swf" />
		<param name="quality" value="high" />
		<param name="bgcolor" value="#c8c8c8" />
		<param name="allowScriptAccess" value="sameDomain" />
		<param name="allowFullScreen" value="true" />
		<!--[if !IE]>-->
		<object type="application/x-shockwave-flash"
			data="${ctx}/static/flexcrop/PhotoUpload.swf" width="560"
			height="340">
			<param name="quality" value="high" />
			<param name="bgcolor" value="#c8c8c8" />
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="allowFullScreen" value="true" />
			<!--<![endif]-->
			<!--[if gte IE 6]>-->
			<p>Either scripts and active content are not permitted to run or
				Adobe Flash Player version 11.1.0 or greater is not installed.</p>
			<!--<![endif]-->
			<a href="http://www.adobe.com/go/getflashplayer"> <img
				src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
				alt="Get Adobe Flash Player" />
			</a>
			<!--[if !IE]>-->
		</object>
		<!--<![endif]-->
	</object>
</body>
</html>