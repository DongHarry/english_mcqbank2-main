<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>ERROR</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resource/img/favicon.png" type="image/png" sizes="16x16">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bracket.css">

    <!-- vendor css -->
    <link href="${pageContext.request.contextPath}/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/rickshaw/rickshaw.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/select2/css/select2.min.css" rel="stylesheet">
</head>

<body>
<!-- ########## START: LEFT PANEL ########## -->
<div class="br-logo"><a href="${pageContext.request.contextPath}/index"><span>[</span>apelish
    <i>hus</i><span>]</span></a></div>
<div class="br-sideleft sideleft-scrollbar">
    <label class="sidebar-label pd-x-10 mg-t-20 op-3">Navigation</label>
    <ul class="br-sideleft-menu">
        <sec:authorize access="hasRole('ADMIN')">

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
                    <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/questions" class="sub-link">Tất
                        cả câu hỏi</a></li>
                    <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/questions/upload"
                                            class="sub-link">Thêm câu hỏi bằng file</a></li>

                </ul>
            </li>
            <!-- br-menu-item -->


            <li class="br-menu-item">
                <a href="#" class="br-menu-link with-sub">
                    <i class="menu-item-icon icon ion-ios-list-outline tx-22"></i>
                    <span class="menu-item-label">Quản lý tài khoản</span>
                </a><!-- br-menu-link -->
                <ul class="br-menu-sub">
                    <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/users" class="sub-link">
                        Tài khoản người dùng</a></li>
                    <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/users/new" class="sub-link">
                        Thêm tài khoản</a></li>
                </ul>
            </li>
            <!-- br-menu-item -->

            <li class="br-menu-item">
                <a href="${pageContext.request.contextPath}/admin/topics" class="br-menu-link">
                    <i class="menu-item-icon icon ion-ios-albums-outline tx-22"></i>
                    <span class="menu-item-label">Quản lý topic</span>
                </a><!-- br-menu-link -->
            </li>
            <!-- br-menu-item -->

            <li class="br-menu-item">
                <a href="${pageContext.request.contextPath}/admin/logs" class="br-menu-link">
                    <i class="menu-item-icon icon ion-ios-bookmarks-outline tx-22"></i>
                    <span class="menu-item-label">Quản lý logs</span>
                </a><!-- br-menu-link -->
            </li>
            <!-- br-menu-item -->

            <li class="br-menu-item">
                <a href="${pageContext.request.contextPath}/admin/profile" class="br-menu-link">
                    <i class="menu-item-icon icon ion-ios-person-outline tx-22"></i>
                    <span class="menu-item-label">Tài khoản admin</span>
                </a><!-- br-menu-link -->
            </li>
            <!-- br-menu-item -->
        </sec:authorize>
        <sec:authorize access="hasAnyRole(hasRole('USER'))">
            <li class="br-menu-item">
                <a href="#" class="br-menu-link with-sub active show-sub">
                    <i class="menu-item-icon icon ion-ios-book-outline tx-20"></i>
                    <span class="menu-item-label">Làm bài</span>
                </a><!-- br-menu-link -->
                <ul class="br-menu-sub">
                    <li class="sub-item"><a href="${pageContext.request.contextPath}/user/exams" class="sub-link">
                        Tất cả bài thi</a></li>

                </ul>
            </li>
            <li class="br-menu-item">
                <a href="${pageContext.request.contextPath}/user/results" class="br-menu-link">
                    <i class="menu-item-icon icon ion-ios-list-outline tx-22"></i>
                    <span class="menu-item-label">Kết quả</span>
                </a><!-- br-menu-link -->
            </li>
            <!-- br-menu-item -->
            <li class="br-menu-item">
                <a href="${pageContext.request.contextPath}/user/profile" class="br-menu-link">
                    <i class="menu-item-icon icon ion-ios-person-outline tx-22"></i>
                    <span class="menu-item-label">Thông tin tài khoản</span>
                </a><!-- br-menu-link -->
            </li>
            <!-- br-menu-item -->
        </sec:authorize>
    </ul><!-- br-sideleft-menu -->

    <label class="sidebar-label pd-x-10 mg-t-25 mg-b-20 tx-info">Information Summary</label>


    <br>
</div><!-- br-sideleft -->
<!-- ########## END: LEFT PANEL ########## -->


<!-- ########## START: HEAD PANEL ########## -->
<div class="br-header">
    <div class="br-header-left">
        <div class="navicon-left hidden-md-down"><a id="btnLeftMenu" href=""><i class="icon ion-navicon-round"></i></a>
        </div>
        <div class="navicon-left hidden-lg-up"><a id="btnLeftMenuMobile" href=""><i class="icon ion-navicon-round"></i></a>
        </div>


    </div><!-- br-header-left -->

    <div class="">
        <a href="" class="nav-link nav-link-profile" data-toggle="dropdown">
            <span class="logged-name hidden-md-down">${loggedInUser.fullName}</span>
            <img src="${pageContext.request.contextPath}/resource/img/favicon.png" class="wd-32 rounded-circle"
                 alt="">
            <span class="square-10 bg-success"></span>
        </a>
        <div class="dropdown-menu dropdown-menu-header wd-250">
            <div class="tx-center">
                <a href=""><img src="${pageContext.request.contextPath}/resource/img/favicon.png"
                                class="wd-80 rounded-circle" alt=""></a>
                <h6 class="logged-fullname">${loggedInUser.fullName}</h6>
                <p>${loggedInUser.email}</p>
            </div>
            <hr>
            <div class="tx-center">
                <span class="profile-earning-label">Số người đăng kí</span>
                <h3 class="profile-earning-amount">9,999,999 <i class="icon ion-ios-arrow-thin-up tx-success"></i>
                </h3>
                <span class="profile-earning-text">Đánh giá 9.5</span>
            </div>
            <hr>
            <ul class="list-unstyled user-profile-nav">
                <li><a href="${pageContext.request.contextPath}/logout"><i class="icon ion-power"></i> Đăng xuất
                </a></li>
            </ul>
        </div> <!-- dropdown-menu -->
    </div>
    <!-- dropdown -->
</div><!-- br-header -->

<div class="br-mainpanel">
    <div class="br-pagebody">
        <div class="br-section-wrapper">
            <h1 class="br-section-label">Trang không tồn tại </h1>

            <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Back to home page</a>
        </div>
    </div>
</div>
</body>
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
</html>
