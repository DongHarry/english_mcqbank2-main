<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Meta -->
    <meta name="description" content="Premium Quality and Responsive UI for Dashboard.">
    <meta name="author" content="ThemePixels">

    <title>Tất cả bài thi</title>

    <!--favicon icon-->
    <link rel="icon" href="${pageContext.request.contextPath}/resource/img/favicon.png" type="image/png" sizes="16x16">

    <!-- vendor css -->
    <link href="${pageContext.request.contextPath}/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/rickshaw/rickshaw.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/select2/css/select2.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/datatables.net-dt/css/jquery.dataTables.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/datatables.net-responsive-dt/css/responsive.dataTables.min.css"
          rel="stylesheet">

    <!-- Bracket CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bracket.css">
    <style>
        .nonClickableLink {
            color: blue; /* Set the color to mimic a link */
            text-decoration: underline; /* Underline to mimic a link */
            cursor: default; /* Change cursor to default (not clickable) */
            pointer-events: none; /* Disable click events */
        }
        .btn.reverse-hover {
            /* Hiệu ứng mặc định (không hover) */
            background-color: #007bff; /* Màu nền trong trạng thái bình thường */
            color: white; /* Màu chữ trong trạng thái bình thường */
            transition: background-color 0.3s ease, color 0.3s ease; /* Hiệu ứng chuyển đổi */

        /* Hiệu ứng khi hover */
        &:hover {
             background-color: transparent; /* Màu nền khi hover */
             color: #007bff; /* Màu chữ khi hover */
         }
        }

    </style>
</head>

<body>

<!-- ########## START: LEFT PANEL ########## -->
<div class="br-logo"><a href="${pageContext.request.contextPath}/index"><span>[</span>apelish
    <i>hus</i><span>]</span></a></div>
<div class="br-sideleft sideleft-scrollbar">
    <label class="sidebar-label pd-x-10 mg-t-20 op-3">Navigation</label>
    <ul class="br-sideleft-menu">
            <li class="br-menu-item">
                <a href="#" class="br-menu-link with-sub active show-sub">
                    <i class="menu-item-icon icon ion-ios-book-outline tx-20"></i>
                    <span class="menu-item-label">Làm bài</span>
                </a><!-- br-menu-link -->
                <ul class="br-menu-sub">
                    <li class="sub-item"><a href="${pageContext.request.contextPath}/user/exams"
                                            class="sub-link active">
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
        <label class="sidebar-label pd-x-10 mg-t-25 mg-b-20 tx-info">Information Summary</label>
    </ul>


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


    <div class="dropdown">
        <a href="" class="nav-link nav-link-profile" data-toggle="dropdown">
            <span class="logged-name hidden-md-down">${loggedInUser.fullName}</span>
            <img src="../resource/img/favicon.png" class="wd-32 rounded-circle" alt="">
            <span class="square-10 bg-success"></span>
        </a>
        <div class="dropdown-menu dropdown-menu-header wd-250">
            <div class="tx-center">
                <a href=""><img src="../resource/img/favicon.png" class="wd-80 rounded-circle" alt=""></a>
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
                <li><a href="#" class="modal-effect2"><i class="icon ion-power"></i> Đăng xuất </a>
                </li>
            </ul>
        </div> <!-- dropdown-menu -->
    </div> <!-- dropdown -->

</div><!-- br-header -->
<!-- ########## END: HEAD PANEL ########## -->


<!-- ########## START: noidung ########## -->

<div class="br-mainpanel">
    <div class="br-pagetitle">
        <i class="icon icon ion-ios-book-outline"></i>
        <div>
            <h4>Tất cả bài thi</h4>
        </div>
    </div><!-- d-flex -->

    <div class="br-pagebody">
        <div class="br-section-wrapper">

            <h6 class="br-section-label">Danh sách các bài thi</h6>

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

<%--                <table id="datatable2" class="table display responsive nowrap">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th class="wd-15p">Exam Name</th>--%>
<%--                        <th class="wd-20p">Topics</th>--%>
<%--                        <th class="wd-15p">Exam type</th>--%>
<%--                        <th class="wd-10p">Question No</th>--%>
<%--                        <th class="wd-25p">Created time</th>--%>
<%--                        <th class="wd-25p">Action</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>

