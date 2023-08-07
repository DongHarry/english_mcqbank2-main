<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 07/08/2023
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Topics</title>
</head>
<body>
    <h1>Topics</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Topic ID</th>
                <th>Topic Name</th>
                <th>Topic Description</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="topic" items="${topics}">
                <tr>
                    <td>${topic.id}</td>
                    <td>${topic.name}</td>
                    <td>${topic.description}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <c:if test="${currentPage > 0}">
        <a href="?page=${currentPage - 1}">Prev</a>
    </c:if>
    <c:if test="${hasNext}">
        <a href="?page=${currentPage + 1}">Next</a>
    </c:if>

    <hr>
    <a href="#">Create new topic</a><br>
    <a href="#">Edit topic</a><br>
    <a href="#">Delete topic</a><br>
    <a href="${pageContext.request.contextPath}/admin">Back</a>
</body>
</html>
