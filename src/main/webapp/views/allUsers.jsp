<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All User</title>
</head>
<body>

<h1>All User</h1>
<table border="1">
    <thead>
    <tr>
        <th>Username</th>
        <th>Enabled</th>
        <th>Role</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.username}</td>
            <td>${user.enabled}</td>
            <td>
                <ul>
                    <c:forEach var="role" items="${user.roles}">
                        <li>${role}</li>
                    </c:forEach>
                </ul>
            </td>
            <td>
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/users/${user.id}">View </a>
                    <li>
                        <a onclick="if (!confirm('Are you sure to delete this user?')) return false" href="${pageContext.request.contextPath}/admin/delete?username=${user.username}">Delete</a>
                    </li>
                </ul>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<hr>
<a href="${pageContext.request.contextPath}/admin/users/new">Create new user</a>
<hr>
<a href="${pageContext.request.contextPath}/admin">Back</a>

</body>
</html>
