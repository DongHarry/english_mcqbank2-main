<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 12/08/2023
  Time: 04:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>${user1.username}</h1>
<h1>${user2.username}</h1>
  <form:form action="${pageContext.request.contextPath}/admin/test2" method="post">
    <c:forEach items="${topics}" var="topic">
      <p>${topic.name}</p>
    </c:forEach>
    <input type="hidden" name="topicWrapper.topics" value="${topics}" />
    <input type="submit" value="submit">
  </form:form>
</body>
</html>
