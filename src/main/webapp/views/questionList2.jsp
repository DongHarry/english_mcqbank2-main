<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 23/07/2023
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Questions</title>
</head>
<body>
<h1>Questions</h1>
    <table>
        <tr>
            <th>Question id</th>
            <th>Question content</th>
            <th>Topic id</th>
            <th>Correct answer</th>
            <th>Answer</th>
            <th>Level</th>
            <th>Type</th>

        </tr>
        <c:forEach items="${questions}" var="question">
            <tr>
                <td>${question.id}</td>
                <td>${question.content}</td>
                <td>${question.topicId}</td>
                <td>${question.correctAnswer}</td>
                <td>${question.answer}</td>
                <td>${question.level}</td>
                <td>${question.type}</td>
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
    <a href="#">Create new question</a> <br>
    <a href="${pageContext.request.contextPath}/admin">Back to admin page</a>
</body>
</html>
