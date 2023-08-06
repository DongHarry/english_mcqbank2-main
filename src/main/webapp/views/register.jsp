<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Add User</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>REGISTER</h1>--%>

<%--<form:form action="${pageContext.request.contextPath}/register" method="post">--%>
<%--    <div>--%>
<%--        <label for="username">Username:</label>--%>
<%--        <input type="text" id="username" name="username" value="${user.username}" required><br>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <label for="fullName">Full Name:</label>--%>
<%--        <input type="text" id="fullName" name="fullName" value="${user.fullName}" required><br>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <label for="address">Address:</label>--%>
<%--        <input type="text" id="address" name="address" required value="${user.address}">  <br>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <label for="phone">Phone:</label>--%>
<%--        <input type="text" id="phone" name="phone" required value="${user.phone}"><br>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <label for="email">Email:</label>--%>
<%--        <input type="email" id="email" name="email" required value="${user.email}"><br>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <label for="password">Password:</label>--%>
<%--        <input type="password" id="password" name="password" required value="${user.password}"><br>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <label for="confirmPassword">Confirm Password:</label>--%>
<%--        <input type="password" id="confirmPassword" name="confirmPassword" required value="${confirmPassword}">--%>
<%--    </div>--%>

<%--    <br>--%>
<%--    <div>--%>
<%--        <button type="submit"> REGISTER </button>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <c:if test="${not empty successMessage}">--%>
<%--            <div class="error"> <strong>${successMessage}</strong> </div>--%>
<%--        </c:if>--%>
<%--        <c:if test="${not empty errorMessage}">--%>
<%--            <div class="error"> <strong>${errorMessage}</strong> </div>--%>
<%--        </c:if>--%>
<%--    </div>--%>

<%--</form:form>--%>
<%--<hr>--%>
<%--<a href="/home">Back</a> or <a href="/login-page">Login</a>--%>
<%--</body>--%>
<%--</html>--%>



<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Meta -->
    <meta name="description" content="Premium Quality and Responsive UI for Dashboard.">
    <meta name="author" content="ThemePixels">

    <title>Đăng ký - English Hus</title>

    <!-- vendor css -->
    <link href="${pageContext.request.contextPath}/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/select2/css/select2.min.css" rel="stylesheet">

    <!-- Bracket CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bracket.css">
</head>

<body>

<div class="row no-gutters flex-row-reverse ht-100v">
    <div class="col-md-6 bg-gray-200 d-flex align-items-center justify-content-center">
        <div class="login-wrapper wd-250 wd-xl-350 mg-y-30">
            <h4 class="tx-inverse tx-center">Sign Up</h4>
            <p class="tx-center mg-b-60">Create your own account.</p>


            <form:form action="${pageContext.request.contextPath}/register" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Enter your username" id="username"
                    name="username" value="${user.username}" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Enter your fullname" id="fullName"
                    name="fullName" value="${user.fullName}" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Enter your address" id="address"
                    name="address" value="${user.address}">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Enter your phone" id="phone"
                    name="phone" value="${user.phone}">
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" placeholder="Enter your email" id="email"
                    name="email" required value="${user.email}">
                </div><!-- form-group -->
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Enter your password" id="password"
                    name="password" required value="${user.password}">
                </div><!-- form-group -->
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Confirm your password" id="confirmPassword"
                    name="confirmPassword" required value="${confirmPassword}">
                </div> <!-- form-group -->

                <div>
                    <c:if test="${not empty successMessage}">
                        <div class="error"> <strong>${successMessage}</strong> </div>
                    </c:if>
                    <c:if test="${not empty errorMessage}">
                        <div class="error"> <strong>${errorMessage}</strong> </div>
                    </c:if>
                </div>

                <div class="form-group tx-12">
                    By clicking the Sign Up button below you agreed to our privacy policy and terms
                    of use of our website.</div>
                <button type="submit" class="btn btn-info btn-block">Sign Up</button>
            </form:form>



            <div class="mg-t-60 tx-center">Already a member? <a href="/login-page" class="tx-info">Sign In</a></div>
        </div><!-- login-wrapper -->
    </div><!-- col -->
    <div class="col-md-6 bg-br-primary d-flex align-items-center justify-content-center">
        <div class="wd-250 wd-xl-450 mg-y-30">
            <div class="signin-logo tx-28 tx-bold tx-white"><span class="tx-normal">[</span> english <span class="tx-info">hus</span> <span class="tx-normal">]</span></div>
            <div class="tx-white-7 mg-b-60">The Admin Template For Perfectionist</div>

            <h5 class="tx-white">Tại sao chọn English Hus?</h5>
            <p class="tx-white-6">English Hus là một trung tâm đào tạo tiếng Anh uy tín, nơi học viên được trải nghiệm môi
                trường học tập thân thiện và chất lượng. Với đội ngũ giáo viên nhiệt tình, phương pháp giảng dạy hiện đại,
                English Hus cam kết mang đến cho học viên sự tiến bộ vượt bậc trong việc sử dụng tiếng Anh. Không chỉ tập
                trung vào ngữ pháp và từ vựng, English Hus còn khuyến khích phát triển kỹ năng giao tiếp tự tin và sáng tạo.</p>
            <p class="tx-white-6 mg-b-60">Đây thực sự là nơi lí tưởng để nâng cao khả năng tiếng Anh và mở ra những cơ hội
                mới trong tương lai.</p>
            <a href="/home" class="btn btn-outline-light bd bd-white bd-2 tx-white pd-x-25 tx-uppercase tx-12 tx-spacing-2 tx-medium">Home</a>
        </div><!-- wd-500 -->
    </div>
</div><!-- row -->

<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery-ui/ui/widgets/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/select2/js/select2.min.js"></script>
<script>
    $(function(){
        'use strict';

        $('.select2').select2({
            minimumResultsForSearch: Infinity
        });
    });
</script>

</body>
</html>
