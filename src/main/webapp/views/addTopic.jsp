<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 09/08/2023
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add topic</title>
</head>
<body>
<h1>Add topic</h1>
<c:if test="${not empty e_message}">
    <div class="error">${e_message}</div>
</c:if>
<form:form action="${pageContext.request.contextPath}/admin/addTopic" method="post">
    <div>
        <label for="name">Topic name:</label>
        <input type="text" id="name" name="name" required><br>
    </div>
    <div>
        <label for="description">Topic description:</label>
        <input type="text" id="description" name="description" required><br>
    </div>
    <div>
        <button type="submit"> SAVE </button>
    </div>
</form:form>
</body>
</html>
