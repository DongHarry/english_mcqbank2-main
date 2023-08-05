<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>User role</title>
</head>
<body>
    <h1>User role</h1>
    <h3><a href="/user/profile">User Information</a></h3>
    <hr>
    <a href="${pageContext.request.contextPath}/user/exams">Test</a>
    <hr>
    <a href="${pageContext.request.contextPath}/user/results">Result</a>
    <hr>
<%--    <a href="${pageContext.request.contextPath}/main">Back to the homepage</a>--%>
    <form:form action="${pageContext.request.contextPath}/logout" method="post">
        <%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">--%>
        <button type="submit">Sign out</button>
    </form:form>
</body>
</html>