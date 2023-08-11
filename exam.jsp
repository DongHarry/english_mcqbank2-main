
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--favicon icon-->
<link rel="icon" href="${pageContext.request.contextPath}/resource/img/favicon.png" type="image/png" sizes="16x16">

<!-- vendor css -->
<link href="${pageContext.request.contextPath}/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/lib/rickshaw/rickshaw.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/lib/select2/css/select2.min.css" rel="stylesheet">

<!-- Bracket CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bracket.css">
<html>
<head>
    <title>Exam</title>
</head>
<body>
    <div class="br-pagetitle">
        <i class="icon ion-ios-person-outline"></i>
        <div>
            <h1>Exam</h1>
        </div>
    </div><!-- d-flex -->

    <div class="br-pagebody">
        <div class="br-section-wrapper">
            <h3 class="br-section-label">Thông tin bài thi </h3>

            <p>Bài thi được thiết kế bởi đội ngũ Apelish</p>
            <div class="editable tx-16 bd pd-30 tx-inverse">
                <p><b>Exam ID:</b> ${exam.id}</p>
                <p><b>Exam Name:</b> ${exam.name}</p>
                <p><b>Exam Date:</b> ${exam.time}</p>
                <p><b>Question No:</b> ${exam.questionNo}</p>
                <p><b>Exam Duration:</b> ${exam.questionNo} minutes</p>
                <li>
                    Exam Topics:
                    <ol>
                        <c:forEach var="examtopic" items="${exam.examTopicList}">
                            <li>
                                Exam Topic ID: <c:out value="${examtopic.topic.name}"/>
                                Exam Topic Name: <c:out value="(${examtopic.percent}%)"/>
                            </li>
                        </c:forEach>
                    </ol>
                </li>
                <a href="${pageContext.request.contextPath}/user/exams/${exam.id}/do">Start</a> <br/>
                <a href="${pageContext.request.contextPath}/user/exams">Back to Exam List</a> <br/>
            </div>

        </div><!-- br-section-wrapper -->
    </div><!-- br-pagebody -->
</div><!-- br-mainpanel -->
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
</body>
</html>
