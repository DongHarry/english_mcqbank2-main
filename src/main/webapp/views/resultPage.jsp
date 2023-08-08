
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<h1>Result</h1>
<h2>Score: ${score}/${totalQuestions}</h2>

<hr>
<a href="${pageContext.request.contextPath}/user/exams">Back</a>
<br>
<a href="${pageContext.request.contextPath}/user/results">Results</a>
<br>
<a href="${pageContext.request.contextPath}/user">Back to home</a>
</body>
</html>
