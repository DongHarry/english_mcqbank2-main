<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Add User</title>
</head>
<body>
<h1>Add User</h1>
<c:if test="${not empty message}">
    <div class="error">${message}
    </div>
</c:if>
<form:form action="/admin/addUser" method="post">
    <div>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="${user.username}" required><br>
    </div>
    <div>
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" value="${user.fullName}" required><br>
    </div>
    <div>
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required value="${user.address}">  <br>
    </div>
    <div>
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required value="${user.phone}"><br>
    </div>
    <div>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required value="${user.email}"><br>
    </div>
    <div>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required value="${user.password}"><br>
    </div>
    <div>
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required value="${confirmPassword}">
    </div>
    <div>
        <label>ROLE:</label>
        <input type="radio" name="role" value="admin"> ROLE_ADMIN
        <input type="radio" name="role" value="user"> ROLE_USER
    </div>
    <br>
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">--%>
    <button type="submit">Add User</button>
</form:form>
<hr>
<a href="/admin">Back</a>
</body>
</html>
