<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
</head>
<body>
<h1>Change Password</h1>
  <form:form action="${pageContext.request.contextPath}/user/profile/change-password" method="post">
    <div>
      <label for="oldPassword">Old password:</label>
      <input type="password" id="oldPassword" name="oldPassword" required><br>
    </div>
    <div>
      <label for="newPassword">New password:</label>
      <input type="password" id="newPassword" name="newPassword" required value="${user.password}"><br>
    </div>
    <div>
      <label for="confirmNewPassword">Confirm new password:</label>
      <input type="password" id="confirmNewPassword" name="confirmNewPassword" required>
    </div>
  <div>
    <button type="submit"> SAVE </button>
  </div>
  <div>
    <c:if test="${not empty successMessage}">
      <div class="error"> <strong>${successMessage}</strong> </div>
    </c:if>
    <c:if test="${not empty errorMessage}">
      <div class="error"> <strong>${errorMessage}</strong> </div>
    </c:if>
  </div>
  </form:form>
<a href="${pageContext.request.contextPath}/user/profile">Back</a>

</body>
</html>
