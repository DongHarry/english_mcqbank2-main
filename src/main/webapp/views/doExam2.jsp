<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 23/07/2023
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Questions</title>
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
<body>
<h1>Bài thi</h1>
<div id="time">Thời gian còn lại: </div>
<div id="countdown"> </div>
<div id="question-count">Số câu hỏi: ${questions.size()}</div>
<hr>
<%--<form:form action="${pageContext.request.contextPath}/questions/submit" method="post">--%>
<form:form action="${pageContext.request.contextPath}/user/exams/submit" method="post" cssClass="my-form" id="myForm">
    <c:forEach var="question" items="${questions}">
        <div class="question-container">
            <h3>${question.content}</h3>
            <c:if test="${question.type == 2}">
                Audio: <audio controls>
                <source src="${pageContext.request.contextPath}/resource/audio/${question.option4}.mp3" type="audio/mpeg">
            </audio>
                <br>
            </c:if>
            <div class="question-options">
                <input type="radio" name="question_${question.id}" id="question_${question.id}_option1" value="${question.option1}" class="radio-option">
                <label for="question_${question.id}_option1" class="label-option">${question.option1}</label><br>
                <input type="radio" name="question_${question.id}" id="question_${question.id}_option2" value="${question.option2}" class="radio-option">
                <label for="question_${question.id}_option2" class="label-option">${question.option2}</label><br>
                <input type="radio" name="question_${question.id}" id="question_${question.id}_option3" value="${question.option3}" class="radio-option">
                <label for="question_${question.id}_option3" class="label-option">${question.option3}</label><br>
                <c:if test="${question.type == 1}">
                <input type="radio" name="question_${question.id}" id="question_${question.id}_option4" value="${question.option4}" class="radio-option">
                <label for="question_${question.id}_option4" class="label-option">${question.option4}</label><br>
                </c:if>
            </div>
            <br><br>
        </div>
    </c:forEach>
    <input type="hidden" name="examId" value="${examId}">
    <input type="submit" value="Submit" id="submitButton">
</form:form>

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
