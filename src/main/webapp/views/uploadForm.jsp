<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload CSV</title>
</head>
<body>
<h1>Upload CSV File</h1>
<c:if test="${not empty message}">
    <h2>${message}</h2>
</c:if>

<form:form method="POST" enctype="multipart/form-data" action="${pageContext.request.contextPath}/test/upload">
    <input type="file" name="file" accept=".csv,.xls,.xlsx" required/>
    <br/>
    <button type="submit">Upload</button>
</form:form>

</body>
</html>
