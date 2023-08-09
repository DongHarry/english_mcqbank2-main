<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 08/08/2023
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reset password</title>
</head>
<body>
<h1>Reset password</h1>
<h2>${user.username}</h2>
<form:form action="${pageContext.request.contextPath}/reset-password" method="post">
    <input type="password" id="password" name="password" placeholder="new password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$"
           title="Mật khẩu phải chứa ít nhất 8 ký tự, bao gồm một chữ hoa, một chữ thường, một chữ số và một ký tự đặc biệt (!@#$%^&*)." required>
    <br>
    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="confirm password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$"
           title="Mật khẩu phải chứa ít nhất 8 ký tự, bao gồm một chữ hoa, một chữ thường, một chữ số và một ký tự đặc biệt (!@#$%^&*)." required>
    <input type="hidden" name="token" value="${param.token}">
    <input type="submit" value="Reset">
</form:form>
</body>
</html>
