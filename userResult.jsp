<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="icon" href="${pageContext.request.contextPath}/resource/img/favicon.png" type="image/png" sizes="16x16">

<!-- vendor css -->
<link href="${pageContext.request.contextPath}/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/lib/rickshaw/rickshaw.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/lib/select2/css/select2.min.css" rel="stylesheet">

<!-- Bracket CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bracket.css">
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
    <div class="form-layout-footer mg-t-30">
        <a href="${pageContext.request.contextPath}/user" class="btn btn-info">Homepage</a>
    </div>
</sec:authorize>


</body>
</html>
