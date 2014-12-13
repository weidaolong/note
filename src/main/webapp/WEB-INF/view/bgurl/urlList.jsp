<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>url配置信息</title>
<script type="text/javascript">


</script>
</head>
<body>


<form class="form-inline" role="form" action="${ctx }/bgurl" method="get">
<div class="panel panel-default">
<div class="panel-heading">查询条件</div>
  <div class="panel-body">
  
  	<div class="form-group">
	    <label for="urlName" class="control-label">url名称</label>
	    <input type="text" class="form-control" id="urlName" name="urlName" value="${sysUrl.urlName }">
	    <label for="urlName" class="control-label">url</label>
	    <input type="text" class="form-control" id="urlName" name="url" value="${sysUrl.url }">
	</div>
	
  	<div class="form-group">
	          <input type="submit" class="form-control" value="查询"> 
	          <input type="button" class="form-control" value="新建"  data-toggle="modal" data-target="#myModal"> 
   </div>
  </div>
</div>

</form>

	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>url名称</th>
				<th>url</th>
				<th>配置详情</th>
				<th>创建时间</th>
				<th>是否可用</th>
				<th>父目录</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="sysurl">
				<tr>
					<td>${sysurl.urlName}</td>
					<td>${sysurl.url}</td>
					<td>${sysurl.comment}</td>
					<td><fmt:formatDate value="${sysurl.createDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td><c:if test="${sysurl.isEnable==0}">是</c:if><c:if test="${sysurl.isEnable!=0 }">否</c:if> </td>
					<td><c:if test="${sysurl.parentId==0}">无</c:if> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<tags:pagination paginationSize="10" page="${list }"></tags:pagination>



<form class="form-inline" role="form" action="${ctx }/bgurl/save" method="post">
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">新增URL</h4>
      </div>
      <div class="modal-body">
  	<div class="form-group">
	    <label for="urlName" class="control-label">url名称</label>
	    <input type="text" class="form-control" id="urlName" name="urlName" value="${sysUrl.urlName }">
	    <label for="urlName" class="control-label">url</label>
	    <input type="text" class="form-control" id="urlName" name="url" value="${sysUrl.url }">
	</div>
	
  		<div class="form-group">
	          <input type="submit" class="form-control" value="查询"> 
	          <input type="button" class="form-control" value="新建"  data-toggle="modal" data-target="#myModal"> 
      </div>
      
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</div>
</form>
</body>
</html>