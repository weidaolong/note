<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增URL</title>
<script type="text/javascript">
function cascade(parentId){
	$.getJSON("getByParentId?parentId="+parentId, function(json){
		if(json!=""){
			$("#secondCase").show();
		}else{
			$("#secondCase").hide();
		}
		
		$("#secondCase>select").empty();
		$.each(json, function(idx, obj) {
			$("#secondCase>select").append("<option value="+obj.id+">"+obj.urlName+"</option>");
		});
	});
}

function chgParentId(parentId){
	$("#parentId").val(parentId);
}

</script>
</head>
<body>
<form  role="form"  action="${ctx }/bgurl/save" method="post">
  
	<div class="form-group">
	  <label>根菜单</label>
	  <select class="form-control" onchange="cascade(this.value);chgParentId(this.value);">
	  	<option value="0">所有资源</option>
	  	<c:forEach items="${url}" var="sysurl">
	  	<option value="${sysurl.id}">${sysurl.urlName }</option>
	    </c:forEach>
	  </select>
	</div>
	
	<div class="form-group" id="secondCase" style="display: none;">
	  <label>二级菜单</label>
	  <select class="form-control" onchange="chgParentId(this.value);">
	  </select>
	</div>
	
<input name="parentId" type="hidden" id="parentId" value="">
  <div class="form-group">
    <label for="exampleInputEmail1">资源名称</label>
    <input type="text" class="form-control" name="urlName">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">资源URL</label>
    <input type="text" class="form-control" name="url" >
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">资源详细说明</label>
    <input type="text" class="form-control" name="comment" >
  </div>
  <button type="submit" class="btn btn-default">保存</button>
   
   
   

</form>
</body>
</html>