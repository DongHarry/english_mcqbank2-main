<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Questions</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resource/img/favicon.png" type="image/png" sizes="16x16">

    <!-- vendor css -->
    <link href="${pageContext.request.contextPath}/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/rickshaw/rickshaw.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/select2/css/select2.min.css" rel="stylesheet">

    <!-- Bracket CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bracket.css">
    <script>
        function countdown(duration) {
            var timer = duration, minutes, seconds;
            setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                document.getElementById("countdown").innerHTML = minutes + ":" + seconds;
                //console.log(timer);
                if (--timer === -2) {
                    alert("Hết giờ!");
                    document.getElementById("countdown").innerHTML = "00:00";
                    document.getElementById("countdown").remove();
                    // Dừng đồng hồ đếm ngược khi đạt 0
                    //$("#submitButton").click(); // Tự động click nút submit
                    document.getElementById("myForm").submit(); // Tự động gửi biểu mẫu
                    clearInterval(interval);

                }
            }, 1000);
        }

        // Thay thế 'yourJSPVariable' bằng biến duration từ EL
        countdown(${duration});
    </script>
</head>
<style>
    .paragraph {
        white-space: pre-wrap;
        word-break: break-word;
        text-align: justify;
        background: #f3f7fa;
        color: #222;
        font-size: 14px;
        font-style: 'Roboto';
    }

    #main {
        padding-top: 120px;
        overflow: hidden;
    }

    @media ( min-width: 767px) {
        #navigation {
            margin-top: 50px;
            position: fixed;
        }
    }

    .fix-scrolling {
        max-height: 450px;
        /*overflow-y: scroll;*/
    }

    .numberCircle {
        display: inline-block;
        width: 30px;
        height: 30px;
        border-radius: 50%;
        font-size: 15px;
        color: #0c0c0c;
        line-height: 25px;
        text-align: center;
        border: 2px solid #666;
        margin: 5px 5px 5px 15px;
    }

    #time {
        font-size: 25px;
        margin-left: 100px;
        color: green
    }

    #backhome {
        margin-left: 25px;
        text-decoration: none;
    }

    #btnSubmit {
        margin-bottom: 15px;
        margin-left: 15px;
    }

    #btnResult {
        margin-bottom: 15px;
        margin-left: 25px;
    }

    #btndoAgain {
        display: none;
        margin-bottom: 15px;
        margin-left: 40px;
    }

    .web-font {
        font-size: 15px;
        font-family: 'Arial';
    }

    #countdown {
        font-size: 100px;
        color: #891823;
    }

    .circle {
        /* ... your existing styles ... */
    }

    .circle.selected {
        background-color: green; /* Color for selected circles */
    }
</style>

<body class="collapsed-menu">
<div class="br-pagetitle">
    <div>
        <h1>Tham gia bài thi</h1>
    </div>
</div><!-- d-flex -->
<div id="content" class="container-fluid fill">
    <div class="row">
        <div id="navigation" class="col-md-3">

            <div class="fix-scrolling">
                <br>
                <div>
                    <span id="countdown">${o_duration}</span>
                </div>
                <hr width="60%">
                <c:set var="index" value="0"/>
                <c:forEach var="question" items="${questions}">
                    <c:set var="index" value="${index + 1}"/>
                    <div class="numberCircle circle" id="circle-${question.id}">${index}</div>
                </c:forEach>
                <br> <br>
                <!-- 	<input type="button" id="btndoAgain" class="btn btn-warning" value="Làm lại"> -->
                <hr width="60%">
            </div>


        </div>

        <div class="col-md-3 ">

        </div>
        <div id="main" class="col-md-8 web-font">
            <c:set var="index" value="0"/>
            <%--<form:form action="${pageContext.request.contextPath}/questions/submit" method="post">--%>
            <form:form action="${pageContext.request.contextPath}/user/exams/submit" method="post" id="myForm">
                <c:forEach var="question" items="${questions}">
                    <div class="question-container" id="question-container-${question.id}">
                        <c:set var="index" value="${index + 1}"/>
                        <h3>${index}. ${question.content}</h3>
                        <c:if test="${question.type == 2}">
                            Audio:
                            <audio controls>
                                <source src="${pageContext.request.contextPath}/resource/audio/${question.option4}.mp3"
                                        type="audio/mpeg">
                            </audio>
                            <br>
                        </c:if>
                        <div class="-question-option">
                            <input type="radio" name="question_${question.id}" value="${question.option1}"
                                   class="radio-option" onclick="handleRadioClick(${question.id})"
                                   data-question-id="${question.id}">
                            <label for="question_${question.id}_option1"
                                   class="label-option">${question.option1}</label><br>
                            <input type="radio" name="question_${question.id}" value="${question.option2}"
                                   data-question-id="${question.id}" class="radio-option"
                                   onclick="handleRadioClick(${question.id})">
                            <label for="question_${question.id}_option2"
                                   class="label-option">${question.option2}</label><br>
                            <input type="radio" name="question_${question.id}" value="${question.option3}"
                                   data-question-id="${question.id}"
                                   class="radio-option" onclick="handleRadioClick(${question.id})">
                            <label for="question_${question.id}_option3"
                                   class="label-option">${question.option3}</label><br>
                            <c:if test="${question.type == 1}">
                                <input type="radio" name="question_${question.id}" value="${question.option4}"
                                       data-question-id="${question.id}"
                                       class="radio-option" onclick="handleRadioClick(${question.id})">
                                <label for="question_${question.id}_option4"
                                       class="label-option">${question.option4}</label><br>
                            </c:if>
                        </div>
                        <br><br>
                    </div>
                </c:forEach>
                <input type="hidden" name="examId" value="${exam.id}" class="btn btn-info">
