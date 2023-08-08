<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 08/08/2023
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forgot password</title>
</head>
<body>
<h1>Forgot password</h1>
<c:if test="${not empty message2}">
    <div class="error">${message2}</div>
    <br>
</c:if>
<form:form action="${pageContext.request.contextPath}/forgot-password" method="post">
    <input type="text" name="name" placeholder="Enter your email or username">
    <input type="submit" value="Submit">
</form:form>
</body>
</html>
