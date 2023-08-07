<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Add User</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Add User</h1>--%>
<%--<c:if test="${not empty message}">--%>
<%--    <div class="error">${message}--%>
<%--    </div>--%>
<%--</c:if>--%>
<%--<form:form action="/admin/addUser" method="post">--%>
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
<%--    <div>--%>
<%--        <label>ROLE:</label>--%>
<%--        <input type="radio" name="role" value="admin"> ROLE_ADMIN--%>
<%--        <input type="radio" name="role" value="user"> ROLE_USER--%>
<%--    </div>--%>
<%--    <br>--%>

<%--    <button type="submit">Add User</button>--%>
<%--</form:form>--%>
<%--<hr>--%>
<%--<a href="/admin">Back</a>--%>
<%--</body>--%>
<%--</html>--%>




<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Meta -->
    <meta name="description" content="Premium Quality and Responsive UI for Dashboard.">
    <meta name="author" content="ThemePixels">

    <title>Trang admin</title>

    <!--favicon icon-->
    <link rel="icon" href="${pageContext.request.contextPath}/resource/img/favicon.png" type="image/png" sizes="16x16">

    <!-- vendor css -->
    <link href="${pageContext.request.contextPath}/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/rickshaw/rickshaw.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/select2/css/select2.min.css" rel="stylesheet">

    <!-- Bracket CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bracket.css">
</head>

<body>

<!-- ########## START: LEFT PANEL ########## -->
<div class="br-logo"><a href=""><span>[</span>apelish <i>hus</i><span>]</span></a></div>
<div class="br-sideleft sideleft-scrollbar">
    <label class="sidebar-label pd-x-10 mg-t-20 op-3">Navigation</label>
    <ul class="br-sideleft-menu">

        <li class="br-menu-item">
            <a href="#" class="br-menu-link with-sub">
                <i class="menu-item-icon icon ion-ios-book-outline tx-20"></i>
                <span class="menu-item-label">Quản lý bài thi</span>
            </a><!-- br-menu-link -->
            <ul class="br-menu-sub">
                <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/exams" class="sub-link">
                    Tất cả bài thi</a></li>

            </ul>
        </li>
        <li class="br-menu-item">
            <a href="#" class="br-menu-link with-sub">
                <i class="menu-item-icon icon ion-ios-briefcase-outline tx-24"></i>
                <span class="menu-item-label">Quản lý câu hỏi</span>
            </a><!-- br-menu-link -->
            <ul class="br-menu-sub">
                <li class="sub-item"><a href="${pageContext.request.contextPath}/questions" class="sub-link">Tất cả câu hỏi</a></li>
                <li class="sub-item"><a href="#" class="sub-link">Thêm câu hỏi</a></li>

            </ul>
        </li><!-- br-menu-item -->


        <li class="br-menu-item">
            <a href="#" class="br-menu-link with-sub active show-sub">
                <i class="menu-item-icon icon ion-ios-list-outline tx-22"></i>
                <span class="menu-item-label">Quản lý tài khoản</span>
            </a><!-- br-menu-link -->
            <ul class="br-menu-sub">
                <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/users" class="sub-link">
                    Tài khoản người dùng</a></li>
                <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/users/new" class="sub-link active">
                    Thêm tài khoản</a></li>
            </ul>
        </li><!-- br-menu-item -->
        <li class="br-menu-item">
            <a href="${pageContext.request.contextPath}/admin/topics" class="br-menu-link">
                <i class="menu-item-icon icon ion-ios-person-outline tx-22"></i>
                <span class="menu-item-label">Quản lý topic</span>
            </a><!-- br-menu-link -->
        </li><!-- br-menu-item -->

        <li class="br-menu-item">
            <a href="${pageContext.request.contextPath}/admin/profile" class="br-menu-link">
                <i class="menu-item-icon icon ion-ios-person-outline tx-22"></i>
                <span class="menu-item-label">Tài khoản admin</span>
            </a><!-- br-menu-link -->
        </li><!-- br-menu-item -->
    </ul><!-- br-sideleft-menu -->

    <label class="sidebar-label pd-x-10 mg-t-25 mg-b-20 tx-info">Information Summary</label>



    <br>
</div><!-- br-sideleft -->
<!-- ########## END: LEFT PANEL ########## -->