<%--                <input type="submit" value="Nộp bài" class="btn btn-info modal-effect2" style="display: none">--%>
<%--                <a href="#" class="modal-effect2 btn btn-info">Nộp bài</a>--%>
                <a href="#"
                   class="modal-effect2 btn btn-outline-danger btn-icon mg-r-5 mg-b-10"
                   data-effect="effect-scale" data-toggle="modal" data-target="#modaldemo9"
                   data-row-id="${exam.id}">
                    <input type="submit" value="Nộp bài" class="btn btn-info modal-effect2">
                </a>
            </form:form>

        </div>
    </div>

    <hr>

    <!-- Add this script tag to include the JavaScript code -->
    <%--<form:form action="${pageContext.request.contextPath}/questions/submit" method="post">--%>
    <%--    <c:forEach var="question" items="${questions}">--%>
    <%--        <div class="question-container">--%>
    <%--            <h3>${question.content}</h3>--%>
    <%--            <div>--%>
    <%--                <input type="radio" name="question_${question.id}" id="question_${question.id}_option1" value="${question.option1}">--%>
    <%--                <label for="question_${question.id}_option1">${question.option1}</label><br>--%>
    <%--                <input type="radio" name="question_${question.id}" id="question_${question.id}_option2" value="${question.option2}">--%>
    <%--                <label for="question_${question.id}_option2">${question.option2}</label><br>--%>
    <%--                <input type="radio" name="question_${question.id}" id="question_${question.id}_option3" value="${question.option3}">--%>
    <%--                <label for="question_${question.id}_option3">${question.option3}</label><br>--%>
    <%--                <input type="radio" name="question_${question.id}" id="question_${question.id}_option4" value="${question.option4}">--%>
    <%--                <label for="question_${question.id}_option4">${question.option4}</label><br>--%>


    <%--            </div>--%>
    <%--            <br><br>--%>
    <%--        </div>--%>
    <%--    </c:forEach>--%>
    <%--    <input type="submit" value="Submit">--%>
    <%--</form:form>--%>
    <!-- SMALL MODAL -->
    <div id="modaldemo9" class="modal fade">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content bd-0 tx-14">
                <div class="modal-header pd-x-20">
                    <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Notice</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pd-20">
                    <p class="mg-b-5">Xác nhận nộp bài</p>
                </div>
                <div class="modal-footer justify-content-center">
                    <a href="#" type="button" onclick="document.getElementById('myForm').submit();"
                       class="btn btn-primary tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium save-changes-btn">Submit</a>
                    <button type="button" class="btn btn-secondary tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium"
                            data-dismiss="modal">Cancel
                    </button>
                </div>
            </div>
        </div><!-- modal-dialog -->
    </div>
    <!-- modal -->


</div>
<script>
    $(function () {

        // showing modal with effect
        $('.modal-effect2').on('click', function (e) {
            e.preventDefault();
            var effect = $(this).attr('data-effect');
            $('#modaldemo9').addClass(effect);
            $('#modaldemo9').modal('show');
        });

        // hide modal with effect
        $('#modaldemo9').on('hidden.bs.modal', function (e) {
            $(this).removeClass(function (index, className) {
                return (className.match(/(^|\s)effect-\S+/g) || []).join(' ');
            });
        });
    });




</script>
<script>
    function submitForm() {
        document.getElementById('myForm').submit();
    }
</script>
<script>
    function handleRadioClick(questionId) {
        var circle = document.getElementById("circle-" + questionId);
        circle.style.backgroundColor = "green";
    }
</script>
<%--<script>--%>
<%--    function confirmSubmission() {--%>
<%--        if (confirm("Bạn có chắc chắn muốn nộp bài?")) {--%>
<%--            // Thực hiện hành động nộp bài ở đây--%>
<%--            // Ví dụ: Gửi dữ liệu form đi hoặc thực hiện các tác vụ cần thiết--%>
<%--            document.getElementById('myForm').submit();--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
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
<script src="${pageContext.request.contextPath}/lib/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/js/bracket.js"></script>
<script src="${pageContext.request.contextPath}/js/ResizeSensor.js"></script>
<script src="${pageContext.request.contextPath}/lib/highlightjs/highlight.pack.min.js"></script>

</body>
</html>
