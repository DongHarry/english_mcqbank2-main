
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Đăng nhập</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">Login #08</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="login-wrap p-4 p-md-5">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="fa fa-user-o"></span>
                    </div>
                    <h3 class="text-center mb-4">Have an account?</h3>
                    <form:form action="${pageContext.request.contextPath}/login-processing" method="post" class="login-form" id="loginForm">
                        <div class="form-group">
                            <div class="w-100">
                                <c:if test="${param.error != null}">
                                    <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                                        Invalid username/password !!!
                                    </div>
                                </c:if>
<%--                                <c:if test="${errorMessage2 != null}">--%>
<%--                                    <div class="alert alert-danger col-xs-offset-1 col-xs-10">--%>
<%--                                        Invalid username/password !!!--%>
<%--                                    </div>--%>
<%--                                </c:if>--%>
                                <c:if test="${param.logout != null}">
                                    <div class="alert alert-success col-xs-offset-1 col-xs-10">
                                        You have been logged out successfully.
                                    </div>
                                </c:if>
<%--                                <c:if test="${successMessage != null}">--%>
<%--                                    <div class="alert alert-success col-xs-offset-1 col-xs-10">--%>
<%--                                            ${successMessage}--%>
<%--                                    </div>--%>
<%--                                </c:if>--%>
                                <c:if test="${logoutMessage != null}">
                                    <div class="alert alert-success col-xs-offset-1 col-xs-10">
                                            ${logoutMessage}
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="text" name="username" id="username" class="form-control rounded-left" placeholder="Username" value="" required>
                        </div>
                        <div class="form-group d-flex">
                            <input type="password" name="password" id="password" class="form-control rounded-left" placeholder="Password" value="" required>
                        </div>
                        <div class="form-group d-md-flex">
<%--                            <div class="w-50">--%>
<%--                                <label class="checkbox-wrap checkbox-primary">Remember Me--%>
<%--                                    <input name="remember-me" type="checkbox" checked>--%>
<%--                                    <span class="checkmark"></span>--%>
<%--                                </label>--%>
<%--                            </div>--%>
                            <div class="w-50">
                                <a href="/register">Register</a>
                            </div>
                            <div class="w-50 text-md-right">
                                <a href="#">Forgot Password</a>
                            </div>
                        </div>
<%--                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">--%>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary rounded submit p-3 px-5">Get Started</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>
</html>


