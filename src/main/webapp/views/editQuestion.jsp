<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 09/08/2023
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Question</title>
</head>
<body>
<h1>Edit question</h1>
<form:form method="post" action="/admin/questions/${c_question.id}/edit">
    <div>
        <label for="content">Question content:</label>
        <input type="text" id="content" name="content" value="${c_question.content}" required><br>
    </div>
    <div>
        <label for="option1">Option 1:</label>
        <input type="text" id="option1" name="option1" value="${c_question.option1}" required><br>
    </div>
    <div>
        <label for="option2">Option 2:</label>
        <input type="text" id="option2" name="option2" value="${c_question.option2}" required><br>
    </div>
    <div>
        <label for="option3">Option 3:</label>
        <input type="text" id="option3" name="option3" value="${c_question.option3}" required><br>
    </div>
    <c:if test="${c_question.type == 1}">
        <div>
            <label for="option4">Option 4:</label>
            <input type="text" id="option4" name="option4" value="${c_question.option4}" required><br>
        </div>
    </c:if>
    <c:if test="${c_question.type == 2}">
        <div>
            <label for="option4">Audio file name:</label>
            <input type="text" id="option4" name="option4" value="${c_question.option4}" required><br>
        </div>
    </c:if>
    <div>
        <div>
            <label for="answer">Exam type(1:reading, 2:listening):</label>
            <input type="radio" name="answer" value="1" id="answer" <c:if test="${c_question.answer == 1}">checked</c:if>> 1
            <input type="radio" name="answer" value="2" id="answer" <c:if test="${c_question.answer == 2}">checked</c:if>> 2
            <input type="radio" name="answer" value="3" id="answer" <c:if test="${c_question.answer == 3}">checked</c:if>> 3
            <c:if test="${c_question.type == 1}">
                <input type="radio" name="examType" value="4" id="answer" <c:if test="${c_question.answer == 4}">checked</c:if>> 4
            </c:if>
        </div><!-- col-4 -->
    </div><!-- col-4 -->
    <div>
        <label for="explain">Question content:</label>
        <input type="text" id="explain" name="explain" value="${c_question.explain}" required><br>
    </div>
    <div>
        <label for="level">Level:</label>
        <input type="text" id="level" name="level" value="${c_question.level}" required><br>
    </div>
<%--    <div>--%>
<%--        <label for="type">Type:</label>--%>
<%--        <input type="text" id="type" name="type" value="${c_question.type}" required><br>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <label for="topic">Topic:</label>--%>
<%--        <input type="text" id="topic" name="topic" value="${c_question.topic.name}" required><br>--%>
<%--    </div>--%>
    <div>
        <button type="submit"> SAVE </button>
    </div>
</form:form>
</body>
</html>
