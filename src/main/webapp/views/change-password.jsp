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

  <title>Change password</title>

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
          <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/questions" class="sub-link">Tất cả câu hỏi</a></li>
          <li class="sub-item"><a href="#" class="sub-link">Thêm câu hỏi</a></li>

        </ul>
      </li><!-- br-menu-item -->

      <c:if test="${type == 1}">
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
      </c:if>
      <c:if test="${type == 2}">
        <li class="br-menu-item">
          <a href="#" class="br-menu-link with-sub active show-sub">
            <i class="menu-item-icon icon ion-ios-list-outline tx-22"></i>
            <span class="menu-item-label">Quản lý tài khoản</span>
          </a><!-- br-menu-link -->
          <ul class="br-menu-sub">
            <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/users" class="sub-link active">
              Tài khoản người dùng</a></li>
            <li class="sub-item"><a href="${pageContext.request.contextPath}/admin/users/new" class="sub-link">
              Thêm tài khoản</a></li>
          </ul>
        </li><!-- br-menu-item -->
      </c:if>


      <li class="br-menu-item">
        <a href="${pageContext.request.contextPath}/admin/topics" class="br-menu-link">
          <i class="menu-item-icon icon ion-ios-albums-outline tx-22"></i>
          <span class="menu-item-label">Quản lý topic</span>
        </a><!-- br-menu-link -->
      </li><!-- br-menu-item -->
      <c:if test="${type == 1}">
        <li class="br-menu-item">
          <a href="${pageContext.request.contextPath}/admin/profile" class="br-menu-link active show-sub">
            <i class="menu-item-icon icon ion-ios-person-outline tx-22"></i>
            <span class="menu-item-label">Tài khoản admin</span>
          </a><!-- br-menu-link -->
        </li><!-- br-menu-item -->
      </c:if>
      <c:if test="${type == 2}">
        <li class="br-menu-item">
          <a href="${pageContext.request.contextPath}/admin/profile" class="br-menu-link">
            <i class="menu-item-icon icon ion-ios-person-outline tx-22"></i>
            <span class="menu-item-label">Tài khoản admin</span>
          </a><!-- br-menu-link -->
        </li><!-- br-menu-item -->
      </c:if>


    </sec:authorize>
    <sec:authorize access="hasRole('USER')">
      <li class="br-menu-item">
        <a href="#" class="br-menu-link with-sub">
          <i class="menu-item-icon icon ion-ios-book-outline tx-20"></i>
          <span class="menu-item-label">Làm bài thi</span>
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
      </li><!-- br-menu-item -->
      <li class="br-menu-item">
        <a href="${pageContext.request.contextPath}/user/profile" class="br-menu-link show-sub active">
          <i class="menu-item-icon icon ion-ios-person-outline tx-22"></i>
          <span class="menu-item-label">Thông tin tài khoản</span>
        </a><!-- br-menu-link -->
      </li><!-- br-menu-item -->
    </sec:authorize>
  </ul><!-- br-sideleft-menu -->

  <label class="sidebar-label pd-x-10 mg-t-25 mg-b-20 tx-info">Information Summary</label>



  <br>
