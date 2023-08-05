<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AddExam</title>
</head>
<body>
    <form:form action="${pageContext.request.contextPath}/admin/addExam" method="post">
        <label for="examName">Exam name:</label>
        <input type="text" name="examName" id="examName">
        <label for="questionNo">QuestionNo:</label>
        <input type="text" name="questionNo" id="questionNo">
        <br>
        <label for="topic">Topic:</label>
        <c:forEach items="${topics}" var="topic">
            <input type="checkbox" name="topic${topic.id}" id="topic" value="${topic.id}"> ${topic.name}:
            <input type="text" name="numQu.OfTopic${topic.id}">
            <br>
        </c:forEach>
        <button type="submit">Add</button>
    </form:form>
</body>
</html>
