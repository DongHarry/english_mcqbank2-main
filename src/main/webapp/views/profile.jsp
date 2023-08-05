<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 17/07/2023
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Profile</title>
</head>
<body>
<h1>Profile</h1>
<ul>
    <li>Username: ${user.username}</li>
    <li>Fullname: ${user.fullName}</li>
    <li>Email: ${user.email}</li>
    <li>Phone: ${user.phone}</li>
    <li>Address: ${user.address}</li>
    <li>Created Date: ${user.createdDate}</li>
    <li>
        User logs:
            <sec:authorize access="hasRole('USER')"><a href="${pageContext.request.contextPath}/user/profile/logs">Logs</a> </sec:authorize>
            <sec:authorize access="hasRole('ADMIN')"><a href="${pageContext.request.contextPath}/admin/users/${user.id}/logs">Logs</a> </sec:authorize>

    </li>
</ul>
<hr>

<sec:authorize access="hasRole('USER')">
    <a href="${pageContext.request.contextPath}/user/profile/edit">Edit</a>
    <a href="${pageContext.request.contextPath}/user/profile/change-password">Change Password</a>
    <div>
        <c:if test="${successMessage != null}">
            <div class="error"> <strong>${successMessage}</strong> </div>
        </c:if>
        <c:if test="${param.successMessage != null}">
            <div class="error"> <strong>${param.successMessage}</strong> </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="error"> <strong>${errorMessage}</strong> </div>
        </c:if>
    </div>
</sec:authorize>

<a href="${pageContext.request.contextPath}/index">Back to the home page</a>
</body>
</html>
