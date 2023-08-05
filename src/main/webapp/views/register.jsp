<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Add User</title>
</head>
<body>
<h1>REGISTER</h1>

<form:form action="${pageContext.request.contextPath}/register" method="post">
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

<%--    <label for="roles" id="roles" name="roles">Roles:</label>--%>
    <br>
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">--%>
    <div>
        <button type="submit"> REGISTER </button>
    </div>
    <div>
        <c:if test="${not empty successMessage}">
            <div class="error"> <strong>${successMessage}</strong> </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="error"> <strong>${errorMessage}</strong> </div>
        </c:if>
    </div>

</form:form>
<hr>
<a href="/home">Back</a> or <a href="/login-page">Login</a>
</body>
</html>
