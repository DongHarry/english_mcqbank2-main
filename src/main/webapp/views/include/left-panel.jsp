<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 07/08/2023
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<!-- ########## START: LEFT PANEL ########## -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="br-logo"><a href=""><span>[</span>apelish <i>hus</i><span>]</span></a></div>
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
            <c:if test="${type == 2  || (type != 1 && type != 3)}">
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
            <c:if test="${type == 3  || (type != 2 && type != 1)}">
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
            <c:if test="${type == 2 || type != 1}">
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
                <a href="${pageContext.request.contextPath}/user/exams" class="br-menu-link">
                    <i class="menu-item-icon icon ion-ios-book tx-22"></i>
                    <span class="menu-item-label">Bài thi của tôi</span>
                </a><!-- br-menu-link -->
            </li><!-- br-menu-item -->
            <li class="br-menu-item">
                <a href="${pageContext.request.contextPath}/user/results" class="br-menu-link">
                    <i class="menu-item-icon icon ion-ios-list-outline tx-22"></i>
                    <span class="menu-item-label">Kết quả</span>
                </a><!-- br-menu-link -->
            </li><!-- br-menu-item -->
            <li class="br-menu-item">
                <a href="${pageContext.request.contextPath}/user/profile" class="br-menu-link">
                    <i class="menu-item-icon icon ion-ios-person-outline tx-22"></i>
                    <span class="menu-item-label">Thông tin tài khoản</span>
                </a><!-- br-menu-link -->
            </li><!-- br-menu-item -->
        </sec:authorize>
    </ul><!-- br-sideleft-menu -->

    <label class="sidebar-label pd-x-10 mg-t-25 mg-b-20 tx-info">Information Summary</label>



    <br>
</div><!-- br-sideleft -->
<!-- ########## END: LEFT PANEL ########## -->
