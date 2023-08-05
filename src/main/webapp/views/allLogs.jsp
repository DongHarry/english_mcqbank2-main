
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>All user's log</title>
</head>
<body>
    <h1>All user's log</h1>
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
    <a href="${pageContext.request.contextPath}/admin">Back to home</a>
</body>
</html>