<!-- ########## START: HEAD PANEL ########## -->
<div class="br-header">
    <div class="br-header-left">
        <div class="navicon-left hidden-md-down"><a id="btnLeftMenu" href=""><i class="icon ion-navicon-round"></i></a></div>
        <div class="navicon-left hidden-lg-up"><a id="btnLeftMenuMobile" href=""><i class="icon ion-navicon-round"></i></a></div>


    </div><!-- br-header-left -->



    <div class="dropdown">
        <a href="" class="nav-link nav-link-profile" data-toggle="dropdown">
            <span class="logged-name hidden-md-down">${user.fullName}</span>
            <img src="../resource/img/favicon.png" class="wd-32 rounded-circle" alt="">
            <span class="square-10 bg-success"></span>
        </a>
        <div class="dropdown-menu dropdown-menu-header wd-250">
            <div class="tx-center">
                <a href=""><img src="../resource/img/favicon.png" class="wd-80 rounded-circle" alt=""></a>
                <h6 class="logged-fullname">${user.fullName}</h6>
                <p>${user.email}</p>
            </div>
            <hr>
            <div class="tx-center">
                <span class="profile-earning-label">Số người đăng kí</span>
                <h3 class="profile-earning-amount">9,999,999 <i class="icon ion-ios-arrow-thin-up tx-success"></i></h3>
                <span class="profile-earning-text">Đánh giá 9.5</span>
            </div>
            <hr>
            <ul class="list-unstyled user-profile-nav">
                <li> <a href="${pageContext.request.contextPath}/logout"><i class="icon ion-power"></i> Đăng xuất </a></li>
            </ul>
        </div> <!-- dropdown-menu -->
    </div> <!-- dropdown -->

</div><!-- br-header -->
<!-- ########## END: HEAD PANEL ########## -->


<!-- ########## START: noidung ########## -->

<div class="br-mainpanel">
    <div class="br-pageheader">
        <nav class="breadcrumb pd-0 mg-0 tx-12">
            <a class="breadcrumb-item" href="#">Admin</a>
            <a class="breadcrumb-item" href="#">Quản lí tài khoản</a>
            <span class="breadcrumb-item active">Thêm tài khoản</span>
        </nav>
    </div><!-- br-pageheader -->
    <div class="br-pagetitle">
        <i class="icon ion-ios-list-outline"></i>
        <div>
            <h4>Thêm tài khoản</h4>

        </div>
    </div><!-- d-flex -->
    <div class="br-pagebody">
        <div class="br-section-wrapper">
        <h6 class="br-section-label">Thêm tài khoản mới</h6>
            <c:if test="${not empty message}">
                <div class="alert alert-danger">
                    <strong>${message}</strong>
                </div>
            </c:if>
        <form:form action="/admin/addUser" method="post">

            <div class="row">
                <div class="col-lg-4">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="icon ion-person tx-16 lh-0 op-6"></i></span>
                        </div>
                        <input type="text" id="username" name="username" value="${user.username}" required
                               class="form-control" placeholder="Username">
                    </div><!-- input-group -->
                </div><!-- col-4 -->


            </div><!-- row -->

            <div class="row pd-t-20">
                    <%--            FullName--%>
                <div class="col-lg-4">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="icon ion-person tx-16 lh-0 op-6"></i></span>
                        </div>
                        <input type="text" id="fullName" name="fullName" value="${user.fullName}" required
                               class="form-control" placeholder="FullName">
                    </div><!-- input-group -->
                </div><!-- col-4 -->
            </div>

            <div class="row pd-t-20">
                    <%--            Address--%>
                <div class="col-lg-4 mg-t-20 mg-lg-t-0">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="icon ion-location tx-16 lh-0 op-6"></i></span>
                        </div>
                        <input type="text" id="address" name="address" value="${user.address}" required
                               class="form-control" placeholder="Address">
                    </div><!-- input-group -->
                </div><!-- col-4 -->
            </div>

            <div class="row pd-t-20">
                    <%--            Phone--%>
                <div class="col-lg-4 mg-t-20 mg-lg-t-0">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="icon ion-ios-telephone tx-16 lh-0 op-6"></i></span>
                        </div>
                        <input type="text" id="phone" name="phone" value="${user.phone}" required
                               class="form-control" placeholder="Phone">
                    </div><!-- input-group -->
                </div><!-- col-4 -->
            </div>

            <div class="row pd-t-20">
                    <%--            Email--%>
                <div class="col-lg-4 mg-t-20 mg-lg-t-0">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="icon ion-email tx-16 lh-0 op-6"></i></span>
                        </div>
                        <input type="text" id="email" name="email" value="${user.email}" required
                               class="form-control" placeholder="Email">
                    </div><!-- input-group -->
                </div><!-- col-4 -->
            </div>

            <div class="row pd-t-20">
                    <%--            Password--%>
                <div class="col-lg-4 mg-t-20 mg-lg-t-0">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="icon ion-locked tx-16 lh-0 op-6"></i></span>
                        </div>
                        <input type="password" id="password" name="password" value="${user.password}" required
                               class="form-control" placeholder="Password">
                    </div><!-- input-group -->
                </div><!-- col-4 -->
            </div>

            <div class="row pd-t-20">
                    <%--            Confirm password--%>
                <div class="col-lg-4 mg-t-20 mg-lg-t-0">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="icon ion-locked tx-16 lh-0 op-6"></i></span>
                        </div>
                        <input type="password" id="confirmPassword" name="confirmPassword" value="${confirmPassword}" required
                               class="form-control" placeholder="Confirm Password">
                    </div><!-- input-group -->
                </div><!-- col-4 -->
            </div>

            <div class="row pd-t-20">
                <div class="col-lg-4 mg-t-20 mg-lg-t-0">
                    Role:
                    <input type="radio" name="role" value="admin"> Admin
                    <input type="radio" name="role" value="user"> User
                </div><!-- col-4 -->
            </div>

            <%--        button addUser--%>
            <div class="form-layout-footer mg-t-30">
                <button class="btn btn-info mg-r-5">Thêm</button>
                <button class="btn btn-secondary">Hủy</button>
            </div>

        </form:form>


    </div>
