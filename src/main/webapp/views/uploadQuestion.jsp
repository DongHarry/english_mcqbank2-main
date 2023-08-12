<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Upload</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Upload File</h1>--%>
<%--<c:if test="${not empty e_message}">--%>
<%--    <h2>${e_message}</h2>--%>
<%--</c:if>--%>

<%--<form:form method="POST" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/questions/upload">--%>
<%--    <input type="file" name="file" accept=".csv,.xls,.xlsx" required/>--%>
<%--    <br/>--%>
<%--    <button type="submit">Upload</button>--%>
<%--</form:form>--%>

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
<div class="br-logo"><a href="${pageContext.request.contextPath}/index"><span>[</span>apelish <i>hus</i><span>]</span></a></div>
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
            <a href="#" class="br-menu-link with-sub active show-sub">
                <i class="menu-item-icon icon ion-ios-briefcase-outline tx-24"></i>
                <span class="menu-item-label">Quản lý câu hỏi</span>
            </a><!-- br-menu-link -->
            <ul class="br-menu-sub">
                <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/questions" class="sub-link">Tất cả câu hỏi</a></li>
                <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/questions/upload"
                                        class="sub-link active">Thêm câu hỏi bằng file</a></li>

            </ul>
        </li><!-- br-menu-item -->


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
        </li><!-- br-menu-item -->

        <li class="br-menu-item">
            <a href="${pageContext.request.contextPath}/admin/topics" class="br-menu-link">
                <i class="menu-item-icon icon ion-ios-albums-outline tx-22"></i>
                <span class="menu-item-label">Quản lý topic</span>
            </a><!-- br-menu-link -->
        </li><!-- br-menu-item -->

        <li class="br-menu-item">
            <a href="${pageContext.request.contextPath}/admin/logs" class="br-menu-link">
                <i class="menu-item-icon icon ion-ios-bookmarks-outline tx-22"></i>
                <span class="menu-item-label">Quản lý logs</span>
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
            <span class="logged-name hidden-md-down">${loggedInUser.fullName}</span>
            <img src="${pageContext.request.contextPath}/resource/img/favicon.png" class="wd-32 rounded-circle" alt="">
            <span class="square-10 bg-success"></span>
        </a>
        <div class="dropdown-menu dropdown-menu-header wd-250">
            <div class="tx-center">
                <a href=""><img src="${pageContext.request.contextPath}/resource/img/favicon.png" class="wd-80 rounded-circle" alt=""></a>
                <h6 class="logged-fullname">${loggedInUser.fullName}</h6>
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
            <a class="breadcrumb-item" href="${pageContext.request.contextPath}/admin">Admin</a>
            <a class="breadcrumb-item" href="${pageContext.request.contextPath}/admin/questions">Quản lý câu hỏi</a>
            <span class="breadcrumb-item active">Thêm câu hỏi</span>
        </nav>
    </div><!-- br-pageheader -->
    <div class="br-pagetitle">
        <i class="icon ion-ios-briefcase-outline"></i>
        <div>
            <h4>Thêm câu hỏi bằng file</h4>

        </div>
    </div><!-- d-flex -->
    <div class="br-pagebody">
        <div class="br-section-wrapper">
            <h6 class="br-section-label">Thêm câu hỏi bằng file</h6>
            <p class="br-section-text" style="color: red">*Chú ý:</p>
            <ul style="margin: -70px 20px">
                <li style="list-style: none">
                    <p class="br-section-text" style="color: red">Kích thước file tối đa 10MB</p>
                </li>
                <li style="list-style: none; margin-top: -40px">
                    <p class="br-section-text" style="color: red">Định dạng chấp nhận là .csv, .xls hoặc .xlsx</p>
                </li>
                <li style="list-style: none; margin-top: -40px">
                    <p class="br-section-text" style="color: red">File có header với định dạng là QU_CONTENT,QU_OPTION1,QU_OPTION2,QU_OPTION3,QU_OPTION4,QU_ANSWER,QU_EXPLAIN,QU_TYPE,TP_ID,DIFFICULT_LEVEL
                    </p>
                </li>
                <li style="list-style: none; margin-top: -40px">
                    <p class="br-section-text" style="color: red">Các cột qu_answer,qu_type, tp_id, difficult_level là kiểu số nguyên, các cột còn lại là kiểu chuỗi</p>
                </li>
                <li style="list-style: none;">
                    <p class="br-section-text" style="color: red">TP_ID phải trong danh sách đã có, thêm hoặc xem tại <a href="${pageContext.request.contextPath}/admin/topics">Topics</a></p>
                </li>
            </ul>
            <c:if test="${not empty e_message}">
                <div class="alert alert-danger" role="alert">
                    ${e_message}
                </div>
            </c:if>
            <form:form method="POST" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/questions/upload">
            <div class="row">
                <div class="col-lg-8">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Chọn file</span>
                        </div>
                        <input type="file" name="file" class="form-control" accept=".csv,.xls,.xlsx" required>
                    </div>
                </div>
            </div>
<%--                <div class="row">--%>
<%--                    <div class="col-lg-4">--%>
<%--                        <div class="custom-file">--%>
<%--                            <input type="file" class="custom-file-input" name="file" accept=".csv,.xls,.xlsx" required>--%>
<%--                            <label class="custom-file-label">Choose file</label>--%>
<%--                        </div>--%>
<%--                    </div><!-- col -->--%>
<%--                </div><!-- row -->--%>
                <div class="form-layout-footer mg-t-30">
                    <button type="submit" class="btn btn-info mg-r-5">Upload</button>

                    <a href="${pageContext.request.contextPath}/admin/questions" class="btn btn-secondary">Quay lại</a>
                </div>
            </form:form>
        </div><!-- br-section-wrapper -->
    </div><!-- br-pagebody -->
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
