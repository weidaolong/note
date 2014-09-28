<%@tag pageEncoding="UTF-8"%>
<%@ attribute name="page" type="org.springframework.data.domain.Page" required="true"%>
<%@ attribute name="paginationSize" type="java.lang.Integer" required="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="note" uri="/WEB-INF/tld/note.tld" %>
<%
int current =  page.getNumber() + 1;
int begin = Math.max(1, current - paginationSize/2);
int end = Math.min(begin + (paginationSize - 1), page.getTotalPages());

request.setAttribute("current", current);
request.setAttribute("begin", begin);
request.setAttribute("end", end);
%>

<div>
	<ul class="pagination">
		 <% if (page.hasPreviousPage()){%>
               	<li><a href="?<note:url searchParam="${searchParams}" regParam="pageNum"  regValue="1" />">&lt;&lt;</a></li>
                <li><a href="?<note:url searchParam="${searchParams}" regParam="pageNum" regValue="${current-1}"/>">&lt;</a></li>
         <%}else{%>
                <li class="disabled"><a href="#">&lt;&lt;</a></li>
                <li class="disabled"><a href="#">&lt;</a></li>
         <%} %>
 
		<c:forEach var="i" begin="${begin}" end="${end}">
            <c:choose>
                <c:when test="${i == current}">
                    <li class="active"><a href="?<note:url searchParam="${searchParams}" regParam="pageNum" regValue="${i}"/>">${i}</a></li>
                </c:when>
                <c:otherwise>
            	<c:if test="${(i>current&& i-2<=current ) ||(i<current&&i+2>=current)}">
                    <li><a href="?<note:url searchParam="${searchParams}" regParam="pageNum" regValue="${i }"/>">${i}</a></li>
                </c:if>
                </c:otherwise>
            </c:choose>
        </c:forEach>
	  
	  	 <% if (page.hasNextPage()){%>
               	<li><a href="?<note:url searchParam="${searchParams}" regParam="pageNum" regValue="${current+1}"/>">&gt;</a></li>
                <li><a href="?<note:url searchParam="${searchParams}" regParam="pageNum" regValue="${page.totalPages}"/>">&gt;&gt;</a></li>
         <%}else{%>
                <li class="disabled"><a href="#">&gt;</a></li>
                <li class="disabled"><a href="#">&gt;&gt;</a></li>
         <%} %>

	</ul>
</div>

