<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 06/08/2023
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
</head>
<body>
    <form:form action="${pageContext.request.contextPath}/sendContactMail">
        <h6>Đừng bỏ lỡ cơ hội</h6>
        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <input type="text" class="form-control" name="name"
                           placeholder="Họ và tên" required="required">
                </div>
            </div>
            <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <input type="email" class="form-control" name="email"
                           placeholder="Địa chỉ email" required="required">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <input type="text" name="phone" value="" class="form-control"
                           id="phone" placeholder="Số điện thoại">
                </div>
            </div>
            <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <input type="text" name="company" value="" size="40"
                           class="form-control" id="company" placeholder="Địa chỉ">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="form-group">
                                                    <textarea name="message" id="message" class="form-control" rows="7"
                                                              cols="25" placeholder="Bạn cần hỗ trợ điều gì?"></textarea>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 mt-20">
                <button type="submit" class="btn softo-solid-btn pull-right"
                        id="btnContactUs">
                    Gửi
                </button>
            </div>
        </div>
    </form:form>
</body>
</html>
