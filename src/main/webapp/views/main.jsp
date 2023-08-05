<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Hello</title>
</head>
<body>
<h1>Chỉ những ai đăng nhập mới truy cập được trang này!</h1>
<h2>Hello ${username}</h2>
<%--<c:if test="${role == 'admin'}">--%>
<%--    <h4>You are admin</h4>--%>
<%--</c:if>--%>
<p>
    User: <sec:authentication property="principal.username"/>
    <br>
    Authorities: <sec:authentication property="authorities"/>
    <br>
</p>

<hr>
<sec:authorize access="hasRole('USER')">
    <a href="/user">User page</a> <br>
</sec:authorize>
<br>

<sec:authorize access="hasRole('ADMIN')">
    <a href="/admin">Admin page</a> <br>
</sec:authorize>

<sec:authorize access="hasRole('MANAGER')">
    <a href="/manager">Manager page</a> <br>
</sec:authorize>

<form:form action="${pageContext.request.contextPath}/logout" method="post">
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">--%>
    <button type="submit">Sign out</button>
</form:form>
</body>
</html>