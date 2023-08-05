<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 17/07/2023
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Logs</title>
</head>
<body>
<h1>${logs.get(0).user.fullName}'s log</h1>
<hr>
<table border="1">
    <tr>
        <th>Log ID</th>
        <th>Log Name</th>
        <th>Log Status</th>
        <th>Log Date</th>
        <th>User</th>
    </tr>
    <c:forEach items="${logs}" var="log">
        <tr>
            <td>${log.id}</td>
            <td>${log.name}</td>
            <td>
                <c:if test="${log.status == 1}">Success</c:if>
                <c:if test="${log.status == 0}">Failed</c:if>
            </td>
            <td>${log.datetime}</td>
            <td>${log.user.username}</td>
        </tr>
    </c:forEach>
</table>
<c:if test="${currentPage > 0}">
    <a href="?page=${currentPage - 1}">Prev</a>
</c:if>
<c:if test="${hasNext}">
    <a href="?page=${currentPage + 1}">Next</a>
</c:if>
<hr>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <a href="${pageContext.request.contextPath}/admin/users/${logs.get(0).user.id}">Back</a>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_USER')">
        <a href="${pageContext.request.contextPath}/user/profile">Back</a>
    </sec:authorize>
</body>
</html>
