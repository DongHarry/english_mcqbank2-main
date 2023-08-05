<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 23/07/2023
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Questions</title>
</head>
<body>
<h1>Questions</h1>
<form:form action="${pageContext.request.contextPath}/questions/submit" method="post">
    <c:forEach var="question" items="${questionMap}">
        <div>
            <h3>${question.value.content}</h3>
            <div>
                <input type="radio" name="question_${question.value.id}" id="question_${question.value.id}_option1" value="${question.value.option1}">
                <label for="question_${question.value.id}_option1">${question.value.option1}</label><br>
                <input type="radio" name="question_${question.value.id}" id="question_${question.value.id}_option2" value="${question.value.option2}">
                <label for="question_${question.value.id}_option2">${question.value.option2}</label><br>
                <input type="radio" name="question_${question.value.id}" id="question_${question.value.id}_option3" value="${question.value.option3}">
                <label for="question_${question.value.id}_option3">${question.value.option3}</label><br>
                <input type="radio" name="question_${question.value.id}" id="question_${question.value.id}_option4" value="${question.value.option4}">
                <label for="question_${question.value.id}_option4">${question.value.option4}</label><br>


            </div>
            <br><br>
        </div>
    </c:forEach>
    <input type="submit" value="Submit">
</form:form>
</body>
</html>
