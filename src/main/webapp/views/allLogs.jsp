<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Meta -->
    <meta name="description" content="Premium Quality and Responsive UI for Dashboard.">
    <meta name="author" content="ThemePixels">

    <title>All Logs</title>

    <!--favicon icon-->
    <link rel="icon" href="${pageContext.request.contextPath}/resource/img/favicon.png" type="image/png" sizes="16x16">

    <!-- vendor css -->
    <link href="${pageContext.request.contextPath}/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/rickshaw/rickshaw.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/select2/css/select2.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/datatables.net-dt/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/datatables.net-responsive-dt/css/responsive.dataTables.min.css" rel="stylesheet">

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
            <a href="#" class="br-menu-link with-sub">
                <i class="menu-item-icon icon ion-ios-briefcase-outline tx-24"></i>
                <span class="menu-item-label">Quản lý câu hỏi</span>
            </a><!-- br-menu-link -->
            <ul class="br-menu-sub">
                <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/questions" class="sub-link">Tất cả câu hỏi</a></li>
                <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/questions/upload"
                                        class="sub-link">Thêm câu hỏi bằng file</a></li>

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
            <a href="${pageContext.request.contextPath}/admin/logs" class="br-menu-link active show-sub">
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
            <img src="/resource/img/favicon.png" class="wd-32 rounded-circle" alt="">
            <span class="square-10 bg-success"></span>
        </a>
        <div class="dropdown-menu dropdown-menu-header wd-250">
            <div class="tx-center">
                <a href=""><img src="/resource/img/favicon.png" class="wd-80 rounded-circle" alt=""></a>
                <h6 class="logged-fullname">${loggedInUser.fullName}</h6>
                <p>${loggedInUser.email}</p>
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
            <a class="breadcrumb-item" href="/admin">Admin</a>
            <span class="breadcrumb-item active">Quản lý phiên đăng nhập</span>
        </nav>
    </div><!-- br-pageheader -->
    <div class="br-pagetitle">
        <i class="icon icon ion-ios-person-outline"></i>
        <div>
            <h4>Phiên đăng nhập</h4>
        </div>
    </div><!-- d-flex -->

    <div class="br-pagebody">
        <div class="br-section-wrapper">

            <h6 class="br-section-label">All log</h6>
            <p class="br-section-text">Danh sách phiên đăng nhập</p>
            <div class="table-wrapper">
                <c:if test="${not empty message}">
                    <div class="alert alert-success">
                        <strong>${message}</strong>
                    </div>
                </c:if>
                <c:if test="${not empty e_message}">
                    <div class="alert alert-danger">
                        <strong>${e_message}</strong>
                    </div>
                </c:if>
                <table id="datatable2" class="table display responsive nowrap">
                    <thead>
                    <tr>
                        <th class="wd-15p">Log ID</th>
                        <th class="wd-15p">User</th>
                        <th class="wd-15p">Log Name</th>
                        <th class="wd-15p">Log Status</th>
                        <th class="wd-15p">Log Date</th>

                        <th class="wd-15p">Action</th>
                    </tr>
                    </thead>
                    <tbody>


                    <c:forEach var="log" items="${logs}">
                        <tr>
                            <td>${log.id}</td>
                            <td>${log.user.username}</td>
                            <td>${log.name}</td>
                            <td>
                                <c:if test="${log.status == 1}">
                                    Success
                                </c:if>
                                <c:if test="${log.status == 0}">
                                    Fail
                                </c:if>
                            </td>
                            <td>${log.datetime}</td>
                            <td>
                                <ul style="margin-left: -40px">
                                    <li style="list-style: none">
                                        Delete: <a onclick="if (!confirm('Are you sure to delete this logs?')) return false"
                                                   href="${pageContext.request.contextPath}/admin/logs/${log.id}/delete" class="btn btn-outline-danger btn-icon mg-r-5 mg-b-10" title="Delete"><i class="fas fa-trash"></i></a>
                                    </li>
                                </ul>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div><!-- table-wrapper -->

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
</div><!-- br-mainpanel -->

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
<script src="${pageContext.request.contextPath}/lib/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/datatables.net-dt/js/dataTables.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/datatables.net-responsive-dt/js/responsive.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/select2/js/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/select2/js/select2.min.js"></script>


<script src="${pageContext.request.contextPath}/js/bracket.js"></script>
<script src="${pageContext.request.contextPath}/js/ResizeSensor.js"></script>
<script>
    $(document).ready(function() {
        var errorMessage = $("#message2").text().trim();
        if (errorMessage !== '') {
            alert(errorMessage);
        }
    });
</script>
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

    $(function(){
        'use strict';

        $('#datatable2').DataTable({
            responsive: true,
            language: {
                searchPlaceholder: 'Search...',
                sSearch: '',
                lengthMenu: '_MENU_ items/page',
            }
        });

        // Select2
        $('.dataTables_length select').select2({ minimumResultsForSearch: Infinity });

    });
</script>
</body>
</html>
