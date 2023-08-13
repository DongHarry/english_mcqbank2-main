<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--favicon icon-->


<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 23/07/2023
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
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
                console.log(timer);
                if (--timer === 0) {

                    alert("Hết giờ!")
                    //$("#submitButton").click(); // Tự động click nút submit
                    document.getElementById("myForm").submit(); // Tự động gửi biểu mẫu
                    clearInterval(interval); // Dừng đồng hồ đếm ngược khi đạt 0
                }
            }, 1000);
        }

        // Thay thế 'yourJSPVariable' bằng biến duration từ EL
        var durationFromEL = ${questions.size() * 30};
        countdown(durationFromEL);
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
</style>

<body>
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
                        <span id="countdown">05:00</span>
                    </div>
                    <hr width="60%">

                    <c:forEach begin="1" end="${questions.size()}" varStatus="loop">
                        <div class="numberCircle" id="answer${loop.index}">${loop.index}</div>
                    </c:forEach>
                    <br> <br>
                    <!-- 	<input type="button" id="btndoAgain" class="btn btn-warning" value="Làm lại"> -->
                    <hr width="60%">
                </div>


            </div>

            <div class="col-md-3 ">
                <!-- Placeholder - keep empty -->
            </div>
            <div id="main" class="col-md-8 web-font">
                <%--<form:form action="${pageContext.request.contextPath}/questions/submit" method="post">--%>
                <form:form action="${pageContext.request.contextPath}/user/exams/submit" method="post" id="myForm">
                    <c:forEach var="question" items="${questions}">
                        <div class="question-container">
                            <h3>${question.content}</h3>
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
                                       class="radio-option">
                                <label for="question_${question.id}_option1"
                                       class="label-option">${question.option1}</label><br>
                                <input type="radio" name="question_${question.id}" value="${question.option2}"
                                       class="radio-option">
                                <label for="question_${question.id}_option2"
                                       class="label-option">${question.option2}</label><br>
                                <input type="radio" name="question_${question.id}" value="${question.option3}"
                                       class="radio-option">
                                <label for="question_${question.id}_option3"
                                       class="label-option">${question.option3}</label><br>
                                <c:if test="${question.type == 1}">
                                    <input type="radio" name="question_${question.id}" value="${question.option4}"
                                           class="radio-option">
                                    <label for="question_${question.id}_option4"
                                           class="label-option">${question.option4}</label><br>
                                </c:if>
                            </div>
                            <br><br>
                        </div>
                    </c:forEach>
                    <input type="hidden" name="examId" value="${exam.id}" class="btn btn-info">
                    <input type="submit" value="Submit" class="btn btn-info">
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

</body>
</html>