</div>

    <footer class="br-footer">
        <div class="footer-left">
            <div class="mg-b-2">Copyright &copy; 2020-2024. Apelish. All Rights Reserved.</div>
            <div>HA NOI UNIVERSITY OF SCIENCE</div>
        </div>
        <div class="footer-right d-flex align-items-center">
            <span class="tx-uppercase mg-r-10">Share:</span>
            <a target="_blank" class="pd-x-5" href="#"><i class="fab fa-facebook tx-20"></i></a>
            <a target="_blank" class="pd-x-5" href="#"><i class="fab fa-twitter tx-20"></i></a>
        </div>
    </footer>
</div>


<!-- ########## END: noidung ########## --->



<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery-ui/ui/widgets/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/peity/jquery.peity.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/rickshaw/vendor/d3.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/rickshaw/vendor/d3.layout.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/rickshaw/rickshaw.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery.flot/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery.flot/jquery.flot.resize.js"></script>
<script src="${pageContext.request.contextPath}/lib/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery-sparkline/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/select2/js/select2.full.min.js"></script>

<script src="${pageContext.request.contextPath}/js/bracket.js"></script>
<script src="${pageContext.request.contextPath}/js/ResizeSensor.js"></script>
<%--<script src="${pageContext.request.contextPath}/js/dashboard.js"></script>--%>
<script>
    $(function(){
        'use strict'

        // FOR DEMO ONLY
        // menu collapsed by default during first page load or refresh with screen
        // having a size between 992px and 1299px. This is intended on this page only
        // for better viewing of widgets demo.
        $(window).resize(function(){
            minimizeMenu();
        });

        minimizeMenu();

        function minimizeMenu() {
            if(window.matchMedia('(min-width: 992px)').matches && window.matchMedia('(max-width: 1299px)').matches) {
                // show only the icons and hide left menu label by default
                $('.menu-item-label,.menu-item-arrow').addClass('op-lg-0-force d-lg-none');
                $('body').addClass('collapsed-menu');
                $('.show-sub + .br-menu-sub').slideUp();
            } else if(window.matchMedia('(min-width: 1300px)').matches && !$('body').hasClass('collapsed-menu')) {
                $('.menu-item-label,.menu-item-arrow').removeClass('op-lg-0-force d-lg-none');
                $('body').removeClass('collapsed-menu');
                $('.show-sub + .br-menu-sub').slideDown();
            }
        }
    });
</script>
</body>
</html>