</div><!-- br-sideleft -->
<%--<jsp:include page="include/left-panel.jsp"></jsp:include>--%>
<%--<!-- ########## END: LEFT PANEL ########## -->--%>


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
      <sec:authorize access="hasRole('ADMIN')">
        <a class="breadcrumb-item" href="#">Admin</a>
      </sec:authorize>
      <sec:authorize access="hasRole('USER')">
        <a class="breadcrumb-item" href="#">User</a>
      </sec:authorize>
      <a class="breadcrumb-item" href="#">Quản lý tài khoản</a>
      <span class="breadcrumb-item active">Tài khoản ${loggedInUser.username}</span>
    </nav>
  </div><!-- br-pageheader -->
  <div class="br-pagetitle">
    <i class="icon ion-ios-person-outline"></i>
    <div>
      <h4>Thay đổi mật khẩu</h4>
    </div>
  </div><!-- d-flex -->

  <div class="br-pagebody">
    <div class="br-section-wrapper">
      <h6 class="br-section-label">Đổi mật khẩu</h6>
      <div>
        <c:if test="${successMessage != null}">
          <div class="alert alert-success"> <strong>${successMessage}</strong> </div>
        </c:if>
        <c:if test="${param.successMessage != null}">
          <div class="alert alert-success"> <strong>${param.successMessage}</strong> </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
          <div class="alert alert-danger"> <strong>${errorMessage}</strong> </div>
        </c:if>
      </div>
      <%--<sec:authorize access="hasRole('ADMIN')">--%>
        <div class="form-layout-footer mg-t-30">

          <div class="tab-pane" id="changePass">
            <form:form class="formDoiMatKhau" action="${pageContext.request.contextPath}/user/profile/change-password" method="post">
              <div class="form-group">
                <label>Mật khẩu cũ</label>
                <input type="password" class="form-control" name="oldPassword" required="required" />
              </div>
              <div class="form-group">
                <label>Mật khẩu mới</label>
                <input type="password" class="form-control" id="password" name="newPassword" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$"
                       title="Mật khẩu phải chứa ít nhất 8 ký tự, bao gồm một chữ hoa, một chữ thường, một chữ số và một ký tự đặc biệt (!@#$%^&*)." required="required" />
              </div>
              <div class="form-group">
                <label>Nhắc lại mật khẩu mới</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmNewPassword" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$"
                       title="Mật khẩu phải chứa ít nhất 8 ký tự, bao gồm một chữ hoa, một chữ thường, một chữ số và một ký tự đặc biệt (!@#$%^&*)." required="required" />
              </div>

              <div>
                <span id="mess"></span>
              </div>
              <input class="btn btn-primary" type="submit" id="btnXacNhanDoiMK"
                     value="Xác nhận" />
              <a href="${pageContext.request.contextPath}/user/profile" class="btn btn-secondary">Quay lại</a>
            </form:form>
          </div>

        </div><!-- form-layout-footer -->


      <%--</sec:authorize>--%>

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
<%--
<sec:authorize access="hasRole('USER')">
    <a href="${pageContext.request.contextPath}/user/profile/edit">Edit</a>
    <a href="${pageContext.request.contextPath}/user/profile/change-password">Change Password</a>
    <div>
        <c:if test="${successMessage != null}">
            <div class="error"> <strong>${successMessage}</strong> </div>
        </c:if>
        <c:if test="${param.successMessage != null}">
            <div class="error"> <strong>${param.successMessage}</strong> </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="error"> <strong>${errorMessage}</strong> </div>
        </c:if>
    </div>
</sec:authorize>

<a href="${pageContext.request.contextPath}/index">Back to the home page</a>

<sec:authorize access="hasRole('USER')">
    <a href="${pageContext.request.contextPath}/user/profile/edit">Edit</a>
    <a href="${pageContext.request.contextPath}/user/profile/change-password">Change Password</a>
    <div>
        <c:if test="${successMessage != null}">
            <div class="error"> <strong>${successMessage}</strong> </div>
        </c:if>
        <c:if test="${param.successMessage != null}">
            <div class="error"> <strong>${param.successMessage}</strong> </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="error"> <strong>${errorMessage}</strong> </div>
        </c:if>
    </div>
</sec:authorize>--%>




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
<script>
  $(function(){
    'use strict';

    $('.select2').select2({
      minimumResultsForSearch: Infinity
    });
  });

  $('#password,#confirmPassword').on('keyup', function () {
    if ($('#password').val() == $('#confirmPassword').val()) {
      $('#mess').html('').css('color', 'green');
    } else
      $('#mess').html('Password và confirmPassword không khớp').css('color', 'red');
  });

<%--<script>--%>
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
<%--</script>--%>
</body>
</html>
