<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>url配置信息</title>
</head>
<body>


<form class="form-inline" role="form" action="${ctx }/url/list" method="get">
<div class="panel panel-default">
<div class="panel-heading">查询条件</div>
  <div class="panel-body">
  
  	<div class="form-group">
	  <label>根菜单</label>
	  <select class="form-control form-horizontal" name="parentId">
	  	<option value="">所有资源</option>
	  	<c:forEach items="${url}" var="selecturl">
 			<c:choose>
		         <c:when test="${selecturl.id==sysUrl.parentId}">
		         	<option value="${selecturl.id}" selected="selected">${selecturl.urlName }</option>
		         </c:when>
		         <c:otherwise>
		         	<option value="${selecturl.id}" >${selecturl.urlName }</option>
		         </c:otherwise>                 
			</c:choose>
	  	
	    </c:forEach>
	  </select>
	</div>
  	<div class="form-group">
	    <label for="urlName" class="control-label">url名称</label>
	    <input type="text" class="form-control" id="urlName" name="urlName" value="${sysUrl.urlName }">
	    <label for="urlName" class="control-label">url</label>
	    <input type="text" class="form-control" id="urlName" name="url" value="${sysUrl.url }">
	</div>
	
  	<div class="form-group">
	          <input type="submit" class="form-control" value="查询"> 
	          <a class="form-control"  href="${ctx }/bgurl/urltoAdd">新增</a> 
   </div>
  </div>
</div>

</form>

	  <table class="table table-striped table-bordered table-hover" id="contentTable" >
		<thead>
			<tr>
				<th>url名称</th>
				<th>url</th>
				<th>配置详情</th>
				<th>创建时间</th>
				<th>是否可用</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="sysurl">
				<tr>
					<td class="odd gradeX">${sysurl.urlName}</td>
					<td>${sysurl.url}</td>
					<td>${sysurl.comment}</td>
					<td><fmt:formatDate value="${sysurl.createDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td><c:if test="${sysurl.isEnable==0}">是</c:if><c:if test="${sysurl.isEnable!=0 }">否</c:if> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<tags:pagination paginationSize="10" page="${list }"></tags:pagination>
</body>
</html>