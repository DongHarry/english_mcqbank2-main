<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 08/08/2023
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit exam</title>
</head>
<body>
<form:form action="${pageContext.request.contextPath}/admin/exams/${c_exam.id}/edit" method="post">
    <div>
        <label for="name">Exam name:</label>
        <input type="text" id="name" name="name" value="${c_exam.name}"><br>
    </div>
    <div>
        <label for="questionNo">Question No:</label>
        <input type="text" id="questionNo" name="questionNo" value="${c_exam.questionNo}" required><br>
    </div>
    <div>
        <label for="type">Exam type:</label>
        <input type="text" id="type" name="type" required value="${c_exam.type}">  <br>
    </div>


    <%--    <label for="roles" id="roles" name="roles">Roles:</label>--%>
    <br>
    <%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">--%>
    <div>
        <button type="submit"> SAVE </button>
    </div>


</form:form>
</body>
</html>
