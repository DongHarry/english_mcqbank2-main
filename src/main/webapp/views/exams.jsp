<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Exams</title>
</head>
<body>
<h2>Users</h2>
<table border="1">
    <thead>
    <tr>
        <th>Exam Id</th>
        <th>Exam Topics</th>
        <th>Topics </th>
        <th>Exam name</th>
        <th>Question No</th>
        <th>Time</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="exam" items="${exams}">
        <tr>
            <td>${exam.id}</td>
            <td>
<%--                    <c:forEach var="topic" items="${exam.examTopicList}">--%>
<%--                        ${topic},--%>
<%--                    </c:forEach>--%>
<%--                <c:set var="topicNames" value="" />--%>
<%--                <c:forEach var="topic" items="${exam.examTopicList}" varStatus="status">--%>
<%--                    <c:set var="delimiter" value="${not status.first ? ', ' : ''}" />--%>
<%--                    <c:set var="topicNames" value="${topicNames}${delimiter}${topic.id}" />--%>
<%--                </c:forEach>--%>
<%--                    ${topicNames}--%>
                <ul>
                    <c:forEach var="exam_topic" items="${exam.examTopicList}">
                        <c:if test="${not empty exam_topic}">
                            <li>${exam_topic.id}: ${exam_topic.percent}%</li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td>
                <ul>
                    <c:forEach var="exam_topic" items="${exam.examTopicList}">
                        <c:if test="${not empty exam_topic}">
                            <li>${exam_topic.topic.id}</li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td>${exam.name}</td>
            <td>${exam.questionNo}</td>
            <td>${exam.time}</td>
            <td>
                <ul>
                    <sec:authorize access="hasRole('USER')">
                        <li>
                            <a href="${pageContext.request.contextPath}/user/exams/${exam.id}">Take Exam</a>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ADMIN')">
                        <li>
                            <a onclick="if (!confirm('Are you sure to delete this exam?')) return false" href="${pageContext.request.contextPath}/admin/deleteExam?examId=${exam.id}">Delete</a>

                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/results/${exam.id}">All result</a>
                        </li>
                    </sec:authorize>
                </ul>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>
<c:if test="${currentPage > 0}">
    <a href="?page=${currentPage - 1}">Prev</a>
</c:if>
<c:if test="${hasNext}">
    <a href="?page=${currentPage + 1}">Next</a>
</c:if>
<hr>
<sec:authorize access="hasRole('ADMIN')">
    <h3><a href="${pageContext.request.contextPath}/admin/exams/new">Add Exam</a> </h3>
    <a href="${pageContext.request.contextPath}/admin">Back to Admin Panel</a>
</sec:authorize>
<sec:authorize access="hasRole('USER')">
    <a href="${pageContext.request.contextPath}/user">Back to User Panel</a>
</sec:authorize>
</body>
</html>
