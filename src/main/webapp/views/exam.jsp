<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 06/08/2023
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Exam</title>
</head>
<body>
<h1>Exam</h1>
<ul>
    <li>Exam ID: ${exam.id} </li>
    <li>Exam Name: ${exam.name} </li>
    <li>Exam Date: ${exam.time} </li>
     <li>Question No: ${exam.questionNo} </li>
    <li>Exam Duration: ${exam.questionNo} minutes </li>
    <li>
        Exam Topics:
        <ol>
        <c:forEach var="examtopic" items="${exam.examTopicList}">
            <li>
                Exam Topic ID: <c:out value="${examtopic.topic.id}"/>
                Exam Topic Name: <c:out value="${examtopic.topic.name}"/>
            </li>
        </c:forEach>
        </ol>
    </li>
</ul>
<a href="${pageContext.request.contextPath}/user/exams/${exam.id}/do">Start</a> <br/>
<a href="${pageContext.request.contextPath}/user/exams">Back to Exam List</a> <br/>
</body>
</html>
