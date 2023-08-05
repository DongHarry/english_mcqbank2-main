<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EditUser</title>
</head>
<body>
<form:form action="${pageContext.request.contextPath}/user/profile/edit" method="post">
  <div>
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" value="${currentUser.username}" readonly><br>
  </div>
  <div>
    <label for="fullName">Full Name:</label>
    <input type="text" id="fullName" name="fullName" value="${currentUser.fullName}" required><br>
  </div>
  <div>
    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required value="${currentUser.address}">  <br>
  </div>
  <div>
    <label for="phone">Phone:</label>
    <input type="text" id="phone" name="phone" required value="${currentUser.phone}"><br>
  </div>
  <div>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required value="${currentUser.email}"><br>
  </div>


  <%--    <label for="roles" id="roles" name="roles">Roles:</label>--%>
  <br>
  <%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">--%>
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
