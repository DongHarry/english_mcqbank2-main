<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin role</title>
</head>
<body>
<h1>Admin role</h1>
<a href="${pageContext.request.contextPath}/admin/profile">Admin profile </a>
<hr>
<h2>Users</h2>
<a href="${pageContext.request.contextPath}/admin/users">All users</a>

<br>
<h3><a href="${pageContext.request.contextPath}/admin/users/new">Add user</a> </h3>
<hr>
<h2>Exams</h2>
<h3><a href="${pageContext.request.contextPath}/admin/exams">All Exam</a> </h3>
<hr>

<h2>Questions</h2>
<h3><a href="${pageContext.request.contextPath}/admin/exams">All Question</a> </h3>
<h3><a href="#">Add question by excel</a> </h3>
<hr>

<c:if test="${not empty message}">
    <div class="message">${message}</div>
</c:if>
<hr>
All users logs: <a href="${pageContext.request.contextPath}/admin/allLogs">Link</a>
<hr>
<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">--%>
    <button type="submit">Sign out</button>
</form:form>
<%--<a href="${pageContext.request.contextPath}/main">Back to the homepage</a>--%>
</body>
</html>