<%--                    <tbody>--%>
<%--                    <c:forEach var="exam" items="${exams}">--%>
<%--                        <tr>--%>
<%--                            <td>${exam.name}</td>--%>
<%--                            <td>--%>
<%--                                <ul style="margin-left: -40px">--%>
<%--                                    <c:forEach var="exam_topic" items="${exam.examTopicList}">--%>
<%--                                        <c:if test="${not empty exam_topic}">--%>
<%--                                            <li style="list-style: none">${exam_topic.topic.name} (${exam_topic.percent}%)</li>--%>
<%--                                        </c:if>--%>
<%--                                    </c:forEach>--%>
<%--                                </ul>--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                <c:if test="${exam.type == 1}">--%>
<%--                                    <span class="badge badge-success" style="font-size: 14px"> Reading </span>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${exam.type == 2}">--%>
<%--                                    <span class="badge badge-info" style="font-size: 14px">Listening</span>--%>
<%--                                </c:if>--%>
<%--                            </td>--%>
<%--                            <td>${exam.questionNo}</td>--%>
<%--                            <td>${exam.time}</td>--%>

<%--                            <td>--%>
<%--                                <ul style="margin-left: -40px">--%>
<%--                                        <li style="list-style: none">--%>
<%--                                            Take exam: <a--%>
<%--                                                href="${pageContext.request.contextPath}/user/exams/${exam.id}"--%>
<%--                                                class="btn btn-outline-primary btn-icon mg-r-5 mg-b-10" title="Start"><i--%>
<%--                                                class="fas fa-play"></i></a>--%>
<%--                                        </li>--%>
<%--                                        <li style="list-style: none">--%>
<%--                                            Ranking: <a--%>
<%--                                                href="${pageContext.request.contextPath}/user/exams/${exam.id}/results"--%>
<%--                                                class="btn btn-outline-primary btn-icon mg-r-5 mg-b-10" title="Start"><i--%>
<%--                                                class="fas fa-list"></i></a>--%>
<%--                                        </li>--%>
<%--                                </ul>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
                <c:forEach items="${exams}" var="exam">
                <br>

                <div class="row">
                    <div class="col-lg-4">
                        <c:set var="imgSource" value="https://i.imgur.com/1QZqj1M.png"/>
                        <c:choose>
                            <c:when test="${exam.id % 5 == 0}">
                                <c:set var="imgSource" value="${pageContext.request.contextPath}/images/exam/1.mini-test.png"/>
                            </c:when>
                            <c:when test="${exam.id % 5 == 1}">
                                <c:set var="imgSource" value="${pageContext.request.contextPath}/images/exam/2.exam-test.jpeg"/>
                            </c:when>
                            <c:when test="${exam.id % 5 == 2}">
                                <c:set var="imgSource" value="${pageContext.request.contextPath}/images/exam/3.mini-test.png"/>
                            </c:when>
                            <c:when test="${exam.id % 5 == 3}">
                                <c:set var="imgSource" value="${pageContext.request.contextPath}/images/exam/4.exam-test.jpeg"/>
                            </c:when>
                            <c:when test="${exam.id % 5 == 4}">
                                <c:set var="imgSource" value="${pageContext.request.contextPath}/images/exam/5.exam-test.jpeg"/>
                            </c:when>
                        </c:choose>
                        <img src="${imgSource}" alt="Image" style="width: 100%">
                    </div>
                    <div class="col-lg-8">
                        <p style="max-width: 100%; font-size: 30px"><b>${exam.name}</b></p>
                        <p style="max-width: 100%; font-size: 15px">
                            Exam type:
                            <c:if test="${exam.type == 1}">
                            <span class="badge badge-success" style="font-size: 14px"> Reading </span>
                            </c:if>
                            <c:if test="${exam.type == 2}">
                                <span class="badge badge-info" style="font-size: 14px">Listening</span>
                            </c:if>
                        </p>
                        <p style="max-width: 100%; font-size: 15px">Question No: ${exam.questionNo}</p>
                        Start:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="btn btn-outline-primary btn-icon mg-r-5 mg-b-10 reverse-hover" title="Start"
                            style="width: 40px;height: 25px;font-size: 20px" href="${pageContext.request.contextPath}/user/exams/${exam.id}">
                            <i class="fas fa-play"></i>
                        </a>
                        <br>
                        Ranking:
                        <a class="btn btn-outline-primary btn-icon mg-r-5 mg-b-10 reverse-hover" title="Ranking"
                                style="width: 40px;height: 25px;font-size: 20px" href="${pageContext.request.contextPath}/user/exams/${exam.id}/results"><i
                                class="fas fa-list"></i>
                        </a>
                    </div>
                </div>
                    <br>
                    <hr>
                </c:forEach>

            </div><!-- table-wrapper -->
        <c:if test="${currentPage > 1}">
            <a href="?page=${currentPage - 1}">Prev</a>
        </c:if>
        <c:if test="${currentPage <= 1}">
            <a href="#" class="nonClickableLink">Prev</a>
        </c:if>
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${currentPage eq i}">
                    <a href="?page=${i}" class="nonClickableLink"><b>${i}</b></a>
                </c:when>
                <c:otherwise>
                    <a href="?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${hasNext}">
            <a href="?page=${currentPage + 1}">Next</a>
        </c:if>
        <c:if test="${!hasNext}">
            <a href="#" class="nonClickableLink">Next</a>
        </c:if>

        </div>
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
<jsp:include page="include/logout-modal.jsp"></jsp:include>
<div id="modaldemo8" class="modal fade">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content bd-0 tx-14">
            <div class="modal-header pd-x-20">
                <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Notice</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pd-20">
                <p class="mg-b-5">Are you sure to delete this exam?</p>
            </div>
            <div class="modal-footer justify-content-center">
                <a href="" type="button"
                   class="btn btn-danger tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium save-changes-btn">Delete</a>
                <button type="button" class="btn btn-secondary tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium"
                        data-dismiss="modal">Cancel
                </button>
            </div>
        </div>
    </div><!-- modal-dialog -->
