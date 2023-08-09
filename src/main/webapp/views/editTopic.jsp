<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 09/08/2023
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit topic</title>
</head>
<body>
    <h1>Edit topic</h1>
    <form:form action="${pageContext.request.contextPath}/admin/topics/${c_topic.id}/edit" method="post">
        <div>
            <label for="name">Topic name:</label>
            <input type="text" id="name" name="name" value="${c_topic.name}"><br>
        </div>
        <div>
            <label for="description">Topic description:</label>
            <input type="text" id="description" name="description" value="${c_topic.description}" required><br>
        </div>
        <div>
            <button type="submit"> SAVE </button>
        </div>
    </form:form>
</body>
</html>
