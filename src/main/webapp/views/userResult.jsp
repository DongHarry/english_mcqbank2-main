<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>${title}</h1>
<hr>
<table border="1">
    <tr>
        <th>Result ID</th>
        <th>User Name</th>
        <th>Exam name</th>
        <th>Exam type</th>
        <th>Score</th>
        <th>Date</th>
    </tr>
    <c:forEach items="${results}" var="result">
        <tr>
            <td>${result.id}</td>
            <td>${result.user.username}</td>
            <td>${result.exam.name}</td>
            <td>
                <c:if test="${result.exam.type == 1}">
                    Reading
                </c:if>
                <c:if test="${result.exam.type == 2}">
                    Listening
                </c:if>
            </td>
            <td>${result.score}/${result.exam.questionNo}</td>
            <td>${result.time}</td>
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
    <a href="${pageContext.request.contextPath}/admin/exams">Back</a>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
    <a href="${pageContext.request.contextPath}/user">Back</a>
</sec:authorize>


</body>
</html>