</div><!-- modal -->
<script>
    $(function () {

        // showing modal with effect
        $('.modal-effect1').on('click', function (e) {
            e.preventDefault();
            var effect = $(this).attr('data-effect');
            $('#modaldemo8').addClass(effect);
            $('#modaldemo8').modal('show');

            var rowId = $(this).data("row-id");
            // Tạo chuỗi đường dẫn mới kết hợp với tham số
            var newHref = "${pageContext.request.contextPath}/admin/deleteExam?examId=" + rowId;
            // Sửa thuộc tính href của thẻ a
            $(".save-changes-btn").attr("href", newHref);
        });

        // hide modal with effect
        $('#modaldemo8').on('hidden.bs.modal', function (e) {
            $(this).removeClass(function (index, className) {
                return (className.match(/(^|\s)effect-\S+/g) || []).join(' ');
            });
        });
    });
</script>

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
<%--<script src="${pageContext.request.contextPath}/lib/datatables.net/js/jquery.dataTables.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/lib/datatables.net-dt/js/dataTables.dataTables.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/lib/datatables.net-responsive/js/dataTables.responsive.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/lib/datatables.net-responsive/js/dataTables.responsive.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/lib/datatables.net-responsive-dt/js/responsive.dataTables.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/lib/select2/js/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/js/bracket.js"></script>
<script src="${pageContext.request.contextPath}/js/ResizeSensor.js"></script>
<%--<script src="${pageContext.request.contextPath}/js/dashboard.js"></script>--%>
<script>
    $(function () {
        'use strict'

        // FOR DEMO ONLY
        // menu collapsed by default during first page load or refresh with screen
        // having a size between 992px and 1299px. This is intended on this page only
        // for better viewing of widgets demo.
        $(window).resize(function () {
            minimizeMenu();
        });

        minimizeMenu();

        function minimizeMenu() {
            if (window.matchMedia('(min-width: 992px)').matches && window.matchMedia('(max-width: 1299px)').matches) {
                // show only the icons and hide left menu label by default
                $('.menu-item-label,.menu-item-arrow').addClass('op-lg-0-force d-lg-none');
                $('body').addClass('collapsed-menu');
                $('.show-sub + .br-menu-sub').slideUp();
            } else if (window.matchMedia('(min-width: 1300px)').matches && !$('body').hasClass('collapsed-menu')) {
                $('.menu-item-label,.menu-item-arrow').removeClass('op-lg-0-force d-lg-none');
                $('body').removeClass('collapsed-menu');
                $('.show-sub + .br-menu-sub').slideDown();
            }
        }
    });

    $(function () {
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
        $('.dataTables_length select').select2({minimumResultsForSearch: Infinity});

    });

</script>
</body>
</html>
